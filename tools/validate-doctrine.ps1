param(
  [string]$RepoRoot,
  [string]$ReportPath,
  [switch]$Json,
  [switch]$Strict
)

$ErrorActionPreference = 'Stop'

function Resolve-DoctrineRepoRoot {
  param([string]$Start)
  if ($Start) { return (Resolve-Path $Start).Path }
  return (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
}

function Get-ValidationState {
  param([object[]]$Results)
  if ($Results | Where-Object { $_.state -eq 'fail' }) { return 'fail' }
  if ($Results | Where-Object { $_.state -eq 'pass-with-caveats' }) { return 'pass-with-caveats' }
  return 'pass'
}

function Get-PowerShellExe {
  $pwsh = Get-Command pwsh -ErrorAction SilentlyContinue
  if ($pwsh) { return $pwsh.Source }
  $powershell = Get-Command powershell.exe -ErrorAction SilentlyContinue
  if ($powershell) { return $powershell.Source }
  return 'powershell.exe'
}

$root = Resolve-DoctrineRepoRoot $RepoRoot
$checks = @(
  'check-mojibake.ps1',
  'check-skill-contracts.ps1',
  'check-source-register.ps1',
  'check-links.ps1'
)
$results = New-Object System.Collections.ArrayList
$psExe = Get-PowerShellExe

foreach ($check in $checks) {
  $script = Join-Path $PSScriptRoot $check
  if (-not (Test-Path $script)) {
    throw "Missing validator check script: $script"
  }
  $args = @('-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', $script, '-RepoRoot', $root, '-Json')
  if ($Strict) { $args += '-Strict' }
  $output = & $psExe @args
  $exitCode = $LASTEXITCODE
  if (-not $output) {
    throw "Validator check produced no JSON output: $check"
  }
  $jsonText = ($output -join "`n")
  $result = $jsonText | ConvertFrom-Json
  $result | Add-Member -NotePropertyName exit_code -NotePropertyValue $exitCode -Force
  [void]$results.Add($result)
}

$state = Get-ValidationState @($results)
$allFindings = @()
foreach ($result in $results) {
  if ($result.findings) {
    foreach ($finding in $result.findings) {
      $allFindings += $finding
    }
  }
}
$blockers = @($allFindings | Where-Object { $_.severity -eq 'blocker' }).Count
$highs = @($allFindings | Where-Object { $_.severity -eq 'high' }).Count
$mediums = @($allFindings | Where-Object { $_.severity -eq 'medium' }).Count
$caveats = @($allFindings | Where-Object { $_.severity -in @('caveat', 'low') }).Count

$report = [pscustomobject]@{
  doctrine_validation = $state
  ran_at = (Get-Date).ToString('s')
  repo_root = $root
  strict = [bool]$Strict
  blocker_findings = $blockers
  high_findings = $highs
  medium_findings = $mediums
  caveat_findings = $caveats
  checks = @($results)
}

if ($ReportPath) {
  $resolvedReport = $ReportPath
  if (-not [System.IO.Path]::IsPathRooted($resolvedReport)) {
    $resolvedReport = Join-Path $root $resolvedReport
  }
  $reportDir = Split-Path $resolvedReport -Parent
  if ($reportDir -and -not (Test-Path $reportDir)) {
    New-Item -ItemType Directory -Path $reportDir -Force | Out-Null
  }
  $report | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $resolvedReport -Encoding UTF8
}

if ($Json) {
  $report | ConvertTo-Json -Depth 8
} else {
  Write-Host 'Doctrine validation summary'
  Write-Host ("state: {0}" -f $state)
  Write-Host ("repo_root: {0}" -f $root)
  Write-Host ("blocker_findings: {0}" -f $blockers)
  Write-Host ("high_findings: {0}" -f $highs)
  Write-Host ("medium_findings: {0}" -f $mediums)
  Write-Host ("caveat_findings: {0}" -f $caveats)
  Write-Host ''
  Write-Host 'Checks'
  foreach ($result in $results) {
    $findingCount = 0
    if ($result.findings) { $findingCount = @($result.findings).Count }
    Write-Host ("- {0}: {1} ({2} finding(s), exit {3})" -f $result.check, $result.state, $findingCount, $result.exit_code)
  }
  if ($allFindings.Count -gt 0) {
    Write-Host ''
    Write-Host 'Findings'
    foreach ($finding in ($allFindings | Select-Object -First 80)) {
      $location = $finding.path
      if ($finding.line -and $finding.line -gt 0) { $location = "${location}:$($finding.line)" }
      Write-Host ("[{0}] {1} {2} {3}" -f $finding.severity, $finding.code, $location, $finding.message)
    }
    if ($allFindings.Count -gt 80) {
      Write-Host ("... {0} additional finding(s) omitted from console output." -f ($allFindings.Count - 80))
    }
  }
}

if ($state -eq 'fail') { exit 1 }
exit 0
