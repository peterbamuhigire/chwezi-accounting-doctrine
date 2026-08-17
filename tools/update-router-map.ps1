param(
  [string]$RepoRoot,
  [string]$MapPath,
  [switch]$Check,
  [switch]$Json
)

$ErrorActionPreference = 'Stop'

function Resolve-DoctrineRepoRoot {
  param([string]$Start)
  if ($Start) { return (Resolve-Path $Start).Path }
  return (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
}

function Get-FrontmatterValue {
  param(
    [string[]]$Lines,
    [string]$Field
  )

  $start = -1
  $end = -1
  for ($index = 0; $index -lt $Lines.Count; $index++) {
    if ($Lines[$index].Trim() -eq '---') {
      if ($start -lt 0) { $start = $index } else { $end = $index; break }
    }
  }
  if ($start -lt 0 -or $end -lt 0) { return $null }

  $fieldPattern = '^' + [regex]::Escape($Field) + ':\s*(.*)$'
  for ($index = $start + 1; $index -lt $end; $index++) {
    $match = [regex]::Match($Lines[$index], $fieldPattern)
    if (-not $match.Success) { continue }

    $value = $match.Groups[1].Value.Trim()
    if ($Field -ne 'description' -or $value -notmatch '^(\||>)(-)?$') {
      return $value.Trim('"', "'")
    }

    $parts = New-Object System.Collections.Generic.List[string]
    for ($continuation = $index + 1; $continuation -lt $end; $continuation++) {
      $line = $Lines[$continuation]
      if ($line -match '^\S[^:]*:\s*') { break }
      if ($line.Trim()) { [void]$parts.Add($line.Trim()) }
    }
    return (($parts -join ' ').Trim())
  }
  return $null
}

function Get-RouterMapText {
  param([string]$Root)

  $skillsRoot = Join-Path $Root 'skills'
  if (-not (Test-Path -LiteralPath $skillsRoot)) {
    throw "Missing active skills root: $skillsRoot"
  }

  $rows = @(
    Get-ChildItem -LiteralPath $skillsRoot -Recurse -File -Filter 'SKILL.md' |
      Sort-Object FullName |
      ForEach-Object {
        $lines = Get-Content -LiteralPath $_.FullName -Encoding UTF8
        $name = Get-FrontmatterValue $lines 'name'
        $description = Get-FrontmatterValue $lines 'description'
        if (-not $name -or -not $description) {
          throw "Missing name or description frontmatter: $($_.FullName)"
        }
        $relative = $_.FullName.Substring($Root.Length).TrimStart('\', '/') -replace '\\', '/'
        [pscustomobject]@{
          Name = $name
          Path = $relative
          Description = ($description -replace '\s+', ' ').Replace('|', '\|')
        }
      }
  )

  $duplicateNames = @($rows | Group-Object Name | Where-Object { $_.Count -gt 1 })
  if ($duplicateNames.Count -gt 0) {
    throw "Duplicate skill names found: $($duplicateNames.Name -join ', ')"
  }

  $output = New-Object System.Collections.Generic.List[string]
  [void]$output.Add('# Chwezi Accounting Doctrine Router Map')
  [void]$output.Add('')
  [void]$output.Add('Generated: filesystem-derived by `tools/update-router-map.ps1`.')
  [void]$output.Add('Source: live filesystem discovery of `skills/**/SKILL.md`.')
  [void]$output.Add('')
  [void]$output.Add('| Skill | Path | Description |')
  [void]$output.Add('|---|---|---|')
  foreach ($row in $rows) {
    [void]$output.Add("| $($row.Name) | $($row.Path) | $($row.Description) |")
  }
  return [pscustomobject]@{
    Text = ($output -join "`n")
    SkillCount = $rows.Count
  }
}

function Normalize-Text {
  param([string]$Text)
  $withoutBom = $Text.TrimStart([char]0xFEFF)
  return (($withoutBom -replace "`r`n", "`n" -replace "`r", "`n").TrimEnd("`n"))
}

function Get-FirstTextDifference {
  param(
    [string]$Actual,
    [string]$Expected
  )

  $actualLines = $Actual -split "`n"
  $expectedLines = $Expected -split "`n"
  $limit = [Math]::Max($actualLines.Count, $expectedLines.Count)
  for ($index = 0; $index -lt $limit; $index++) {
    $actualLine = if ($index -lt $actualLines.Count) { $actualLines[$index] } else { '<missing>' }
    $expectedLine = if ($index -lt $expectedLines.Count) { $expectedLines[$index] } else { '<missing>' }
    if ($actualLine -cne $expectedLine) {
      return "line $($index + 1): actual=[$actualLine] expected=[$expectedLine]"
    }
  }
  return 'no line-level difference found'
}

function Resolve-MapPath {
  param([string]$Root, [string]$RequestedPath)
  if (-not $RequestedPath) { return (Join-Path $Root 'docs\router-map.md') }
  if ([System.IO.Path]::IsPathRooted($RequestedPath)) { return (Resolve-Path $RequestedPath).Path }
  return (Join-Path $Root $RequestedPath)
}

function Get-RouterRows {
  param([string]$Text)

  $rows = New-Object System.Collections.Generic.List[object]
  $lineNumber = 0
  foreach ($line in ($Text -split "`r?`n")) {
    $lineNumber++
    $match = [regex]::Match($line, '^\|\s*([^|]+?)\s*\|\s*([^|]+?)\s*\|')
    if (-not $match.Success) { continue }
    $name = $match.Groups[1].Value.Trim()
    $path = $match.Groups[2].Value.Trim()
    if ($name -eq 'Skill' -or $name -match '^[-]+$' -or $path -match '^[-]+$') { continue }
    [void]$rows.Add([pscustomobject]@{ Name = $name; Path = $path; Line = $lineNumber })
  }
  return $rows.ToArray()
}

function Add-Finding {
  param(
    [System.Collections.ArrayList]$Findings,
    [string]$Code,
    [string]$Message,
    [int]$Line = 0
  )
  [void]$Findings.Add([pscustomobject]@{
    severity = 'blocker'
    code = $Code
    path = 'docs/router-map.md'
    line = $Line
    message = $Message
  })
}

function Add-RouterMapSemanticFindings {
  param(
    [string]$ActualText,
    [object[]]$ExpectedRows,
    [System.Collections.ArrayList]$Findings
  )

  $actualRows = @(Get-RouterRows $ActualText)
  $placeholderLines = @($ActualText -split "`r?`n" | Where-Object { $_ -match '\$name|\$rel' })
  if ($placeholderLines.Count -gt 0) {
    Add-Finding $Findings 'ROUTER-003' "Router map contains placeholder tokens (`$name or `$rel) in $($placeholderLines.Count) row(s)." 0
  }

  foreach ($group in @($actualRows | Group-Object Name | Where-Object { $_.Count -gt 1 })) {
    Add-Finding $Findings 'ROUTER-004' "Router map contains duplicate skill route name: $($group.Name)." $group.Group[0].Line
  }
  foreach ($group in @($actualRows | Group-Object Path | Where-Object { $_.Count -gt 1 })) {
    Add-Finding $Findings 'ROUTER-004' "Router map contains duplicate skill route path: $($group.Name)." $group.Group[0].Line
  }

  $expectedByPath = @{}
  foreach ($row in @($ExpectedRows)) { $expectedByPath[$row.Path] = $true }
  $actualByPath = @{}
  foreach ($row in $actualRows) { $actualByPath[$row.Path] = $true }

  $missing = @($expectedByPath.Keys | Where-Object { -not $actualByPath.ContainsKey($_) } | Sort-Object)
  if ($missing.Count -gt 0) {
    Add-Finding $Findings 'ROUTER-005' "Router map is missing $($missing.Count) filesystem-derived route path(s): $($missing -join ', ')." 0
  }
  $unexpected = @($actualByPath.Keys | Where-Object { -not $expectedByPath.ContainsKey($_) } | Sort-Object)
  if ($unexpected.Count -gt 0) {
    Add-Finding $Findings 'ROUTER-006' "Router map contains $($unexpected.Count) route path(s) not found under skills/**/SKILL.md: $($unexpected -join ', ')." 0
  }
  return $actualRows
}

$root = Resolve-DoctrineRepoRoot $RepoRoot
$mapPath = Resolve-MapPath $root $MapPath
$findings = New-Object System.Collections.ArrayList
$generated = $null
try {
  $generated = Get-RouterMapText $root
} catch {
  Add-Finding $findings 'ROUTER-007' $_.Exception.Message 0
}

if ($Check) {
  if (-not (Test-Path -LiteralPath $mapPath)) {
    Add-Finding $findings 'ROUTER-001' 'Router map is missing.' 0
  } elseif ($null -ne $generated) {
    $actual = Get-Content -LiteralPath $mapPath -Raw -Encoding UTF8
    $actualRows = Add-RouterMapSemanticFindings $actual (Get-RouterRows $generated.Text) $findings
    $normalizedActual = Normalize-Text $actual
    $normalizedExpected = Normalize-Text $generated.Text
    if ($normalizedActual -cne $normalizedExpected) {
      $difference = Get-FirstTextDifference $normalizedActual $normalizedExpected
      Add-Finding $findings 'ROUTER-002' "Router map differs from filesystem-derived output; run tools/update-router-map.ps1. ($difference)" 0
    }
  }
} elseif ($null -ne $generated) {
  $mapDirectory = Split-Path -Parent $mapPath
  if (-not (Test-Path -LiteralPath $mapDirectory)) { New-Item -ItemType Directory -Path $mapDirectory -Force | Out-Null }
  Set-Content -LiteralPath $mapPath -Value $generated.Text -Encoding UTF8
}

$state = if ($findings.Count -eq 0 -and $null -ne $generated) { 'pass' } else { 'fail' }
$placeholderRows = 0
if (Test-Path -LiteralPath $mapPath) {
  $placeholderRows = @((Get-Content -LiteralPath $mapPath -Raw) -split "`n" | Where-Object { $_ -match '\$name|\$rel' }).Count
}
$report = [pscustomobject]@{
  check = 'router-map'
  state = $state
  repo_root = $root
  map_path = $mapPath
  skill_count = if ($null -ne $generated) { $generated.SkillCount } else { 0 }
  placeholder_rows = $placeholderRows
  findings = @($findings)
}

if ($Json) {
  $report | ConvertTo-Json -Depth 8
} else {
  Write-Host "check: router-map"
  Write-Host "state: $($report.state)"
  Write-Host "skill_count: $($report.skill_count)"
  Write-Host "placeholder_rows: $($report.placeholder_rows)"
  foreach ($finding in $findings) { Write-Host "[$($finding.severity)] $($finding.code) $($finding.message)" }
}

if ($state -eq 'fail') { exit 1 }
exit 0
