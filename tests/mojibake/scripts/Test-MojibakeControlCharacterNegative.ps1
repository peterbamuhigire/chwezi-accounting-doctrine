param(
  [string]$RepoRoot,
  [switch]$Json
)

$ErrorActionPreference = 'Stop'
if ($RepoRoot) { $root = (Resolve-Path $RepoRoot).Path } else { $root = (Resolve-Path (Join-Path $PSScriptRoot '..\..\..')).Path }
$checker = Join-Path $root 'tools\check-mojibake.ps1'
$fixtureRoot = Join-Path ([System.IO.Path]::GetTempPath()) ([guid]::NewGuid().ToString('N'))
$fixturePath = Join-Path $fixtureRoot 'fixture.md'
$results = New-Object System.Collections.Generic.List[object]

try {
  New-Item -ItemType Directory -Path $fixtureRoot | Out-Null
  [System.IO.File]::WriteAllText($fixturePath, "tab`tpermitted`nfield$([char]0x07)name`n", [System.Text.UTF8Encoding]::new($false))
  $controlOutput = & $checker -RepoRoot $fixtureRoot -Json -Strict
  $controlExit = $LASTEXITCODE
  $controlReport = ($controlOutput -join "`n") | ConvertFrom-Json
  $controlFinding = @($controlReport.findings | Where-Object { $_.code -eq 'MOJIBAKE-003' }).Count -eq 1
  $controlPassed = $controlExit -eq 1 -and $controlReport.state -eq 'fail' -and $controlFinding -and $controlReport.summary.control_character_matches -eq 1
  [void]$results.Add([pscustomobject]@{ case = 'bell-control-is-rejected'; passed = $controlPassed; checker_exit = $controlExit; findings = @($controlReport.findings | ForEach-Object { $_.code }) })

  [System.IO.File]::WriteAllText($fixturePath, "tab`tpermitted`nplain text`n", [System.Text.UTF8Encoding]::new($false))
  $cleanOutput = & $checker -RepoRoot $fixtureRoot -Json -Strict
  $cleanExit = $LASTEXITCODE
  $cleanReport = ($cleanOutput -join "`n") | ConvertFrom-Json
  $cleanPassed = $cleanExit -eq 0 -and $cleanReport.state -eq 'pass' -and $cleanReport.summary.control_character_matches -eq 0
  [void]$results.Add([pscustomobject]@{ case = 'tab-remains-permitted'; passed = $cleanPassed; checker_exit = $cleanExit; findings = @($cleanReport.findings | ForEach-Object { $_.code }) })
} finally {
  if (Test-Path $fixtureRoot) { Remove-Item -LiteralPath $fixtureRoot -Recurse -Force }
}

$failed = @($results | Where-Object { -not $_.passed }).Count
$state = 'fail'
if ($failed -eq 0) { $state = 'pass' }
$report = [pscustomobject]@{
  check = 'mojibake-control-negative-controls'
  state = $state
  total_controls = $results.Count
  failed_controls = $failed
  results = $results.ToArray()
  findings = @()
}
if ($Json) { $report | ConvertTo-Json -Depth 8 } else { $report | ConvertTo-Json -Depth 8 }
if ($failed -gt 0) { exit 1 }
exit 0
