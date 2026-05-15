# Auditor Export Format

The auditor export is an immutable period bundle. It supports external audit, internal review, and management pack release evidence.

## Folder naming

```text
audit-export-<entity-slug>-<YYYY-MM>/
```

Use lowercase entity slugs with hyphens. The period is the accounting period, not the export date.

## Required root files

| File | Format | Purpose |
|---|---|---|
| `00-index.md` | Markdown | Human-readable navigation index. |
| `manifest.yaml` | YAML | Export metadata, hashes, sign-off, release state. |
| `15-audit-log.csv` | CSV | Audit-log extract for the period and pack actions. |
| `quality-gate-manifest.yaml` | YAML | Gate result, blockers, caveats, waivers. |

## Standard directories

| Directory | Required contents |
|---|---|
| `01-trial-balance.csv` | Account, opening, debit movement, credit movement, closing, dimensions where applicable. |
| `02-gl-detail.csv` | Journal-line detail for every account in the period. |
| `03-journal-listing.csv` | Journal header, status, source, preparer, reviewer. |
| `04-financial-statements.pdf` | Searchable PDF with print header, footer, and sign-off boxes. |
| `05-ar-detail/` | AR ageing, open items, allowance support. |
| `06-ap-detail/` | AP ageing, supplier balances, WHT support where applicable. |
| `07-inventory/` | Valuation, movement, count variance, NRV support. |
| `08-fixed-assets/` | Register, depreciation, additions, disposals. |
| `09-payroll/` | Payroll register-to-GL tie-out and statutory schedules. |
| `10-reconciliations/` | Bank, mobile money, POS, card, petty cash evidence packs. |
| `11-tax/` | VAT, PAYE, WHT, NSSF, income-tax schedules. |
| `12-management-accounts.pdf` | Management pack with variance commentary. |
| `13-donor-grants/` | Grant utilisation and restriction evidence where applicable. |
| `14-source-documents/` | Invoices, receipts, statements, signed schedules, extracts. |

## `manifest.yaml` schema

```yaml
entity: "Chwezi Demo Ltd"
period: "2026-05"
framework: "IFRS for SMEs"
book: "tax"
release_state: "pass"
generated_at: "2026-06-05T12:30:00+03:00"
prepared_by: "Accountant Name"
reviewed_by: "Controller Name"
approved_by: ""
quality_gate_state: "pass"
files:
  - path: "01-trial-balance.csv"
    sha256: "<hash>"
    row_count: 120
caveats: []
```

## CSV conventions

- UTF-8, comma-delimited, header row required.
- Dates use `YYYY-MM-DD`.
- Datetimes use ISO 8601 with offset.
- Money columns are decimal numbers without currency symbols.
- Currency is a separate ISO 4217 column.
- Empty optional fields are blank, not `NULL`.

## Rejection conditions

- Missing index or manifest.
- PDF report is image-only.
- File hash missing for any exported file.
- Released pack has mutable files after sign-off.
- Ledger totals in the export do not tie to the released trial balance.

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
