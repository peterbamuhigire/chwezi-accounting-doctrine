param(
  [string]$RepoRoot,
  [switch]$Json,
  [switch]$Strict
)

$ErrorActionPreference = 'Stop'

function Resolve-DoctrineRepoRoot {
  param([string]$Start)
  if ($Start) { return (Resolve-Path $Start).Path }
  return (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
}

function New-Finding {
  param([string]$Severity, [string]$Code, [string]$Message, [string]$Path, [int]$Line = 0)
  [pscustomobject]@{
    severity = $Severity
    code = $Code
    message = $Message
    path = $Path
    line = $Line
  }
}

function Get-ValidationState {
  param([object[]]$Findings)
  if ($Findings | Where-Object { $_.severity -in @('blocker', 'high') }) { return 'fail' }
  if ($Findings | Where-Object { $_.severity -in @('medium', 'low', 'caveat') }) { return 'pass-with-caveats' }
  return 'pass'
}

function Get-ManifestStates {
  param([string]$ManifestPath)
  $states = @{}
  if (-not (Test-Path $ManifestPath)) { return $states }
  foreach ($line in Get-Content -LiteralPath $ManifestPath -Encoding UTF8) {
    if ($line -match '^\|\s*`?([^`|]+?)`?\s*\|\s*(present|planned|external|deprecated)\s*\|') {
      $key = $matches[1].Trim().Replace('/', '\')
      $states[$key] = $matches[2].Trim()
    }
  }
  return $states
}

function Test-Heading {
  param([string]$Text, [string[]]$Names)
  foreach ($name in $Names) {
    if ($Text -match "(?im)^##+\s+$([regex]::Escape($name))\s*$") { return $true }
  }
  return $false
}

function Resolve-DeclaredPath {
  param([string]$Root, [string]$SkillDir, [string]$Declared)
  $clean = $Declared.Trim().TrimEnd('.').Replace('/', '\')
  if ($clean -eq 'SKILL.md') { return (Join-Path $SkillDir $clean) }
  if ($clean -match '^(doctrine|governance|skills|docs|integration|tools)\\') {
    return (Join-Path $Root $clean)
  }
  return (Join-Path $SkillDir $clean)
}

$root = Resolve-DoctrineRepoRoot $RepoRoot
$manifest = Get-ManifestStates (Join-Path $root 'docs\reference-manifest.md')
$findings = New-Object System.Collections.ArrayList
$skillRoot = Join-Path $root 'skills'
# Skills are organised into category sub-folders under skills/.
# A category folder is any direct child of skills/ that contains no SKILL.md
# itself but has skill sub-folders. A skill folder is any folder that contains
# a SKILL.md, regardless of nesting depth.
$skillFiles = @(Get-ChildItem -Path $skillRoot -Recurse -Filter SKILL.md)
$skillDirs = @($skillFiles | ForEach-Object { Get-Item (Split-Path $_.FullName -Parent) })
$categoryDirs = @(Get-ChildItem -Path $skillRoot -Directory | Where-Object {
  -not (Test-Path (Join-Path $_.FullName 'SKILL.md'))
})
$activeSkillCount = $skillFiles.Count
$plannedSkillDirs = 0
$declaredReferences = 0
$missingDeclaredReferences = 0
$qualityGateIds = 0
$qualityGateCovered = 0
$qualityGatePlanned = 0

# Soft ceiling - gap-stub introduction can take this higher, but a runaway
# explosion still warrants attention from the doctrine owner.
if ($activeSkillCount -gt 120) {
  [void]$findings.Add((New-Finding 'caveat' 'SKILL-001' "Active finance skill count is $activeSkillCount, above the advisory ceiling of 120." 'skills' 0))
}

# Inside each category folder, every direct sub-folder is expected to be a
# skill folder. Sub-folders without a SKILL.md are flagged as planned.
foreach ($cat in $categoryDirs) {
  foreach ($dir in (Get-ChildItem -Path $cat.FullName -Directory)) {
    $skillFile = Join-Path $dir.FullName 'SKILL.md'
    $relativeDir = $dir.FullName.Substring($root.Length + 1)
    if (-not (Test-Path $skillFile)) {
      $plannedSkillDirs++
      $severity = 'caveat'
      if ($Strict) { $severity = 'high' }
      [void]$findings.Add((New-Finding $severity 'SKILL-002' 'Skill directory exists without SKILL.md; treated as planned, not active.' $relativeDir 0))
    }
  }
}

foreach ($file in $skillFiles) {
  $relative = $file.FullName.Substring($root.Length + 1)
  $skillDir = Split-Path $file.FullName -Parent
  $text = Get-Content -LiteralPath $file.FullName -Raw -Encoding UTF8

  if ($text -notmatch '(?s)^---\s+.+?\s+---') {
    [void]$findings.Add((New-Finding 'high' 'SKILL-003' 'SKILL.md is missing YAML frontmatter.' $relative 0))
  } else {
    if ($text -notmatch '(?m)^name\s*:') {
      [void]$findings.Add((New-Finding 'high' 'SKILL-004' 'Skill frontmatter is missing name.' $relative 0))
    }
    if ($text -notmatch '(?m)^description\s*:') {
      [void]$findings.Add((New-Finding 'high' 'SKILL-005' 'Skill frontmatter is missing description.' $relative 0))
    }
  }

  if (($text -notmatch '(?im)Last reviewed:\s*\d{4}-\d{2}-\d{2}') -or ($text -notmatch '(?im)Next review due:\s*\d{4}-\d{2}-\d{2}')) {
    $severity = 'caveat'
    if ($Strict) { $severity = 'high' }
    [void]$findings.Add((New-Finding $severity 'SKILL-006' 'Review metadata should include Last reviewed and Next review due dates.' $relative 0))
  }

  $sectionRules = @(
    @{ Code = 'SKILL-010'; Name = 'Prerequisites'; Aliases = @('Prerequisites', 'Required first reads', 'Required reads') },
    @{ Code = 'SKILL-011'; Name = 'Inputs'; Aliases = @('Inputs') },
    @{ Code = 'SKILL-012'; Name = 'Outputs'; Aliases = @('Outputs', 'Output standard') },
    @{ Code = 'SKILL-013'; Name = 'Decision Rules'; Aliases = @('Decision Rules', 'Decision rules') },
    @{ Code = 'SKILL-014'; Name = 'Acceptance Evidence'; Aliases = @('Acceptance Evidence', 'Acceptance evidence', 'Acceptance evidence (tests)') },
    @{ Code = 'SKILL-015'; Name = 'Anti-Patterns'; Aliases = @('Anti-Patterns', 'Anti-patterns', 'Forbidden patterns', 'Forbidden Patterns') }
  )
  foreach ($rule in $sectionRules) {
    if (-not (Test-Heading $text $rule.Aliases)) {
      $severity = 'caveat'
      if ($Strict) { $severity = 'high' }
      [void]$findings.Add((New-Finding $severity $rule.Code "Missing normalized section: $($rule.Name)." $relative 0))
    }
  }

  $inFiles = $false
  foreach ($line in ($text -split "`r?`n")) {
    if ($line -match '^## Files\s*$') { $inFiles = $true; continue }
    if ($inFiles -and $line -match '^##\s+') { $inFiles = $false }
    if ($inFiles -and $line -match '`([^`]+)`') {
      $declaredReferences++
      $declared = $matches[1].Trim()
      $resolved = Resolve-DeclaredPath $root $skillDir $declared
      if (-not (Test-Path $resolved)) {
        $missingDeclaredReferences++
        $rootRelative = $resolved.Substring($root.Length + 1)
        $manifestState = $null
        if ($manifest.ContainsKey($rootRelative)) { $manifestState = $manifest[$rootRelative] }
        if (-not $manifestState) {
          [void]$findings.Add((New-Finding 'high' 'SKILL-020' "Declared file is missing and not classified in docs/reference-manifest.md: $declared" $relative 0))
        } elseif ($manifestState -in @('planned', 'external', 'deprecated')) {
          [void]$findings.Add((New-Finding 'caveat' 'SKILL-021' "Declared file is $manifestState in reference manifest: $rootRelative" $relative 0))
        } elseif ($manifestState -eq 'present') {
          [void]$findings.Add((New-Finding 'high' 'SKILL-022' "Manifest says present, but declared file is missing: $rootRelative" $relative 0))
        }
      }
    }
  }
}

$gatePath = Join-Path $root 'governance\finance-accounting-quality-gate.md'
$mapPath = Join-Path $root 'docs\quality-gate-fixture-map.md'
if ((Test-Path $gatePath) -and (Test-Path $mapPath)) {
  $gateText = Get-Content -LiteralPath $gatePath -Raw -Encoding UTF8
  $mapText = Get-Content -LiteralPath $mapPath -Raw -Encoding UTF8
  $ids = @([regex]::Matches($gateText, 'B-\d{3}') | ForEach-Object { $_.Value } | Sort-Object -Unique)
  $qualityGateIds = $ids.Count
  foreach ($id in $ids) {
    if ($mapText -notmatch [regex]::Escape($id)) {
      [void]$findings.Add((New-Finding 'high' 'GATE-001' "Quality-gate blocker is missing from fixture map: $id" 'docs/quality-gate-fixture-map.md' 0))
    } else {
      $qualityGateCovered++
      $line = ($mapText -split "`r?`n" | Where-Object { $_ -match [regex]::Escape($id) } | Select-Object -First 1)
      if ($line -match '\|\s*planned\s*\|') { $qualityGatePlanned++ }
    }
  }
  if ($qualityGatePlanned -gt 0) {
    [void]$findings.Add((New-Finding 'caveat' 'GATE-002' "$qualityGatePlanned quality-gate blocker rows are mapped to planned fixtures or checks." 'docs/quality-gate-fixture-map.md' 0))
  }
} else {
  [void]$findings.Add((New-Finding 'high' 'GATE-003' 'Quality gate file or fixture map is missing.' 'docs/quality-gate-fixture-map.md' 0))
}

$state = Get-ValidationState @($findings)
$result = [pscustomobject]@{
  check = 'skill-contracts'
  state = $state
  summary = [pscustomobject]@{
    active_finance_skills = $activeSkillCount
    skill_directories = $skillDirs.Count
    planned_skill_directories = $plannedSkillDirs
    declared_references = $declaredReferences
    missing_declared_references = $missingDeclaredReferences
    quality_gate_blockers = $qualityGateIds
    quality_gate_blockers_covered = $qualityGateCovered
    quality_gate_planned_rows = $qualityGatePlanned
    strict = [bool]$Strict
  }
  findings = @($findings)
}

if ($Json) {
  $result | ConvertTo-Json -Depth 6
} else {
  Write-Host "check: skill-contracts"
  Write-Host "state: $state"
  Write-Host "active_finance_skills: $activeSkillCount"
  Write-Host "planned_skill_directories: $plannedSkillDirs"
  Write-Host "missing_declared_references: $missingDeclaredReferences"
  Write-Host "quality_gate_blockers_covered: $qualityGateCovered / $qualityGateIds"
  foreach ($finding in $findings) {
    Write-Host ("[{0}] {1} {2} {3}" -f $finding.severity, $finding.code, $finding.path, $finding.message)
  }
}

if ($state -eq 'fail') { exit 1 }
exit 0
