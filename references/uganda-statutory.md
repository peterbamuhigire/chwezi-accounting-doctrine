# Uganda Statutory Reference Snapshot

- Last verified: 2026-10-31 (register keys and states only)
- Next review due: 2026-12-29
- Primary source register: `doctrine/source-register/uganda/` (machine-readable; it wins if this file disagrees)
- Historical record: `docs/source-registers/ifrs-tax-statutory-2026.md` (2026-07-08, not maintained as machine keys)

This file is a human-readable snapshot for engine routing and reviewer awareness. It is not a substitute for the source register, and it carries no value that is not also held by a register entry. Every key below resolves to an entry in the register, and `tools/source_register_integrity.py` fails when a key cited here does not. Final statutory output must consume verified source entries and carry reviewer sign-off; the register state, not this file, decides whether an entry can support final output.

## Current Snapshot

| Topic | Current engine treatment | Source key | Register state at 2026-10-31 |
|---|---|---|---|
| VAT standard rate | URA's VAT page and FY2026-27 VAT guide state 18% for standard-rated supplies, subject to zero-rated, exempt and deemed VAT rules. | `UG-VAT-STANDARD-RATE` | `draft`: blocked for final output until a named reviewer verifies and the page is archived. |
| VAT registration threshold | URA's VAT page and FY2026-27 guide now state UGX 300,000,000 a year and UGX 75,000,000 over three consecutive months. The July 2026 conflict (URA at UGX 150,000,000, introduced Bill at UGX 250,000,000, Hansard at UGX 300,000,000) is resolved on the URA side only; the amending Act, its commencement date and the gazette were not located. | `UG-VAT-REG-THRESHOLD` | `draft`: blocked for final use. |
| PAYE | URA's PAYE page and 2026 return-change notice give a revised resident schedule from 2026-07-01. The register holds the schedule and the superseded earlier one; use the entry, not a remembered table. | `UG-PAYE-RATES`, `UG-PAYE-RATES-THROUGH-2026-06-30` | Current entry `draft`: blocked for final payroll. Earlier entry `superseded`: not for periods from 2026-07-01. |
| NSSF | 5% employee deduction plus 10% employer contribution, total 15%; remit by the 15th day of the following month. | `UG-NSSF-MEMBERSHIP-CONTRIBUTIONS` | `verified-current` for that scope only. The entry records a page recheck rather than a named reviewer; confirm the reviewer before final payroll use (open item in the pass-2 kaizen next-cycle file). |
| WHT | Payment-specific; no generic WHT rate may be hardcoded. | `UG-WHT-RATES` | `draft`: blocked unless a payment-specific verified entry exists. |
| LST | Municipality and local-government administered; the applicable schedule and calculation base are not established. | `UG-LST-RATES` | `draft`: blocked for final payroll. |
| EFRIS | VAT-registered taxpayers must enrol; the current handbook version and technical scope are not reconciled. | `UG-EFRIS-HANDBOOK-FY2026-27`, `UG-EFRIS-HANDBOOK-2024-25` | `draft`: blocked until integration evidence and review exist. |

## Engine Controls

- Do not hardcode Uganda statutory rates in `SKILL.md` logic, templates, examples, or tests without a source key.
- Treat PAYE, WHT, VAT threshold, LST, return templates, EFRIS schemas, and exchange rates as volatile.
- Treat NSSF contribution rates as current only while `UG-NSSF-MEMBERSHIP-CONTRIBUTIONS` remains within its recheck date and its reviewer is named.
- Use examples with explicit fixture assumptions; never promote fixture assumptions into client facts.
- If a source has a conflict watch, show the caveat in the output and route to the tax reviewer.

## Reverification Triggers

- Uganda Finance Act, Tax Amendment Act, statutory instrument, Gazette, URA handbook, URA return-template update, NSSF Act/regulation update, EFRIS implementation notice, local-government LST schedule update, or source-register recheck date.
