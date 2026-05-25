param(
  [Parameter(Mandatory=$true)][string]$TargetPath,
  [string]$RepoRoot,
  [string]$OutputPath,
  [switch]$Json,
  [switch]$NoFailOnFindings,
  [int]$MaxFileSizeKb = 768
)

$ErrorActionPreference = 'Stop'

function Resolve-RepoRoot {
  param([string]$Start)
  if ($Start) { return (Resolve-Path $Start).Path }
  return (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
}

function New-Finding {
  param(
    [string]$Severity,
    [string]$Domain,
    [string]$Code,
    [string]$Message,
    [string]$Path,
    [int]$Line,
    [string]$Doctrine,
    [string]$Instruction
  )
  [pscustomobject]@{
    severity = $Severity
    domain = $Domain
    code = $Code
    message = $Message
    path = $Path
    line = $Line
    doctrine = $Doctrine
    instruction = $Instruction
  }
}

function Get-SeverityRank {
  param([string]$Severity)
  switch ($Severity) {
    'critical' { return 4 }
    'high' { return 3 }
    'medium' { return 2 }
    default { return 1 }
  }
}

function Get-State {
  param([object[]]$Findings)
  if ($Findings | Where-Object { $_.severity -eq 'critical' }) { return 'nonconformant-critical' }
  if ($Findings | Where-Object { $_.severity -eq 'high' }) { return 'nonconformant-high' }
  if ($Findings | Where-Object { $_.severity -eq 'medium' }) { return 'conformant-with-gaps' }
  return 'conformant-with-caveats'
}

function Test-ExcludedPath {
  param([string]$Path)
  return ($Path -match '\\(\.git|node_modules|vendor|dist|build|coverage|storage|cache|tmp|logs|__pycache__)\\')
}

function Get-TextFiles {
  param([string]$Path, [int]$MaxKb)
  $item = Get-Item -LiteralPath $Path
  if (-not $item.PSIsContainer) {
    if ($item.Length -le ($MaxKb * 1024)) { return @($item) }
    return @()
  }
  $extensions = @(
    '.md','.txt','.yaml','.yml','.json','.csv','.sql','.php','.js','.jsx','.ts','.tsx',
    '.py','.rb','.java','.cs','.go','.rs','.kt','.swift','.vue','.svelte','.html',
    '.css','.scss','.xml','.ini','.env','.toml','.ps1','.sh'
  )
  return @(Get-ChildItem -LiteralPath $Path -Recurse -File | Where-Object {
    -not (Test-ExcludedPath $_.FullName) -and
    $_.Length -le ($MaxKb * 1024) -and
    ($extensions -contains $_.Extension.ToLowerInvariant())
  })
}

function Add-PatternFinding {
  param(
    [System.Collections.ArrayList]$Findings,
    [string]$Text,
    [string]$Relative,
    [string]$Pattern,
    [string]$Severity,
    [string]$Domain,
    [string]$Code,
    [string]$Message,
    [string]$Doctrine,
    [string]$Instruction
  )
  $lines = $Text -split "`r?`n"
  for ($i = 0; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -match $Pattern) {
      [void]$Findings.Add((New-Finding $Severity $Domain $Code $Message $Relative ($i + 1) $Doctrine $Instruction))
      return
    }
  }
}

$root = Resolve-RepoRoot $RepoRoot
$target = (Resolve-Path $TargetPath).Path
$findings = New-Object System.Collections.ArrayList
$files = Get-TextFiles $target $MaxFileSizeKb

foreach ($file in $files) {
  $relative = $file.FullName
  if ($file.FullName.StartsWith($target)) {
    $relative = $file.FullName.Substring($target.Length).TrimStart('\')
    if (-not $relative) { $relative = Split-Path $file.FullName -Leaf }
  }
  try {
    $text = Get-Content -LiteralPath $file.FullName -Raw -Encoding UTF8
  } catch {
    continue
  }

  Add-PatternFinding $findings $text $relative '(?i)\b(insert|update|delete)\s+.*\b(journal|ledger|gl_|general_ledger|journal_lines?)\b' 'critical' 'ledger' 'LEDGER-DIRECT-WRITE' 'Potential direct write to ledger or journal tables.' 'skills/01-foundations/ledger-posting-engine-core/SKILL.md' 'Route all accounting writes through a posting service with balance, currency, period, idempotency, reversal, and evidence checks.'
  Add-PatternFinding $findings $text $relative '(?i)\b(delete|destroy|truncate)\s+.*\b(journal|ledger|invoice|receipt|payment|audit)\b' 'critical' 'immutability' 'IMMUTABLE-DELETE' 'Potential destructive operation against accounting or audit evidence.' 'skills/01-foundations/period-locking-and-data-immutability/SKILL.md' 'Replace destructive edits with immutable reversal, voiding, supersession, retention policy, and audit-log entries.'
  Add-PatternFinding $findings $text $relative '(?i)(status|state)\s*[:=]\s*["'']?(paid|posted|approved|void|cancelled)["'']?' 'medium' 'state' 'STATE-FREE-TEXT' 'Finance status appears as ungoverned free text.' 'doctrine/references/status-taxonomy.md' 'Use a governed status taxonomy with allowed transitions, actor, timestamp, reason, and approval metadata.'
  Add-PatternFinding $findings $text $relative '(?i)\b(vat|gst|paye|nssf|withholding|wht|tax_rate|taxrate|exchange_rate|fx_rate)\b.*\b(0\.\d+|[1-9]\d?%)' 'high' 'statutory' 'STATIC-STATUTORY-VALUE' 'Possible hard-coded statutory, tax, payroll, or exchange-rate value.' 'skills/08-tax-and-statutory/tax-statutory-source-register-and-country-packs/SKILL.md' 'Move rates and thresholds to verified-current source-register entries with authority URL, effective date, retrieval date, and reviewer approval.'
  Add-PatternFinding $findings $text $relative '(?i)\b(invoice|receipt|payment|journal|claim|expense|bank_statement|source_document)\b' 'low' 'evidence' 'EVIDENCE-SURFACE' 'Finance evidence surface detected; verify drilldown manually.' 'skills/06-close-consolidation-and-reporting/audit-ready-reporting-pack/SKILL.md' 'Confirm each record stores source document reference, checksum or file pointer, actor, period, account, dimensions, and audit-log link.'
  Add-PatternFinding $findings $text $relative '(?i)\b(ai|llm|model|prompt|completion)\b.*\b(post|approve|classify|reconcile|journal|invoice|payment|tax)\b' 'high' 'ai-governance' 'AI-FINANCE-ACTION' 'AI appears to influence finance classification, posting, approval, or reconciliation.' 'skills/17-ai-automation-and-emerging/ai-in-finance-governance/SKILL.md' 'Require human approval for judgemental accounting, retained prompt/output evidence, model-risk controls, confidence thresholds, and blocked autonomous posting.'
  Add-PatternFinding $findings $text $relative '(?i)\b(cash|drawer|petty|imprest|till|pos)\b' 'medium' 'cash-controls' 'CASH-CONTROL-SURFACE' 'Cash, POS, or imprest surface detected.' 'skills/04-subledgers-and-operations/pos-and-cash-drawer-management/SKILL.md' 'Verify shift/session controls, opening float, counted cash, expected cash, variance approval, deposit tie-out, and GL reconciliation.'
  Add-PatternFinding $findings $text $relative '(?i)\b(accounts?_receivable|ar_|customer_balance|credit_limit|aging|ageing)\b' 'medium' 'receivables' 'AR-SURFACE' 'Accounts receivable or credit-control surface detected.' 'skills/05-receivables-payables-and-treasury/accounts-receivable-and-credit-management/SKILL.md' 'Verify invoice-to-cash workflow, credit limits, ageing, expected-credit-loss or impairment route, receipt allocation, and AR control-account tie-out.'
  Add-PatternFinding $findings $text $relative '(?i)\b(accounts?_payable|ap_|supplier_balance|vendor|three.?way|purchase_order|goods_received)\b' 'medium' 'payables' 'AP-SURFACE' 'Accounts payable or supplier-management surface detected.' 'skills/05-receivables-payables-and-treasury/accounts-payable-and-supplier-management/SKILL.md' 'Verify supplier onboarding, PO/GRN/invoice matching, approval limits, payment run controls, withholding-tax route, and AP control-account tie-out.'
  Add-PatternFinding $findings $text $relative '(?i)\b(budget|forecast|variance|kpi|scenario|sensitivity|margin|pricing|discount|rebate)\b' 'medium' 'fpa' 'FPA-SURFACE' 'Budgeting, forecasting, variance, KPI, pricing, or scenario surface detected.' 'skills/09-budgeting-fpa-and-costing/variance-analysis-and-kpi-reporting/SKILL.md' 'Add versioned assumptions, owner approvals, driver logic, variance bridge, source actuals, and management-reporting tie-out.'
  Add-PatternFinding $findings $text $relative '(?i)\b(related.?party|director|shareholder|beneficial.?owner|intercompany|associate|joint.?venture)\b' 'high' 'related-party' 'RELATED-PARTY-SURFACE' 'Related-party, intercompany, associate, or beneficial-owner surface detected.' 'skills/03-ifrs-specialised-standards/ifrs-related-party-disclosures-ias24/SKILL.md' 'Add related-party identification, relationship type, transaction/balance disclosure support, approvals, conflict checks, and consolidation/intercompany route.'
  Add-PatternFinding $findings $text $relative '(?i)\b(going.?concern|liquidity|covenant|debt|loan|facility|cash.?flow)\b' 'medium' 'viability' 'VIABILITY-SURFACE' 'Going-concern, liquidity, debt, or covenant surface detected.' 'skills/07-financial-statements-and-disclosures/going-concern-and-viability-assessment/SKILL.md' 'Add cash-flow forecast, covenant test, financing assumptions, downside scenario, mitigation plan, and reviewer sign-off.'
}

$countsBySeverity = @{}
foreach ($sev in @('critical','high','medium','low')) {
  $countsBySeverity[$sev] = @($findings | Where-Object { $_.severity -eq $sev }).Count
}

$top = @($findings | Sort-Object @{Expression={Get-SeverityRank $_.severity};Descending=$true}, path, line)
$state = Get-State @($findings)
$report = [pscustomobject]@{
  doctrine_conformance = $state
  scanned_at = (Get-Date).ToString('s')
  doctrine_repo = $root
  target_path = $target
  files_scanned = $files.Count
  finding_counts = [pscustomobject]@{
    critical = $countsBySeverity['critical']
    high = $countsBySeverity['high']
    medium = $countsBySeverity['medium']
    low = $countsBySeverity['low']
  }
  findings = @($top)
}

if ($OutputPath) {
  $resolvedOut = $OutputPath
  if (-not [System.IO.Path]::IsPathRooted($resolvedOut)) {
    $resolvedOut = Join-Path (Get-Location).Path $resolvedOut
  }
  $outDir = Split-Path $resolvedOut -Parent
  if ($outDir -and -not (Test-Path $outDir)) { New-Item -ItemType Directory -Path $outDir -Force | Out-Null }
  if ($Json) {
    $report | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $resolvedOut -Encoding UTF8
  } else {
    $lines = New-Object System.Collections.ArrayList
    [void]$lines.Add("# Finance Doctrine Conformance Scan")
    [void]$lines.Add("")
    [void]$lines.Add("| Field | Value |")
    [void]$lines.Add("|---|---|")
    [void]$lines.Add("| Doctrine conformance | $state |")
    [void]$lines.Add("| Target | $target |")
    [void]$lines.Add("| Files scanned | $($files.Count) |")
    [void]$lines.Add("| Critical / high / medium / low | $($countsBySeverity['critical']) / $($countsBySeverity['high']) / $($countsBySeverity['medium']) / $($countsBySeverity['low']) |")
    [void]$lines.Add("")
    [void]$lines.Add("## Findings")
    [void]$lines.Add("")
    if ($top.Count -eq 0) {
      [void]$lines.Add("No heuristic findings. Manual doctrine review is still required for accounting judgement, statutory values, and proposal claims.")
    } else {
      [void]$lines.Add("| Severity | Domain | Location | Finding | Alignment instruction |")
      [void]$lines.Add("|---|---|---|---|---|")
      foreach ($finding in $top) {
        $loc = $finding.path
        if ($finding.line -gt 0) { $loc = "${loc}:$($finding.line)" }
        [void]$lines.Add("| $($finding.severity) | $($finding.domain) | `$loc` | $($finding.message) | $($finding.instruction) |")
      }
    }
    $lines -join "`r`n" | Set-Content -LiteralPath $resolvedOut -Encoding UTF8
  }
}

if ($Json) {
  $report | ConvertTo-Json -Depth 8
} else {
  Write-Host "Finance doctrine conformance scan"
  Write-Host ("state: {0}" -f $state)
  Write-Host ("target: {0}" -f $target)
  Write-Host ("files_scanned: {0}" -f $files.Count)
  Write-Host ("critical/high/medium/low: {0}/{1}/{2}/{3}" -f $countsBySeverity['critical'], $countsBySeverity['high'], $countsBySeverity['medium'], $countsBySeverity['low'])
  foreach ($finding in ($top | Select-Object -First 40)) {
    $loc = $finding.path
    if ($finding.line -gt 0) { $loc = "${loc}:$($finding.line)" }
    Write-Host ("[{0}] {1} {2} - {3}" -f $finding.severity, $finding.code, $loc, $finding.message)
  }
  if ($top.Count -gt 40) {
    Write-Host ("... {0} additional finding(s) omitted from console output." -f ($top.Count - 40))
  }
}

if (($state -match '^nonconformant') -and -not $NoFailOnFindings) { exit 2 }
exit 0
