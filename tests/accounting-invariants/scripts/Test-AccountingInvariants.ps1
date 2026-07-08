param(
  [string]$FixturePath,
  [switch]$Json
)

$ErrorActionPreference = 'Stop'

function Resolve-DefaultFixture {
  if ($FixturePath) { return (Resolve-Path $FixturePath).Path }
  return (Resolve-Path (Join-Path $PSScriptRoot '..\fixtures\retail-vat-pos.fixture.json')).Path
}

function Add-Result {
  param(
    [System.Collections.ArrayList]$Results,
    [string]$CaseId,
    [string]$Invariant,
    [bool]$Passed,
    [string]$Message
  )
  [void]$Results.Add([pscustomobject]@{
    case_id = $CaseId
    invariant = $Invariant
    passed = $Passed
    message = $Message
  })
}

function Get-LineTotal {
  param($Lines, [string]$Currency, [string]$Side)
  $sum = 0
  foreach ($line in $Lines) {
    if ($line.currency -eq $Currency) { $sum += [decimal]$line.$Side }
  }
  return $sum
}

function Test-Case {
  param($Fixture, $Case, [bool]$ExpectFailure)
  $results = New-Object System.Collections.ArrayList
  $evidenceIds = @{}
  foreach ($ev in $Fixture.evidence_index) { $evidenceIds[$ev.id] = $true }

  $currency = $Fixture.currency
  $debits = Get-LineTotal $Case.journal_lines $currency 'debit'
  $credits = Get-LineTotal $Case.journal_lines $currency 'credit'
  Add-Result $results $Case.case_id 'double-entry' ($debits -eq $credits) "debits=$debits credits=$credits"

  $periodState = $Fixture.period_state.$($Case.period)
  Add-Result $results $Case.case_id 'period-state' ($periodState -ne 'locked') "period=$($Case.period) state=$periodState"

  $missingEvidence = @()
  foreach ($line in $Case.journal_lines) {
    if (-not $evidenceIds.ContainsKey($line.evidence_id)) { $missingEvidence += $line.evidence_id }
  }
  Add-Result $results $Case.case_id 'evidence-index' ($missingEvidence.Count -eq 0) ("missing=" + (($missingEvidence | Sort-Object -Unique) -join ','))

  if ($Case.expected_vat) {
    $vat = $Case.expected_vat
    $sourceState = $vat.source_state
    if (-not $sourceState) { $sourceState = $Fixture.statutory_assumptions.source_state }
    $allowedSource = $sourceState -in @('verified-current', 'verified-current-with-conflict-watch', 'verified-with-caveat')
    Add-Result $results $Case.case_id 'statutory-source' $allowedSource "source=$($vat.source_key) state=$sourceState"

    $expectedNet = [math]::Round(([decimal]$vat.gross / (1 + [decimal]$Fixture.statutory_assumptions.vat_rate)), 0)
    $expectedVat = [decimal]$vat.gross - $expectedNet
    Add-Result $results $Case.case_id 'vat-decomposition' (($expectedNet -eq [decimal]$vat.net) -and ($expectedVat -eq [decimal]$vat.vat)) "gross=$($vat.gross) net=$($vat.net) vat=$($vat.vat)"
  }

  if ($Case.clearing_expectation) {
    foreach ($property in $Case.clearing_expectation.PSObject.Properties) {
      $account = $property.Name
      $opening = 0
      if ($Case.clearing_opening -and $Case.clearing_opening.PSObject.Properties.Name -contains $account) {
        $opening = [decimal]$Case.clearing_opening.$account
      }
      $movement = 0
      foreach ($line in $Case.journal_lines | Where-Object { $_.account -eq $account }) {
        $movement += ([decimal]$line.debit - [decimal]$line.credit)
      }
      $closing = $opening + $movement
      Add-Result $results $Case.case_id "clearing-$account" ($closing -eq [decimal]$property.Value) "opening=$opening movement=$movement closing=$closing expected=$($property.Value)"
    }
  }

  $casePassed = -not ($results | Where-Object { -not $_.passed })
  if ($ExpectFailure) {
    $failedInvariants = @($results | Where-Object { -not $_.passed } | ForEach-Object { $_.invariant })
    $negativePassed = -not $casePassed
    $summary = New-Object System.Collections.ArrayList
    Add-Result $summary $Case.case_id 'negative-case-behavior' $negativePassed ("expected failure=$($Case.expected_failure); failed invariants=" + (($failedInvariants | Sort-Object -Unique) -join ','))
    return @($summary)
  }

  return @($results)
}

$fixtureFile = Resolve-DefaultFixture
$fixture = Get-Content -LiteralPath $fixtureFile -Raw -Encoding UTF8 | ConvertFrom-Json
$allResults = New-Object System.Collections.ArrayList

$keys = @{}
foreach ($case in $fixture.positive_cases + $fixture.negative_cases) {
  foreach ($keyName in @('idempotency_key', 'source_event_id')) {
    $key = $case.$keyName
    if ($keys.ContainsKey($key)) {
      Add-Result $allResults $case.case_id "unique-$keyName" $false "duplicate=$key"
    } else {
      $keys[$key] = $true
      Add-Result $allResults $case.case_id "unique-$keyName" $true "unique=$key"
    }
  }
}

foreach ($case in $fixture.positive_cases) {
  foreach ($result in (Test-Case $fixture $case $false)) { [void]$allResults.Add($result) }
}
foreach ($case in $fixture.negative_cases) {
  foreach ($result in (Test-Case $fixture $case $true)) { [void]$allResults.Add($result) }
}

$failed = @($allResults | Where-Object { -not $_.passed })
$report = [pscustomobject]@{
  check = 'accounting-invariants'
  fixture = $fixtureFile
  ran_at = (Get-Date).ToString('s')
  state = if ($failed.Count -eq 0) { 'pass' } else { 'fail' }
  total_assertions = $allResults.Count
  failed_assertions = $failed.Count
  results = @($allResults)
}

if ($Json) {
  $report | ConvertTo-Json -Depth 8
} else {
  Write-Host "check: accounting-invariants"
  Write-Host "state: $($report.state)"
  Write-Host "fixture: $fixtureFile"
  Write-Host "total_assertions: $($report.total_assertions)"
  Write-Host "failed_assertions: $($report.failed_assertions)"
  foreach ($result in $failed) {
    Write-Host ("[fail] {0} {1} {2}" -f $result.case_id, $result.invariant, $result.message)
  }
}

if ($report.state -eq 'fail') { exit 1 }
exit 0
