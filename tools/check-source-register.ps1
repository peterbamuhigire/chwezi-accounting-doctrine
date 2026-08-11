param(
  [string]$RepoRoot,
  [string]$RegisterRoot,
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

function Get-ScalarValue {
  param([string[]]$Lines, [string]$Field)
  foreach ($line in $Lines) {
    if ($line -match "^\s*$([regex]::Escape($Field))\s*:\s*(.+?)\s*$") {
      return $matches[1].Trim().Trim('"').Trim("'")
    }
  }
  return $null
}

function Get-SourceRegisterEntries {
  param([string[]]$Lines)

  $entries = New-Object System.Collections.Generic.List[object]
  $current = $null
  foreach ($line in $Lines) {
    if ($line -match '^-\s+' -and $line -notmatch '^-\s+id:\s*') {
      if ($null -ne $current) { [void]$entries.Add($current) }
      $current = [pscustomobject]@{ id = $null; state = $null }
      continue
    }
    $idMatch = [regex]::Match($line, '^\s*-\s+id:\s*(.+?)\s*$')
    if ($idMatch.Success) {
      if ($null -ne $current) { [void]$entries.Add($current) }
      $current = [pscustomobject]@{
        id = $idMatch.Groups[1].Value.Trim().Trim('"').Trim("'")
        state = $null
      }
      continue
    }
    if ($null -ne $current -and $line -match '^\s+state:\s*(.+?)\s*$') {
      $current.state = $matches[1].Trim().Trim('"').Trim("'")
    }
  }
  if ($null -ne $current) { [void]$entries.Add($current) }
  return $entries.ToArray()
}

$root = Resolve-DoctrineRepoRoot $RepoRoot
$registerRoot = if ($RegisterRoot) { (Resolve-Path $RegisterRoot).Path } else { Join-Path $root 'doctrine\source-register' }
$findings = New-Object System.Collections.ArrayList
$entryFiles = 0
$sourceEntries = New-Object System.Collections.Generic.List[object]
$duplicateSourceIds = New-Object System.Collections.Generic.List[string]
$verifiedCurrent = 0
$verifiedWithCaveat = 0
$draftEntries = 0
$staleEntries = 0

if (-not (Test-Path $registerRoot)) {
  $severity = 'caveat'
  if ($Strict) { $severity = 'high' }
  [void]$findings.Add((New-Finding $severity 'SRC-001' 'doctrine/source-register is not present. Final statutory, payroll, tax, FX, and e-invoicing output remains blocked until source entries exist.' 'doctrine/source-register' 0))
} else {
  $files = Get-ChildItem -Path $registerRoot -Recurse -File | Where-Object {
    ($_.Extension -in @('.yml', '.yaml', '.json')) -and ($_.Name -ne 'schema.yaml') -and ($_.Name -ne 'schema.yml')
  }
  foreach ($file in $files) {
    $entryFiles++
    $relative = if ($file.FullName.StartsWith($root, [System.StringComparison]::OrdinalIgnoreCase)) {
      $file.FullName.Substring($root.Length + 1)
    } else {
      $file.FullName
    }
    $lines = @(Get-Content -LiteralPath $file.FullName -Encoding UTF8)
    $text = ($lines -join "`n")
    foreach ($entry in (Get-SourceRegisterEntries $lines)) {
      [void]$sourceEntries.Add([pscustomobject]@{
        id = $entry.id
        state = $entry.state
        path = $relative
      })
    }
    $state = Get-ScalarValue $lines 'state'
    if (-not $state) {
      [void]$findings.Add((New-Finding 'high' 'SRC-002' 'Source-register file has no state field.' $relative 0))
      continue
    }
    if ($state -notin @('draft', 'verified-current', 'verified-with-caveat', 'stale', 'superseded', 'no-source-found', 'blocked')) {
      [void]$findings.Add((New-Finding 'high' 'SRC-003' "Unknown source-register state: $state" $relative 0))
      continue
    }
    if ($state -eq 'verified-current') { $verifiedCurrent++ }
    if ($state -eq 'verified-with-caveat') { $verifiedWithCaveat++ }
    if ($state -eq 'draft') { $draftEntries++ }
    if ($state -eq 'stale') { $staleEntries++ }

    foreach ($required in @('topic', 'jurisdiction', 'source_url_or_doc', 'date_accessed_utc', 'verifier', 'expires_or_recheck_due')) {
      if ($text -notmatch "(?m)^\s*$([regex]::Escape($required))\s*:") {
        $severity = 'medium'
        if ($state -eq 'verified-current') { $severity = 'high' }
        [void]$findings.Add((New-Finding $severity 'SRC-004' "Missing required source-register field: $required" $relative 0))
      }
    }

    $recheck = Get-ScalarValue $lines 'expires_or_recheck_due'
    if ($recheck) {
      [datetime]$parsed = [datetime]::MinValue
      if ([datetime]::TryParse($recheck, [ref]$parsed)) {
        if ($parsed.Date -lt (Get-Date).Date -and $state -in @('verified-current', 'verified-with-caveat')) {
          [void]$findings.Add((New-Finding 'high' 'SRC-005' "Verified source entry is past recheck due date: $recheck" $relative 0))
        }
      }
    }
  }

  if ($entryFiles -eq 0) {
    [void]$findings.Add((New-Finding 'caveat' 'SRC-006' 'Source-register directory exists but contains no YAML, JSON, or Markdown entries.' 'doctrine/source-register' 0))
  }
  if ($verifiedCurrent -eq 0) {
    [void]$findings.Add((New-Finding 'caveat' 'SRC-007' 'No verified-current entries found. Release can only support draft or caveated non-final outputs.' 'doctrine/source-register' 0))
  }

  foreach ($group in @($sourceEntries | Group-Object id | Where-Object { $_.Name -and $_.Count -gt 1 })) {
    [void]$duplicateSourceIds.Add([string]$group.Name)
    [void]$findings.Add((New-Finding 'high' 'SRC-008' "Duplicate source-register identity appears $($group.Count) times: $($group.Name)" (($group.Group | Select-Object -First 1).path) 0))
  }
  foreach ($entry in @($sourceEntries | Where-Object { [string]::IsNullOrWhiteSpace([string]$_.id) })) {
    [void]$findings.Add((New-Finding 'high' 'SRC-009' 'Source-register entry has no identity id.' $entry.path 0))
  }
}

$state = Get-ValidationState @($findings)
$result = [pscustomobject]@{
  check = 'source-register'
  state = $state
  summary = [pscustomobject]@{
    entry_files = $entryFiles
    source_entries = $sourceEntries.Count
    duplicate_source_ids = @($duplicateSourceIds)
    verified_current_entries = $verifiedCurrent
    verified_with_caveat_entries = $verifiedWithCaveat
    draft_entries = $draftEntries
    stale_entries = $staleEntries
    strict = [bool]$Strict
  }
  findings = @($findings)
}

if ($Json) {
  $result | ConvertTo-Json -Depth 6
} else {
  Write-Host "check: source-register"
  Write-Host "state: $state"
  Write-Host "entry_files: $entryFiles"
  Write-Host "verified_current_entries: $verifiedCurrent"
  foreach ($finding in $findings) {
    Write-Host ("[{0}] {1} {2} {3}" -f $finding.severity, $finding.code, $finding.path, $finding.message)
  }
}

if ($state -eq 'fail') { exit 1 }
exit 0
