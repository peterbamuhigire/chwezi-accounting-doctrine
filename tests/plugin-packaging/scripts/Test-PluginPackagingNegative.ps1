param(
  [string]$RepoRoot,
  [switch]$Json
)

$ErrorActionPreference = 'Stop'
if ($RepoRoot) { $root = (Resolve-Path $RepoRoot).Path } else { $root = (Resolve-Path (Join-Path $PSScriptRoot '..\..\..')).Path }
$checker = Join-Path $root 'tools\check-plugin-packaging.ps1'
$fixture = Join-Path ([System.IO.Path]::GetTempPath()) ([guid]::NewGuid().ToString('N'))
$results = New-Object System.Collections.Generic.List[object]

function Write-FixtureJson {
  param([string]$Path, [object]$Value)
  $directory = Split-Path $Path -Parent
  New-Item -ItemType Directory -Path $directory -Force | Out-Null
  $Value | ConvertTo-Json -Depth 10 | Set-Content -LiteralPath $Path -Encoding UTF8
}

try {
  New-Item -ItemType Directory -Path (Join-Path $fixture 'skills\example') -Force | Out-Null
  [System.IO.File]::WriteAllText((Join-Path $fixture 'skills\example\SKILL.md'), "---`nname: example`ndescription: Fixture skill.`n---`n")

  $codex = [pscustomobject]@{ name = 'accounting'; version = '1.0.0'; description = 'Fixture'; author = [pscustomobject]@{ name = 'Author' }; skills = './skills/' }
  $claude = [pscustomobject]@{ name = 'accounting'; version = '1.0.0'; description = 'Fixture'; author = [pscustomobject]@{ name = 'Author' }; skills = @('./skills/example/') }
  $codexMarket = [pscustomobject]@{ name = 'local'; plugins = @([pscustomobject]@{ name = 'accounting'; source = [pscustomobject]@{ source = 'local'; path = './' } }) }
  $claudeMarket = [pscustomobject]@{ plugins = @([pscustomobject]@{ name = 'accounting'; version = '1.0.0'; source = './' }) }
  Write-FixtureJson (Join-Path $fixture '.codex-plugin\plugin.json') $codex
  Write-FixtureJson (Join-Path $fixture '.claude-plugin\plugin.json') $claude
  Write-FixtureJson (Join-Path $fixture '.agents\plugins\marketplace.json') $codexMarket
  Write-FixtureJson (Join-Path $fixture '.claude-plugin\marketplace.json') $claudeMarket

  $passOutput = & $checker -RepoRoot $fixture -Json
  $passExit = $LASTEXITCODE
  $passReport = ($passOutput -join "`n") | ConvertFrom-Json
  $passOk = $passExit -eq 0 -and $passReport.state -eq 'pass' -and $passReport.summary.codex_discovered_skills -eq 1 -and $passReport.summary.claude_discovered_skills -eq 1
  [void]$results.Add([pscustomobject]@{ case = 'matching-host-manifests-resolve'; passed = $passOk; checker_exit = $passExit; findings = @($passReport.findings | ForEach-Object { $_.code }) })

  $codex.skills = './missing-skills/'
  Write-FixtureJson (Join-Path $fixture '.codex-plugin\plugin.json') $codex
  $failOutput = & $checker -RepoRoot $fixture -Json
  $failExit = $LASTEXITCODE
  $failReport = ($failOutput -join "`n") | ConvertFrom-Json
  $codes = @($failReport.findings | ForEach-Object { $_.code })
  $failOk = $failExit -eq 1 -and $failReport.state -eq 'fail' -and $codes -contains 'PACKAGING-003'
  [void]$results.Add([pscustomobject]@{ case = 'missing-codex-skill-root-is-rejected'; passed = $failOk; checker_exit = $failExit; findings = $codes })
} finally {
  if (Test-Path $fixture) { Remove-Item -LiteralPath $fixture -Recurse -Force }
}

$failed = @($results | Where-Object { -not $_.passed }).Count
$state = 'fail'
if ($failed -eq 0) { $state = 'pass' }
$report = [pscustomobject]@{ check = 'plugin-packaging-negative-controls'; state = $state; total_controls = $results.Count; failed_controls = $failed; results = $results.ToArray(); findings = @() }
if ($Json) { $report | ConvertTo-Json -Depth 8 } else { $report | ConvertTo-Json -Depth 8 }
if ($failed -gt 0) { exit 1 }
exit 0
