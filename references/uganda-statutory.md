# Uganda Statutory Reference Snapshot

Last verified: 2026-07-08  
Next review due: 2026-08-08  
Primary source register: `docs/source-registers/ifrs-tax-statutory-2026.md`  
Machine-readable country pack: `doctrine/source-register/uganda/`

This file is a human-readable snapshot for engine routing and reviewer awareness. It is not a substitute for the source register. Final statutory output must consume verified source entries and carry reviewer sign-off.

## Current Snapshot

| Topic | Current engine treatment | Source key | Release state |
|---|---|---|---|
| VAT standard rate | 18% for standard-rated taxable supplies, subject to zero-rated, exempt, and deemed VAT rules. | `UG-VAT-STANDARD-RATE` | Usable with reviewer sign-off and July 2026 Act check. |
| VAT registration threshold | Live URA guidance still shows UGX 150,000,000; the introduced 2026 Bill shows UGX 250,000,000; Parliament Hansard records passage with a UGX 300,000,000 amendment. | `UG-VAT-REG-THRESHOLD` | Block final threshold use pending assented Act/Gazette or updated URA guidance. |
| PAYE | URA live page and 2026 bill material conflict for July 2026 onward treatment. | `UG-PAYE-URA-LIVE`, `UG-PAYE-2026-AMENDMENT` | Block final payroll rate tables pending reviewer confirmation. |
| NSSF | 5% employee deduction plus 10% employer contribution, total 15%; remit by 15th day of following month. | `UG-NSSF-MANDATORY` | Usable with reviewer sign-off. |
| WHT | Payment-specific; no generic WHT rate may be hardcoded. | `UG-WHT-GENERAL` | Block final rate use unless payment-specific verified entry exists. |
| LST | Municipality/local-government administered; current schedule requires local authority verification. | `UG-LST` | Block final payroll use pending local authority confirmation. |
| EFRIS | VAT-registered taxpayers must enroll; EFRIS supports EFD, e-invoicing, or direct system communication. | `UG-EFRIS` | Usable with reviewer sign-off and current integration evidence. |

## Engine Controls

- Do not hardcode Uganda statutory rates in `SKILL.md` logic, templates, examples, or tests without a source key.
- Treat PAYE, WHT, VAT threshold, LST, return templates, EFRIS schemas, and exchange rates as volatile.
- Treat NSSF contribution rates as current only while `UG-NSSF-MANDATORY` remains within review date.
- Use examples with explicit fixture assumptions; never promote fixture assumptions into client facts.
- If a source has a conflict watch, show the caveat in the output and route to the tax reviewer.

## Reverification Triggers

- Uganda Finance Act, Tax Amendment Act, statutory instrument, Gazette, URA handbook, URA return-template update, NSSF Act/regulation update, EFRIS implementation notice, local-government LST schedule update, or source-register recheck date.
