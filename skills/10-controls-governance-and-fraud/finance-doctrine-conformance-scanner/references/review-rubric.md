# Review Rubric

## Review Lanes

| Lane | What to inspect | Primary doctrine |
|---|---|---|
| Ledger integrity | Posting service, journal writes, reversals, period locks, idempotency, audit trail | `skills/01-foundations/ledger-posting-engine-core/SKILL.md` |
| Master data | CoA, dimensions, customer/supplier/account setup, normal balances, control accounts | `skills/01-foundations/chart-of-accounts-design-and-governance/SKILL.md` |
| Statutory values | VAT, PAYE, WHT, NSSF, fiscal devices, tax returns, exchange rates | `skills/08-tax-and-statutory/tax-statutory-source-register-and-country-packs/SKILL.md` |
| Subledgers | AR, AP, inventory, fixed assets, payroll, POS, cash, staff claims, bank feeds | Relevant subledger skills under `skills/04-*` and `skills/05-*` |
| Reporting | Financial statements, IAS 7 cash flows, disclosures, going concern, audit PBC | `skills/07-financial-statements-and-disclosures/*` |
| Controls | Segregation of duties, approvals, fraud analytics, AML/KYC, whistleblowing, ICFR | `skills/10-controls-governance-and-fraud/*` |
| Sector fit | NGO, school, clinic, retail, agribusiness, hospitality, real estate, fintech | `skills/11-sector-and-fund-accounting/*` |
| Systems and data | ERP integration, payment gateway, warehouse, open banking, data contracts | `skills/14-systems-integration-and-data/*` |
| Security and continuity | Privacy, retention, cyber controls, BCP/DR, payment privilege | `skills/15-security-privacy-and-continuity/*` |
| UX and output quality | Non-accountant UX, accessibility, mobile/offline, print fidelity | `skills/16-ux-and-presentation/*` |
| AI and automation | AI judgement controls, RPA identity, digital assets, emissions accounting | `skills/17-ai-automation-and-emerging/*` |
| Proposals and prose | Source discipline, caveats, deliverability, financial logic, evidence claims | `doctrine/accounting-finance-doctrine.md` plus relevant domain skills |

## Severity Rules

| Severity | Use when | Required response |
|---|---|---|
| Critical | The artefact can mispost, delete evidence, bypass locks, misstate statements, or release unsupported statutory values. | Block release; fix before use. |
| High | The artefact lacks review routing, source-register support, SoD, control-account tie-out, audit evidence, or high-risk disclosure support. | Fix before external/client release. |
| Medium | The artefact is usable internally but missing workflow completeness, exceptions, traceability, accessibility, offline resilience, or management-reporting support. | Add to sprint or proposal revision. |
| Low | Clarity, naming, documentation, or formatting issue that does not change accounting outcome. | Fix opportunistically. |

## Manual Review Tests

1. Can every financial figure, rate, date, and compliance claim be traced to a source?
2. Can every posted amount drill from report line to account, journal, source document, evidence file, and audit log?
3. Are facts, assumptions, estimates, inferences, and recommendations separated?
4. Does the artefact identify the reporting framework and jurisdiction?
5. Are statutory values blocked unless verified-current in the source register?
6. Are period locks, reversals, voids, reopen approvals, and immutable evidence preserved?
7. Are control accounts reconciled to their subledgers?
8. Are approval limits, SoD conflicts, overrides, and exceptions visible?
9. Are AI or automation outputs prevented from final accounting approval without human review?
10. Does the proposed implementation produce evidence an auditor or reviewer can actually use?

Last reviewed: 2026-05-25.
