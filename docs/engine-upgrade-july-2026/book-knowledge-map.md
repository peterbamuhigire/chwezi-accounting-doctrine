# Book to Engine Knowledge Map

Upgrade date: 2026-07-08  
Engine: Chwezi Core Systems accounting doctrine

This map records how the attached books informed production engine files. The upgrade uses the books as doctrine inputs, not as copied text. Each concept below is compressed into routing rules, acceptance criteria, templates, tests, source registers, or examples.

| Book | Key concepts extracted | Gaps/backlog informed | Engine files informed | How the knowledge was operationalised |
|---|---|---|---|---|
| ACCA - Financial Reporting - June 2025 | Materiality; faithful representation; going concern; PPE and intangible recognition; revenue and government grant teaching examples; NFP budget and variance emphasis; cash-flow usefulness. | Richness; World-Class Output Capability; worked examples for statements and sector reporting. | `examples/journal-packs/retail-vat-pos/README.md`; `templates/sector-report-packs/ngo/ngo-monthly-report-pack-template.md`; `docs/world-class-exemplars/retail-vat-pos-pack.md`. | Added materiality and faithful-representation checks to pack acceptance criteria; required source-to-report drilldown; added NGO budget-vs-actual and donor variance sections. |
| COSO - Internal Control Integrated Framework | Five control components: control environment, risk assessment, control activities, information and communication, monitoring; persuasive evidence; documentation discipline; variance investigation as a control activity. | Robustness; quality gates; common mistakes; evidence packs. | `docs/quality-gates/world-class-finance-release-gate.md`; `examples/journal-packs/retail-vat-pos/README.md`; `templates/sector-report-packs/ngo/ngo-monthly-report-pack-template.md`. | Converted COSO components into finance pack control assertions, maker-checker evidence, exception owner fields, monitoring cadence, and variance-investigation gates. |
| F7-SampleNotes2025 | Compact teaching structure for IFRS 15, IAS 16, IFRS 9, going concern, and framework definitions. | Richness; ambiguity handling; beginner-to-edge-case examples. | `docs/world-class-exemplars/retail-vat-pos-pack.md`; `tests/accounting-invariants/README.md`. | Used as a compression model: every example states framework, recognition trigger, posting result, and review caveat in plain language before technical detail. |
| Finance Department - The Umbrex Diagnostic Guide | Finance operations diagnostic scoring; data request lists; budgeting, treasury, controls, compliance oversight, audit process maturity. | Full-workflow orchestration; templates; release checklist. | `templates/sector-report-packs/ngo/ngo-monthly-report-pack-template.md`; `docs/quality-gates/world-class-finance-release-gate.md`; `FINAL-UPGRADE-REPORT.md`. | Turned diagnostic maturity ideas into intake fields, evidence index, issue register, and pass/fail pack-release criteria. |
| How the Banking & Financial Services Industry Works | Payment value chains, fintech/payment economics, settlement, chargebacks, float, compliance, cybersecurity, fraud monitoring. | Retail POS example; bank/mobile-money reconciliation edge cases; fintech sector awareness. | `examples/journal-packs/retail-vat-pos/README.md`; `tests/accounting-invariants/fixtures/retail-vat-pos.fixture.json`. | Added tender split, card/mobile-money settlement, fees, chargeback/refund, clearing account, and reconciliation ageing requirements. |
| IAASB Handbook 2023-2024 | Audit evidence sufficiency and appropriateness; materiality and aggregation risk; risk assessment; ISA 500/501/520/560/570 concepts; ISQM quality management components. | Robustness; evidence packs; QA checklists; final release gates. | `docs/quality-gates/world-class-finance-release-gate.md`; `examples/journal-packs/retail-vat-pos/README.md`; `docs/world-class-exemplars/retail-vat-pos-pack.md`. | Encoded evidence sufficiency, source reliability, sampling, subsequent-event/going-concern flags, and reviewer sign-off into acceptance criteria. |
| IFRS for SMEs - Accounting Standard 3ed | SME scope/public accountability; materiality; going concern; revised Section 23 revenue; financial instruments; fewer disclosures; plain-English drafting; effective date transition to third edition. | Currency & Compliance; SME default; disclosure templates; source register. | `docs/source-registers/ifrs-tax-statutory-2026.md`; `templates/sector-report-packs/ngo/ngo-monthly-report-pack-template.md`; `references/uganda-statutory.md`. | Added SME framework selection, 2025 third-edition transition caveat, plain-English policy note expectations, and disclosure pack references. |
| Management Accounting - Kaplan, Atkinson, Matsumura, Young, 6th ed. | Balanced scorecard; strategy maps; activity-based costing; variance analysis; budgeting and continuous budgeting; management accounting and control systems; behavioral risks in budgeting. | Composability & Reuse; NGO pack; management reporting examples; FP&A quality. | `templates/sector-report-packs/ngo/ngo-monthly-report-pack-template.md`; `docs/world-class-exemplars/retail-vat-pos-pack.md`. | Added driver-based NGO reporting, activity/donor dimensions, budget-vs-actual variance narrative, nonfinancial KPI section, and controllability caveats. |

## Running Example Thread

The upgraded engine uses one running example across source register, journal pack, invariant tests, and exemplar output:

**Chwezi Retail Uganda Ltd**, a VAT-registered Uganda retailer using IFRS for SMEs, runs Store KLA-01 with POS, cash drawer, card settlement, mobile-money settlement, inventory, EFRIS, and monthly controller review. The June 2026 day-end pack includes VAT-inclusive sales, split tender, settlement fees, a refund, stock movement, cash variance, and a source-register caveat for statutory rates.

This running example appears in:

- `examples/journal-packs/retail-vat-pos/README.md`
- `tests/accounting-invariants/fixtures/retail-vat-pos.fixture.json`
- `docs/world-class-exemplars/retail-vat-pos-pack.md`
- `docs/source-registers/ifrs-tax-statutory-2026.md`

Last verified: 2026-07-08. Revisit this map when books are replaced by newer editions or when new deliverable families are added.
