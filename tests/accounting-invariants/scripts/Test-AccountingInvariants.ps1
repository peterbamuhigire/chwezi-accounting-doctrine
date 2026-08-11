param(
  [string]$FixturePath,
  [string]$RepoRoot,
  [switch]$Json
)

$ErrorActionPreference = 'Stop'

function Resolve-DefaultFixture {
  if ($FixturePath) { return (Resolve-Path $FixturePath).Path }
  if ($RepoRoot) { return (Resolve-Path (Join-Path $RepoRoot 'tests\accounting-invariants\fixtures\retail-vat-pos.fixture.json')).Path }
  return (Resolve-Path (Join-Path $PSScriptRoot '..\fixtures\retail-vat-pos.fixture.json')).Path
}

function Resolve-RepositoryRoot {
  if ($RepoRoot) { return (Resolve-Path $RepoRoot).Path }
  return (Resolve-Path (Join-Path $PSScriptRoot '..\..\..')).Path
}

function Get-SchemaStates {
  param([string]$Root)
  $schemaPath = Join-Path $Root 'doctrine\source-register\schema.yaml'
  if (-not (Test-Path -LiteralPath $schemaPath)) { return @() }
  $schemaText = Get-Content -LiteralPath $schemaPath -Raw -Encoding UTF8
  $stateBlockMatch = [regex]::Match($schemaText, '(?ms)^\s{2}state:\s*\r?\n(?<block>.*?)(?=^\s{2}archive_snapshot:)')
  if (-not $stateBlockMatch.Success) { return @() }
  return @([regex]::Matches($stateBlockMatch.Groups['block'].Value, '(?m)^\s+-\s+([a-z0-9-]+)\s*$') | ForEach-Object { $_.Groups[1].Value })
}

function Get-SourceRegisterEntries {
  param([string]$Root)
  $registerRoot = Join-Path $Root 'doctrine\source-register'
  if (-not (Test-Path -LiteralPath $registerRoot)) { return @() }
  $entries = New-Object System.Collections.Generic.List[object]
  $files = Get-ChildItem -Path $registerRoot -Recurse -File | Where-Object {
    $_.Extension -in @('.yml', '.yaml', '.json') -and $_.Name -notin @('schema.yaml', 'schema.yml')
  }
  foreach ($file in $files) {
    $current = $null
    foreach ($line in @(Get-Content -LiteralPath $file.FullName -Encoding UTF8)) {
      if ($line -match '^-\s+' -and $line -notmatch '^-\s+id:\s*') {
        if ($null -ne $current) { [void]$entries.Add($current) }
        $current = [pscustomobject]@{ id = $null; state = $null; path = $file.FullName }
        continue
      }
      $idMatch = [regex]::Match($line, '^\s*-\s+id:\s*(.+?)\s*$')
      if ($idMatch.Success) {
        if ($null -ne $current) { [void]$entries.Add($current) }
        $current = [pscustomobject]@{ id = $idMatch.Groups[1].Value.Trim().Trim('"').Trim("'"); state = $null; path = $file.FullName }
        continue
      }
      if ($null -ne $current -and $line -match '^\s+state:\s*(.+?)\s*$') {
        $current.state = $matches[1].Trim().Trim('"').Trim("'")
      }
    }
    if ($null -ne $current) { [void]$entries.Add($current) }
  }
  return $entries.ToArray()
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

function Get-CaseSignature {
  param($Case)
  $payload = [ordered]@{
    source_event_id = [string]$Case.source_event_id
    period = [string]$Case.period
    journal_lines = @($Case.journal_lines)
    expected_vat = $Case.expected_vat
    source_usage = [string]$Case.source_usage
  }
  return ($payload | ConvertTo-Json -Compress -Depth 12)
}

function Test-Case {
  param($Fixture, $Case, [bool]$ExpectFailure, $CasesById, [string[]]$SchemaStates, $SourceEntries)
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
    $knownState = $sourceState -in $SchemaStates
    Add-Result $results $Case.case_id 'source-state-schema' $knownState "source=$($vat.source_key) state=$sourceState"
    $sourceMatches = @($SourceEntries | Where-Object { [string]$_.id -eq [string]$vat.source_key })
    $sourceIdentity = $sourceMatches.Count -eq 1
    Add-Result $results $Case.case_id 'source-register-identity' $sourceIdentity "source=$($vat.source_key) matches=$($sourceMatches.Count)"
    $sourceStateMatch = $sourceIdentity -and [string]$sourceMatches[0].state -eq [string]$sourceState
    Add-Result $results $Case.case_id 'source-register-state-match' $sourceStateMatch "source=$($vat.source_key) fixture_state=$sourceState register_state=$($sourceMatches[0].state)"
    $finalOutputAllowed = $sourceState -in @('verified-current', 'verified-with-caveat')
    if ($Case.source_usage -eq 'final-statutory-output') {
      Add-Result $results $Case.case_id 'statutory-source' $finalOutputAllowed "source=$($vat.source_key) state=$sourceState usage=final-statutory-output"
    } else {
      $blocked = $knownState -and (-not $finalOutputAllowed) -and ($Fixture.statutory_assumptions.final_output_status -eq 'blocked-pending-source-review')
      Add-Result $results $Case.case_id 'statutory-output-gate' $blocked "source=$($vat.source_key) state=$sourceState usage=illustrative-calculation final_output=$($Fixture.statutory_assumptions.final_output_status)"
    }

    $expectedNet = [math]::Round(([decimal]$vat.gross / (1 + [decimal]$Fixture.statutory_assumptions.vat_rate)), 0)
    $expectedVat = [decimal]$vat.gross - $expectedNet
    Add-Result $results $Case.case_id 'vat-decomposition' (($expectedNet -eq [decimal]$vat.net) -and ($expectedVat -eq [decimal]$vat.vat)) "gross=$($vat.gross) net=$($vat.net) vat=$($vat.vat)"
  }

  if ($Case.expected_reversal) {
    $original = $null
    if ($Case.reversal_of_case_id) { $original = $CasesById[$Case.reversal_of_case_id] }
    $linkagePassed = $null -ne $original -and
      -not [string]::IsNullOrWhiteSpace([string]$Case.journal_id) -and
      -not [string]::IsNullOrWhiteSpace([string]$original.journal_id) -and
      [string]$Case.journal_id -ne [string]$original.journal_id -and
      [string]$Case.case_id -ne [string]$Case.reversal_of_case_id -and
      [string]$Case.reversal_of_journal_id -eq [string]$original.journal_id -and
      [string]$Case.reversal_type -in @('full', 'partial')
    Add-Result $results $Case.case_id 'reversal-linkage' $linkagePassed "original_case=$($Case.reversal_of_case_id) original_journal=$($Case.reversal_of_journal_id) type=$($Case.reversal_type)"

    $equalAndOpposite = $false
    if ($linkagePassed) {
      $remaining = New-Object System.Collections.ArrayList
      foreach ($line in $Case.journal_lines) { [void]$remaining.Add($line) }
      $equalAndOpposite = $true
      foreach ($line in $original.journal_lines) {
        $match = @($remaining | Where-Object {
          $_.account -eq $line.account -and
          $_.currency -eq $line.currency -and
          [decimal]$_.debit -eq [decimal]$line.credit -and
          [decimal]$_.credit -eq [decimal]$line.debit
        } | Select-Object -First 1)
        if ($match.Count -eq 0) { $equalAndOpposite = $false; break }
        [void]$remaining.Remove($match[0])
      }
      if ($remaining.Count -ne 0) { $equalAndOpposite = $false }
    }
    Add-Result $results $Case.case_id 'reversal-equal-opposite' $equalAndOpposite "original_case=$($Case.reversal_of_case_id) remaining_lines=$(@($remaining).Count)"
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

function Test-DuplicateCase {
  param($Case, $CasesById)
  $results = New-Object System.Collections.ArrayList
  $original = $CasesById[$Case.duplicate_of_case_id]
  $keyName = if ($Case.duplicate_key_name) { [string]$Case.duplicate_key_name } else { 'idempotency_key' }
  $sameKey = $null -ne $original -and [string]$Case.$keyName -eq [string]$original.$keyName
  $payloadChanged = $null -ne $original -and (Get-CaseSignature $Case) -ne (Get-CaseSignature $original)
  $rejected = $Case.expected_failure -eq 'duplicate-idempotency-key' -and $keyName -eq 'idempotency_key' -and $sameKey -and $payloadChanged
  Add-Result $results $Case.case_id 'duplicate-idempotency-key-rejection' $rejected "duplicate_of=$($Case.duplicate_of_case_id) key=$($Case.$keyName) payload_changed=$payloadChanged"
  return @($results)
}

$fixtureFile = Resolve-DefaultFixture
$fixture = Get-Content -LiteralPath $fixtureFile -Raw -Encoding UTF8 | ConvertFrom-Json
$repositoryRoot = Resolve-RepositoryRoot
$schemaStates = @(Get-SchemaStates $repositoryRoot)
$sourceEntries = @(Get-SourceRegisterEntries $repositoryRoot)
$allResults = New-Object System.Collections.ArrayList
$positiveCases = @($fixture.positive_cases)
$negativeCases = @($fixture.negative_cases)
$duplicateCases = @($fixture.duplicate_cases)
$allCases = @($positiveCases + $negativeCases + $duplicateCases)
$casesById = @{}
foreach ($case in $allCases) { $casesById[$case.case_id] = $case }

$duplicateSourceIds = @($sourceEntries | Group-Object id | Where-Object { $_.Name -and $_.Count -gt 1 })
$missingSourceIds = @($sourceEntries | Where-Object { [string]::IsNullOrWhiteSpace([string]$_.id) })
Add-Result $allResults '[fixture]' 'unique-source-register-identity' ($duplicateSourceIds.Count -eq 0 -and $missingSourceIds.Count -eq 0) ("duplicate_ids=" + (($duplicateSourceIds | ForEach-Object { $_.Name }) -join ',') + "; missing_entries=$($missingSourceIds.Count)")

$duplicateCaseIds = @($allCases | Group-Object case_id | Where-Object { $_.Name -and $_.Count -gt 1 })
Add-Result $allResults '[fixture]' 'unique-case-identity' ($duplicateCaseIds.Count -eq 0) ("duplicate_ids=" + (($duplicateCaseIds | ForEach-Object { $_.Name }) -join ','))

$keys = @{}
foreach ($case in $positiveCases + $negativeCases) {
  foreach ($keyName in @('idempotency_key', 'source_event_id', 'journal_id')) {
    $key = $case.$keyName
    if ([string]::IsNullOrWhiteSpace([string]$key)) { continue }
    if ($keys.ContainsKey($key)) {
      Add-Result $allResults $case.case_id "unique-$keyName" $false "duplicate=$key"
    } else {
      $keys[$key] = $true
      Add-Result $allResults $case.case_id "unique-$keyName" $true "unique=$key"
    }
  }
}

foreach ($case in $fixture.positive_cases) {
  foreach ($result in (Test-Case $fixture $case $false $casesById $schemaStates $sourceEntries)) { [void]$allResults.Add($result) }
}
foreach ($case in $fixture.negative_cases) {
  foreach ($result in (Test-Case $fixture $case $true $casesById $schemaStates $sourceEntries)) { [void]$allResults.Add($result) }
}
foreach ($case in $duplicateCases) {
  foreach ($result in (Test-DuplicateCase $case $casesById)) { [void]$allResults.Add($result) }
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
