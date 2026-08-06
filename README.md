# Chwezi Accounting and Finance Doctrine

See [`docs/control-plane-adoption.md`](docs/control-plane-adoption.md) for
finance-specific agent roles, thin commands, period-control hooks, evidence,
and segregation-of-duties rules.

Canonical accounting and finance doctrine for the Chwezi skill-engine portfolio. This repository is the cross-cutting finance source of truth for accounting, IFRS, IFRS for SMEs, IPSAS, tax, treasury, controls, reporting, finance systems, and money-touching product work.

Acknowledgement: Shared by Peter Bamuhigire, techguypeter.com, +256 784 464178.

Current state: `pass-with-caveats` doctrine status, 103 active `SKILL.md` skills in 17 category groups, and a Kaizen operating contract adopted in August 2026.

## Start here

When finance or accounting scope is detected:

1. Read this README.
2. Read `doctrine/accounting-finance-doctrine.md`.
3. Read `governance/finance-accounting-quality-gate.md` when producing or releasing an artefact.
4. Load the applicable source register and specialist `skills/**/SKILL.md` files.
5. Load the Kaizen skill for an engine audit, product audit, or book-driven improvement:
   `skills/10-controls-governance-and-fraud/kaizen-engine-and-product-improvement/SKILL.md`.
6. Route current, uncertain, statutory, regulatory, tax, exchange-rate, or standards claims through the Digital Research Skills Engine at `C:\wamp64\www\digital-research-skills`.

Do not rely on native skill discovery. Resolve the canonical engine path from the project `AGENTS.md` or global engine-routing table, then read the matching files directly.

## What this engine governs

This doctrine applies whenever a workflow touches the Chart of Accounts, subledgers, postings, rates, reconciliations, approvals, financial reports, statutory returns, audit evidence, or money movement. This includes:

- General ledger, Chart of Accounts, dimensions, currencies, periods, journals, reversals, and control accounts.
- IFRS, IFRS for SMEs, IAS/IFRS specialist standards, financial statements, disclosures, and reporting-basis transitions.
- IPSAS, public-sector finance, donor-funded projects, procurement, and fiscal controls.
- Sales, purchases, inventory, POS, cash drawers, bank and mobile money, payroll, grants, assets, leases, treasury, AR, AP, and tax.
- Budgets, forecasts, costing, variance analysis, management reporting, and financial planning.
- Month-end/year-end close, consolidation, intercompany, migration, opening balances, audit PBC, evidence packs, and reporting releases.
- Internal controls, segregation of duties, anti-fraud, AML/KYC, whistleblowing, ICFR, cybersecurity, continuity, and finance integrations.
- Finance UX for non-accountants, ledger UX, accessibility, low-bandwidth/offline workflows, print fidelity, and AI/RPA governance.

The engine serves both accounting professionals and other skill engines producing finance-touching websites, software, SRS documents, proposals, business plans, dashboards, databases, mobile/desktop applications, and operational runbooks.

## Core doctrine

### Reporting-basis hierarchy

Every accounting artefact names its reporting basis: IFRS, IFRS for SMEs, IPSAS, local statutory basis, client-specific basis, or not applicable.

- IFRS for SMEs is the practical default for typical SMEs, schools, clinics, NGOs, retail, agribusiness, and hospitality clients unless another basis is required.
- Full IFRS applies where public-interest status, financing covenants, donor requirements, regulation, or client policy requires it.
- IPSAS applies to public-sector or public-finance scope after the applicable jurisdictional overlay is identified.
- Local statutory, tax, payroll, filing, regulator, and exchange-rate rules require current-source verification.
- Complex judgement, statutory sign-off, tax positions, audit positions, and final reporting require the appropriate professional reviewer.

The doctrine is not a substitute for an accountant, auditor, tax adviser, lawyer, regulator, or standard-setter. It does not certify compliance by itself.

### Ledger and control invariants

Every money-touching implementation must preserve:

- Approved posting services as the only journal-entry boundary.
- Balanced double entry by currency.
- Immutable posted history; corrections use linked reversal or correction postings.
- Period locks and approved adjustment paths.
- Idempotent mutating commands and duplicate-event rejection/quarantine.
- Source-document, actor, reviewer, approval, and system audit trails.
- Control-account tie-outs to subledgers at close and migration.
- CoA mappings, dimensions, permissions, evidence pointers, and drilldown from report to source.
- Segregation of duties between preparation, approval, posting, reconciliation, and review.
- Separation of net, tax, and gross amounts for VAT-inclusive transactions.

Forbidden patterns include direct writes to journal tables, single-sided effects, destructive editing of posted history, unverified statutory values, stale exchange rates, migration without tie-out sign-off, and reports that cannot drill into their evidence.

## The Kaizen operating contract

Continuous improvement applies to this doctrine, every skill, and every product produced from the engine. Improvement must remove waste and uncertainty without weakening accounting invariants, controls, segregation of duties, source verification, privacy, or reviewer accountability.

### Required cycle

`Observe -> Baseline -> Select -> Experiment -> Check -> Standardise -> Teach -> Re-measure`

1. Observe the failure, delay, exception, user friction, audit finding, control weakness, or evidence gap.
2. Baseline the current process, score, population, cycle time, error rate, control state, and evidence quality.
3. Select one bounded improvement with a named owner, hypothesis, risk, and rollback.
4. Experiment in a safe, reversible scope; never bypass a control merely to measure speed.
5. Check accounting correctness, control effectiveness, reviewer experience, source currency, usability, and unintended effects.
6. Standardise only when acceptance evidence is complete; update the doctrine, skill, reference, fixture, test, or template.
7. Teach the change through the skill, example, runbook, release note, and reviewer route.
8. Re-measure and schedule the next review; a closed item without follow-up evidence is not continuous improvement.

### Audit and remediation rules

The portfolio score is deliberately hard-capped:

```text
capped_audit_score = min(raw_audit_score, 65)
```

The cap is a reporting ceiling, not permission to waive a blocker. Every audit must identify blockers separately. The remediation plan must target 95/100 and contain:

- Current baseline and gap to target.
- Root cause and affected control/product outcome.
- Proposed change and testable improvement hypothesis.
- Owner, due date, dependencies, and risk.
- Acceptance evidence and independent review route.
- Rollback/recovery procedure.
- Residual-risk owner and next re-audit date.

The accounting audit covers correctness, completeness, cut-off, framework fit, source currency, reconciliation, close, reporting, controls, SoD, audit evidence, privacy/security, explainability, accessibility, operational continuity, handoff, and residual risk.

### Product audits

The same contract applies to any finance-touching product: website, web app, mobile app, desktop app, ERP/POS, database, API, dashboard, proposal, business plan, SRS, architecture, design, report, tax-return pack, close pack, or runbook.

Audit the product from source evidence, not screenshots or claims alone. Trace money flows from source event through posting, subledger, control account, report, statutory output, evidence pack, and reviewer sign-off. Test happy paths, exceptions, reversals, stale sources, duplicate submissions, period locks, migration, permissions, reconciliation, print/export, accessibility, and recovery.

For finance-system changes, apply the Facility Move pattern: charter and decision rights, current-state inventory, readiness and continuity risks, target state, integrated cutover plan, rehearsals, rollback, stabilisation, closeout, and lessons learned.

## Book-derived capabilities adopted

The August 2026 book intake was used as a source of improvement patterns, not as authority for current IFRS, tax, statutory, or regulatory facts. Current claims still require the source register and Digital Research verification.

| Book or source | Accounting-engine capability adopted |
|---|---|
| LEAN: Ultimate Collection | Build-Measure-Learn, validated learning, innovation accounting, KPI discipline, waste/value analysis, DMAIC, Kanban, and experiment records. |
| Kaizen and the Art of Creative Thinking | Small-step problem solving, standard work, observation, practical experimentation, and making improvement visible to the people doing the work. |
| Applying the Kaizen in Africa | Participatory improvement, PDCA, 5S, muda reduction, QC Story, QCC-style ownership, 7 QC tools, on-site observation, management commitment, and institutionalisation. |
| Facility Move Playbook | Finance-system readiness, asset/data/process inventory, continuity, cutover, rehearsal, rollback, stabilisation, and lessons-learned controls for ERP and reporting changes. |
| Agile Processes in Software Engineering and XP 2026 | Evidence-led retrospectives, hypothesis engineering, decision rights, small experiments, independent evaluation, and feedback-driven delivery. |
| Platform Enterprise | Platform-as-product ownership, consumer feedback, cognitive-load reduction, sociotechnical design, sustainable maintenance, technical-debt visibility, and clear ownership. |
| Designing for AI | Problem-first AI selection, separation of human/system/model/input/output concerns, transparency, user control, correction, contestability, drift detection, and rollback for finance AI/RPA. |
| Leveling Up as a Tech Lead | Role clarity, ownership transfer, transparent communication, implement-reflect-adjust loops, trust, and non-blaming learning culture for finance-system teams. |
| MSC Software Magazine | Model/data lineage, assumptions, independent verification, simulation-to-test correlation, error visibility, and production decision evidence. |
| The Nonprofit Guide to Strategic Planning | Governance, stakeholder readiness, baseline analysis, external scan, options/trade-offs, resource implications, implementation cadence, KPI dashboards, and refresh triggers for NGO finance plans. |
| Paid for Your Perspective | Expert-positioning boundaries, buyer needs, preparation, compliance screening, knowledge-product discipline, and explicit professional-review limits. |
| Digital Storytelling and Video Game Storytelling | Used only as transferable patterns for clear evidence narratives, user journeys, branch/rejoin logic, and cross-disciplinary communication; not as accounting authority. |
| AI for Game Developers | Used only as a transferable pattern for deterministic fallbacks, state-machine reasoning, instrumentation, and recovery in finance automation; dated APIs are not adopted. |
| Dynamic Characters and Anatomy for Artists | Routed to design/game engines. No accounting doctrine or financial claim is derived from these books. Anatomy extraction was not usable. |

The detailed portfolio study and provenance limits are maintained in the Digital Research engine. The local accounting adoption record is `docs/continuous-improvement/kaizen-adoption-2026-08.md`.

## Skill catalogue

There are 103 active skills across 17 groups:

| Group | Scope |
|---|---|
| `01-foundations` | CoA, ledger core, dimensions, currency, period locks, immutability. |
| `02-ifrs-core-standards` | Revenue, leases, financial instruments, SMEs, PPE, intangibles, employee benefits, borrowing costs, FX. |
| `03-ifrs-specialised-standards` | Impairment, agriculture, grants, deferred tax, provisions, business combinations, disclosures, and specialist IAS/IFRS. |
| `04-subledgers-and-operations` | Bank/mobile-money reconciliation, fixed assets, inventory, payroll, petty cash, POS, expenses. |
| `05-receivables-payables-and-treasury` | AR, AP, treasury, FX, hedging, facilities, and covenants. |
| `06-close-consolidation-and-reporting` | Close, continuous close, consolidation, migration, audit PBC, reporting packs, and finance-module audits. |
| `07-financial-statements-and-disclosures` | Primary statements, cash flow, notes, going concern, and disclosure support. |
| `08-tax-and-statutory` | Source registers, VAT/WHT, transfer pricing, e-invoicing, and statutory packs. |
| `09-budgeting-fpa-and-costing` | Budgets, forecasts, variance, KPIs, costing, and pricing. |
| `10-controls-governance-and-fraud` | Controls, SoD, audit quality, fraud, AML, whistleblowing, ICFR, conformance, and Kaizen. |
| `11-sector-and-fund-accounting` | NGO, schools, clinics, retail, agribusiness, hospitality, property, and fintech. |
| `12-public-sector-and-ipsas` | IPSAS, public procurement, donor fiscal compliance, and public-sector overlays. |
| `13-project-and-contract-accounting` | POC/WIP, construction, and professional-services contracts. |
| `14-systems-integration-and-data` | ERP, bank feeds, data contracts, and open banking. |
| `15-security-privacy-and-continuity` | Finance cybersecurity, privacy, business continuity, and disaster recovery. |
| `16-ux-and-presentation` | Finance UI, non-accountant UX, accessibility, mobile, offline, and print fidelity. |
| `17-ai-automation-and-emerging` | RPA, AI governance, digital assets, and carbon accounting. |

Read only the relevant `SKILL.md` files for the task. The generated inventory is available at `docs/router-map.md`.

## Operating routes

### Digital Research

Use `C:\wamp64\www\digital-research-skills` for current or uncertain claims, literature review, source evaluation, due diligence, regulatory research, source freshness, and evidence verification. Historical books and early-release material may provide improvement hypotheses but cannot establish current compliance.

### Design system

When the financial artefact has material visual, UX, typography, layout, accessibility, or presentation requirements, consult `C:\wamp64\www\design-system-skills` in addition to this engine. Accounting content and controls remain here; visual design authority remains with the design engine.

### Consumer engines

The business-plan, proposal, SRS, website, social-media, software-development, and Linux engines route finance scope here. They must not create local finance mirrors or invent accounting, IFRS, IPSAS, tax, statutory, or exchange-rate rules.

## Validation and release

Run the doctrine gate from the repository root:

```powershell
.\tools\validate-doctrine.ps1
```

Run the additional quality checks when applicable:

```powershell
.\scripts\fix-frontmatter-report.ps1 -Strict
.\tests\accounting-invariants\scripts\Test-AccountingInvariants.ps1
.\tools\invoke-doctrine-conformance-scan.ps1 -TargetPath "C:\path\to\target" -OutputPath ".\docs\conformance-scan.md"
```

For release-grade finance output also use:

- `governance/finance-accounting-quality-gate.md`
- `docs/quality-gates/world-class-finance-release-gate.md`
- `governance/anti-slop-finance-output.md`
- the applicable jurisdiction source register under `doctrine/source-register/`
- independent controller, tax, audit, or professional review where required

Release decisions are `pass`, `pass-with-caveats`, or `fail`. A passing validator does not replace professional review or current-source verification.

## Repository map

```text
chwezi-accounting-doctrine/
|-- README.md
|-- doctrine/                         # canonical doctrine, references, source registers, examples
|-- skills/                           # 103 active accounting and finance skills
|-- governance/                       # quality gates, referencing rules, anti-patterns, backlog
|-- docs/                             # router map, source registers, release gates, Kaizen records
|-- examples/                         # reproducible evidence and transaction packs
|-- templates/                        # sector and reporting artefact templates
|-- tests/accounting-invariants/      # machine-readable accounting invariant tests
|-- tools/                            # validation, conformance scan, and maintenance scripts
|-- scripts/                          # repository maintenance and reporting checks
`-- integration/                      # historical mirror tooling and integration records
```

The old mirror model is retired. Consumer engines reference this repository through the canonical routing table; do not copy or mirror doctrine files into them.

## Source and jurisdiction limitations

- The doctrine is not the authoritative text of IFRS, IFRS for SMEs, IPSAS, tax law, or any regulator's rules.
- Authoritative IFRS Foundation text and current effective dates require re-verification before final client output.
- Current Uganda VAT, PAYE, WHT, NSSF, exchange-rate, EFRIS, URA, URSB, and ICPAU claims remain source-register verification targets.
- Country extensions for Kenya, Rwanda, Tanzania, and South Africa are structured overlays, not blanket legal advice.
- Historical books, 2019 material, early-release books, incomplete extractions, and unreadable conversions are labelled and cannot establish current facts.
- No client facts, reviewer names, statutory rates, or regulatory approvals may be fabricated.
- Where evidence is missing, return a qualified result, mark the dimension unassessed, block certification, and state the narrowest safe next step.

Last reviewed: 2026-08-04. Next review due: 2026-11-04.

<!-- design-system-skills:trigger v1 -->
### Design and presentation trigger

Any work affecting typography, colour, layout, grid, visual identity, UI screens, or document presentation must also route to `design-system-skills`. Resolve its path from the global engine-routing table, read its README and doctrine, and load only the relevant skills. Content, accounting structure, and control evidence remain governed by this engine; visual presentation is governed by the design engine.
<!-- /design-system-skills:trigger -->
