param(
  [string]$RepoRoot,
  [switch]$Json
)

$ErrorActionPreference = 'Stop'

if ($RepoRoot) { $root = (Resolve-Path $RepoRoot).Path } else { $root = (Resolve-Path (Join-Path $PSScriptRoot '../../..')).Path }
$checker = Join-Path $root 'tools/check-source-register.ps1'

# Each control points the checker at a fixture register and names the finding
# codes it must report. Every expected code must appear and the run must fail.
$controls = @(
  [pscustomobject]@{ name = 'duplicate-source-state-identity'; fixture = 'duplicate-source-state-id'; expect = @('SRC-008', 'SRC-009') },
  [pscustomobject]@{ name = 'mixed-state-overdue-verified-entry'; fixture = 'mixed-state-overdue'; expect = @('SRC-005', 'SRC-011') },
  [pscustomobject]@{ name = 'recheck-before-access-date'; fixture = 'recheck-before-access'; expect = @('SRC-010') }
)

$results = @()
foreach ($control in $controls) {
  $fixtureRoot = Join-Path (Join-Path $root 'tests/source-register/fixtures') $control.fixture
  $output = & $checker -RepoRoot $root -RegisterRoot $fixtureRoot -Json
  $exitCode = $LASTEXITCODE
  $sourceReport = ($output -join "`n") | ConvertFrom-Json
  $codes = @($sourceReport.findings | ForEach-Object { $_.code })
  $missing = @($control.expect | Where-Object { $codes -notcontains $_ })
  $passed = $exitCode -eq 1 -and $sourceReport.state -eq 'fail' -and $missing.Count -eq 0
  $results += [pscustomobject]@{
    control = $control.name
    expected_failure = ($control.expect -join ',')
    passed = $passed
    exit_code = $exitCode
    findings = $codes
  }
}

$failed = @($results | Where-Object { -not $_.passed }).Count
$report = [pscustomobject]@{
  check = 'source-register-negative-controls'
  state = if ($failed -eq 0) { 'pass' } else { 'fail' }
  total_controls = $results.Count
  failed_controls = $failed
  findings = @()
  results = $results
}
$report | ConvertTo-Json -Depth 8
if ($report.state -eq 'fail') { exit 1 }
exit 0
