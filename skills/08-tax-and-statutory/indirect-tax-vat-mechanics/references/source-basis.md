# Source Basis - Indirect Tax VAT Mechanics

This reference records the source discipline for the skill. It does not reproduce proprietary standard text and does not override the full standard, law, regulator guidance, contract, or reviewer judgement.

## Evidence Discipline

- Numeric statutory values, tax rates, exchange rates, thresholds, penalties, and filing dates must come from verified-current source-register entries.
- IFRS, IAS, IPSAS, ISSB, AML, cybersecurity, accessibility, and professional-ethics claims must be checked against the named source before client release.
- If a source cannot be opened or a claim cannot be traced, mark a gap and block final output.
- External URLs listed here should be archived before client-facing publication; this local closure pass records the canonical source location but does not claim an archive snapshot.

## Source Register

| ID | Source | Tier | Canonical location | Use in this skill |
|---|---|---|---|---|
| INT-DOCTRINE | Chwezi accounting and finance doctrine | 1 - internal canonical doctrine | doctrine/accounting-finance-doctrine.md | Policy hierarchy, evidence discipline, ledger boundaries, and reviewer routing. |
| INT-LEDGER | Chwezi ledger invariants | 1 - internal canonical doctrine | doctrine/references/ledger-invariants.md | Posting invariants, immutability, source evidence, reversals, and drilldown. |
| SOURCE-REGISTER | Chwezi source-register framework | 1 - internal source-control register | doctrine/source-register/README.md | Country statutory values must be pulled from verified-current source-register entries before release. |
| URA-EFRIS | Uganda Revenue Authority - EFRIS Handbook 2024/25 | 1 - official tax authority | https://ura.go.ug/storage/2025/01/THE-EFRIS-HANDBOOK-2024-25-2.pdf | Uganda fiscal-document and e-invoicing source seed; verify current source-register status before final output. |
| OECD-TP | OECD Transfer Pricing Guidelines for Multinational Enterprises and Tax Administrations 2022 | 1 - international organisation | https://www.oecd.org/en/publications/oecd-transfer-pricing-guidelines-for-multinational-enterprises-and-tax-administrations-2022_0e655865-en | Transfer-pricing documentation, related-party pricing evidence, and comparability analysis where local law points to OECD-style methods. |

## Source-Tier Verdict

The source set is sufficient for doctrine design because it uses internal canonical doctrine plus official standard-setter, regulator, professional-body, or government sources where the skill depends on external authority. It is not sufficient for client-specific statutory output until the relevant country source-register entry is verified-current on the engagement date.

Last reviewed: 2026-05-25.
