# IFRS, Uganda Tax, Statutory, and Sector Source Register 2026

Engine: Chwezi Core Systems accounting doctrine  
Register version: 2026-07-08  
Last verified: 2026-07-08  
Next review due: 2026-08-08 for Uganda statutory entries; 2026-12-31 for non-volatile standards entries  
Reviewer of this register: Builder verification pass; named human reviewer required before client statutory release  

This register is the root-level source map for standards and statutory facts used by Chwezi finance outputs. Final statutory output must still consume machine-readable entries from `doctrine/source-register/` or a release snapshot derived from this file. If a source conflict exists, the controlling rule is: block final values, state the conflict, and route to a named reviewer.

## Usage States

| State | Meaning | Final-output use |
|---|---|---|
| `verified-current` | Official or primary source checked and no conflicting official source was found in this pass. | Allowed with reviewer sign-off. |
| `verified-current-with-conflict-watch` | A current official source exists, but a newer official bill/Act/handbook source may change treatment or effective date. | Allowed only where the conflict does not affect the output; otherwise block. |
| `blocked-pending-review` | Current source could not be confirmed to final statutory standard, or live sources conflict. | Not allowed for final output. |
| `secondary-corroboration` | Professional-firm or institutional source used to interpret or corroborate official material. | Cannot override official source. |

## Standards Register

| Source key | Standard or surface | Current implementation basis | Source URL or local book | Effective date / edition | Checked date | Reviewer | Next review | State | Engine use |
|---|---|---|---|---|---|---|---|---|---|
| IFRS-REQ-2026 | IFRS Accounting Standards Required 2026 | IFRS Foundation required edition for annual periods beginning on or after 2026-01-01. Includes amendments effective 2026-01-01; IFRS 18 remains transition watch for 2027. | https://www.ifrs.org/news-and-events/news/2026/01/now-available-ifrs-accounting-standards-required-2026-two-editions/ | Required at 2026-01-01 | 2026-07-08 | Accounting standards reviewer pending | 2026-12-31 | `verified-current` | Full IFRS overlays, accounting-policy choices, transition watch. |
| IFRS-SMES-2025-3ED | IFRS for SMEs Accounting Standard, third edition | Third edition issued February 2025, effective for periods beginning on or after 2027-01-01; early adoption permitted; 2015 edition remains usable until effective date. | https://www.ifrs.org/issued-standards/ifrs-for-smes/ and local book `IFRS for SMEs - Accounting Standard 3ed.md` | Issued 2025-02; effective 2027-01-01 | 2026-07-08 | SME reporting reviewer pending | 2026-12-31 | `verified-current` | SME framework default, transition notes, disclosure templates. |
| IAASB-HANDBOOK-2025 | IAASB Handbook | IAASB homepage identifies the 2025 Handbook as the current edition; attached book remains 2023-2024 and is used for audit evidence doctrine until replaced. | https://www.iaasb.org/ and local book `IAASB - Handbook ... 2023-2024.md` | 2025 edition current per IAASB homepage | 2026-07-08 | Assurance reviewer pending | 2026-12-31 | `verified-current-with-conflict-watch` | Audit evidence, ISQM, assurance pack checklists. |
| COSO-ICIF | COSO Internal Control - Integrated Framework | Control environment, risk assessment, control activities, information and communication, monitoring activities. | Local book `COSO - Internal Control Integrated Framework.md` | 2013 framework text in attached material | 2026-07-08 | Controls reviewer pending | 2026-12-31 | `verified-current` | Internal controls library, release gates, evidence criteria. |

## Uganda Statutory Register

| Source key | Surface | Current rule captured | Official source | Effective date / period | Checked date | Reviewer | Next review | State | Engine rule |
|---|---|---|---|---|---|---|---|---|---|
| UG-VAT-STANDARD-RATE | VAT standard rate | Standard VAT rate remains 18% for taxable supplies, subject to exempt/zero-rated/deemed VAT rules. | URA Tax Amendments FY 2024-25 PDF and URA VAT materials; corroborated by professional summaries where needed. | Current at check date; 2026 VAT amendments affect threshold and selected treatments, not standard rate in sources reviewed. | 2026-07-08 | Uganda tax reviewer pending | 2026-08-08 | `verified-current-with-conflict-watch` | Use 18% only with source key; re-check 2026 Finance Act/URA handbook before final filings. |
| UG-VAT-REG-THRESHOLD | VAT registration threshold | URA's live VAT registered category page still states UGX 150,000,000. The Parliament bill tracker and introduced Bill show UGX 250,000,000. Parliament's 21 April 2026 Hansard records the Committee of the Whole substituting UGX 300,000,000 and passing the Value Added Tax (Amendment) Bill, 2026 with amendments. | URA VAT registered category page; Parliament Bill Tracker for Value Added Tax (Amendment) Bill, 2026; Parliament Hansard, 21 April 2026. | Bill commencement states 2026-07-01; final operational threshold blocked pending assented Act/Gazette or URA update. | 2026-07-08 | Uganda tax reviewer pending | 2026-08-08 | `blocked-pending-review` | Do not use any VAT registration threshold in final output until the assented Act/Gazette or URA current guidance confirms whether UGX 300,000,000 controls for the relevant period. |
| UG-PAYE-URA-LIVE | PAYE resident and non-resident monthly bands | URA live PAYE page states resident monthly bands: nil up to UGX 235,000; 10% on 235,000-335,000; 20% plus UGX 10,000 on 335,000-410,000; 30% plus UGX 25,000 on 410,000-10,000,000; additional 10% above UGX 10,000,000. | https://ura.go.ug/en/domestic-taxes/paye-rates/ | Live page checked 2026-07-08 | 2026-07-08 | Uganda payroll tax reviewer pending | 2026-08-08 | `verified-current-with-conflict-watch` | Allowed for draft examples and existing-system comparison; final July 2026+ payroll requires conflict resolution below. |
| UG-PAYE-2026-AMENDMENT | PAYE revised annual resident bands | 2026 Income Tax Amendment Bill text shows revised annual bands: nil up to UGX 4,020,000; 20% to UGX 4,920,000; 25% to UGX 5,820,000; 30% to UGX 120,000,000; additional 10% above UGX 120,000,000, commencing 2026-07-01. | Parliament/Gazette bill text for Income Tax (Amendment) Bill, 2026. | Bill says 2026-07-01 commencement. | 2026-07-08 | Uganda payroll tax reviewer pending | 2026-08-08 | `blocked-pending-review` | Do not finalize payroll outputs until assented Act or URA post-budget handbook confirms live treatment. |
| UG-NSSF-MANDATORY | NSSF mandatory contributions | Employer deducts 5% from employee gross monthly wage and adds 10% employer contribution; total 15%; payment due by the 15th day of the following month. | https://www.nssfug.org/about-us/membership/ | Current at check date. | 2026-07-08 | Payroll reviewer pending | 2026-08-08 | `verified-current` | Payroll fixtures may use 5% employee and 10% employer when source key is present. |
| UG-WHT-GENERAL | Withholding tax surface | WHT is deducted at source and remitted to URA; rate depends on payment nature and legal status. 2026 bill introduces or revises selected WHT rates including 5%, 6%, 10%, and 15% categories. | https://ura.go.ug/en/witholding-tax/ and Parliament Income Tax (Amendment) Bill, 2026 PDF. | Mixed current/live and 2026 amendment surfaces. | 2026-07-08 | Uganda tax reviewer pending | 2026-08-08 | `blocked-pending-review` | Never hardcode a generic WHT rate; require payment-specific source entry. |
| UG-LST | Local Service Tax | LST is local-government administered; common official local-government/KCCA guidance shows annual bands up to UGX 100,000 for employment income above UGX 1,000,000 monthly and deduction within the first four months of the financial year. | KCCA Local Service Tax FAQ PDF and local-government guidance; URA is not the primary LST authority. | Current authority not fully verified in this pass. | 2026-07-08 | Uganda local-government tax reviewer pending | 2026-08-08 | `blocked-pending-review` | Payroll templates must ask for municipality-specific/current LST schedule before final use. |
| UG-EFRIS | EFRIS e-invoicing/fiscal receipting | EFRIS is Electronic Fiscal Receipting and Invoicing Solution using EFDs, e-invoicing, or direct system communication. VAT-registered taxpayers must enroll. | https://ura.go.ug/en/efris/ | Live page checked 2026-07-08 | 2026-07-08 | Uganda tax systems reviewer pending | 2026-08-08 | `verified-current` | Retail POS and VAT packs must include EFRIS evidence for VAT-registered entities. |

## Sector and Report-Pack Register

| Source key | Sector/use | Source basis | Checked date | State | Engine use |
|---|---|---|---|---|---|
| NGO-UG-PATTERNS | Uganda NGO and donor reporting | Existing doctrine `doctrine/references/uganda-ngo-financial-management-patterns.md`; ACCA NFP budget/variance concepts; Management Accounting budget and variance concepts. | 2026-07-08 | `verified-current-with-conflict-watch` | NGO sector report pack template; donor restriction and variance reporting. |
| RETAIL-POS-CONTROLS | Retail POS accounting and controls | Existing `retail-and-pos-accounting-pack`; COSO control components; banking/payments value-chain book; URA EFRIS/VAT surfaces. | 2026-07-08 | `verified-current-with-conflict-watch` | Retail VAT/POS journal pack, invariant tests, evidence pack exemplar. |

## Release Rules

1. Final statutory output must cite a source key from this file and a corresponding machine-readable source entry where one exists.
2. `blocked-pending-review` keys cannot be used in final client or production output.
3. When URA live guidance and 2026 amendment materials conflict, the final output must be blocked until the Gazette/assented Act/URA post-budget handbook is reviewed.
4. Source values must appear in examples only as illustrative values tied to source keys, not as permanent constants embedded in skill logic.
5. Every final pack must include: source key, source URL or archive path, checked date, reviewer, next review date, and caveat state.
