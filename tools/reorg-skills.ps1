param([switch]$DryRun)

# One-shot reorganization: move 25 existing skills into 17 category folders,
# scaffold stub SKILL.md files for newly identified gap skills, and write a
# README.md per category. Run from repo root.

$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$skillsRoot = Join-Path $root 'skills'

# Category map: category -> @{ description; existing[]; gaps @{ name = description } }
$categories = [ordered]@{
  '01-foundations' = @{
    description = 'Core ledger backbone: posting engine, CoA discipline, dimensions, and the invariants every other skill depends on.'
    existing = @('ledger-posting-engine-core','management-accounting-dimensions')
    gaps = [ordered]@{
      'chart-of-accounts-design-and-governance' = 'Use when designing, reviewing, or governing the Chart of Accounts: account taxonomy, normal-balance enforcement, control-account ownership, dimension requirements, direct-posting permissions, evidence requirements, and CoA change control.'
      'functional-and-presentation-currency'   = 'Use when determining functional currency, presentation currency, translation method, and remeasurement/translation gain-loss treatment under IAS 21 / IFRS for SMEs Section 30.'
      'period-locking-and-data-immutability'   = 'Use when designing period state machines (open, soft-closed, hard-closed, reopened, archived), immutability guarantees on posted journals, and audit-evidence retention for finance data.'
    }
  }
  '02-ifrs-core-standards' = @{
    description = 'High-frequency IFRS / IFRS for SMEs standards that apply to most Chwezi clients across recognition and measurement.'
    existing = @('ifrs-revenue-recognition','ifrs-leases','ifrs-financial-instruments','ifrs-for-smes-equivalents')
    gaps = [ordered]@{
      'ifrs-property-plant-equipment-ias16'    = 'Use when accounting for PPE under IAS 16 / IFRS for SMEs Section 17: component depreciation, revaluation model vs cost model, subsequent costs, derecognition, and impairment interaction.'
      'ifrs-intangible-assets-ias38'           = 'Use when recognising and measuring intangible assets under IAS 38 / IFRS for SMEs Section 18: research vs development phase, internally generated intangibles, useful-life assessment, and amortisation.'
      'ifrs-employee-benefits-ias19'           = 'Use for short-term, post-employment (defined contribution and defined benefit), other long-term, and termination benefits under IAS 19 / IFRS for SMEs Section 28, including actuarial assumptions and remeasurements.'
      'ifrs-borrowing-costs-ias23'             = 'Use when capitalising borrowing costs on qualifying assets under IAS 23 / IFRS for SMEs Section 25: capitalisation rate, commencement, suspension, and cessation rules.'
      'ifrs-foreign-currency-translation-ias21'= 'Use when translating foreign-currency transactions and foreign operations under IAS 21 / IFRS for SMEs Section 30: spot vs average rates, monetary vs non-monetary items, and CTA reserve treatment.'
    }
  }
  '03-ifrs-specialised-standards' = @{
    description = 'Specialised and judgement-heavy IFRS / IAS standards that activate for specific transactions, sectors, or events.'
    existing = @('ias-agriculture','ias-government-grants','ias-impairment','ias-income-tax-deferred-tax','ias-provisions-contingencies')
    gaps = [ordered]@{
      'ifrs-business-combinations-ifrs3'        = 'Use when accounting for business combinations under IFRS 3 / IFRS for SMEs Section 19: acquisition method, identifiable assets/liabilities, goodwill, NCI measurement, and bargain purchases.'
      'ifrs-investment-property-ias40'          = 'Use when classifying and measuring investment property under IAS 40 / IFRS for SMEs Section 16: cost vs fair-value model, transfers, and disclosure.'
      'ifrs-associates-and-joint-arrangements'  = 'Use when applying IAS 28 / IFRS 11 / IFRS for SMEs Sections 14 and 15: equity method, joint operations vs joint ventures, and significant influence assessment.'
      'ifrs-fair-value-measurement-ifrs13'      = 'Use when measuring or disclosing fair value under IFRS 13: valuation techniques, fair-value hierarchy (Level 1/2/3), highest-and-best-use, and required disclosures.'
      'ifrs-share-based-payment-ifrs2'          = 'Use when recognising equity-settled or cash-settled share-based payments under IFRS 2 / IFRS for SMEs Section 26: grant-date fair value, vesting conditions, modifications, and cancellations.'
      'ifrs-insurance-contracts-ifrs17'         = 'Use when an entity issues insurance or reinsurance contracts in scope of IFRS 17: GMM/PAA/VFA measurement models, CSM mechanics, and presentation.'
      'ifrs-discontinued-operations-ifrs5'      = 'Use when classifying non-current assets or disposal groups as held-for-sale and presenting discontinued operations under IFRS 5.'
      'ifrs-events-after-reporting-period-ias10'= 'Use when distinguishing adjusting vs non-adjusting events after the reporting period under IAS 10 / IFRS for SMEs Section 32, including going-concern reassessment.'
      'ifrs-accounting-policies-changes-errors-ias8' = 'Use when adopting or changing accounting policies, accounting for changes in estimates, and correcting prior-period errors under IAS 8 / IFRS for SMEs Section 10.'
      'ifrs-related-party-disclosures-ias24'    = 'Use when identifying related parties and disclosing transactions, outstanding balances, and key management personnel compensation under IAS 24 / IFRS for SMEs Section 33.'
      'ifrs-first-time-adoption-ifrs1'          = 'Use when an entity prepares its first IFRS or IFRS for SMEs financial statements: opening IFRS statement of financial position, mandatory exceptions, optional exemptions, and reconciliations.'
      'ifrs-segment-reporting-ifrs8'            = 'Use when an entity has publicly traded debt/equity or chooses to disclose operating segments under IFRS 8: chief operating decision maker identification, aggregation criteria, and reconciliations.'
      'ifrs-earnings-per-share-ias33'           = 'Use when computing and presenting basic and diluted EPS under IAS 33 for entities with publicly traded ordinary shares or in process of issuance.'
    }
  }
  '04-subledgers-and-operations' = @{
    description = 'Operational subledgers that feed the general ledger: banking, mobile money, inventory, fixed assets, and payroll.'
    existing = @('bank-and-mobile-money-reconciliation','fixed-assets-and-depreciation','inventory-costing-and-stock-accounting','payroll-and-statutory-postings-east-africa')
    gaps = [ordered]@{
      'petty-cash-and-imprest-management'   = 'Use when designing petty cash and imprest float controls: float size, replenishment, custodian rotation, surprise counts, evidence requirements, and ledger postings.'
      'pos-and-cash-drawer-management'      = 'Use when designing point-of-sale cash-drawer flows: opening float, X/Z reads, blind cash-up, variance triage, till-to-bank, and POS-to-GL reconciliation.'
      'expense-management-and-staff-claims' = 'Use when designing employee expense, advance, and claim workflows: receipt capture, mileage, per diem, VAT recovery, multi-currency, approval, and reimbursement posting.'
    }
  }
  '05-receivables-payables-and-treasury' = @{
    description = 'AR, AP, and treasury operations: credit, collections, supplier management, cash forecasting, and FX risk.'
    existing = @()
    gaps = [ordered]@{
      'accounts-receivable-and-credit-management' = 'Use when designing customer credit limits, invoicing, aging, dunning, write-off, ECL on trade receivables (IFRS 9 simplified), and AR-to-control tie-out.'
      'accounts-payable-and-supplier-management'  = 'Use when designing supplier master data, three-way match (PO/GRN/invoice), payment runs, supplier statements reconciliation, and AP-to-control tie-out.'
      'cash-flow-forecasting-and-treasury'        = 'Use when building 13-week and longer cash-flow forecasts, cash-position dashboards, sweep rules, bank-account hierarchy, and intercompany cash pooling.'
      'fx-management-and-hedging'                 = 'Use when managing FX exposure: natural hedging, forward contracts, hedge documentation, hedge effectiveness, and hedge-accounting eligibility under IFRS 9.'
      'banking-facilities-and-covenants'          = 'Use when tracking debt facilities, drawdowns, repayments, interest accrual, covenant calculations, and covenant-breach disclosure.'
    }
  }
  '06-close-consolidation-and-reporting' = @{
    description = 'Period close, group consolidation, audit-ready packs, and finance-module audit.'
    existing = @('month-end-and-year-end-close-playbook','opening-balances-and-migration-playbook','consolidation-and-intercompany','audit-ready-reporting-pack','finance-module-audit')
    gaps = [ordered]@{
      'continuous-close-and-flash-reporting' = 'Use when designing a continuous-close cadence: subledger lock-by-day-N, flash P&L, sub-process completion telemetry, and exception escalation.'
      'audit-pbc-and-evidence-management'    = 'Use when managing the auditor PBC (prepared-by-client) cycle: request log, evidence index, sampling support, and reviewer trail.'
    }
  }
  '07-financial-statements-and-disclosures' = @{
    description = 'Preparation, structure, and disclosure of the primary financial statements and supporting notes.'
    existing = @()
    gaps = [ordered]@{
      'financial-statements-preparation'          = 'Use when assembling the four primary statements (SoFP, SoPL/OCI, SoCE, SoCF) including IFRS 18 presentation categories, comparatives, restatements, and rounding policy.'
      'cash-flow-statement-ias7'                  = 'Use when preparing the statement of cash flows under IAS 7 / IFRS for SMEs Section 7: operating activities (direct vs indirect), investing, financing, non-cash transactions, and reconciliations.'
      'notes-and-disclosure-pack'                 = 'Use when assembling notes to the financial statements: significant accounting policies, judgements and estimates, standards-issued-not-effective, and standard-specific quantitative disclosures.'
      'going-concern-and-viability-assessment'    = 'Use when documenting going-concern and (where applicable) longer-term viability assessments: assumptions, sensitivities, mitigations, and emphasis-of-matter triggers.'
      'integrated-and-sustainability-reporting-s1-s2' = 'Use when preparing sustainability-related financial disclosures under IFRS S1 and climate-related disclosures under IFRS S2: governance, strategy, risk management, metrics, and assurance posture.'
    }
  }
  '08-tax-and-statutory' = @{
    description = 'Tax doctrine, country packs, statutory source register, and indirect-tax mechanics.'
    existing = @('tax-statutory-source-register-and-country-packs')
    gaps = [ordered]@{
      'indirect-tax-vat-mechanics'              = 'Use when designing VAT/GST mechanics: place of supply, reverse charge, mixed supplies, input VAT recovery, partial exemption, and adjustments.'
      'withholding-tax-and-treaties'            = 'Use when applying withholding tax: domestic rates, double-tax-treaty relief, withholding certificates, and supplier gross-up.'
      'transfer-pricing-documentation'          = 'Use when documenting related-party transactions for transfer-pricing purposes: master file, local file, CbC reporting thresholds, and benchmarking evidence.'
      'e-invoicing-and-fiscal-device-integration' = 'Use when integrating with fiscal devices and e-invoicing platforms (EFRIS, eTIMS, EBM, etc.): document numbering, signing, transmission, void/credit, and reconciliation to the ledger.'
    }
  }
  '09-budgeting-fpa-and-costing' = @{
    description = 'Budgeting, rolling forecasts, variance analysis, KPI reporting, and cost-accounting methods.'
    existing = @()
    gaps = [ordered]@{
      'budgeting-and-rolling-forecasts'    = 'Use when designing annual budgets, rolling forecasts, driver-based planning, top-down/bottom-up reconciliation, and budget-vs-actual reporting.'
      'variance-analysis-and-kpi-reporting'= 'Use when designing variance reports (price/volume/mix/efficiency), KPI cascades, contribution margin analysis, and management commentary.'
      'cost-accounting-methods'            = 'Use when selecting and applying cost-accounting methods: standard costing, job-order, process, ABC, throughput, and absorption vs marginal costing.'
      'scenario-and-sensitivity-modelling' = 'Use when running scenario, sensitivity, and stress modelling for finance plans: assumption catalogue, scenario governance, and reportable ranges.'
      'pricing-discounts-rebates-and-refunds' = 'Use when designing pricing, discount, rebate, refund, and chargeback mechanics with accounting recognition under IFRS 15 / IFRS for SMEs Section 23.'
    }
  }
  '10-controls-governance-and-fraud' = @{
    description = 'Internal controls, engagement quality, anti-fraud, AML, and ethics.'
    existing = @('internal-controls-library','engagement-quality-and-plain-language-output')
    gaps = [ordered]@{
      'forensic-accounting-and-anti-fraud'         = 'Use when scoping anti-fraud controls and forensic analytics: red-flag library, Benford analysis, journal-entry testing, vendor-employee match, and incident-response playbook.'
      'aml-kyc-and-suspicious-transaction-reporting' = 'Use when finance touches AML/CFT scope: customer due diligence, sanctions screening, suspicious-transaction triggers, regulator reporting, and record-keeping.'
      'whistleblowing-and-finance-ethics'          = 'Use when designing whistleblowing intake, finance-ethics escalation, conflict-of-interest registers, and code-of-conduct attestation flows.'
      'sox-style-icfr-documentation'               = 'Use when an entity needs SOX-style ICFR-equivalent documentation: process narratives, risk-control matrices, walkthroughs, and design/operating-effectiveness testing.'
    }
  }
  '11-sector-and-fund-accounting' = @{
    description = 'Sector-specific accounting packs for the typical Chwezi client base.'
    existing = @()
    gaps = [ordered]@{
      'ngo-and-fund-accounting'             = 'Use for NGO/not-for-profit accounting: donor-restricted vs unrestricted funds, project budgets, multi-currency grants, IPSAS/IFRS choice, and donor-specific reporting.'
      'school-and-education-accounting-pack'= 'Use for schools and higher-education institutions: fee billing, scholarships and bursaries, term/semester accruals, capitation grants, and parent statements.'
      'clinic-and-healthcare-accounting-pack'= 'Use for clinics, hospitals, and health-insurance billing: patient accounts, payer mix (cash/insurance/NHIF/HMO), claim adjudication, and revenue recognition under IFRS 15.'
      'retail-and-pos-accounting-pack'      = 'Use for multi-outlet retail: SKU master, daily sales-day-end, layaway/gift cards, returns, shrinkage, and intercompany inventory transfers.'
      'agribusiness-and-cooperative-pack'   = 'Use for agribusiness, smallholder out-grower schemes, and cooperatives: biological assets (IAS 41), member equity, patronage refunds, and crop-cycle costing.'
      'hospitality-and-restaurant-pack'     = 'Use for hotels, lodges, and restaurants: room nights, package allocations, F&B recipe costing, tips and service-charge handling, and tour-operator commissions.'
      'real-estate-and-property-pack'       = 'Use for property developers and landlords: deposits, lease incentives, service-charge accounting, IAS 40 vs IAS 16 vs IAS 2 classification, and developer revenue.'
      'fintech-and-payments-pack'           = 'Use for fintechs, mobile-money operators, agents, and PSPs: float accounts, trust accounts, settlement reconciliation, scheme/interchange fees, and customer-money safeguarding.'
    }
  }
  '12-public-sector-and-ipsas' = @{
    description = 'Public-sector finance: IPSAS overlay, fund accounting for government, and donor/grant fiscal controls.'
    existing = @()
    gaps = [ordered]@{
      'ipsas-public-sector-overlay'             = 'Use when an entity reports under IPSAS (accrual or cash basis): IPSAS-to-IFRS deltas, public-sector revenue (IPSAS 23/47), social benefits, and budget reporting (IPSAS 24).'
      'government-procurement-and-fiscal-controls' = 'Use when finance interfaces with public procurement and fiscal controls: PPDA processes, vote books, commitment accounting, and treasury single account flows.'
      'donor-funded-project-fiscal-compliance'  = 'Use when managing donor-funded projects with eligibility, ineligible-cost recovery, audit-clause compliance, and donor-specific reporting templates.'
    }
  }
  '13-project-and-contract-accounting' = @{
    description = 'Project, contract, and construction accounting where revenue, costs, and billings unfold over time.'
    existing = @()
    gaps = [ordered]@{
      'project-and-contract-accounting'        = 'Use when revenue and cost are recognised over time (POC) or at a point in time under IFRS 15: performance obligations, input vs output methods, WIP, and contract assets/liabilities.'
      'construction-contract-accounting'       = 'Use for construction-style contracts: retentions, variations, claims, liquidated damages, advance payments, milestone certificates, and subcontractor accruals.'
      'professional-services-time-and-materials' = 'Use for time-and-materials and fixed-fee professional services: utilisation, realisation, WIP at standard vs actual rates, and unbilled receivables.'
    }
  }
  '14-systems-integration-and-data' = @{
    description = 'How finance data flows in and out: ERP integrations, bank feeds, payment gateways, and reporting data contracts.'
    existing = @()
    gaps = [ordered]@{
      'erp-and-finance-system-integration-patterns' = 'Use when integrating Chwezi finance modules with external ERPs or SaaS finance systems: master-data sync, event vs batch, idempotency, and reconciliation watchers.'
      'bank-feed-and-payment-gateway-integration'   = 'Use when integrating bank feeds, payment gateways, and mobile-money APIs: feed contracts, schema drift, replay, deduplication, and posting safety.'
      'finance-data-contracts-and-warehouse-models' = 'Use when shipping finance data to BI/warehouse: conformed dimensions, slowly changing dimensions for CoA, partition keys, and reconciliation back to the GL.'
      'open-banking-and-direct-debit-mandates'      = 'Use when working with open-banking aggregators, direct-debit mandates (where available), and recurring-payment authorisations.'
    }
  }
  '15-security-privacy-and-continuity' = @{
    description = 'Cybersecurity, data privacy, retention, and business continuity for finance systems.'
    existing = @()
    gaps = [ordered]@{
      'finance-data-privacy-and-retention'              = 'Use when classifying finance data (PII, financial, statutory) and setting retention, lawful basis, cross-border transfer, and right-to-erasure rules consistent with statutory retention minima.'
      'finance-cybersecurity-controls'                  = 'Use when applying cybersecurity controls to finance systems: identity, MFA, privileged access for posting/approval, secret rotation, and payment-system hardening.'
      'business-continuity-and-disaster-recovery-finance' = 'Use when planning continuity and disaster recovery for finance operations: RPO/RTO per finance system, payroll fallback, bank-payment fallback, and tabletop exercises.'
    }
  }
  '16-ux-and-presentation' = @{
    description = 'How finance shows up to people: UI pattern library, UX for non-accountants, and print/export fidelity.'
    existing = @('finance-ui-pattern-library','finance-ux-for-non-accountants')
    gaps = [ordered]@{
      'finance-accessibility-and-inclusive-design' = 'Use when ensuring finance UI meets accessibility standards: keyboard parity, screen-reader semantics for ledger tables, colour-independent semantic states, and localisation/RTL.'
      'finance-mobile-and-offline-patterns'        = 'Use when shipping finance flows on mobile or in low-bandwidth/offline settings: deferred posting queues, conflict resolution, evidence capture, and reconciliation.'
    }
  }
  '17-ai-automation-and-emerging' = @{
    description = 'Governance for AI, RPA, and emerging-domain finance topics including digital assets.'
    existing = @()
    gaps = [ordered]@{
      'ai-in-finance-governance'             = 'Use when applying AI/LLM features to finance workflows (reconciliation suggestions, narrative generation, coding hints): model registry, human-in-the-loop checkpoints, evaluation, and audit trail.'
      'rpa-and-automation-controls-for-finance' = 'Use when designing RPA bots and scheduled automations that touch postings, approvals, or filings: bot identity, segregation-of-duties, kill-switch, and exception routing.'
      'digital-assets-and-crypto-accounting'   = 'Use when an entity holds or transacts in digital assets: classification (IAS 38 vs inventory vs financial instrument), measurement, custody, and disclosure.'
      'carbon-and-emissions-accounting'        = 'Use when an entity accounts for carbon allowances, offsets, and Scope 1/2/3 emissions data feeding sustainability disclosures and internal carbon-pricing schemes.'
    }
  }
}

# Stub template
function New-StubSkill {
  param([string]$Path, [string]$Name, [string]$Description, [string]$Category)
  $body = @"
---
name: $Name
description: $Description
status: draft
metadata:
  portable: true
  category: $Category
  compatible_with:
    - claude-code
    - codex
---

# $Name

<!-- dual-compat-start -->
## Use When

$Description

## Do Not Use When

Do not use as a substitute for professional advice, country statutory verification, or specialist sign-off where the doctrine requires named reviewer approval.

## Required Inputs

Entity, period, reporting framework, jurisdiction, functional currency, source events, and source-register snapshot when statutory values appear.

## Workflow

Validate scope and framework, gather inputs, apply the decision rules below, capture evidence, and route to the relevant reviewer before final release.

## Quality Standards

Framework-identified, source-evidenced, reviewer-routable, and consistent with the canonical doctrine and ledger invariants.

## Anti-Patterns

Treating this stub as authoritative before it has been fleshed out and reviewer-signed; bypassing the posting service or source register; releasing final statutory output without verified-current sources.

## Outputs

Artefacts that name the framework, cite sources, expose drilldown to the ledger, and carry reviewer routing metadata.

## References

Load the doctrine references listed below before implementation or review.
<!-- dual-compat-end -->

## Prerequisites

- Read ``doctrine/accounting-finance-doctrine.md``.
- Read ``doctrine/references/policy-hierarchy.md``.
- Read ``doctrine/references/ledger-invariants.md``.
- Confirm reporting framework, jurisdiction, functional currency, and the open period.

## Inputs

| Artifact | Produced by | Required? | Validation |
|---|---|---|---|
| Scope statement | Engagement owner | Required | Entity, period, framework, and jurisdiction stated. |
| Source events | Feature module or subledger | Required | Source document, actor, period, currency, and amount captured. |
| Source-register snapshot | ``tax-statutory-source-register-and-country-packs`` | Required when statutory values appear | Entries are ``verified-current`` or approved caveat. |

## Outputs

| Artifact | Consumed by | Acceptance evidence |
|---|---|---|
| Worked artefact (memo, posting set, disclosure, or report) | Reviewer, GL, audit pack | Framework named, sources cited, drilldown evident. |
| Reviewer routing record | Quality gate | Reviewer roles, sign-off status, and caveats captured. |

## Decision Rules

1. Identify the reporting framework before applying any recognition or measurement decision.
2. Do not release final statutory values without verified-current source-register support.
3. Route reviewer-required outputs through the named role before release.
4. Apply the canonical ledger invariants when any output affects posted journals.

## Acceptance Evidence

- Worked example, decision-rule trace, and reviewer sign-off captured under ``examples/`` (to be added when the stub is built out).
- Reference set under ``references/`` (to be added when the stub is built out).

## Anti-Patterns

- Final output without reviewer sign-off where the doctrine requires it.
- Statutory values without source-register support.
- Bypassing the posting service or the Chart of Accounts policy register.

## Review Metadata

| Field | Value |
|---|---|
| Owner role | To assign |
| Reviewer roles | Doctrine owner; framework-specific reviewer |
| Last reviewed | 2026-05-25 |
| Next review due | 2026-11-25 |
| Release state | Draft stub - not release evidence until fleshed out and reviewer-signed |
| Caveat | This skill is a scaffolded gap-stub. It must be fully written and reviewer-signed before any client-facing release. |

Last reviewed: 2026-05-25. Next review due: 2026-11-25.
"@
  if ($DryRun) { Write-Host "[dry-run] write $Path"; return }
  Set-Content -LiteralPath $Path -Value $body -Encoding utf8
}

function New-CategoryReadme {
  param([string]$Path, [string]$Category, [string]$Description, [string[]]$ExistingSkills, [string[]]$GapSkills)
  $lines = @()
  $lines += "# $Category"
  $lines += ''
  $lines += $Description
  $lines += ''
  $lines += '## Skills in this category'
  $lines += ''
  $lines += '| Skill | Status |'
  $lines += '|---|---|'
  foreach ($s in $ExistingSkills) { $lines += "| ``$s`` | active |" }
  foreach ($s in $GapSkills)      { $lines += "| ``$s`` | draft (gap stub) |" }
  $lines += ''
  $lines += "Last reviewed: 2026-05-25. Next review due: 2026-11-25."
  $body = ($lines -join "`r`n")
  if ($DryRun) { Write-Host "[dry-run] write $Path"; return }
  Set-Content -LiteralPath $Path -Value $body -Encoding utf8
}

Push-Location $root
try {
  foreach ($cat in $categories.Keys) {
    $catDir = Join-Path $skillsRoot $cat
    if (-not (Test-Path $catDir)) {
      if ($DryRun) { Write-Host "[dry-run] mkdir $catDir" }
      else { New-Item -ItemType Directory -Path $catDir -Force | Out-Null }
    }
    # Move existing
    foreach ($skill in $categories[$cat].existing) {
      $src = Join-Path $skillsRoot $skill
      $dst = Join-Path $catDir $skill
      if (Test-Path $src) {
        if ($DryRun) { Write-Host "[dry-run] git mv $src $dst" }
        else {
          git mv $src $dst 2>&1 | Out-Null
          if ($LASTEXITCODE -ne 0) { throw "git mv failed for $src" }
        }
      }
    }
    # Scaffold gap stubs
    $gapNames = @()
    foreach ($gapName in $categories[$cat].gaps.Keys) {
      $gapNames += $gapName
      $gapDir = Join-Path $catDir $gapName
      if (-not (Test-Path $gapDir)) {
        if ($DryRun) { Write-Host "[dry-run] mkdir $gapDir" }
        else {
          New-Item -ItemType Directory -Path $gapDir -Force | Out-Null
          New-Item -ItemType Directory -Path (Join-Path $gapDir 'references') -Force | Out-Null
          New-Item -ItemType Directory -Path (Join-Path $gapDir 'examples') -Force | Out-Null
        }
      }
      $stubPath = Join-Path $gapDir 'SKILL.md'
      New-StubSkill -Path $stubPath -Name $gapName -Description $categories[$cat].gaps[$gapName] -Category $cat
    }
    # Category README
    $readme = Join-Path $catDir 'README.md'
    New-CategoryReadme -Path $readme -Category $cat -Description $categories[$cat].description `
      -ExistingSkills $categories[$cat].existing -GapSkills $gapNames
  }
}
finally {
  Pop-Location
}

Write-Host 'Reorg complete.'
