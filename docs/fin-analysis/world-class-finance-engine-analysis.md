# World-Class Finance Doctrine Engine Analysis

Prepared: 2026-05-14
Repository: `C:\wamp64\www\chwezi-accounting-doctrine`
Doctrine version reviewed: `1.0.0`
Current repository release assessment: `pass-with-caveats` for internal doctrine use; not yet safe to claim "100% current" or "Big Four equivalent" without the remediation programme below.

## Executive Summary

This repository already has the right foundation for a serious accounting and finance doctrine engine. The strongest parts are the accounting boundary, the Chart of Accounts backbone, ledger invariants, tax-return pack concept, live-rate verification protocol, role-conditioned finance UX, print-fidelity requirement, month-end close playbook, audit-ready reporting pack, internal controls, and a finance quality gate with named blockers. Those are the correct primitives for producing software plans, SRS documents, proposals, business plans, and implementation guidance that can stand up to serious professional review.

The repository is not yet at the level implied by "world class, 100% accurate, standardized, and stronger than top-tier firms" because the current package is still a doctrine skeleton plus skill suite, not a fully governed operating system. It lacks executable validators, a source-register implementation, complete reference files promised by skills, current 2026/2027 standards-transition handling, complete East Africa country packs, a canonical ledger posting engine skill inside this repo, and enough worked examples to make every downstream engine deterministic. It also has visible production-quality issues such as mojibake encoding artifacts, stale mirror paths, unresolved TODO/TBD items, and relative links that do not always resolve from the repository.

The target should not be to copy PwC, Deloitte, EY, KPMG, or other firms. The target should be to encode the same professional disciplines that make their work valuable: authoritative sources, versioned methodology, reviewer sign-off, risk-based judgement, audit evidence, consistent templates, current standards monitoring, quality control, independence/ethics awareness, and plain-language client communication. The repository can reach that bar if it becomes a governed doctrine product with acceptance tests, source verification, release manifests, and a capped skill catalogue.

The recommended skill count is exactly 25: keep the current 18 skills and add 7 targeted skills. Do not add more until the current set is normalized, reference-complete, and tested. Depth should come from `references/`, examples, snippets, evidence packs, and validators, not from an uncontrolled number of skills.

Highest-priority changes:

1. Add executable doctrine validation: link checks, frontmatter checks, required-section checks, missing-reference checks, mojibake checks, quality-gate fixture tests, and source-register schema validation.
2. Add a repository-native `ledger-posting-engine-core` skill that turns ledger doctrine into schema contracts, posting-service contracts, event mapping, idempotency, tests, and examples.
3. Build a live `tax-statutory-source-register-and-country-packs` system for Uganda first, then Kenya, Rwanda, Tanzania, and South Africa.
4. Update the standards roadmap for IFRS for SMEs third edition and IFRS 18, both effective for annual periods beginning on or after 2027-01-01, subject to jurisdiction adoption and client framework.
5. Normalize every skill against the skill-composition standard: inputs, outputs, decision rules, anti-patterns, read-next links, directly resolvable references, and acceptance evidence.
6. Convert the doctrine from "high-quality guidance" to "release-grade engine contract" by adding machine-readable requirement IDs, test fixtures, example outputs, manifests, and auditor-export samples.
7. Preserve layman usability by requiring every finance output to have a business-language layer, an accounting-policy layer, and an evidence/audit layer.

## Scope And Evidence

Reviewed repository areas:

| Area | Evidence |
|---|---|
| Master doctrine | `doctrine/accounting-finance-doctrine.md` |
| Doctrine references | 19 files under `doctrine/references/` |
| Examples | 4 files under `doctrine/examples/` |
| Governance | `governance/finance-accounting-quality-gate.md`, cleanup backlog, reference instructions |
| Integration | `integration/mirror.ps1`, integration plan, deprecation list, changelog entries |
| Skills | 18 skill directories under `skills/` |
| Audit harness | `skills/finance-module-audit/` and its references |
| UI and reporting | `finance-ui-pattern-library`, `finance-ux-for-non-accountants`, `audit-ready-reporting-pack` |

External standards checked on 2026-05-14:

| Source | Why it matters |
|---|---|
| IFRS Foundation: IFRS Accounting Standards - Required 2026 | Confirms authoritative 2026 IFRS baseline exists for standards required at 2026-01-01. |
| IFRS Foundation: IFRS for SMEs Accounting Standard | Confirms third edition issued in 2025 and effective for annual periods beginning on or after 2027-01-01, with early application permitted. |
| IFRS Foundation: IFRS 18 project page | Confirms IFRS 18 replaces IAS 1 and is effective 2027-01-01. |
| IAASB: 2025 Handbook | Confirms the current audit/assurance handbook includes ISAs, ISQMs, ISA for LCE, ISSA 5000, and related assurance material. |
| IESBA: 2025 Handbook | Confirms current ethics handbook and sustainability assurance ethics material. |
| ICPAU / IFAC Uganda profile | Supports Uganda IFRS and IFRS for SMEs adoption context, but final operational claims still require current-source verification. |

Source links:

- https://www.ifrs.org/news-and-events/news/2026/01/now-available-ifrs-accounting-standards-required-2026-two-editions/
- https://www.ifrs.org/content/ifrs/home/issued-standards/ifrs-for-smes/
- https://www.ifrs.org/projects/completed-projects/2024/primary-financial-statements/
- https://www.iaasb.org/publications/2025-handbook-international-quality-management-auditing-review-other-assurance-and-related-services
- https://www.ethicsboard.org/publications/2025-handbook-international-code-ethics-professional-accountants
- https://www.ifac.org/about-ifac/membership/profile/uganda
- https://www.icpau.co.ug/resources/ifrs-smes-implementation-guidelines

## Strategic Fit Against The Stated Ambition

### What Already Aligns Well

The repo has a professional architecture concept. It correctly treats finance as a system boundary instead of a report-writing afterthought. It says that payroll, purchases, stock, POS, bank, mobile money, grants, assets, and tax are accounting scope when they affect postings, reports, approvals, evidence, or statutory obligations.

The repo correctly uses IFRS for SMEs as the practical default for typical Chwezi clients, with full IFRS as a governed promotion path. This matches the likely market: SMEs, schools, clinics, NGOs, retail, hospitality, agribusiness, and owner-managed companies.

The ledger doctrine is strong. It requires one approved posting service, double entry, immutability, reversals, period locks, audit logs, idempotency, and control-account tie-outs. Those are the right non-negotiables for accounting software and for generated implementation plans.

The repo is unusually strong on non-accountant usability. The split between workflow surface and ledger surface is correct. Cashiers, clerks, and managers should record business events in ordinary language while the system posts clean journals behind the scenes.

The audit-ready reporting pack is a real differentiator. Many small accounting systems can produce trial balances and invoices; fewer can produce a controlled monthly pack, source drilldowns, export index, hashes, sign-offs, and print fidelity.

The quality gate has useful blocker IDs. This is important because downstream engines need deterministic stop/go rules, not vague advice.

### What Does Not Yet Align

The repository cannot yet support a "100% accurate" claim. It explicitly records verification gaps for IFRS Foundation text, Uganda rates, EFRIS schemas, BoU exchange rates, URA templates, and sector-specific statutory details. That honesty is good, but it means final deliverables must be labelled with verification state.

The repo is not yet executable enough. It describes rules, but there is no CI or validator that proves every skill has required sections, every promised reference exists, every quality-gate blocker maps to a test, every link resolves, every file is free from mojibake, and every statutory value has a source-register entry.

The repo has broken or incomplete reference promises. Examples include `ledger-invariants.md` pointing to an internal-controls acceptance-test reference that is not present, several skills listing `references/*.md` or `examples/*.md` files that do not exist, and integration references to files in consumer engines that are not part of this repo. Some of those are intentional future files, but they need a manifest state: `present`, `planned`, `external`, or `deprecated`.

The baseline evaluation found encoding defects: corrupted dash, arrow, comparison, and box-drawing glyphs appeared in multiple files. For a doctrine engine that generates premium client-facing artifacts, this is a visible quality defect.

The mirror script uses `$Master = 'C:\wamp64\www\_chwezi-doctrine'`, while this repository is located at `C:\wamp64\www\chwezi-accounting-doctrine`. If `_chwezi-doctrine` is no longer the canonical path, mirroring will fail or copy stale material.

The standards roadmap needs 2027 transition handling. IFRS for SMEs third edition and IFRS 18 both become major implementation planning issues for entities with annual periods beginning on or after 2027-01-01. The current doctrine still leans heavily on IAS 1 and current SME section summaries without a transition module.

## Findings Register

| ID | Severity | Standard area | Evidence | Risk | Required fix | Acceptance evidence |
|---|---|---|---|---|---|---|
| F-001 | High | Current standards | `doctrine/references/ifrs-for-smes-default.md`, `full-ifrs-overlay.md`; external IFRS sources | Doctrine may generate 2027+ outputs that miss IFRS for SMEs third edition and IFRS 18 transition effects. | Add standards-transition roadmap and update report/presentation modules for 2027. | `standards-transition-2027` reference; test fixtures for 2026 vs 2027 reporting basis. |
| F-002 | High | Executability | No CI, validator, or test harness found in repo. | Downstream engines can drift, broken links can ship, and quality gates remain manual. | Add `tools/validate-doctrine.ps1` or equivalent plus CI instructions. | Validator report passes for links, frontmatter, skill sections, missing files, source-register schema, mojibake. |
| F-003 | High | Source verification | Doctrine says live rates require source register; no source-register schema/file exists. | Tax, payroll, FX, EFRIS, and statutory claims cannot be promoted from draft to final. | Add `doctrine/source-register/` schema and Uganda seed entries with `draft` state until verified. | Source-register validator and sample entries with verifier, source tier, date accessed, expiry. |
| F-004 | High | Core accounting engine | Strong ledger references exist, but no repo-native core posting-engine skill exists. | Consumer engines may implement accounting inconsistently. | Add `ledger-posting-engine-core` skill with schema, service contract, event map, idempotency, tests. | Example posting service contract, journal fixtures, failure fixtures, invariant test suite. |
| F-005 | High | Completeness | Several skills list missing references/examples in their `Files` sections. | Agents may assume unavailable depth exists and produce incomplete guidance. | Add missing files or mark them as planned in a manifest. | `docs/reference-manifest.md` shows all declared references as present/planned/external. |
| F-006 | Medium | Encoding and presentation | Mojibake found in README, skills, and doctrine references. | Client-facing output looks unprofessional and may corrupt symbols in downstream engines. | Normalize files to UTF-8 and replace corrupted glyphs with ASCII or intended characters. | Mojibake scan returns zero matches. |
| F-007 | High | Integration | `integration/mirror.ps1` master path appears stale for this repo. | Consumer engines may not receive current doctrine. | Make master path repo-relative by default, with override parameter. | Dry-run from repo root succeeds and logs expected destinations. |
| F-008 | High | Skill composition | Current skills generally lack explicit `Inputs` and `Outputs` contract sections. | Skills do not compose deterministically across SRS, proposal, business-plan, and software engines. | Normalize all skills to the composition standard. | Composition validator passes for all 25 target skills. |
| F-009 | Medium | Country support | Kenya, Rwanda, Tanzania, South Africa are placeholders. | Remote and regional work may use Uganda assumptions incorrectly. | Add country-pack skeletons with authority list, source register, return pack map, payroll schedule, e-invoicing status. | Each country pack has `draft` source register and no final rates without verification. |
| F-010 | High | Domain coverage | No repo-native skills for inventory costing, fixed assets, payroll/statutory postings, or consolidation/intercompany. | Common client systems will be under-specified despite touching material accounting areas. | Add the 7 proposed skills in the 25-skill catalogue. | Skills pass structure gate and include examples, snippets, and test fixtures. |
| F-011 | Medium | Layman usability | UX doctrine is strong, but output templates do not consistently require business-language explanations. | Business owners may receive technically correct documents they cannot safely act on. | Add "plain-language layer" to all report/proposal/SRS/business-plan output contracts. | Templates show business meaning, accounting treatment, evidence, caveat. |
| F-012 | Medium | Quality management | Repo has internal controls but not a methodology for engagement quality, ethics, independence, and reviewer competence. | Premium client work can be technically strong but weak on professional governance. | Add quality-control requirements into `finance-module-audit` and `internal-controls-library`; consider as references instead of a separate skill. | Reviewer role matrix includes preparer, technical reviewer, tax reviewer, controller, partner/owner sign-off. |

## Standards Scorecard

| Area | Score | Rationale |
|---|---|---|
| Accounting boundary | Pass | Clear definition of finance scope and posting boundaries. |
| Ledger invariants | Pass-with-caveats | Strong rules; needs executable tests and core posting-engine skill. |
| Chart of Accounts | Pass-with-caveats | Strong metadata model; needs examples by sector and validation fixtures. |
| IFRS for SMEs | Pass-with-caveats | Practical default is correct; needs third edition 2025/2027 transition plan. |
| Full IFRS | Pass-with-caveats | Overlay exists; needs IFRS 18 and deeper module coverage for full IFRS clients. |
| Uganda compliance | Pass-with-caveats | Correct caveat posture; no live source register implementation yet. |
| East Africa/Africa expansion | Fail for final use | Country extensions are placeholders only. |
| Tax and statutory returns | Pass-with-caveats | Strong return-pack concept; needs source-register and authority-template fixtures. |
| Reconciliation | Pass-with-caveats | Good bank/mobile/POS design; needs provider quirks and sample import formats. |
| Month-end close | Pass | Strong workflow and evidence model. |
| Audit-ready reporting | Pass-with-caveats | Strong pack concept; missing referenced templates and examples. |
| Internal controls | Pass-with-caveats | Good workflow controls; needs quality management, ethics, and evidence sampling. |
| UX for non-accountants | Pass | Strong separation between workflow and ledger surfaces. |
| Print fidelity | Pass-with-caveats | Good requirements; needs automated print fixtures and visual checks. |
| Skill architecture | Pass-with-caveats | Strong suite; needs normalization and cap discipline. |
| Repository operations | Fail for release-grade | No CI/validator; stale mirror path; encoding issues; missing references. |

## Recommended 25-Skill Catalogue

Total allowed: 25. Current count: 18. Recommended additions: 7. Do not exceed this until every skill has a passing manifest and validator.

### Tier 0: Doctrine Spine And Gates

| # | Skill | Status | Purpose |
|---|---|---|---|
| 1 | `finance-module-audit` | Keep, normalize | Runs finding register, scorecard, and remediation plan. |
| 2 | `audit-ready-reporting-pack` | Keep, deepen | Defines monthly/year-end reporting pack, drilldown, export index, sign-off. |
| 3 | `internal-controls-library` | Keep, deepen | Defines SoD, maker-checker, approvals, audit review, exception monitoring. |
| 4 | `ledger-posting-engine-core` | Add | Canonical accounting engine implementation contract: events, mappings, posting service, schema, tests. |
| 5 | `tax-statutory-source-register-and-country-packs` | Add | Live verification, source register, country packs, authority template versioning. |

### Tier 1: Operating Finance Workflows

| # | Skill | Status | Purpose |
|---|---|---|---|
| 6 | `bank-and-mobile-money-reconciliation` | Keep, deepen | Bank, mobile money, POS cash drawer, card, clearing reconciliation. |
| 7 | `month-end-and-year-end-close-playbook` | Keep, deepen | Close tasks, period states, sign-off, retained earnings, reopen control. |
| 8 | `opening-balances-and-migration-playbook` | Keep, deepen | Cutover, opening TB, subledger tie-outs, migration suspense. |
| 9 | `management-accounting-dimensions` | Keep, deepen | Cost centres, branches, projects, donor restrictions, budgets, allocations. |
| 10 | `inventory-costing-and-stock-accounting` | Add | IAS 2/Section 13 inventory costing, FIFO/weighted average, NRV, COGS, stock counts. |
| 11 | `fixed-assets-and-depreciation` | Add | IAS 16/Section 17 asset register, depreciation, disposals, revaluation, impairment handoff. |
| 12 | `payroll-and-statutory-postings-east-africa` | Add | Payroll journals, PAYE/NSSF/LST/WHT schedules, payroll-to-GL tie-outs, country-specific verification. |

### Tier 2: Standards Modules

| # | Skill | Status | Purpose |
|---|---|---|---|
| 13 | `ifrs-for-smes-equivalents` | Keep, update | Maps IFRS for SMEs to full IFRS modules and transition issues. |
| 14 | `ifrs-revenue-recognition` | Keep, deepen | Section 23 and IFRS 15 revenue, contracts, obligations, deferred revenue. |
| 15 | `ifrs-leases` | Keep, deepen | Section 20 and IFRS 16 leases, exemptions, ROU model when material. |
| 16 | `ifrs-financial-instruments` | Keep, deepen | Sections 11/12 and IFRS 9 classification, ECL, disclosures. |
| 17 | `ias-impairment` | Keep, deepen | Section 27 and IAS 36 impairment indicators, recoverable amount, reversals. |
| 18 | `ias-provisions-contingencies` | Keep, deepen | Section 21 and IAS 37 provisions, contingencies, onerous contracts. |
| 19 | `ias-income-tax-deferred-tax` | Keep, deepen | Section 29 and IAS 12 current/deferred tax and tax reconciliation. |
| 20 | `ias-government-grants` | Keep, deepen | Section 24 and IAS 20 grant accounting. |
| 21 | `ias-agriculture` | Keep, deepen | Section 34 and IAS 41 biological assets and produce. |
| 22 | `consolidation-and-intercompany` | Add | Groups, multi-entity books, eliminations, non-controlling interest, intercompany matching. |

### Tier 3: User Experience And Commercial Output

| # | Skill | Status | Purpose |
|---|---|---|---|
| 23 | `finance-ux-for-non-accountants` | Keep, deepen | Plain-language workflows for cashiers, clerks, managers, family businesses. |
| 24 | `finance-ui-pattern-library` | Keep, deepen | Components, status chips, drilldown, money cells, print stylesheet. |
| 25 | `engagement-quality-and-plain-language-output` | Add | Quality-control review, ethics caveats, layman explanation layer, executive/client-ready outputs. |

Why these 25: they cover the full value chain from source event to ledger, controls, statutory verification, close, reporting, audit evidence, common SME modules, full IFRS escalation, and client-facing usability. Additional topics such as sustainability/ISSB, sector packs, procurement, grants, insurance, construction, and treasury should start as references under these skills until demand proves they deserve promotion.

## Skill Realignment Rules

Every skill should follow one contract:

```markdown
## Prerequisites

- `doctrine/accounting-finance-doctrine.md`
- Relevant doctrine references.
- Relevant upstream skill outputs.

## Inputs

| Artifact | Produced by | Required? | Why |
|---|---|---|---|
| Finance context map | `finance-module-audit` | required | Defines entity, framework, jurisdiction, modules, users. |
| CoA policy register | `ledger-posting-engine-core` | required where posting exists | Drives account mappings and reporting groups. |
| Source-register snapshot | `tax-statutory-source-register-and-country-packs` | required for final statutory output | Proves rates/templates are current. |

## Outputs

| Artifact | Consumed by | Acceptance evidence |
|---|---|---|
| Finding register | Quality gate, client report | IDs, severity, evidence, owner, fix, reviewer. |
| Posting-rule fixture | Software/SRS/test-plan engines | Balanced journal examples and failure cases. |
| Plain-language explanation | Proposal/business-plan/client report | Business meaning before accountant detail. |
```

Required file layout for each skill:

```text
skills/<skill-name>/
  SKILL.md
  references/
    decision-rules.md
    implementation-contract.md
    acceptance-tests.md
  examples/
    happy-path.md
    failure-case.md
```

Not every skill needs exactly those names, but every skill needs the same classes of content: decision rules, implementation contract, acceptance tests, and examples.

## Recommended Repository Improvements

### 1. Add A Doctrine Validation Harness

Create `tools/validate-doctrine.ps1` with checks for:

- frontmatter presence and valid `name`
- skill count <= 25
- required skill sections
- unresolved declared files
- broken local links
- mojibake characters
- hardcoded statutory values in final doctrine files
- missing `Last reviewed` / `Next review due`
- missing source-register entries for any final rates
- quality-gate blocker coverage

Example validator output:

```text
Doctrine validation: fail
skills_total: 18
missing_declared_references: 24
mojibake_matches: 37
stale_integration_paths: 1
source_register_entries: 0
quality_gate_blockers_without_tests: 31
```

Acceptance target:

```text
Doctrine validation: pass-with-caveats
skills_total: 25
missing_declared_references: 0
mojibake_matches: 0
stale_integration_paths: 0
source_register_entries: >= 1 per active country pack
quality_gate_blockers_without_tests: 0
```

### 2. Add Canonical Ledger Posting Snippets

The repo should include language-neutral and PHP/Laravel-ready snippets because many downstream systems will be built in PHP, TypeScript, or mobile stacks.

Canonical value object:

```php
<?php
declare(strict_types=1);

final readonly class JournalEntry
{
    /**
     * @param list<JournalLine> $lines
     */
    public function __construct(
        public int $tenantId,
        public string $book,
        public string $idempotencyKey,
        public DateTimeImmutable $entryDate,
        public string $sourceType,
        public string $sourceId,
        public string $description,
        public array $lines,
        public ?int $reversesJournalId = null,
    ) {}
}

final readonly class JournalLine
{
    /**
     * @param array<string, string|int|null> $dimensions
     */
    public function __construct(
        public int $accountId,
        public string $currency,
        public int $debitMinor,
        public int $creditMinor,
        public array $dimensions = [],
    ) {}
}
```

Invariant test:

```php
public function test_posted_journal_balances_by_currency(): void
{
    $entry = $this->fixture->vatInclusiveCashSale();

    $posted = $this->postingService->post($entry);

    $totals = $this->journalLines->totalsByCurrency($posted->journalId);

    foreach ($totals as $currency => $total) {
        self::assertSame(
            $total->debitMinor,
            $total->creditMinor,
            "Journal must balance for {$currency}"
        );
    }
}
```

VAT-inclusive posting fixture:

```yaml
source:
  type: pos_sale
  gross_minor: 118000
  currency: UGX
  tax_code: UG-VAT-STANDARD
  tax_rate_source_state: verified-current
expected_journal:
  - account: cash_on_hand
    debit_minor: 118000
    credit_minor: 0
  - account: sales_revenue
    debit_minor: 0
    credit_minor: 100000
  - account: output_vat_control
    debit_minor: 0
    credit_minor: 18000
acceptance:
  - debits_equal_credits
  - tax_code_has_effective_period
  - output_vat_routes_to_control_account
  - report_drilldown_reaches_source_document
```

### 3. Implement The Source Register

Add this structure:

```text
doctrine/source-register/
  schema.yaml
  uganda/
    vat.yaml
    paye.yaml
    nssf.yaml
    wht.yaml
    income-tax.yaml
    efris.yaml
    exchange-rates.yaml
  kenya/
    README.md
```

Entry shape:

```yaml
- topic: Uganda VAT standard rate
  jurisdiction: UG
  value_or_rule: "<verified value or draft placeholder>"
  source_url_or_doc: "<Tier 1 or Tier 2 source>"
  source_tier: 1
  date_accessed: "2026-05-14"
  verifier: "<named reviewer>"
  output_affected:
    - sales-tax-codes
    - vat-return-pack
  expiry_or_recheck: "2026-08-14"
  state: draft
  evidence_archive: "<path>"
  notes: "Do not use in final output until state is verified-current."
```

Rules:

- Draft values may support planning only.
- Final outputs must fail when a required source-register entry is missing, stale, or not `verified-current`.
- Big Four publications can support interpretation but should not be the sole source for statutory rates.

### 4. Add Standards Transition References

Add:

```text
doctrine/references/standards-transition-2027.md
doctrine/references/ifrs-18-presentation-transition.md
doctrine/references/ifrs-for-smes-third-edition-transition.md
```

Minimum coverage:

- affected reports and statement layouts
- effective date and early-application policy
- entity framework and jurisdiction adoption dependency
- comparative-period and transition disclosure requirements
- impact on templates, note packs, and SRS requirements
- quality-gate blockers for using old/new basis incorrectly

### 5. Make Client Output Understandable To Laymen

Every generated deliverable should use a three-layer output pattern:

| Layer | Audience | Example |
|---|---|---|
| Business meaning | Owner, manager, cashier, client | "This sale increases cash, records revenue, and sets aside VAT payable." |
| Accounting treatment | Accountant, implementer | "Debit Cash, credit Revenue net of VAT, credit Output VAT Control." |
| Evidence and caveats | Reviewer, auditor, tax adviser | "Tax code must be verified-current; source invoice and EFRIS reference required." |

Example:

```markdown
### Recording a VAT-inclusive sale

Business meaning: The customer paid the full shelf price. The business keeps the net sale amount and owes the VAT portion to the tax authority.

Accounting treatment: Debit cash or receivable for the gross amount. Credit revenue for the net amount. Credit output VAT control for the tax amount.

Evidence: Attach receipt/invoice, tax code, source-register entry, cashier identity, and settlement reference. Do not finalize if the tax rate is not verified-current.
```

### 6. Fix Integration And Release Governance

`integration/mirror.ps1` should default to the repository root:

```powershell
param(
  [switch]$DryRun,
  [string]$Engine,
  [string]$Master = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
)
```

Every mirror run should produce:

```yaml
mirror-run:
  doctrine-version: "1.0.0"
  source-commit: "<git-sha>"
  ran-at: "2026-05-14T00:00:00+03:00"
  target-engine: "proposal"
  files-copied: 0
  warnings: []
  validation-state-before: pass-with-caveats
  validation-state-after: pass-with-caveats
```

### 7. Add Reference Manifest

Create `docs/reference-manifest.md` or `doctrine/reference-manifest.yaml`:

```yaml
- path: skills/audit-ready-reporting-pack/references/notes-templates.md
  declared_by: skills/audit-ready-reporting-pack/SKILL.md
  state: missing
  required_for_release: true
  owner: doctrine-owner
  target_date: "2026-06-15"
```

This prevents invisible promises. A missing file can be acceptable only when it is declared as planned and not required for the current release state.

## Master Remediation Plan

### Phase 1: Stabilize The Doctrine Package

Target duration: 1 to 2 weeks.

| Work item | Owner | Acceptance evidence |
|---|---|---|
| Fix mojibake and encoding artifacts | Doctrine maintainer | Scan returns no corrupted glyph signatures, replacement characters, or corrupted arrows. |
| Fix mirror path and add dry-run verification | Tooling owner | `integration/mirror.ps1 -DryRun` succeeds from repo root. |
| Add reference manifest | Doctrine maintainer | Every declared reference is present/planned/external/deprecated. |
| Add validation harness | Tooling owner | Validator runs locally and returns structured output. |
| Add quality-gate fixture map | Finance reviewer + engineer | Every blocker has at least one positive or negative fixture. |

### Phase 2: Build The Missing Core Skills

Target duration: 2 to 4 weeks.

| Work item | Owner | Acceptance evidence |
|---|---|---|
| `ledger-posting-engine-core` | Accounting systems architect | Service contract, schema contract, event map, posting fixtures, invariant tests. |
| `tax-statutory-source-register-and-country-packs` | Tax reviewer + doctrine owner | Source-register schema and Uganda draft pack. |
| `inventory-costing-and-stock-accounting` | Inventory/accounting specialist | FIFO/weighted-average fixtures, NRV test, stock-count variance posting. |
| `fixed-assets-and-depreciation` | Accounting specialist | Asset lifecycle examples, depreciation fixtures, disposal journals. |
| `payroll-and-statutory-postings-east-africa` | Payroll/tax reviewer | Payroll-to-GL examples, statutory schedule pack, verification rules. |
| `consolidation-and-intercompany` | Financial reporting specialist | Intercompany matching, elimination journals, group pack skeleton. |
| `engagement-quality-and-plain-language-output` | Delivery lead | Review roles, client explanation pattern, ethics/professional-review caveats. |

### Phase 3: Update Standards And Country Coverage

Target duration: 2 to 6 weeks.

| Work item | Owner | Acceptance evidence |
|---|---|---|
| IFRS for SMEs third edition transition | IFRS reviewer | Transition reference with effective date, affected sections, client policy choices. |
| IFRS 18 transition | IFRS reviewer | Report presentation templates and quality-gate checks updated. |
| Uganda statutory pack | Tax reviewer | URA/NSSF/BoU/ICPAU source register entries with state and expiry. |
| Kenya pack skeleton | Tax reviewer | KRA/eTIMS/CBK/ICPAK source hierarchy and draft source register. |
| Country-pack validator | Tooling owner | Missing final rates block final output. |

### Phase 4: Productize For Premium Client Work

Target duration: ongoing.

| Work item | Owner | Acceptance evidence |
|---|---|---|
| Auditor export sample bundle | Reporting owner | Sample `audit-export-entity-period/` with index, hashes, reports, source docs. |
| Proposal/SRS/business-plan templates | Delivery lead | Templates consume doctrine, show caveats, and explain finance in plain English. |
| Client assurance pack | Delivery lead | Executive summary, scope, assumptions, evidence, sign-offs, residual risk. |
| Training examples | Doctrine owner | Owner-manager, cashier, accountant, auditor examples for core workflows. |

## What "World Class" Should Mean In This Repo

For this doctrine engine, "world class" should be defined by evidence, not adjectives:

- Every final finance claim has a framework, source, date, verifier, and caveat state.
- Every ledger-affecting workflow has a posting fixture and failure fixture.
- Every report figure can drill down to journal, source document, evidence, and audit log.
- Every statutory output distinguishes draft planning from verified-current final use.
- Every generated client document is understandable by a non-accountant and reviewable by an accountant.
- Every skill has inputs, outputs, decision rules, examples, anti-patterns, and acceptance evidence.
- Every release has a manifest, validation result, reviewer sign-off, and known gaps.

The repository is already pointed in the right direction. The next step is to turn it from a strong written doctrine into a tested, versioned, evidence-producing methodology engine.
