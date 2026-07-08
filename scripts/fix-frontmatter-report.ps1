param(
  [string]$RepoRoot,
  [string]$ReportPath,
  [switch]$Json,
  [switch]$Strict,
  [switch]$Fix
)

$ErrorActionPreference = 'Stop'

function Resolve-RepoRoot {
  param([string]$Start)
  if ($Start) { return (Resolve-Path $Start).Path }
  return (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
}

function Convert-ToSkillName {
  param([string]$Path)
  return (Split-Path (Split-Path $Path -Parent) -Leaf).ToLowerInvariant()
}

function New-Finding {
  param([string]$Severity, [string]$Code, [string]$Path, [string]$Message)
  [pscustomobject]@{
    severity = $Severity
    code = $Code
    path = $Path
    message = $Message
  }
}

function Get-Frontmatter {
  param([string]$Text)
  if ($Text -match "(?s)^---\s*\r?\n(.*?)\r?\n---\s*\r?\n") {
    return $matches[1]
  }
  return $null
}

function Get-Field {
  param([string]$Frontmatter, [string]$Name)
  if (-not $Frontmatter) { return $null }
  if ($Frontmatter -match "(?m)^$([regex]::Escape($Name))\s*:\s*(.+?)\s*$") {
    $value = $matches[1].Trim().Trim('"').Trim("'")
    if ($value -in @('>-', '|-', '>', '|')) {
      $lines = @($Frontmatter -split "`r?`n")
      $capturing = $false
      $folded = New-Object System.Collections.Generic.List[string]
      foreach ($line in $lines) {
        if ($line -match "^$([regex]::Escape($Name))\s*:") {
          $capturing = $true
          continue
        }
        if ($capturing) {
          if ($line -match '^\s{2,}(.+?)\s*$') {
            $folded.Add($matches[1].Trim())
          } else {
            break
          }
        }
      }
      return (($folded | Where-Object { $_ }) -join ' ')
    }
    return $value
  }
  return $null
}

function Test-WeakDescription {
  param([string]$Description, [string]$SkillName)
  if (-not $Description) { return $true }
  $normalized = $Description.Trim()
  if ($normalized.Length -lt 90) { return $true }
  if ($normalized -match '^(use when|handles|covers|skill for)\.?$') { return $true }
  if ($normalized -match '^\[MISSING\]$') { return $true }
  if ($normalized -notmatch '(Use when|Use for|Use whenever|govern|design|review|validate|prepare|account|reconcile|report|control|statutory|IFRS|tax|payroll|ledger)') { return $true }
  if ($normalized -eq $SkillName) { return $true }
  return $false
}

function Add-OrRepairFrontmatter {
  param([string]$Text, [string]$Name, [string]$Description)
  $frontmatter = Get-Frontmatter $Text
  if (-not $frontmatter) {
    return "---`nname: $Name`ndescription: $Description`nstatus: active`n---`n`n$Text"
  }
  $newFrontmatter = $frontmatter
  if (-not (Get-Field $frontmatter 'name')) {
    $newFrontmatter = "name: $Name`n" + $newFrontmatter
  }
  if (-not (Get-Field $frontmatter 'description')) {
    $newFrontmatter = $newFrontmatter.TrimEnd() + "`ndescription: $Description"
  }
  return ($Text -replace "(?s)^---\s*\r?\n.*?\r?\n---\s*\r?\n", "---`n$newFrontmatter`n---`n")
}

$root = Resolve-RepoRoot $RepoRoot
$skillFiles = @(Get-ChildItem -Path (Join-Path $root 'skills') -Recurse -Filter SKILL.md)
$findings = New-Object System.Collections.ArrayList
$fixed = New-Object System.Collections.ArrayList

foreach ($file in $skillFiles) {
  $relative = $file.FullName.Substring($root.Length + 1)
  $text = Get-Content -LiteralPath $file.FullName -Raw -Encoding UTF8
  $frontmatter = Get-Frontmatter $text
  $expectedName = Convert-ToSkillName $file.FullName
  $generatedDescription = "Use when applying the $expectedName accounting doctrine, including scope, inputs, outputs, decision rules, acceptance evidence, anti-patterns, reviewer routing, and source-register caveats."

  if (-not $frontmatter) {
    [void]$findings.Add((New-Finding 'blocker' 'FM-001' $relative 'Missing YAML frontmatter.'))
    if ($Fix) {
      Set-Content -LiteralPath $file.FullName -Encoding UTF8 -Value (Add-OrRepairFrontmatter $text $expectedName $generatedDescription)
      [void]$fixed.Add($relative)
    }
    continue
  }

  $name = Get-Field $frontmatter 'name'
  $description = Get-Field $frontmatter 'description'

  if (-not $name) {
    [void]$findings.Add((New-Finding 'blocker' 'FM-002' $relative 'Missing frontmatter name.'))
  } elseif ($name -ne $expectedName -and $Strict) {
    [void]$findings.Add((New-Finding 'high' 'FM-003' $relative "Frontmatter name '$name' does not match folder '$expectedName'."))
  }

  if (-not $description) {
    [void]$findings.Add((New-Finding 'blocker' 'FM-004' $relative 'Missing frontmatter description.'))
  } elseif (Test-WeakDescription $description $expectedName) {
    $severity = 'medium'
    if ($Strict) { $severity = 'high' }
    [void]$findings.Add((New-Finding $severity 'FM-005' $relative 'Weak or non-routing description; include intent, domain nouns, and trigger verbs.'))
  }

  if (($Fix) -and ((-not $name) -or (-not $description))) {
    Set-Content -LiteralPath $file.FullName -Encoding UTF8 -Value (Add-OrRepairFrontmatter $text $expectedName $generatedDescription)
    [void]$fixed.Add($relative)
  }
}

$state = 'pass'
if ($findings | Where-Object { $_.severity -in @('blocker', 'high') }) { $state = 'fail' }
elseif ($findings.Count -gt 0) { $state = 'pass-with-caveats' }

$report = [pscustomobject]@{
  check = 'frontmatter-report'
  state = $state
  ran_at = (Get-Date).ToString('s')
  repo_root = $root
  skill_files = $skillFiles.Count
  strict = [bool]$Strict
  fix_mode = [bool]$Fix
  fixed_files = @($fixed)
  findings = @($findings)
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
  $report | ConvertTo-Json -Depth 6 | Set-Content -LiteralPath $resolvedReport -Encoding UTF8
}

if ($Json) {
  $report | ConvertTo-Json -Depth 6
} else {
  Write-Host "check: frontmatter-report"
  Write-Host "state: $state"
  Write-Host "skill_files: $($skillFiles.Count)"
  Write-Host "findings: $($findings.Count)"
  foreach ($finding in $findings) {
    Write-Host ("[{0}] {1} {2} {3}" -f $finding.severity, $finding.code, $finding.path, $finding.message)
  }
}

if ($state -eq 'fail') { exit 1 }
exit 0
