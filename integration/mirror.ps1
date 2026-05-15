# mirror.ps1
# Mirrors the canonical Chwezi accounting & finance doctrine and the new skill
# suite from the master staging tree into each consumer engine.
#
# Run from any directory. Idempotent. Preserves engine-specific finance files
# already present (they live outside the mirrored paths).
#
# Usage:
#   .\mirror.ps1                 # mirrors to all four engines
#   .\mirror.ps1 -DryRun         # show what would happen without copying
#   .\mirror.ps1 -Engine srs     # mirror to one engine only

param(
  [switch]$DryRun,
  [string]$Engine,
  [string]$Master = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
)

$ErrorActionPreference = 'Stop'

# Consumer engines: engine key -> root path
$Engines = @{
  'web-dev'      = 'C:\Users\Peter\.claude\skills'
  'srs'          = 'C:\wamp64\www\srs-skills'
  'proposal'     = 'C:\wamp64\www\proposal-skills'
  'business-plan' = 'C:\wamp64\www\business-plan-skills'
}

# For each engine, doctrine and skills mirror destinations.
# skills-web-dev (.claude\skills) uses `_doctrine/` and `skills/` (its existing
# skills folder); the others use `doctrine/` and `skills/finance/`.
$EngineLayouts = @{
  'web-dev'      = @{ doctrine = '_doctrine'; skills = 'skills' }
  'srs'          = @{ doctrine = 'doctrine';  skills = 'skills\finance' }
  'proposal'     = @{ doctrine = 'doctrine';  skills = 'skills\finance' }
  'business-plan' = @{ doctrine = 'doctrine';  skills = 'skills\finance' }
}

function Copy-Tree($src, $dst, $label) {
  # SAFETY: Additive-only. NEVER /MIR, NEVER /PURGE. Files at $dst that are
  # not in $src are preserved. This script must never delete user data.
  if (-not (Test-Path $src)) { throw "Missing source: $src" }
  if ($DryRun) {
    Write-Host "[dry-run] additive copy $label : $src -> $dst" -ForegroundColor Yellow
    return
  }
  if (-not (Test-Path $dst)) {
    New-Item -ItemType Directory -Path $dst -Force | Out-Null
  }
  # /E recursive + empty subdirs; /COPY:DAT data/attributes/timestamps;
  # /NJH /NJS /NDL /NFL /NP quiet output. No /MIR. No /PURGE.
  robocopy $src $dst /E /COPY:DAT /NJH /NJS /NDL /NFL /NP | Out-Null
  if ($LASTEXITCODE -gt 7) {
    throw "robocopy failed for $label ($src -> $dst) with code $LASTEXITCODE"
  }
  Write-Host "OK      additive copy $label : $src -> $dst" -ForegroundColor Green
}

function Write-Adoption($engineKey, $engineRoot, $doctrineDest) {
  $stamp = Get-Date -Format 'yyyy-MM-dd'
  $body = @"
# Doctrine adoption - $engineKey

| Field | Value |
|---|---|
| Engine | $engineKey |
| Engine root | $engineRoot |
| Doctrine mirrored to | $doctrineDest |
| Doctrine version adopted | 1.0.0 |
| Adoption date | $stamp |
| Owner | Chwezi Core Systems finance/accounting doctrine owner |
| Reviewer | Pending |
| Affected engine files | CLAUDE.md, AGENTS.md (trigger block); skills/finance/ |
| Unresolved gaps | See doctrine/governance/cleanup-backlog.md |

This engine consumes the doctrine from $doctrineDest. Updates flow from the
master tree at $Master via integration/mirror.ps1.

Last reviewed: $stamp. Next review due: $((Get-Date).AddMonths(6).ToString('yyyy-MM-dd')).
"@
  $adoptionPath = Join-Path $doctrineDest 'ADOPTION.md'
  if ($DryRun) {
    Write-Host "[dry-run] write $adoptionPath" -ForegroundColor Yellow
  } else {
    Set-Content -Path $adoptionPath -Value $body -Encoding utf8
    Write-Host "OK      adoption record written: $adoptionPath" -ForegroundColor Green
  }
}

$targets = if ($Engine) { @($Engine) } else { $Engines.Keys }
foreach ($key in $targets) {
  if (-not $Engines.ContainsKey($key)) {
    Write-Host "Unknown engine key: $key" -ForegroundColor Red
    continue
  }
  $engineRoot = $Engines[$key]
  $engineLayout = $EngineLayouts[$key]
  $doctrineDst = Join-Path $engineRoot $engineLayout.doctrine
  $skillsDst   = Join-Path $engineRoot $engineLayout.skills

  Write-Host "==> $key  ($engineRoot)" -ForegroundColor Cyan

  Copy-Tree (Join-Path $Master 'doctrine')   $doctrineDst                          'doctrine'
  Copy-Tree (Join-Path $Master 'governance') (Join-Path $doctrineDst 'governance') 'governance'
  Copy-Tree (Join-Path $Master 'skills')     $skillsDst                            'skills'

  Write-Adoption $key $engineRoot $doctrineDst
}

Write-Host "Done." -ForegroundColor Green
