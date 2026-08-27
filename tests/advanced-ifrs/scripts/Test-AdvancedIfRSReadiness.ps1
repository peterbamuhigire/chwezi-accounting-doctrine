[CmdletBinding()]
param(
  [string]$RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..\..\..')).Path
)

$ErrorActionPreference = 'Stop'
$checker = Join-Path $RepoRoot 'tools\check-advanced-ifrs-readiness.ps1'
$fixture = Join-Path $RepoRoot 'tests\advanced-ifrs\fixtures\minimal-incomplete-engine'

try {
  if (-not (Test-Path -LiteralPath $checker)) {
    throw "Readiness checker is missing: $checker"
  }

  $incompleteOutput = & powershell -NoProfile -ExecutionPolicy Bypass -File $checker -RepoRoot $RepoRoot -TargetPath $fixture -Json 2>&1 | Out-String
  $incompleteExit = $LASTEXITCODE
  if ($incompleteExit -eq 0) {
    throw 'The incomplete fixture unexpectedly passed the readiness check.'
  }
  $incompleteReport = $incompleteOutput | ConvertFrom-Json
  $requiredFindings = @('Conceptual Framework', 'IFRS 18', 'consolidated statements', 'published IFRS')
  foreach ($needle in $requiredFindings) {
    if (-not (($incompleteReport.findings -join ' ') -match [regex]::Escape($needle))) {
      throw "Incomplete-fixture report did not identify: $needle"
    }
  }

  $liveOutput = & powershell -NoProfile -ExecutionPolicy Bypass -File $checker -RepoRoot $RepoRoot -Json 2>&1 | Out-String
  $liveExit = $LASTEXITCODE
  if ($liveExit -ne 0) {
    throw "Live repository failed the readiness check: $liveOutput"
  }
  $liveReport = $liveOutput | ConvertFrom-Json
  if ($liveReport.state -ne 'pass') {
    throw 'Live repository readiness report did not return state=pass.'
  }

  [pscustomobject]@{
    check = 'advanced-ifrs-readiness-test'
    state = 'pass'
    summary = [pscustomobject]@{
      incomplete_fixture_exit = $incompleteExit
      live_repository_exit = $liveExit
      required_negative_findings = $requiredFindings.Count
    }
    findings = @()
  } | ConvertTo-Json -Depth 8
  exit 0
}
catch {
  [pscustomobject]@{
    check = 'advanced-ifrs-readiness-test'
    state = 'fail'
    summary = [pscustomobject]@{ }
    findings = @($_.Exception.Message)
  } | ConvertTo-Json -Depth 8
  exit 1
}
