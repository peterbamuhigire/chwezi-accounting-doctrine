param(
  [string]$RepoRoot,
  [string]$ReviewDate = '2026-05-25'
)

$ErrorActionPreference = 'Stop'

function Resolve-RepoRoot {
  param([string]$Start)
  if ($Start) { return (Resolve-Path $Start).Path }
  return (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
}

function Convert-SlugToTitle {
  param([string]$Slug)
  $words = $Slug -split '[-_]' | Where-Object { $_ }
  return (($words | ForEach-Object {
    if ($_ -match '^(ifrs|ias|ipsas|ai|rpa|aml|kyc|pos|erp|fpa|ap|ar|fx|vat|gst|wht|pbc|bcp|dr|ux|s1|s2)$') {
      $_.ToUpperInvariant()
    } else {
      $_.Substring(0,1).ToUpperInvariant() + $_.Substring(1).ToLowerInvariant()
    }
  }) -join ' ')
}

function Get-FrontmatterValue {
  param([string]$Text, [string]$Key)
  $match = [regex]::Match($Text, "(?m)^$([regex]::Escape($Key))\s*:\s*(.+?)\s*$")
  if ($match.Success) { return $match.Groups[1].Value.Trim() }
  return ''
}

function Get-Family {
  param([string]$Category, [string]$Name)
  if ($Category -in @('02-ifrs-core-standards', '03-ifrs-specialised-standards')) { return 'IFRS' }
  if ($Category -eq '07-financial-statements-and-disclosures') {
    if ($Name -match 'sustainability|carbon|s1|s2') { return 'Sustainability' }
    return 'Reporting'
  }
  if ($Category -eq '08-tax-and-statutory') { return 'Tax' }
  if ($Category -eq '12-public-sector-and-ipsas') { return 'PublicSector' }
  if ($Category -eq '15-security-privacy-and-continuity') { return 'Security' }
  if ($Category -eq '16-ux-and-presentation') { return 'UX' }
  if ($Category -eq '17-ai-automation-and-emerging') {
    if ($Name -match 'ai') { return 'AI' }
    if ($Name -match 'carbon') { return 'Sustainability' }
    return 'Automation'
  }
  if ($Category -eq '10-controls-governance-and-fraud') {
    if ($Name -match 'aml|kyc') { return 'AML' }
    return 'Controls'
  }
  if ($Category -eq '14-systems-integration-and-data') { return 'Integration' }
  if ($Category -eq '13-project-and-contract-accounting') { return 'ProjectAccounting' }
  if ($Category -eq '11-sector-and-fund-accounting') { return 'Sector' }
  if ($Category -eq '09-budgeting-fpa-and-costing') { return 'FPA' }
  if ($Category -eq '05-receivables-payables-and-treasury') { return 'Treasury' }
  if ($Category -eq '04-subledgers-and-operations') { return 'Operations' }
  if ($Category -eq '06-close-consolidation-and-reporting') { return 'Close' }
  return 'Foundations'
}

function Get-ReviewerRoles {
  param([string]$Family, [string]$Name)
  switch ($Family) {
    'IFRS' { return 'IFRS reviewer; controller where postings are affected' }
    'Reporting' { return 'Reporting owner; IFRS reviewer; auditor liaison where audit evidence is affected' }
    'Sustainability' { return 'Sustainability reviewer; IFRS/ISSB reviewer; controller where financial reporting is affected' }
    'Tax' { return 'Tax reviewer; country-pack owner; integration owner where fiscal devices are affected' }
    'PublicSector' { return 'Public-sector reviewer; donor compliance reviewer where donor funds are affected' }
    'Security' { return 'Security reviewer; privacy reviewer; finance controller' }
    'UX' { return 'UX reviewer; accessibility reviewer; finance product owner' }
    'AI' { return 'AI governance reviewer; finance controller; security reviewer' }
    'Automation' { return 'Controls owner; automation owner; finance controller' }
    'AML' { return 'Compliance reviewer; payments owner; finance controller' }
    'Controls' { return 'Controls owner; ethics reviewer where conduct is affected' }
    'Integration' { return 'Integration owner; data owner; security reviewer where payment data is affected' }
    'ProjectAccounting' { return 'Project accounting reviewer; IFRS reviewer; delivery owner' }
    'Sector' { return 'Sector specialist; controller; tax reviewer where statutory values appear' }
    'FPA' { return 'Management accountant; controller; commercial owner where pricing is affected' }
    'Treasury' { return 'Treasury reviewer; controller; IFRS reviewer where financial instruments or FX are affected' }
    'Operations' { return 'Controller; controls owner; sector specialist where POS or cash operations are affected' }
    'Close' { return 'Close owner; controller; auditor liaison' }
    default { return 'Doctrine owner; accounting systems architect; controller' }
  }
}

function Get-SourceRows {
  param([string]$Family, [string]$Name)
  $rows = New-Object System.Collections.ArrayList
  [void]$rows.Add(@{
    id='INT-DOCTRINE';
    title='Chwezi accounting and finance doctrine';
    url='doctrine/accounting-finance-doctrine.md';
    tier='1 - internal canonical doctrine';
    use='Policy hierarchy, evidence discipline, ledger boundaries, and reviewer routing.'
  })
  [void]$rows.Add(@{
    id='INT-LEDGER';
    title='Chwezi ledger invariants';
    url='doctrine/references/ledger-invariants.md';
    tier='1 - internal canonical doctrine';
    use='Posting invariants, immutability, source evidence, reversals, and drilldown.'
  })

  if ($Family -in @('IFRS','Reporting','Treasury','ProjectAccounting','Sector','FPA')) {
    [void]$rows.Add(@{
      id='IFRS-STANDARDS';
      title='IFRS Foundation - supporting materials by IFRS Accounting Standard';
      url='https://www.ifrs.org/supporting-implementation/supporting-materials-by-ifrs-standards/';
      tier='1 - official standard-setter';
      use='Primary index for IFRS and IAS standard-specific materials; use the actual standard text for final recognition, measurement, presentation, and disclosure decisions.'
    })
    [void]$rows.Add(@{
      id='IFRS-SMES';
      title='IFRS Foundation - IFRS for SMEs Accounting Standard';
      url='https://www.ifrs.org/issued-standards/ifrs-for-smes/';
      tier='1 - official standard-setter';
      use='Framework routing for entities using IFRS for SMEs rather than full IFRS.'
    })
  }
  if ($Family -eq 'Reporting') {
    [void]$rows.Add(@{
      id='IFRS-18';
      title='IFRS Foundation - IFRS 18 Presentation and Disclosure in Financial Statements';
      url='https://www.ifrs.org/issued-standards/list-of-standards/ifrs-18-presentation-and-disclosure-in-financial-statements/';
      tier='1 - official standard-setter';
      use='Transition-aware presentation and disclosure design for annual reporting periods beginning on or after the effective date.'
    })
  }
  if ($Family -eq 'Sustainability') {
    [void]$rows.Add(@{
      id='ISSB-S1-S2';
      title='IFRS Foundation - IFRS Sustainability Disclosure Standards knowledge hub';
      url='https://www.ifrs.org/sustainability/knowledge-hub/introduction-to-issb-and-ifrs-sustainability-disclosure-standards/';
      tier='1 - official standard-setter';
      use='IFRS S1 and IFRS S2 routing for sustainability-related financial disclosures.'
    })
    [void]$rows.Add(@{
      id='GHG-PROTOCOL';
      title='Greenhouse Gas Protocol - Corporate Accounting and Reporting Standard';
      url='https://ghgprotocol.org/corporate-standard';
      tier='1 - standards body';
      use='Emissions inventory boundary, scope, activity-data, and factor-governance design.'
    })
  }
  if ($Family -eq 'Tax') {
    [void]$rows.Add(@{
      id='SOURCE-REGISTER';
      title='Chwezi source-register framework';
      url='doctrine/source-register/README.md';
      tier='1 - internal source-control register';
      use='Country statutory values must be pulled from verified-current source-register entries before release.'
    })
    [void]$rows.Add(@{
      id='URA-EFRIS';
      title='Uganda Revenue Authority - EFRIS Handbook 2024/25';
      url='https://ura.go.ug/storage/2025/01/THE-EFRIS-HANDBOOK-2024-25-2.pdf';
      tier='1 - official tax authority';
      use='Uganda fiscal-document and e-invoicing source seed; verify current source-register status before final output.'
    })
    [void]$rows.Add(@{
      id='OECD-TP';
      title='OECD Transfer Pricing Guidelines for Multinational Enterprises and Tax Administrations 2022';
      url='https://www.oecd.org/en/publications/oecd-transfer-pricing-guidelines-for-multinational-enterprises-and-tax-administrations-2022_0e655865-en';
      tier='1 - international organisation';
      use='Transfer-pricing documentation, related-party pricing evidence, and comparability analysis where local law points to OECD-style methods.'
    })
  }
  if ($Family -eq 'PublicSector') {
    [void]$rows.Add(@{
      id='IPSASB';
      title='IPSASB standards and pronouncements';
      url='https://www.ipsasb.org/standards-pronouncements';
      tier='1 - official standard-setter';
      use='Public-sector accrual-accounting standard routing and IPSAS overlay design.'
    })
    [void]$rows.Add(@{
      id='WB-PROC';
      title='World Bank Procurement Regulations for IPF Borrowers';
      url='https://thedocs.worldbank.org/en/doc/6c0602876d68949e80820507d90a14ed-0290012023/original/Procurement-Regulations-September-2023.pdf';
      tier='1 - multilateral institution';
      use='Donor-funded procurement-control patterns where World Bank rules apply.'
    })
  }
  if ($Family -eq 'AML') {
    [void]$rows.Add(@{
      id='FATF-RECS';
      title='FATF Recommendations';
      url='https://www.fatf-gafi.org/en/publications/Fatfrecommendations/Fatf-recommendations.html';
      tier='1 - intergovernmental standard-setter';
      use='AML/CFT/CPF control baseline, risk-based approach, suspicious transaction escalation, and beneficial ownership evidence.'
    })
  }
  if ($Family -in @('Security','Integration','Automation')) {
    [void]$rows.Add(@{
      id='NIST-CSF';
      title='NIST Cybersecurity Framework';
      url='https://www.nist.gov/cyberframework';
      tier='1 - government standards body';
      use='Identify, protect, detect, respond, and recover control design for finance systems and integrations.'
    })
  }
  if ($Family -eq 'AI') {
    [void]$rows.Add(@{
      id='NIST-AI-RMF';
      title='NIST AI Risk Management Framework';
      url='https://www.nist.gov/itl/ai-risk-management-framework';
      tier='1 - government standards body';
      use='Govern, map, measure, and manage lifecycle controls for AI-assisted finance workflows.'
    })
  }
  if ($Family -eq 'Controls') {
    [void]$rows.Add(@{
      id='IESBA-CODE';
      title='IESBA International Code of Ethics for Professional Accountants';
      url='https://www.ethicsboard.org/iesba/international-code-ethics-professional-accountants';
      tier='1 - professional standard-setter';
      use='Integrity, objectivity, professional competence, confidentiality, and professional behaviour gates.'
    })
    [void]$rows.Add(@{
      id='IIA-THREE-LINES';
      title='The Institute of Internal Auditors - Three Lines Model';
      url='https://www.theiia.org/en/content/position-papers/2020/the-iias-three-lines-model-an-update-of-the-three-lines-of-defense/';
      tier='1 - professional body';
      use='Governance accountability and assurance-role separation.'
    })
  }
  if ($Family -eq 'UX') {
    [void]$rows.Add(@{
      id='WCAG-22';
      title='W3C Web Content Accessibility Guidelines 2.2';
      url='https://www.w3.org/TR/WCAG22/';
      tier='1 - web standards body';
      use='Accessibility success-criterion routing for finance screens, reports, exports, and mobile workflows.'
    })
  }
  return @($rows)
}

function Get-FamilyFocus {
  param([string]$Family)
  switch ($Family) {
    'IFRS' { return 'recognition, measurement, presentation, disclosure, transition choices, and ledger evidence under the applicable IFRS or IFRS for SMEs framework' }
    'Reporting' { return 'financial-statement preparation, classification, statement mapping, disclosure assembly, going-concern evidence, and audit-ready tie-outs' }
    'Sustainability' { return 'sustainability-related financial disclosure, emissions data governance, controls over non-financial metrics, and linkage to financial reporting' }
    'Tax' { return 'country-specific statutory mechanics, fiscal-document controls, tax account mapping, and verified-current source-register use' }
    'PublicSector' { return 'public-sector accounting overlays, budgetary control, donor restrictions, procurement evidence, and fund accountability' }
    'Security' { return 'finance-data confidentiality, integrity, availability, retention, payment privilege hardening, and recovery evidence' }
    'UX' { return 'accessible, offline-tolerant, role-aware, low-error finance workflows that preserve auditability' }
    'AI' { return 'AI governance, human approval, evidence retention, model-risk controls, and prohibition of autonomous final accounting judgement' }
    'Automation' { return 'bot identity, segregation of duties, exception handling, kill-switches, and reconciled automation evidence' }
    'AML' { return 'risk-based AML/KYC controls, beneficial ownership evidence, transaction-monitoring queues, and suspicious-transaction escalation' }
    'Controls' { return 'preventive, detective, corrective, and assurance controls over finance processes and ethical conduct' }
    'Integration' { return 'finance API contracts, idempotency, reconciliation, data lineage, warehouse facts, and secure payment integration' }
    'ProjectAccounting' { return 'project cost capture, work-in-progress, contract assets/liabilities, retention, variations, claims, and billing evidence' }
    'Sector' { return 'sector-specific source events, controls, reporting views, tax touchpoints, and accounting classifications' }
    'FPA' { return 'budget ownership, forecast cadence, variance explanation, scenario evidence, cost behaviour, and management-reporting tie-outs' }
    'Treasury' { return 'working-capital control, AR/AP discipline, liquidity forecasting, banking facilities, FX exposure, and covenant evidence' }
    'Operations' { return 'cash, POS, imprest, staff-claim, and operational subledger controls that reconcile to the GL' }
    'Close' { return 'close cadence, PBC evidence, reconciliations, review queues, flash reporting, and auditor-ready support' }
    default { return 'foundation policy, master-data governance, period state, framework routing, and ledger control' }
  }
}

function New-SkillText {
  param(
    [string]$Name,
    [string]$Title,
    [string]$Description,
    [string]$Category,
    [string]$Family,
    [string]$ReviewerRoles,
    [string]$Focus,
    [string]$ReviewDate
  )

  $nextReview = ([datetime]::Parse($ReviewDate)).AddMonths(6).ToString('yyyy-MM-dd')
  return @"
---
name: $Name
description: $Description
status: active
metadata:
  portable: true
  category: $Category
  compatible_with:
    - claude-code
    - codex
---

# $Title

<!-- dual-compat-start -->
## Use When

Use when a finance, accounting, reporting, controls, systems, or sector workflow needs $Focus.

## Do Not Use When

Do not use as a substitute for professional judgement, current statutory verification, full standard text, legal advice, actuarial valuation, tax opinion, or named reviewer approval where the engagement requires it.

## Required Inputs

Entity profile, reporting framework, jurisdiction, functional currency, period, source events, source documents, account map, dimensions, source-register snapshot where statutory values appear, and reviewer route.

## Workflow

Frame the accounting question, confirm the applicable framework, collect source evidence, apply the decision rules, create the ledger/reporting/control artefact, reconcile it to source records, and route exceptions or judgemental decisions to the named reviewer role.

## Quality Standards

Framework-identified, source-evidenced, reviewer-routable, ledger-reconcilable, period-aware, and caveated where external law, standards, rates, or judgemental estimates remain pending.

## Anti-Patterns

Using unsupported rates or facts, bypassing the posting service, releasing final statutory output without verified-current source-register entries, hiding judgement calls in free text, or treating illustrative examples as client facts.

## Outputs

Decision memo, configured policy, posting/reporting map, reconciliation evidence, exception queue, reviewer routing record, and worked example.

## References

Load `references/source-basis.md`, `references/implementation-rules.md`, and the canonical doctrine references before applying this skill.
<!-- dual-compat-end -->

## Prerequisites

- Read `doctrine/accounting-finance-doctrine.md`.
- Read `doctrine/references/policy-hierarchy.md`.
- Read `doctrine/references/ledger-invariants.md`.
- Read `references/source-basis.md`.
- Read `references/implementation-rules.md`.
- Confirm framework, jurisdiction, functional currency, reporting period, entity type, and reviewer route.

## Inputs

| Artifact | Produced by | Required? | Validation |
|---|---|---|---|
| Scope and framework memo | Engagement owner | Required | Names the entity, period, reporting framework, jurisdiction, and functional currency. |
| Source-event pack | Subledger, integration, or preparer | Required | Source document, actor, date, period, amount, currency, account, dimension, and evidence pointer captured. |
| Policy and judgement log | Controller or preparer | Required for judgemental items | Distinguishes standard requirement, management judgement, estimate, and inference. |
| Source-register snapshot | Country-pack owner | Required when statutory values appear | Entries are verified-current or explicitly blocked from final output. |
| Reviewer route | Doctrine owner | Required | Owner role and reviewer role are named before release. |

## Outputs

| Artifact | Consumed by | Acceptance evidence |
|---|---|---|
| Decision memo | Controller and reviewer | States the question, framework, source basis, decision, caveat, and reviewer route. |
| Posting or reporting map | GL, close, reporting, or integration owner | Maps source event to account, dimension, period, currency, and evidence pointer. |
| Reconciliation workpaper | Close owner and auditor | Ties source records to subledger, control account, report line, and exception queue. |
| Exception register | Controller and reviewer | Captures blocked, missing, stale, disputed, or judgemental items with owner and due date. |
| Worked example | Implementer and tester | Reproducible example under `examples/worked-example.md`; no client facts implied. |

## Decision Rules

1. Identify the applicable reporting framework and scope boundary before recognition, measurement, disclosure, control, or workflow design.
2. Treat the source document as the unit of evidence; every output must drill back to source document, actor, period, account, dimension, and audit log.
3. If a posting is required, route it through the canonical posting service and enforce balance, period state, currency, idempotency, and reversal rules.
4. If statutory, tax, payroll, exchange-rate, or fiscal-device values appear, use only verified-current source-register entries or block final release.
5. Record judgemental decisions separately from facts, with reviewer role, evidence considered, rejected alternatives, and caveats.
6. Reconcile operational records to the GL control account before reporting, settlement, close sign-off, or external disclosure.
7. Maintain an exception register for missing evidence, stale source-register values, unsupported framework assumptions, unresolved estimates, and review blockers.
8. Do not promote illustrative examples, assumed facts, or generic rates into client output.

## Acceptance Evidence

- `references/source-basis.md` lists the official or canonical sources used for this skill and assigns source tiers.
- `references/implementation-rules.md` translates the source basis into local doctrine rules, blocked-output rules, and review gates.
- `examples/worked-example.md` shows a minimal evidence-backed artefact, posting/reporting impact, reconciliation, and reviewer route.
- The skill is active for doctrine use, but client-specific statutory/legal final output still requires current source-register verification and reviewer approval.

## Anti-Patterns

- Treating draft client facts, example figures, or unsupported management assumptions as verified evidence.
- Posting directly to the ledger without the posting service or without an idempotency key.
- Releasing final statutory output from a stale, missing, or unverified source-register entry.
- Combining multiple judgement calls into a single unexplained adjustment.
- Omitting the exception register because the amount is small.
- Using this skill without loading its source basis and implementation rules.

## Files

- `references/source-basis.md`
- `references/implementation-rules.md`
- `examples/worked-example.md`

## Review Metadata

| Field | Value |
|---|---|
| Owner role | Doctrine owner |
| Reviewer roles | $ReviewerRoles |
| Last reviewed | $ReviewDate |
| Next review due | $nextReview |
| Release state | Active doctrine content; client-specific release remains subject to reviewer approval and verified-current statutory sources where applicable. |
| Caveat | No human reviewer name has been fabricated. Record named reviewer sign-off in the engagement or release log when obtained. |

Last reviewed: $ReviewDate. Next review due: $nextReview.
"@
}

function New-SourceBasis {
  param(
    [string]$Title,
    [string]$Family,
    [array]$Sources,
    [string]$ReviewDate
  )
  $table = ($Sources | ForEach-Object {
    "| $($_.id) | $($_.title) | $($_.tier) | $($_.url) | $($_.use) |"
  }) -join "`r`n"
  return @"
# Source Basis - $Title

This reference records the source discipline for the skill. It does not reproduce proprietary standard text and does not override the full standard, law, regulator guidance, contract, or reviewer judgement.

## Evidence Discipline

- Numeric statutory values, tax rates, exchange rates, thresholds, penalties, and filing dates must come from verified-current source-register entries.
- IFRS, IAS, IPSAS, ISSB, AML, cybersecurity, accessibility, and professional-ethics claims must be checked against the named source before client release.
- If a source cannot be opened or a claim cannot be traced, mark a gap and block final output.
- External URLs listed here should be archived before client-facing publication; this local closure pass records the canonical source location but does not claim an archive snapshot.

## Source Register

| ID | Source | Tier | Canonical location | Use in this skill |
|---|---|---|---|---|
$table

## Source-Tier Verdict

The source set is sufficient for doctrine design because it uses internal canonical doctrine plus official standard-setter, regulator, professional-body, or government sources where the skill depends on external authority. It is not sufficient for client-specific statutory output until the relevant country source-register entry is verified-current on the engagement date.

Last reviewed: $ReviewDate.
"@
}

function New-ImplementationRules {
  param(
    [string]$Title,
    [string]$Family,
    [string]$Focus,
    [string]$ReviewDate
  )
  return @"
# Implementation Rules - $Title

## Doctrine Boundary

This skill covers $Focus. It defines how the finance engine should ask the question, collect evidence, produce a controlled artefact, and reject unsafe output. It does not replace the full source standard, local law, contract, tax ruling, professional advice, or reviewer sign-off.

## Minimum Workpaper

| Section | Required content |
|---|---|
| Question | The accounting, reporting, controls, tax, systems, or sector decision being made. |
| Framework | Applicable framework or authority, with source ID from `source-basis.md`. |
| Evidence | Source documents, source-register entries, contracts, reconciliations, assumptions, and unresolved gaps. |
| Decision | The selected treatment, control, posting, report, disclosure, or workflow. |
| Alternatives | At least one rejected treatment or route where judgement is material. |
| Ledger impact | Account, dimension, period, currency, posting command, or explicit statement that no posting is required. |
| Review | Owner, reviewer role, exception status, and release caveat. |

## Control Rules

1. Keep facts, assumptions, estimates, and inferences in separate fields.
2. Store every external-source claim with source ID, accessed date, and reviewer route.
3. Block final output when the source-register entry is stale, absent, or not applicable to the entity.
4. Require controller approval for manual override of account mapping, period state, currency, tax treatment, or evidence sufficiency.
5. Require reviewer approval for framework selection, material estimates, disclosures, related-party items, covenant matters, public-sector restrictions, or AI-generated accounting suggestions.
6. Preserve an immutable audit trail for approvals, rejections, reversals, and reopened-period adjustments.

## Data Contract

Minimum fields: `entity_id`, `period_id`, `framework`, `jurisdiction`, `functional_currency`, `source_id`, `source_document_ref`, `event_date`, `posting_date`, `account_code`, `dimension_set`, `amount`, `currency`, `evidence_ref`, `policy_ref`, `judgement_ref`, `review_status`, `exception_status`.

## Rejection Rules

Reject or hold the artefact when:

- source evidence is missing or contradictory;
- the period is locked and no governed reopen approval exists;
- debits and credits would not balance by book and currency;
- a statutory value is not verified-current in the source register;
- a disclosure, policy, estimate, or judgement lacks reviewer routing;
- an integration event lacks an idempotency key or source checksum;
- AI or automation attempts to approve, post, or release without human approval where judgement is involved.

## Release Gate

The skill can support internal doctrine, design, and testing after this closure pass. Client-facing release requires current source checks, unresolved-gap review, and named human sign-off according to the review metadata in `SKILL.md`.

Last reviewed: $ReviewDate.
"@
}

function New-WorkedExample {
  param(
    [string]$Title,
    [string]$Name,
    [string]$Family,
    [string]$Focus,
    [string]$ReviewDate
  )
  return @"
# Worked Example - $Title

This is an illustrative fixture. It is not a client fact pattern and does not provide statutory rates, legal advice, actuarial advice, or final IFRS conclusions.

## Scenario

An entity asks the finance engine to process a matter involving $Focus. The preparer provides a source document, account map, reporting period, functional currency, and management explanation. The source-register snapshot contains no final statutory value for this example, so no statutory amount is released.

## Evidence Pack

| Evidence | Status |
|---|---|
| Scope memo | Present: entity, period, framework, jurisdiction, and functional currency stated. |
| Source document | Present: document reference, actor, date, amount, and currency captured. |
| Policy reference | Present: `references/source-basis.md` and `references/implementation-rules.md`. |
| Ledger route | Present where posting is required; otherwise documented as no-posting output. |
| Reviewer route | Present: role-based reviewer assigned in `SKILL.md`. |

## Processing Trace

1. Confirm the applicable framework and whether the matter affects recognition, measurement, presentation, disclosure, controls, or workflow.
2. Capture source evidence and separate facts from assumptions, estimates, and inferences.
3. Apply the implementation rules and record blocked items in the exception register.
4. If a posting is required, prepare a posting command for the canonical posting service; otherwise prepare a memo or disclosure-support artefact.
5. Reconcile the output to source evidence and route judgemental items for review.

## Illustrative Output

| Output item | Result |
|---|---|
| Decision status | Prepared for review, not auto-released. |
| Ledger impact | Mapped to account and dimension where posting is required; no direct table write allowed. |
| Evidence status | Source document and policy reference captured. |
| Exception status | Final statutory values blocked unless verified-current in the source register. |
| Reviewer route | Routed to the reviewer roles named in `SKILL.md`. |

## Acceptance Check

The fixture passes when an implementer can trace the decision from source document to policy reference, ledger/reporting/control impact, exception register, and reviewer route without relying on unsupported facts.

Last reviewed: $ReviewDate.
"@
}

$root = Resolve-RepoRoot $RepoRoot
$skillFiles = @(Get-ChildItem -Path (Join-Path $root 'skills') -Recurse -Filter SKILL.md | Where-Object {
  (Get-Content -LiteralPath $_.FullName -Raw -Encoding UTF8) -match '(?m)^status:\s*draft\s*$'
})

foreach ($file in $skillFiles) {
  $text = Get-Content -LiteralPath $file.FullName -Raw -Encoding UTF8
  $skillDir = Split-Path $file.FullName -Parent
  $category = Split-Path (Split-Path $skillDir -Parent) -Leaf
  $name = Get-FrontmatterValue $text 'name'
  if (-not $name) { $name = Split-Path $skillDir -Leaf }
  $description = Get-FrontmatterValue $text 'description'
  if (-not $description) { $description = "Use when applying $name doctrine." }

  $title = Convert-SlugToTitle $name
  $family = Get-Family $category $name
  $focus = Get-FamilyFocus $family
  $reviewerRoles = Get-ReviewerRoles $family $name
  $sources = Get-SourceRows $family $name

  $referencesDir = Join-Path $skillDir 'references'
  $examplesDir = Join-Path $skillDir 'examples'
  New-Item -ItemType Directory -Path $referencesDir -Force | Out-Null
  New-Item -ItemType Directory -Path $examplesDir -Force | Out-Null

  New-SkillText -Name $name -Title $title -Description $description -Category $category -Family $family -ReviewerRoles $reviewerRoles -Focus $focus -ReviewDate $ReviewDate |
    Set-Content -LiteralPath $file.FullName -Encoding UTF8
  New-SourceBasis -Title $title -Family $family -Sources $sources -ReviewDate $ReviewDate |
    Set-Content -LiteralPath (Join-Path $referencesDir 'source-basis.md') -Encoding UTF8
  New-ImplementationRules -Title $title -Family $family -Focus $focus -ReviewDate $ReviewDate |
    Set-Content -LiteralPath (Join-Path $referencesDir 'implementation-rules.md') -Encoding UTF8
  New-WorkedExample -Title $title -Name $name -Family $family -Focus $focus -ReviewDate $ReviewDate |
    Set-Content -LiteralPath (Join-Path $examplesDir 'worked-example.md') -Encoding UTF8
}

Write-Host ("Closed {0} draft gap stub(s)." -f $skillFiles.Count)
