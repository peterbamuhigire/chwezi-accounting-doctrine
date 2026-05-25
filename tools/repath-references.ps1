param([switch]$DryRun)

$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path

# Mapping of old skill folder name -> new path under skills/
$map = @{
  'ledger-posting-engine-core'                       = '01-foundations/ledger-posting-engine-core'
  'management-accounting-dimensions'                 = '01-foundations/management-accounting-dimensions'
  'ifrs-revenue-recognition'                         = '02-ifrs-core-standards/ifrs-revenue-recognition'
  'ifrs-leases'                                      = '02-ifrs-core-standards/ifrs-leases'
  'ifrs-financial-instruments'                       = '02-ifrs-core-standards/ifrs-financial-instruments'
  'ifrs-for-smes-equivalents'                        = '02-ifrs-core-standards/ifrs-for-smes-equivalents'
  'ias-agriculture'                                  = '03-ifrs-specialised-standards/ias-agriculture'
  'ias-government-grants'                            = '03-ifrs-specialised-standards/ias-government-grants'
  'ias-impairment'                                   = '03-ifrs-specialised-standards/ias-impairment'
  'ias-income-tax-deferred-tax'                      = '03-ifrs-specialised-standards/ias-income-tax-deferred-tax'
  'ias-provisions-contingencies'                     = '03-ifrs-specialised-standards/ias-provisions-contingencies'
  'bank-and-mobile-money-reconciliation'             = '04-subledgers-and-operations/bank-and-mobile-money-reconciliation'
  'fixed-assets-and-depreciation'                    = '04-subledgers-and-operations/fixed-assets-and-depreciation'
  'inventory-costing-and-stock-accounting'           = '04-subledgers-and-operations/inventory-costing-and-stock-accounting'
  'payroll-and-statutory-postings-east-africa'       = '04-subledgers-and-operations/payroll-and-statutory-postings-east-africa'
  'month-end-and-year-end-close-playbook'            = '06-close-consolidation-and-reporting/month-end-and-year-end-close-playbook'
  'opening-balances-and-migration-playbook'          = '06-close-consolidation-and-reporting/opening-balances-and-migration-playbook'
  'consolidation-and-intercompany'                   = '06-close-consolidation-and-reporting/consolidation-and-intercompany'
  'audit-ready-reporting-pack'                       = '06-close-consolidation-and-reporting/audit-ready-reporting-pack'
  'finance-module-audit'                             = '06-close-consolidation-and-reporting/finance-module-audit'
  'tax-statutory-source-register-and-country-packs'  = '08-tax-and-statutory/tax-statutory-source-register-and-country-packs'
  'internal-controls-library'                        = '10-controls-governance-and-fraud/internal-controls-library'
  'engagement-quality-and-plain-language-output'     = '10-controls-governance-and-fraud/engagement-quality-and-plain-language-output'
  'finance-ui-pattern-library'                       = '16-ux-and-presentation/finance-ui-pattern-library'
  'finance-ux-for-non-accountants'                   = '16-ux-and-presentation/finance-ux-for-non-accountants'
}

$targets = @(
  'docs/reference-manifest.md',
  'docs/quality-gate-fixture-map.md',
  'docs/fin-analysis/07-standards-and-source-references.md',
  'docs/fin-analysis/08-target-90-evidence-package.md',
  'doctrine/references/ledger-invariants.md',
  'governance/how-to-reference-this-doctrine.md',
  'README.md'
)

foreach ($rel in $targets) {
  $full = Join-Path $root $rel
  if (-not (Test-Path $full)) { continue }
  $text = Get-Content -LiteralPath $full -Raw -Encoding UTF8
  $orig = $text
  foreach ($k in $map.Keys) {
    # Forward-slash form: skills/<old>  ->  skills/<new>
    $text = $text -replace ("skills/" + [regex]::Escape($k) + "(?=[/`` ]|$)"), ("skills/" + $map[$k])
    # Backslash form: skills\<old>  ->  skills\<new>
    $newBs = $map[$k] -replace '/', '\'
    $text = $text -replace ("skills\\" + [regex]::Escape($k) + "(?=[\\`` ]|$)"), ("skills\" + $newBs)
  }
  if ($text -ne $orig) {
    if ($DryRun) { Write-Host "[dry-run] would update $rel" }
    else {
      Set-Content -LiteralPath $full -Value $text -Encoding utf8
      Write-Host "updated $rel"
    }
  }
}
