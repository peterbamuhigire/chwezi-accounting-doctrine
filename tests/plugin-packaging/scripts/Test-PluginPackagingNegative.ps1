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

  New-Item -ItemType Directory -Path (Join-Path $fixture 'alternate\different') -Force | Out-Null
  [System.IO.File]::WriteAllText((Join-Path $fixture 'alternate\different\SKILL.md'), "---`nname: different`ndescription: Alternate fixture skill.`n---`n")
  $codex.skills = './alternate/'
  Write-FixtureJson (Join-Path $fixture '.codex-plugin\plugin.json') $codex
  $mismatchOutput = & $checker -RepoRoot $fixture -Json
  $mismatchExit = $LASTEXITCODE
  $mismatchReport = ($mismatchOutput -join "`n") | ConvertFrom-Json
  $mismatchCodes = @($mismatchReport.findings | ForEach-Object { $_.code })
  $mismatchOk = $mismatchExit -eq 1 -and $mismatchReport.state -eq 'fail' -and $mismatchCodes -contains 'PACKAGING-007'
  [void]$results.Add([pscustomobject]@{ case = 'same-count-different-codex-path-set-is-rejected'; passed = $mismatchOk; checker_exit = $mismatchExit; findings = $mismatchCodes })

  $codex.skills = './skills/'
  Write-FixtureJson (Join-Path $fixture '.codex-plugin\plugin.json') $codex
  $claude.skills = @('./skills/example/', './skills/example/')
  Write-FixtureJson (Join-Path $fixture '.claude-plugin\plugin.json') $claude
  $duplicateOutput = & $checker -RepoRoot $fixture -Json
  $duplicateExit = $LASTEXITCODE
  $duplicateReport = ($duplicateOutput -join "`n") | ConvertFrom-Json
  $duplicateCodes = @($duplicateReport.findings | ForEach-Object { $_.code })
  $duplicateOk = $duplicateExit -eq 1 -and $duplicateReport.state -eq 'fail' -and $duplicateCodes -contains 'PACKAGING-014'
  [void]$results.Add([pscustomobject]@{ case = 'duplicate-claude-skill-path-is-rejected'; passed = $duplicateOk; checker_exit = $duplicateExit; findings = $duplicateCodes })

  $claude.skills = @('./../outside/')
  Write-FixtureJson (Join-Path $fixture '.claude-plugin\plugin.json') $claude
  $traversalOutput = & $checker -RepoRoot $fixture -Json
  $traversalExit = $LASTEXITCODE
  $traversalReport = ($traversalOutput -join "`n") | ConvertFrom-Json
  $traversalCodes = @($traversalReport.findings | ForEach-Object { $_.code })
  $traversalOk = $traversalExit -eq 1 -and $traversalReport.state -eq 'fail' -and $traversalCodes -contains 'PACKAGING-009'
  [void]$results.Add([pscustomobject]@{ case = 'parent-directory-traversal-is-rejected'; passed = $traversalOk; checker_exit = $traversalExit; findings = $traversalCodes })

  if ([System.IO.Path]::DirectorySeparatorChar -ne '\') {
    $caseSkill = Join-Path $fixture 'skills\Example'
    New-Item -ItemType Directory -Path $caseSkill -Force | Out-Null
    [System.IO.File]::WriteAllText((Join-Path $caseSkill 'SKILL.md'), "---`nname: Example`ndescription: Case sibling fixture.`n---`n")
    $claude.skills = @('./skills/example/', './skills/Example/')
    Write-FixtureJson (Join-Path $fixture '.claude-plugin\plugin.json') $claude
    $caseOutput = & $checker -RepoRoot $fixture -Json
    $caseExit = $LASTEXITCODE
    $caseReport = ($caseOutput -join "`n") | ConvertFrom-Json
    $caseOk = $caseExit -eq 0 -and $caseReport.state -eq 'pass' -and $caseReport.summary.active_skills -eq 2 -and $caseReport.summary.claude_discovered_skills -eq 2
    [void]$results.Add([pscustomobject]@{ case = 'case-distinct-skill-directories-remain-distinct-on-case-sensitive-host'; passed = $caseOk; checker_exit = $caseExit; expected = 2; actual = $caseReport.summary.claude_discovered_skills })
  }

  if ([System.IO.Path]::DirectorySeparatorChar -ne '\') {
    $outside = Join-Path ([System.IO.Path]::GetTempPath()) ([guid]::NewGuid().ToString('N'))
    New-Item -ItemType Directory -Path $outside -Force | Out-Null
    try {
      [void][System.IO.Directory]::CreateSymbolicLink((Join-Path $fixture 'escape'), $outside)
      $claude.skills = @('./escape/')
      Write-FixtureJson (Join-Path $fixture '.claude-plugin\plugin.json') $claude
      $escapeOutput = & $checker -RepoRoot $fixture -Json
      $escapeExit = $LASTEXITCODE
      $escapeReport = ($escapeOutput -join "`n") | ConvertFrom-Json
      $escapeCodes = @($escapeReport.findings | ForEach-Object { $_.code })
      $escapeOk = $escapeExit -eq 1 -and $escapeReport.state -eq 'fail' -and $escapeCodes -contains 'PACKAGING-013'
      [void]$results.Add([pscustomobject]@{ case = 'symlink-escape-path-is-rejected'; passed = $escapeOk; checker_exit = $escapeExit; findings = $escapeCodes })
    } catch {
      [void]$results.Add([pscustomobject]@{ case = 'symlink-escape-path-is-rejected'; passed = $false; checker_exit = -1; error = $_.Exception.Message })
    } finally {
      if (Test-Path $outside) { Remove-Item -LiteralPath $outside -Recurse -Force }
    }
  }
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
