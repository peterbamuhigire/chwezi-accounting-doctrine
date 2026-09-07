param([string]$RepoRoot, [switch]$Json, [switch]$Strict)
$ErrorActionPreference = 'Stop'
if (-not $RepoRoot) { $RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '../../..')).Path }
# Load only the function AST; do not execute the parent gate recursively.
$parseErrors = $null
$tokens = $null
$ast = [System.Management.Automation.Language.Parser]::ParseFile(
  (Join-Path $RepoRoot 'tools/validate-doctrine.ps1'), [ref]$tokens, [ref]$parseErrors)
if ($parseErrors) { throw 'Parent gate has PowerShell parse errors' }
$definition = $ast.Find({ param($node)
  $node -is [System.Management.Automation.Language.FunctionDefinitionAst] -and
  $node.Name -eq 'Get-ValidationState'
}, $true)
if (-not $definition) { throw 'Get-ValidationState was not found' }
. ([scriptblock]::Create($definition.Extent.Text))
$cases = @(
  @{ name='valid'; values=@([pscustomobject]@{state='pass';exit_code=0}); expected='pass' },
  @{ name='caveat'; values=@([pscustomobject]@{state='pass-with-caveats';exit_code=0}); expected='pass-with-caveats' },
  @{ name='declared failure'; values=@([pscustomobject]@{state='fail';exit_code=0}); expected='fail' },
  @{ name='empty'; values=@(); expected='fail' },
  @{ name='unknown'; values=@([pscustomobject]@{state='unknown';exit_code=0}); expected='fail' },
  @{ name='process failed'; values=@([pscustomobject]@{state='pass';exit_code=1}); expected='fail' },
  @{ name='missing process evidence'; values=@([pscustomobject]@{state='pass'}); expected='fail' },
  @{ name='string exit code'; values=@([pscustomobject]@{state='pass';exit_code='0'}); expected='fail' },
  @{ name='null result'; values=@($null); expected='fail' },
  @{ name='mixed results'; values=@([pscustomobject]@{state='pass';exit_code=0},[pscustomobject]@{state='pass';exit_code=2}); expected='fail' }
)
$findings = @()
foreach ($case in $cases) {
  $actual = Get-ValidationState -Results $case.values
  if ($actual -cne $case.expected) {
    $findings += [pscustomobject]@{severity='high';code='AGGREGATE-001';path='tools/validate-doctrine.ps1';message="Case $($case.name): expected $($case.expected), got $actual"}
  }
}
$state = if ($findings.Count) { 'fail' } else { 'pass' }
$report = [pscustomobject]@{check='validation-state-negative-controls';state=$state;cases=$cases.Count;findings=@($findings)}
if ($Json) { $report | ConvertTo-Json -Depth 6 } else { $report | Format-List }
if ($findings.Count) { exit 1 }
exit 0
