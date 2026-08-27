[CmdletBinding()]
param(
  [string]$RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path,
  [string]$TargetPath,
  [switch]$Json,
  [switch]$Strict
)

$ErrorActionPreference = 'Stop'

function Get-ResolvedPath {
  param([string]$Path)
  if (-not (Test-Path -LiteralPath $Path)) {
    throw "Path does not exist: $Path"
  }
  return (Resolve-Path -LiteralPath $Path).Path
}

try {
  $resolvedRepoRoot = Get-ResolvedPath -Path $RepoRoot
  $targetRoot = if ([string]::IsNullOrWhiteSpace($TargetPath)) {
    $resolvedRepoRoot
  } else {
    Get-ResolvedPath -Path $TargetPath
  }

  $routes = @(
    @{ label = 'Conceptual Framework'; path = 'skills/02-ifrs-core-standards/ifrs-conceptual-framework-and-accounting-judgements/SKILL.md' },
    @{ label = 'IFRS 18'; path = 'skills/03-ifrs-specialised-standards/ifrs-18-presentation-and-disclosures/SKILL.md' },
    @{ label = 'IFRS 9 financial instruments'; path = 'skills/02-ifrs-core-standards/ifrs-financial-instruments/SKILL.md' },
    @{ label = 'IFRS 15 revenue'; path = 'skills/02-ifrs-core-standards/ifrs-revenue-recognition/SKILL.md' },
    @{ label = 'IFRS 16 leases'; path = 'skills/02-ifrs-core-standards/ifrs-leases/SKILL.md' },
    @{ label = 'IAS 36 impairment'; path = 'skills/03-ifrs-specialised-standards/ias-impairment/SKILL.md' },
    @{ label = 'IFRS 13 fair value'; path = 'skills/03-ifrs-specialised-standards/ifrs-fair-value-measurement-ifrs13/SKILL.md' },
    @{ label = 'IAS 37 provisions and contingencies'; path = 'skills/03-ifrs-specialised-standards/ias-provisions-contingencies/SKILL.md' },
    @{ label = 'IAS 16 property, plant and equipment'; path = 'skills/02-ifrs-core-standards/ifrs-property-plant-equipment-ias16/SKILL.md' },
    @{ label = 'IAS 10 events after reporting period'; path = 'skills/03-ifrs-specialised-standards/ifrs-events-after-reporting-period-ias10/SKILL.md' },
    @{ label = 'IAS 7 cash flows'; path = 'skills/07-financial-statements-and-disclosures/cash-flow-statement-ias7/SKILL.md' },
    @{ label = 'IAS 23 borrowing costs'; path = 'skills/02-ifrs-core-standards/ifrs-borrowing-costs-ias23/SKILL.md' },
    @{ label = 'Advanced consolidated statements'; path = 'skills/06-close-consolidation-and-reporting/advanced-ifrs-consolidated-statements-review/SKILL.md' },
    @{ label = 'Published IFRS financial statement analysis'; path = 'skills/07-financial-statements-and-disclosures/published-ifrs-financial-statement-analysis/SKILL.md' }
  )

  $findings = [System.Collections.Generic.List[string]]::new()
  $routeFiles = [System.Collections.Generic.List[string]]::new()
  foreach ($route in $routes) {
    $fullPath = Join-Path $targetRoot ($route.path -replace '/', '\')
    if (-not (Test-Path -LiteralPath $fullPath)) {
      [void]$findings.Add("Missing $($route.label) capability route: $($route.path)")
      continue
    }

    [void]$routeFiles.Add($fullPath)
    $content = Get-Content -LiteralPath $fullPath -Raw
    foreach ($marker in @('## Decision Rules', '## Evidence Produced', 'Last reviewed:')) {
      if ($content -notmatch [regex]::Escape($marker)) {
        [void]$findings.Add("$($route.label) route is missing required contract marker '$marker': $($route.path)")
      }
    }
  }

  $stalePatterns = @(
    'Tier-3 scope',
    'deferred until'
  )
  foreach ($fullPath in $routeFiles) {
    $content = Get-Content -LiteralPath $fullPath -Raw
    foreach ($pattern in $stalePatterns) {
      if ($content -match $pattern) {
        $relative = $fullPath.Substring($targetRoot.Length).TrimStart('\')
        [void]$findings.Add("Stale deferred-scope language found in active route: $relative")
        break
      }
    }
  }

  $state = if ($findings.Count -eq 0) { 'pass' } else { 'fail' }
  $report = [pscustomobject]@{
    check = 'advanced-ifrs-readiness'
    state = $state
    summary = [pscustomobject]@{
      target = $targetRoot
      required_routes = $routes.Count
      route_files_checked = $routeFiles.Count
      findings = $findings.Count
      strict = $true
    }
    findings = @($findings)
  }
  $report | ConvertTo-Json -Depth 8
  if ($state -eq 'fail') { exit 1 }
  exit 0
}
catch {
  $report = [pscustomobject]@{
    check = 'advanced-ifrs-readiness'
    state = 'fail'
    summary = [pscustomobject]@{ required_routes = 0; route_files_checked = 0; findings = 1; strict = $true }
    findings = @($_.Exception.Message)
  }
  $report | ConvertTo-Json -Depth 8
  exit 1
}
