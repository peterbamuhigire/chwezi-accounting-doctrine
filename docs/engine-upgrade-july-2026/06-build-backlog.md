# Concrete Build Backlog

| # | Filename/path | Purpose | Acceptance criteria | Effort |
| --- | --- | --- | --- | --- |
| 1 | [DONE 2026-07-08] docs/source-registers/ifrs-tax-statutory-2026.md | Created current-source register for IFRS, IFRS for SMEs, IAASB, Uganda tax/statutory, NGO, and retail/POS rules, with conflict states for July 2026 Uganda statutory changes. | Every volatile rule has source URL/path, effective date or caveat, checked date, reviewer route, next review, and usage state. | M |
| 2 | [DONE 2026-07-08] scripts/fix-frontmatter-report.ps1 | Added strict frontmatter validator with JSON output, optional repair mode, folded-YAML support, and weak-description detection. | Strict validation passes across 102 skill files. | S |
| 3 | [DONE 2026-07-08] examples/journal-packs/retail-vat-pos/ | Added full Chwezi Retail Uganda Ltd transaction-to-report worked example. | Includes source event, VAT split, journals, subledger controls, reconciliation, FS impact, audit evidence, edge cases, and sign-off. | L |
| 4 | [DONE 2026-07-08] tests/accounting-invariants/ | Added machine-readable retail VAT/POS fixture plus deterministic invariant runner. | Posting balance, VAT, period locks, source-register, evidence, idempotency, negative fixtures, and clearing examples pass deterministic tests. | L |
| 5 | [DONE 2026-07-08] templates/sector-report-packs/ngo/ | Added production NGO monthly finance and donor report pack template. | Pack includes reports, controls, statutory status, notes, close checklist, issue register, evidence index, and sign-off. | M |
