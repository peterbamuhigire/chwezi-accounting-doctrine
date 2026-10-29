param(
  [string]$RepoRoot,
  [switch]$Json
)

$ErrorActionPreference = 'Stop'
if ($RepoRoot) { $root = (Resolve-Path $RepoRoot).Path } else { $root = (Resolve-Path (Join-Path $PSScriptRoot '..\..\..')).Path }
$checker = Join-Path $root 'tools\check-package-file-count.ps1'
$fixture = Join-Path ([System.IO.Path]::GetTempPath()) ([guid]::NewGuid().ToString('N'))
$gitFixture = Join-Path $fixture '.git'
$nested = Join-Path $fixture 'nested'
$results = New-Object System.Collections.Generic.List[object]

try {
  New-Item -ItemType Directory -Path $gitFixture -Force | Out-Null
  New-Item -ItemType Directory -Path $nested -Force | Out-Null
  [System.IO.File]::WriteAllText((Join-Path $fixture 'visible.md'), 'fixture')
  [System.IO.File]::WriteAllText((Join-Path $gitFixture 'object'), 'git metadata')
  [System.IO.File]::WriteAllText((Join-Path $nested 'data.md'), 'fixture')

  $passOutput = & $checker -RepoRoot $fixture -MaximumFiles 3 -Json
  $passExit = $LASTEXITCODE
  $passReport = ($passOutput -join "`n") | ConvertFrom-Json
  $passOk = $passExit -eq 0 -and $passReport.state -eq 'pass' -and $passReport.summary.full_checkout_files -eq 3 -and $passReport.summary.package_oriented_files -eq 2
  [void]$results.Add([pscustomobject]@{ case = 'under-limit-counts-full-and-package'; passed = $passOk; checker_exit = $passExit; full = $passReport.summary.full_checkout_files; package = $passReport.summary.package_oriented_files })

  $failOutput = & $checker -RepoRoot $fixture -MaximumFiles 1 -Json
  $failExit = $LASTEXITCODE
  $failReport = ($failOutput -join "`n") | ConvertFrom-Json
  $codes = @($failReport.findings | ForEach-Object { $_.code })
  $failOk = $failExit -eq 1 -and $failReport.state -eq 'fail' -and $codes -contains 'PACKAGE-001' -and $codes -contains 'PACKAGE-002'
  [void]$results.Add([pscustomobject]@{ case = 'over-limit-fails-both-counts'; passed = $failOk; checker_exit = $failExit; findings = $codes })
} finally {
  if (Test-Path $fixture) { Remove-Item -LiteralPath $fixture -Recurse -Force }
}

$failed = @($results | Where-Object { -not $_.passed }).Count
$state = 'fail'
if ($failed -eq 0) { $state = 'pass' }
$report = [pscustomobject]@{ check = 'package-file-count-negative-controls'; state = $state; total_controls = $results.Count; failed_controls = $failed; results = $results.ToArray(); findings = @() }
if ($Json) { $report | ConvertTo-Json -Depth 8 } else { $report | ConvertTo-Json -Depth 8 }
if ($failed -gt 0) { exit 1 }
exit 0
