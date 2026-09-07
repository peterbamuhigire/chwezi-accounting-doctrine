param([string]$RepoRoot, [switch]$Json, [switch]$Strict)
$ErrorActionPreference = 'Stop'
if (-not $RepoRoot) { $RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path }
# Python/PyYAML are required; unavailable execution must fail the parent gate.
& python (Join-Path $PSScriptRoot 'check_frontmatter_yaml.py') --root $RepoRoot
exit $LASTEXITCODE
