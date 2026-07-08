# Research Verification Manifest

Engine: Chwezi Core Systems accounting doctrine  
Research engine: `C:\wamp64\www\digital-research-skills`  
Verifier: Codex builder using Digital Research Skills Engine methodology  
Checked at: 2026-07-08  
Release status: conditional-pass

## Source Registry

| ID | Title | Ref | Tier | Accessed | Verification method | Confidence |
|---|---|---|---:|---|---|---|
| SRC-IFRS-REQ-2026 | IFRS Accounting Standards Required 2026 availability note | https://www.ifrs.org/news-and-events/news/2026/01/now-available-ifrs-accounting-standards-required-2026-two-editions/ | 1 | 2026-07-08 | Official standard-setter page; source-evaluation credibility ladder. | High |
| SRC-IFRS-SMES-3ED | IFRS for SMEs Accounting Standard | https://www.ifrs.org/issued-standards/ifrs-for-smes/ | 1 | 2026-07-08 | Official standard-setter page plus attached book cross-check. | High |
| SRC-IAASB-2025 | IAASB Handbook surface | https://www.iaasb.org/ | 1 | 2026-07-08 | Official standard-setter homepage check. | Medium-high |
| SRC-URA-PAYE | URA PAYE rates page | https://ura.go.ug/en/domestic-taxes/paye-rates/ | 1 | 2026-07-08 | Official revenue-authority page; conflict checked against 2026 parliamentary material. | Medium because conflict watch remains. |
| SRC-URA-EFRIS | URA EFRIS page | https://ura.go.ug/en/efris/ | 1 | 2026-07-08 | Official revenue-authority page. | High |
| SRC-URA-VAT-REGISTERED | URA VAT registered category page | https://ura.go.ug/en/vat-registered-category/ | 1 | 2026-07-08 | Official revenue-authority page; checked against parliamentary 2026 amendment material. | Medium because conflict watch remains. |
| SRC-URA-WHT | URA withholding tax page | https://ura.go.ug/en/witholding-tax/ | 1 | 2026-07-08 | Official revenue-authority page; payment-specific rate table not fully extracted here. | Medium |
| SRC-NSSF-MEMBERSHIP | NSSF Uganda membership page | https://www.nssfug.org/about-us/membership/ | 1 | 2026-07-08 | Official statutory fund page. | High |
| SRC-PARL-VAT-2026 | Parliament of Uganda VAT Amendment Bill / bill tracker / Hansard surface | https://www.parliament.go.ug/ | 1 | 2026-07-08 | Primary parliamentary source search and conflict comparison. | Medium-high pending assented Act/Gazette. |
| SRC-PARL-INCOME-2026 | Parliament of Uganda Income Tax Amendment Bill / bill tracker surface | https://www.parliament.go.ug/ | 1 | 2026-07-08 | Primary parliamentary source search and conflict comparison with URA PAYE page. | Medium pending assented Act/Gazette/URA update. |
| SRC-LST-GAP | Uganda local service tax current schedule | No controlling current official source verified in this pass. | n/a | 2026-07-08 | Gap logged under online-legal-research evidence discipline. | Low; blocked. |

## Claim Registry

| Claim ID | Claim | Source IDs | Status | Confidence | File impact |
|---|---|---|---|---|---|
| CL-IFRS-2026 | IFRS Accounting Standards Required 2026 is the current required edition basis for 2026 annual periods. | SRC-IFRS-REQ-2026 | Accepted | High | `docs/source-registers/ifrs-tax-statutory-2026.md` |
| CL-SMES-2027 | IFRS for SMEs third edition is a 2025 issuance with 2027 effective-date transition relevance. | SRC-IFRS-SMES-3ED | Accepted | High | `docs/source-registers/ifrs-tax-statutory-2026.md`; NGO template caveats |
| CL-NSSF | Uganda NSSF mandatory contribution fixture can use 5% employee and 10% employer when source key is current. | SRC-NSSF-MEMBERSHIP | Accepted | High | `references/uganda-statutory.md` |
| CL-EFRIS | VAT-registered taxpayers require EFRIS evidence for Uganda VAT retail/POS packs. | SRC-URA-EFRIS | Accepted | High | Retail VAT/POS pack |
| CL-PAYE-CONFLICT | URA live PAYE guidance conflicts with 2026 parliamentary amendment material for July 2026 onward payroll treatment. | SRC-URA-PAYE; SRC-PARL-INCOME-2026 | Accepted as conflict | Medium | Source register; Uganda statutory snapshot |
| CL-VAT-THRESHOLD-CONFLICT | Uganda VAT registration threshold is unresolved for final output because URA live guidance, introduced Bill text, and Parliament Hansard point to different amounts. | SRC-URA-VAT-REGISTERED; SRC-PARL-VAT-2026 | Accepted as conflict | Medium | Source register; Uganda statutory snapshot |
| CL-WHT-BLOCK | Generic WHT rate should not be hardcoded; payment-specific source entry is required. | SRC-URA-WHT; SRC-PARL-INCOME-2026 | Accepted | Medium | Source register |
| CL-LST-BLOCK | LST final payroll treatment remains blocked until a current local-government authority schedule is verified. | SRC-LST-GAP | Accepted as gap | Low | Source register; Uganda statutory snapshot |

## Verification Failures and Quarantined Claims

| Item | Reason | Action |
|---|---|---|
| Uganda VAT threshold stated as final UGX 250,000,000 | Parliament Hansard indicates a later UGX 300,000,000 substitution and URA live page still shows UGX 150,000,000. | Quarantined; source register revised to blocked-pending-review. |
| Uganda PAYE July 2026 table stated as final | URA live page conflicts with 2026 amendment material. | Quarantined; source register keeps final payroll blocked pending controlling authority. |
| Uganda LST schedule stated as current | No controlling current local-government source verified in this pass. | Quarantined; final LST use blocked. |

## Release Decision

The upgrade deliverables can ship as doctrine, examples, templates, tests, and research logs. They cannot be used as final Uganda statutory filing or payroll-rate advice unless a named reviewer verifies the controlling primary authority and updates the source-register state.
