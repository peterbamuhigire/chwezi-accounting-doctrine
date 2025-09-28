# Concrete Build Backlog

| # | Filename/path | Purpose | Acceptance criteria | Effort |
| --- | --- | --- | --- | --- |
| 1 | docs/source-registers/ifrs-tax-statutory-2026.md | Create a current-source register for IFRS, Uganda tax, statutory, and sector rules. | Every volatile rule has source URL/path, effective date, checked date, reviewer, and next review. | M |
| 2 | scripts/fix-frontmatter-report.ps1 | Detect missing or weak skill frontmatter. | Validation fails on missing name/description or generic trigger language. | S |
| 3 | examples/journal-packs/retail-vat-pos/ | Add full transaction-to-report worked example. | Includes source event, journal, subledger, controls, reconciliation, FS impact, and audit evidence. | L |
| 4 | tests/accounting-invariants/ | Create machine-readable invariant tests. | Posting balance, reversals, period locks, VAT, FX, and reconciliation examples pass deterministic tests. | L |
| 5 | templates/sector-report-packs/ngo/ | Create sector-specific statutory/management pack templates. | Pack includes reports, controls, notes, close checklist, and evidence index. | M |
