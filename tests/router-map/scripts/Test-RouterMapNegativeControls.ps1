param(
  [string]$RepoRoot,
  [switch]$Json
)

$ErrorActionPreference = 'Stop'

if ($RepoRoot) { $root = (Resolve-Path $RepoRoot).Path } else { $root = (Resolve-Path (Join-Path $PSScriptRoot '..\..\..')).Path }
$router = Join-Path $root 'tools\update-router-map.ps1'
$cases = @(
  [pscustomobject]@{ id = 'placeholder'; path = 'tests\router-map\fixtures\placeholder-router-map.md'; code = 'ROUTER-003' },
  [pscustomobject]@{ id = 'duplicate'; path = 'tests\router-map\fixtures\duplicate-router-map.md'; code = 'ROUTER-004' },
  [pscustomobject]@{ id = 'missing'; path = 'tests\router-map\fixtures\missing-router-map.md'; code = 'ROUTER-005' }
)
$results = New-Object System.Collections.ArrayList
foreach ($case in $cases) {
  $output = & $router -RepoRoot $root -MapPath $case.path -Check -Json
  $exitCode = $LASTEXITCODE
  $report = ($output -join "`n") | ConvertFrom-Json
  $found = @($report.findings | Where-Object { $_.code -eq $case.code }).Count -gt 0
  [void]$results.Add([pscustomobject]@{
    control = $case.id
    expected_failure = $case.code
    passed = ($exitCode -eq 1 -and $report.state -eq 'fail' -and $found)
    exit_code = $exitCode
    findings = @($report.findings | ForEach-Object { $_.code })
  })
}

$failed = @($results | Where-Object { -not $_.passed })
$report = [pscustomobject]@{
  check = 'router-map-negative-controls'
  state = if ($failed.Count -eq 0) { 'pass' } else { 'fail' }
  total_controls = $results.Count
  failed_controls = $failed.Count
  findings = @()
  results = @($results)
}
$report | ConvertTo-Json -Depth 8
if ($report.state -eq 'fail') { exit 1 }
exit 0
