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

function Get-SourceRegisterEntryBlocks {
  # One block per list item, so every field is read from its own entry and
  # never from the first entry in the file.
  param([string[]]$Lines)

  $blocks = New-Object System.Collections.Generic.List[object]
  $current = $null
  foreach ($line in $Lines) {
    if ($line -match '^-\s+') {
      if ($null -ne $current) { [void]$blocks.Add($current) }
      $current = [pscustomobject]@{ lines = (New-Object System.Collections.Generic.List[string]) }
      [void]$current.lines.Add(($line -replace '^-\s+', '  '))
      continue
    }
    if ($null -ne $current) { [void]$current.lines.Add($line) }
  }
  if ($null -ne $current) { [void]$blocks.Add($current) }
  return $blocks.ToArray()
}

function ConvertTo-RegisterDate {
  param([string]$Value)
  if ([string]::IsNullOrWhiteSpace($Value) -or $Value.Length -lt 10) { return $null }
  [datetime]$parsed = [datetime]::MinValue
  $ok = [datetime]::TryParseExact($Value.Substring(0, 10), 'yyyy-MM-dd', [System.Globalization.CultureInfo]::InvariantCulture, [System.Globalization.DateTimeStyles]::None, [ref]$parsed)
  if ($ok) { return $parsed }
  return $null
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
    foreach ($entry in (Get-SourceRegisterEntries $lines)) {
      [void]$sourceEntries.Add([pscustomobject]@{
        id = $entry.id
        state = $entry.state
        path = $relative
      })
    }
    $blocks = @(Get-SourceRegisterEntryBlocks $lines)
    if ($blocks.Count -eq 0) {
      [void]$findings.Add((New-Finding 'high' 'SRC-002' 'Source-register file has no entries.' $relative 0))
      continue
    }
    foreach ($block in $blocks) {
      $entryLines = @($block.lines)
      $entryText = ($entryLines -join "`n")
      $entryId = Get-ScalarValue $entryLines 'id'
      $label = if ($entryId) { $entryId } else { '(entry without id)' }
      $state = Get-ScalarValue $entryLines 'state'
      if (-not $state) {
        [void]$findings.Add((New-Finding 'high' 'SRC-002' "Source-register entry $label has no state field." $relative 0))
        continue
      }
      if ($state -notin @('draft', 'verified-current', 'verified-with-caveat', 'stale', 'superseded', 'no-source-found', 'blocked')) {
        [void]$findings.Add((New-Finding 'high' 'SRC-003' "Unknown source-register state for ${label}: $state" $relative 0))
        continue
      }
      if ($state -eq 'verified-current') { $verifiedCurrent++ }
      if ($state -eq 'verified-with-caveat') { $verifiedWithCaveat++ }
      if ($state -eq 'draft') { $draftEntries++ }
      if ($state -eq 'stale') { $staleEntries++ }

      foreach ($required in @('topic', 'jurisdiction', 'source_url_or_doc', 'date_accessed_utc', 'verifier', 'expires_or_recheck_due')) {
        if ($entryText -notmatch "(?m)^\s*$([regex]::Escape($required))\s*:") {
          $severity = 'medium'
          if ($state -eq 'verified-current') { $severity = 'high' }
          [void]$findings.Add((New-Finding $severity 'SRC-004' "Entry $label is missing required source-register field: $required" $relative 0))
        }
      }

      $recheckDate = ConvertTo-RegisterDate (Get-ScalarValue $entryLines 'expires_or_recheck_due')
      $accessedDate = ConvertTo-RegisterDate (Get-ScalarValue $entryLines 'date_accessed_utc')
      if ($recheckDate -and $recheckDate.Date -lt (Get-Date).Date -and $state -in @('verified-current', 'verified-with-caveat')) {
        [void]$findings.Add((New-Finding 'high' 'SRC-005' "Verified source entry $label is past recheck due date: $($recheckDate.ToString('yyyy-MM-dd'))" $relative 0))
      }
      if ($recheckDate -and $accessedDate -and $recheckDate.Date -lt $accessedDate.Date) {
        [void]$findings.Add((New-Finding 'high' 'SRC-010' "Entry $label has a recheck due date ($($recheckDate.ToString('yyyy-MM-dd'))) earlier than its access date ($($accessedDate.ToString('yyyy-MM-dd')))." $relative 0))
      }
      if ($state -in @('verified-current', 'verified-with-caveat')) {
        $archive = Get-ScalarValue $entryLines 'archive_snapshot'
        if ([string]::IsNullOrWhiteSpace($archive) -or $archive -match '^(capture-required|NOT_CAPTURED)') {
          if ($state -eq 'verified-current') {
            [void]$findings.Add((New-Finding 'high' 'SRC-011' "Verified-current entry $label has no captured archive snapshot." $relative 0))
          }
        } elseif ($archive -notmatch '^[A-Za-z][A-Za-z0-9+.-]*://') {
          $archivePath = Join-Path $root ($archive -replace '/', [System.IO.Path]::DirectorySeparatorChar)
          if (-not (Test-Path -LiteralPath $archivePath)) {
            [void]$findings.Add((New-Finding 'high' 'SRC-011' "Entry $label names an archive snapshot that does not exist: $archive" $relative 0))
          }
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
