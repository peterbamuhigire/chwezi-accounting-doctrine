param(
  [string]$RepoRoot,
  [switch]$Json
)

$ErrorActionPreference = 'Stop'

if ($RepoRoot) { $root = (Resolve-Path $RepoRoot).Path } else { $root = (Resolve-Path (Join-Path $PSScriptRoot '..\..\..')).Path }
$checker = Join-Path $root 'tools\check-source-register.ps1'
$fixtureRoot = Join-Path $root 'tests\source-register\fixtures\duplicate-source-state-id'
$output = & $checker -RepoRoot $root -RegisterRoot $fixtureRoot -Json
$exitCode = $LASTEXITCODE
$sourceReport = ($output -join "`n") | ConvertFrom-Json
$duplicateFound = @($sourceReport.findings | Where-Object { $_.code -eq 'SRC-008' }).Count -gt 0
$missingFound = @($sourceReport.findings | Where-Object { $_.code -eq 'SRC-009' }).Count -gt 0
$passed = $exitCode -eq 1 -and $sourceReport.state -eq 'fail' -and $duplicateFound -and $missingFound
$report = [pscustomobject]@{
  check = 'source-register-negative-controls'
  state = if ($passed) { 'pass' } else { 'fail' }
  total_controls = 1
  failed_controls = if ($passed) { 0 } else { 1 }
  findings = @()
  result = [pscustomobject]@{
    control = 'duplicate-source-state-identity'
    expected_failure = 'SRC-008,SRC-009'
    passed = $passed
    exit_code = $exitCode
    findings = @($sourceReport.findings | ForEach-Object { $_.code })
  }
}
$report | ConvertTo-Json -Depth 8
if ($report.state -eq 'fail') { exit 1 }
exit 0
