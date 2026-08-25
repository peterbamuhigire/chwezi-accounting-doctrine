[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
$script = Join-Path $PSScriptRoot 'test_accounting_agent_contract.py'
& python -X utf8 $script
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
