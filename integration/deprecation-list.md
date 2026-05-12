# Deprecation List

Items deprecated by the v1.0.0 doctrine adoption. Each entry: deprecated item, reason, replacement, deprecation date, removal date.

| # | Item | Reason | Replacement | Deprecated | Remove by |
|---|---|---|---|---|---|
| 1 | LIFO inventory option in any IFRS / IFRS-for-SMEs context | Not permitted under either framework. | FIFO or weighted average. Legacy LIFO data preserved for historical reporting only. | 2026-05-12 | Next MAJOR — earliest 2027-05-12. |
| 2 | Hardcoded tax / payroll / statutory / FX values in final artefacts | Stale facts ship; statutory risk. | Source-register entry plus verified-current marker. | 2026-05-12 | Next MINOR. |
| 3 | US GAAP defaults | Not the default for East / Central Africa clients. | IFRS for SMEs default; full IFRS overlay; US GAAP only as explicit overlay. | 2026-05-12 | Immediate (not a removal but a re-classification). |
| 4 | Vendor-replacement proposal language without caveats | Overpromises accounting readiness. | Required caveats and acceptance-criteria blocks. | 2026-05-12 | Immediate. |
| 5 | Direct `journal_lines` insert / update / delete outside posting services | Breaks ledger integrity. | Approved posting service. | 2026-05-12 | Immediate. |
| 6 | Free-text status fields on finance records | Breaks status taxonomy. | Controlled status taxonomy. | 2026-05-12 | Next MINOR. |
| 7 | Reports without print stylesheets | Breaks print fidelity required by audits. | Print stylesheet per `print-fidelity.md`. | 2026-05-12 | Next MINOR. |
| 8 | `Delete` / `Remove` verb on posted accounting records | Breaks immutability. | `Reverse` verb with linked correction. | 2026-05-12 | Immediate. |
| 9 | Single-density UI across all roles | Confuses workflow vs ledger surfaces. | Two surface modes per `design-system-finance-accounting.md`. | 2026-05-12 | Next MINOR. |
| 10 | Compliance disclosures rendered as disconnected modal dumps | UX anti-pattern. | Disclosures rendered inline at the relevant field. | 2026-05-12 | Next MINOR. |
| 11 | Dashboards displaying summary numbers without drilldown | Hides audit trail. | Required drilldown affordance. | 2026-05-12 | Next MINOR. |
| 12 | Country-context rate values shipped as permanent facts | Statutory risk. | Source-register-referenced verification-gated values. | 2026-05-12 | Immediate (mark current values as `draft` until verified). |

A MINOR removal lasts at least one MINOR cycle before final removal. A MAJOR removal is announced one cycle in advance.

Last reviewed: 2026-05-12. Next review due: 2026-11-12.
