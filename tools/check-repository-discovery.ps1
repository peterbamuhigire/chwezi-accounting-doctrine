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

function Add-Finding {
  param(
    [System.Collections.ArrayList]$Findings,
    [string]$Code,
    [string]$Path,
    [string]$Message
  )
  [void]$Findings.Add([pscustomobject]@{
    severity = 'blocker'
    code = $Code
    path = $Path
    line = 0
    message = $Message
  })
}

$root = Resolve-DoctrineRepoRoot $RepoRoot
$findings = New-Object System.Collections.ArrayList
$agentsPath = Join-Path $root 'AGENTS.md'
$claudePath = Join-Path $root 'CLAUDE.md'
$readmePath = Join-Path $root 'README.md'

if (-not (Test-Path -LiteralPath $agentsPath)) {
  Add-Finding $findings 'DISCOVERY-001' 'AGENTS.md' 'Canonical model-neutral repository instructions are missing.'
} else {
  $agents = Get-Content -LiteralPath $agentsPath -Raw -Encoding UTF8
  foreach ($required in @('model-neutral', 'doctrine/accounting-finance-doctrine.md', 'tools/validate-doctrine.ps1', 'NOT ASSESSED')) {
    if ($agents -notmatch [regex]::Escape($required)) {
      Add-Finding $findings 'DISCOVERY-002' 'AGENTS.md' "Canonical discovery guidance is missing required marker: $required."
    }
  }
}

if (-not (Test-Path -LiteralPath $claudePath)) {
  Add-Finding $findings 'DISCOVERY-003' 'CLAUDE.md' 'Claude discovery bridge is missing.'
} else {
  $claudeLines = @(Get-Content -LiteralPath $claudePath -Encoding UTF8)
  $claudeText = ($claudeLines -join "`n")
  if (@($claudeLines | Where-Object { $_ -match '^\s*@AGENTS\.md\s*$' }).Count -ne 1) {
    Add-Finding $findings 'DISCOVERY-004' 'CLAUDE.md' 'Claude bridge must import AGENTS.md exactly once.'
  }
  $nonBridgeLines = @($claudeLines | Where-Object {
    $trimmed = $_.Trim()
    $trimmed -and
      $trimmed -notmatch '^#' -and
      $trimmed -ne '@AGENTS.md' -and
      $trimmed -notmatch '^The canonical instructions live in `AGENTS\.md`; keep this Claude-specific file$' -and
      $trimmed -notmatch '^thin so model-neutral accounting doctrine does not drift between runners\.$'
  })
  if ($nonBridgeLines.Count -gt 0) {
    Add-Finding $findings 'DISCOVERY-005' 'CLAUDE.md' 'Claude bridge contains non-bridge operational content; keep canonical rules in AGENTS.md.'
  }
  if ($claudeLines.Count -gt 20) {
    Add-Finding $findings 'DISCOVERY-006' 'CLAUDE.md' "Claude bridge is $($claudeLines.Count) lines; review for duplicated canonical guidance."
  }
}

if (-not (Test-Path -LiteralPath $readmePath)) {
  Add-Finding $findings 'DISCOVERY-007' 'README.md' 'Repository controller README is missing.'
}

$state = if ($findings.Count -eq 0) { 'pass' } else { 'fail' }
$report = [pscustomobject]@{
  check = 'repository-discovery'
  state = $state
  repo_root = $root
  findings = @($findings)
}

if ($Json) {
  $report | ConvertTo-Json -Depth 8
} else {
  Write-Host "check: repository-discovery"
  Write-Host "state: $state"
  foreach ($finding in $findings) {
    Write-Host "[$($finding.severity)] $($finding.code) $($finding.path) $($finding.message)"
  }
}

if ($state -eq 'fail') { exit 1 }
exit 0
