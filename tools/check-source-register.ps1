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

function Get-ScalarValue {
  param([string[]]$Lines, [string]$Field)
  foreach ($line in $Lines) {
    if ($line -match "^\s*$([regex]::Escape($Field))\s*:\s*(.+?)\s*$") {
      return $matches[1].Trim().Trim('"').Trim("'")
    }
  }
  return $null
}

$root = Resolve-DoctrineRepoRoot $RepoRoot
$registerRoot = Join-Path $root 'doctrine\source-register'
$findings = New-Object System.Collections.ArrayList
$entryFiles = 0
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
    $relative = $file.FullName.Substring($root.Length + 1)
    $lines = @(Get-Content -LiteralPath $file.FullName -Encoding UTF8)
    $text = ($lines -join "`n")
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
}

$state = Get-ValidationState @($findings)
$result = [pscustomobject]@{
  check = 'source-register'
  state = $state
  summary = [pscustomobject]@{
    entry_files = $entryFiles
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
