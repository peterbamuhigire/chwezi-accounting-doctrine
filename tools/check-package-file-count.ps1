param(
  [string]$RepoRoot,
  [int]$MaximumFiles = 5000,
  [switch]$Json
)

$ErrorActionPreference = 'Stop'
if ($MaximumFiles -lt 1) { throw 'MaximumFiles must be a positive integer.' }
if ($RepoRoot) { $root = (Resolve-Path $RepoRoot).Path } else { $root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path }

$excludedPackageDirectories = @('.git', '.cache', 'cache', '__pycache__', 'node_modules', '.venv', 'venv')
$allFiles = @(Get-ChildItem -LiteralPath $root -Recurse -File -Force)
$packageFiles = @($allFiles | Where-Object {
  $relative = $_.FullName.Substring($root.Length).TrimStart([System.IO.Path]::DirectorySeparatorChar, [System.IO.Path]::AltDirectorySeparatorChar)
  $parts = $relative -split '[\\/]'
  -not @($parts | Where-Object { $excludedPackageDirectories -contains $_ }).Count
})

$findings = New-Object System.Collections.ArrayList
if ($allFiles.Count -gt $MaximumFiles) {
  [void]$findings.Add([pscustomobject]@{ severity = 'high'; code = 'PACKAGE-001'; message = "Full-checkout file entries exceed the limit ($($allFiles.Count) > $MaximumFiles)." })
}
if ($packageFiles.Count -gt $MaximumFiles) {
  [void]$findings.Add([pscustomobject]@{ severity = 'high'; code = 'PACKAGE-002'; message = "Package-oriented file entries exceed the limit ($($packageFiles.Count) > $MaximumFiles)." })
}
$state = 'pass'
if ($findings.Count -gt 0) { $state = 'fail' }
$report = [pscustomobject]@{
  check = 'package-file-count'
  state = $state
  summary = [pscustomobject]@{
    full_checkout_files = $allFiles.Count
    package_oriented_files = $packageFiles.Count
    maximum_files = $MaximumFiles
    exclusions = $excludedPackageDirectories
  }
  findings = @($findings)
}
if ($Json) { $report | ConvertTo-Json -Depth 6 } else { $report | ConvertTo-Json -Depth 6 }
if ($state -eq 'fail') { exit 1 }
exit 0
