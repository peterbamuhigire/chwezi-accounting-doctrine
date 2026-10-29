param(
  [string]$RepoRoot,
  [switch]$Json
)

$ErrorActionPreference = 'Stop'
if ($RepoRoot) { $root = (Resolve-Path $RepoRoot).Path } else { $root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path }
$findings = New-Object System.Collections.ArrayList
$codexPathCount = 0
$claudePathCount = 0
$activeSkillCount = @(Get-ChildItem -LiteralPath (Join-Path $root 'skills') -Filter 'SKILL.md' -Recurse -File).Count

function Read-JsonManifest {
  param([string]$Path, [string]$Code)
  if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
    [void]$findings.Add([pscustomobject]@{ severity = 'high'; code = $Code; message = "Required manifest not found: $Path" })
    return $null
  }
  try { return Get-Content -LiteralPath $Path -Raw -Encoding UTF8 | ConvertFrom-Json }
  catch {
    [void]$findings.Add([pscustomobject]@{ severity = 'high'; code = $Code; message = "Invalid JSON manifest: $Path" })
    return $null
  }
}

function Resolve-Directory {
  param([string]$RelativePath, [string]$Code, [string]$Context)
  if (-not $RelativePath.StartsWith('./')) {
    [void]$findings.Add([pscustomobject]@{ severity = 'high'; code = $Code; message = "$Context path must be relative to the plugin root and start with ./: $RelativePath" })
    return $null
  }
  $candidate = [System.IO.Path]::GetFullPath((Join-Path $root $RelativePath))
  $prefix = $root.TrimEnd([System.IO.Path]::DirectorySeparatorChar) + [System.IO.Path]::DirectorySeparatorChar
  if (-not $candidate.StartsWith($prefix, [System.StringComparison]::OrdinalIgnoreCase) -and $candidate -ne $root) {
    [void]$findings.Add([pscustomobject]@{ severity = 'high'; code = $Code; message = "$Context path escapes the plugin root: $RelativePath" })
    return $null
  }
  if (-not (Test-Path -LiteralPath $candidate -PathType Container)) {
    [void]$findings.Add([pscustomobject]@{ severity = 'high'; code = $Code; message = "$Context directory does not exist: $RelativePath" })
    return $null
  }
  return $candidate
}

$codex = Read-JsonManifest (Join-Path $root '.codex-plugin/plugin.json') 'PACKAGING-001'
$claude = Read-JsonManifest (Join-Path $root '.claude-plugin/plugin.json') 'PACKAGING-002'
$codexMarket = Read-JsonManifest (Join-Path $root '.agents/plugins/marketplace.json') 'PACKAGING-004'
$claudeMarket = Read-JsonManifest (Join-Path $root '.claude-plugin/marketplace.json') 'PACKAGING-005'

if ($codex) {
  if (-not $codex.name -or -not $codex.version -or -not $codex.description -or -not $codex.author.name) {
    [void]$findings.Add([pscustomobject]@{ severity = 'high'; code = 'PACKAGING-006'; message = 'Codex compatibility manifest lacks name, version, description or author.name.' })
  }
  if ($codex.skills -isnot [string]) {
    [void]$findings.Add([pscustomobject]@{ severity = 'high'; code = 'PACKAGING-003'; message = 'Codex compatibility skills must be one relative directory path.' })
  } else {
    $skillRoot = Resolve-Directory ([string]$codex.skills) 'PACKAGING-003' 'Codex skills'
    if ($skillRoot) {
      $codexPathCount = @(Get-ChildItem -LiteralPath $skillRoot -Filter 'SKILL.md' -Recurse -File).Count
      if ($codexPathCount -ne $activeSkillCount) {
        [void]$findings.Add([pscustomobject]@{ severity = 'high'; code = 'PACKAGING-007'; message = "Codex discovery resolves $codexPathCount skill files; repository contains $activeSkillCount." })
      }
    }
  }
}

if ($claude) {
  if (-not $claude.name -or -not $claude.version -or -not $claude.description -or -not $claude.author.name) {
    [void]$findings.Add([pscustomobject]@{ severity = 'high'; code = 'PACKAGING-008'; message = 'Claude plugin manifest lacks name, version, description or author.name.' })
  }
  if ($claude.skills -isnot [System.Array]) {
    [void]$findings.Add([pscustomobject]@{ severity = 'high'; code = 'PACKAGING-009'; message = 'Claude skills must be an array of plugin-root-relative directories.' })
  } else {
    $seen = @{}
    foreach ($entry in $claude.skills) {
      $skillPath = Resolve-Directory ([string]$entry) 'PACKAGING-009' 'Claude skill'
      if ($skillPath) {
        if (-not (Test-Path -LiteralPath (Join-Path $skillPath 'SKILL.md') -PathType Leaf)) {
          [void]$findings.Add([pscustomobject]@{ severity = 'high'; code = 'PACKAGING-009'; message = "Claude skill path has no SKILL.md: $entry" })
        } elseif (-not $seen.ContainsKey($skillPath)) {
          $seen[$skillPath] = $true
          $claudePathCount++
        }
      }
    }
    if ($claudePathCount -ne $activeSkillCount) {
      [void]$findings.Add([pscustomobject]@{ severity = 'high'; code = 'PACKAGING-010'; message = "Claude manifest resolves $claudePathCount distinct skill paths; repository contains $activeSkillCount." })
    }
  }
}

if ($codexMarket) {
  $entry = @($codexMarket.plugins | Where-Object { $_.name -eq $codex.name }) | Select-Object -First 1
  if (-not $entry -or $entry.source.source -ne 'local' -or -not $entry.source.path) {
    [void]$findings.Add([pscustomobject]@{ severity = 'high'; code = 'PACKAGING-011'; message = 'Codex local marketplace must contain the matching plugin with a local source path.' })
  } elseif (-not (Resolve-Directory ([string]$entry.source.path) 'PACKAGING-011' 'Codex marketplace source')) {
    # Resolve-Directory reports the missing or unsafe source path.
  }
}

if ($claudeMarket) {
  $entry = @($claudeMarket.plugins | Where-Object { $_.name -eq $claude.name }) | Select-Object -First 1
  if (-not $entry -or -not $entry.source -or $entry.version -ne $claude.version) {
    [void]$findings.Add([pscustomobject]@{ severity = 'high'; code = 'PACKAGING-012'; message = 'Claude marketplace entry is missing or does not match the plugin name/version.' })
  }
}

$state = 'pass'
if ($findings.Count -gt 0) { $state = 'fail' }
$report = [pscustomobject]@{
  check = 'plugin-packaging'
  state = $state
  summary = [pscustomobject]@{ active_skills = $activeSkillCount; codex_discovered_skills = $codexPathCount; claude_discovered_skills = $claudePathCount }
  findings = @($findings)
}
if ($Json) { $report | ConvertTo-Json -Depth 8 } else { $report | ConvertTo-Json -Depth 8 }
if ($state -eq 'fail') { exit 1 }
exit 0
