# Gap Register

Every gap identified in this assessment is listed below with severity, rationale, and the stub skill that now scaffolds it. Severity scale:

## Closure Status

Closure pass completed: 2026-05-25.

All 76 gap-stub skills listed below have been converted from draft stubs to active doctrine skills. Each closed skill now has:

- a full `SKILL.md` body with workflow, decision rules, acceptance evidence, anti-patterns, files, and review metadata;
- `references/source-basis.md`;
- `references/implementation-rules.md`;
- `examples/worked-example.md`;
- `status: active` in frontmatter.

The closure is a doctrine-content closure, not a substitute for client-specific reviewer sign-off. Statutory values, tax rates, exchange rates, local-law conclusions, actuarial conclusions, and material accounting judgements remain blocked unless supported by verified-current source-register entries and named reviewer approval.

| Severity | Meaning |
|---|---|
| **critical** | Doctrine cannot honestly support typical client engagements without it; a consumer engine will hit it on the happy path. |
| **high** | Doctrine cannot support common client engagements without it; engine will hit it on the second or third real client. |
| **medium** | Doctrine should cover it for credibility; engines occasionally hit it. |
| **emerging** | Pressure is rising (regulatory, market, or technological); doctrine should not be silent. |

## 01 - Foundations

| Gap | Severity | Why it matters | Stub |
|---|---|---|---|
| CoA design and governance | critical | CoA is the doctrine spine; the existing reference is structural-only, no design playbook. | `skills/01-foundations/chart-of-accounts-design-and-governance/` |
| Functional and presentation currency | high | Multi-currency entities cannot be served honestly without IAS 21 / Section 30 doctrine. | `skills/01-foundations/functional-and-presentation-currency/` |
| Period locking and data immutability | high | Cited in invariants but no doctrine for the state machine itself. | `skills/01-foundations/period-locking-and-data-immutability/` |

## 02 - IFRS core standards (high-frequency)

| Gap | Severity | Why it matters | Stub |
|---|---|---|---|
| IAS 16 Property, plant and equipment | critical | `fixed-assets-and-depreciation` is operational; IAS 16 recognition/measurement is separate. | `skills/02-ifrs-core-standards/ifrs-property-plant-equipment-ias16/` |
| IAS 38 Intangible assets | critical | Not covered at all today. Software, brands, development costs are routine. | `skills/02-ifrs-core-standards/ifrs-intangible-assets-ias38/` |
| IAS 19 Employee benefits | high | Payroll EA pack covers postings; defined-benefit, leave provision, termination benefits are separate. | `skills/02-ifrs-core-standards/ifrs-employee-benefits-ias19/` |
| IAS 23 Borrowing costs | high | Common SME issue with construction or qualifying assets. | `skills/02-ifrs-core-standards/ifrs-borrowing-costs-ias23/` |
| IAS 21 Foreign currency translation | critical | Any client with USD bank account hits this immediately. | `skills/02-ifrs-core-standards/ifrs-foreign-currency-translation-ias21/` |

## 03 - IFRS specialised standards

| Gap | Severity | Why it matters | Stub |
|---|---|---|---|
| IFRS 3 Business combinations | high | Pairs with consolidation-and-intercompany; acquisition accounting is not in present scope. | `ifrs-business-combinations-ifrs3` |
| IAS 40 Investment property | high | Common in EA real estate. | `ifrs-investment-property-ias40` |
| IAS 28 / IFRS 11 Associates and joint arrangements | high | Equity method and JV accounting absent. | `ifrs-associates-and-joint-arrangements` |
| IFRS 13 Fair value measurement | critical | Referenced by many other standards (IAS 16 revaluation, IFRS 9, IAS 40, IFRS 3). Cannot be silent. | `ifrs-fair-value-measurement-ifrs13` |
| IFRS 2 Share-based payment | medium | Common in growing entities issuing options. | `ifrs-share-based-payment-ifrs2` |
| IFRS 17 Insurance contracts | medium | Required when an entity issues insurance contracts. | `ifrs-insurance-contracts-ifrs17` |
| IFRS 5 Discontinued operations / held for sale | medium | Activates at disposal/exit events. | `ifrs-discontinued-operations-ifrs5` |
| IAS 10 Events after the reporting period | critical | Every audit-cycle artefact must address adjusting vs non-adjusting events. | `ifrs-events-after-reporting-period-ias10` |
| IAS 8 Accounting policies, changes, errors | critical | Required for any policy change or prior-period correction; consumer engines will need it. | `ifrs-accounting-policies-changes-errors-ias8` |
| IAS 24 Related party disclosures | critical | Universal disclosure obligation; cannot be missing. | `ifrs-related-party-disclosures-ias24` |
| IFRS 1 First-time adoption | high | Activates whenever a client migrates to IFRS or IFRS for SMEs. | `ifrs-first-time-adoption-ifrs1` |
| IFRS 8 Operating segments | medium | Required for entities with publicly traded debt/equity. | `ifrs-segment-reporting-ifrs8` |
| IAS 33 Earnings per share | medium | Same trigger as IFRS 8. | `ifrs-earnings-per-share-ias33` |

## 04 - Subledgers and operations

| Gap | Severity | Why it matters | Stub |
|---|---|---|---|
| Petty cash and imprest management | high | Universal in SME, NGO, schools, clinics; no doctrine today. | `petty-cash-and-imprest-management` |
| POS and cash-drawer management | critical | Retail and hospitality clients depend on it. | `pos-and-cash-drawer-management` |
| Expense management and staff claims | critical | Hits every entity with staff. | `expense-management-and-staff-claims` |

## 05 - Receivables, payables, treasury (entirely new pillar)

| Gap | Severity | Why it matters | Stub |
|---|---|---|---|
| AR and credit management | critical | One of the two main subledgers; entirely absent today. | `accounts-receivable-and-credit-management` |
| AP and supplier management | critical | The other main subledger; entirely absent today. | `accounts-payable-and-supplier-management` |
| Cash-flow forecasting and treasury | critical | Required for any business plan or going-concern assessment. | `cash-flow-forecasting-and-treasury` |
| FX management and hedging | high | Pairs with IAS 21; required for any export/import client. | `fx-management-and-hedging` |
| Banking facilities and covenants | high | Required for any financed entity. | `banking-facilities-and-covenants` |

## 06 - Close, consolidation, reporting

| Gap | Severity | Why it matters | Stub |
|---|---|---|---|
| Continuous close and flash reporting | medium | Modern close cadence beyond once-a-month playbook. | `continuous-close-and-flash-reporting` |
| Audit PBC and evidence management | high | Audit-ready reporting pack hands off to PBC; the cycle itself has no doctrine. | `audit-pbc-and-evidence-management` |

## 07 - Financial statements and disclosures (entirely new pillar)

| Gap | Severity | Why it matters | Stub |
|---|---|---|---|
| Financial statements preparation | critical | The four primary statements have no preparation doctrine today. IFRS 18 transition is on the timeline. | `financial-statements-preparation` |
| IAS 7 Statement of cash flows | critical | A primary financial statement; absent today. | `cash-flow-statement-ias7` |
| Notes and disclosure pack | critical | Every set of financial statements needs notes; no doctrine today. | `notes-and-disclosure-pack` |
| Going concern and viability | high | Auditor and IAS 1 paragraph 25 obligation; required for every engagement. | `going-concern-and-viability-assessment` |
| IFRS S1 / S2 sustainability disclosures | emerging | Increasingly mandatory across jurisdictions; doctrine must not be silent. | `integrated-and-sustainability-reporting-s1-s2` |

## 08 - Tax and statutory

| Gap | Severity | Why it matters | Stub |
|---|---|---|---|
| Indirect-tax (VAT/GST) mechanics | high | The country pack lists rates; the mechanics doctrine (place of supply, reverse charge, partial exemption) is absent. | `indirect-tax-vat-mechanics` |
| Withholding tax and treaties | high | Domestic WHT entry is in source register; treaty mechanics absent. | `withholding-tax-and-treaties` |
| Transfer-pricing documentation | medium | Required for related-party-heavy clients. | `transfer-pricing-documentation` |
| E-invoicing and fiscal-device integration | critical | EFRIS/eTIMS are live obligations; engines must know the patterns. | `e-invoicing-and-fiscal-device-integration` |

## 09 - Budgeting, FP&A, costing (entirely new pillar)

| Gap | Severity | Why it matters | Stub |
|---|---|---|---|
| Budgeting and rolling forecasts | critical | Required for `business-plan-skills` and `proposal-skills` engines to be honest. | `budgeting-and-rolling-forecasts` |
| Variance analysis and KPI reporting | critical | Required for management reporting in any engine. | `variance-analysis-and-kpi-reporting` |
| Cost-accounting methods | critical | Pricing, manufacturing, services engagements depend on it. | `cost-accounting-methods` |
| Scenario and sensitivity modelling | high | Required for business plans, viability, and impairment value-in-use. | `scenario-and-sensitivity-modelling` |
| Pricing, discounts, rebates, refunds | high | Sits between IFRS 15 (revenue) and management accounting; presently neither covers it. | `pricing-discounts-rebates-and-refunds` |

## 10 - Controls, governance, fraud

| Gap | Severity | Why it matters | Stub |
|---|---|---|---|
| Forensic accounting and anti-fraud | high | Internal controls library covers preventive design; detective analytics are absent. | `forensic-accounting-and-anti-fraud` |
| AML / KYC / suspicious-transaction reporting | high | Any finance system touching payments has obligations. | `aml-kyc-and-suspicious-transaction-reporting` |
| Whistleblowing and finance ethics | medium | Pairs with engagement quality skill. | `whistleblowing-and-finance-ethics` |
| SOX-style ICFR documentation | medium | Required for entities preparing for listing or with public-interest investors. | `sox-style-icfr-documentation` |

## 11 - Sector and fund accounting (entirely new pillar)

| Gap | Severity | Why it matters | Stub |
|---|---|---|---|
| NGO and fund accounting | critical | Named in README as typical client; no doctrine. | `ngo-and-fund-accounting` |
| Schools and education | critical | Same. | `school-and-education-accounting-pack` |
| Clinics and healthcare | critical | Same. | `clinic-and-healthcare-accounting-pack` |
| Retail and POS | critical | Same. | `retail-and-pos-accounting-pack` |
| Agribusiness and cooperatives | critical | Same; pairs with IAS 41. | `agribusiness-and-cooperative-pack` |
| Hospitality and restaurant | critical | Same. | `hospitality-and-restaurant-pack` |
| Real estate and property | high | Common EA sector; pairs with IAS 40/16/2 classification. | `real-estate-and-property-pack` |
| Fintech and payments | high | Float accounts, trust accounts, settlement reconciliation have no doctrine. | `fintech-and-payments-pack` |

## 12 - Public sector and IPSAS (entirely new pillar)

| Gap | Severity | Why it matters | Stub |
|---|---|---|---|
| IPSAS public-sector overlay | high | Required for any government-adjacent client. | `ipsas-public-sector-overlay` |
| Government procurement and fiscal controls | high | PPDA, vote books, TSA flows are common in EA public sector. | `government-procurement-and-fiscal-controls` |
| Donor-funded project fiscal compliance | high | Donor compliance is its own discipline beyond NGO accounting. | `donor-funded-project-fiscal-compliance` |

## 13 - Project and contract accounting (entirely new pillar)

| Gap | Severity | Why it matters | Stub |
|---|---|---|---|
| Project and contract accounting (POC/WIP) | critical | IFRS 15 doctrine exists; the operational POC/WIP doctrine does not. | `project-and-contract-accounting` |
| Construction contracts | high | Retentions, variations, claims, advance payments common in EA construction. | `construction-contract-accounting` |
| Professional services T&M | medium | Utilisation, realisation, unbilled receivables common in services. | `professional-services-time-and-materials` |

## 14 - Systems integration and data (entirely new pillar)

| Gap | Severity | Why it matters | Stub |
|---|---|---|---|
| ERP and finance system integration patterns | critical | Engines that build finance modules need this. | `erp-and-finance-system-integration-patterns` |
| Bank feed and payment gateway integration | high | Pairs with bank reconciliation; integration patterns absent. | `bank-feed-and-payment-gateway-integration` |
| Finance data contracts and warehouse models | high | BI/warehouse modelling for finance data has no doctrine. | `finance-data-contracts-and-warehouse-models` |
| Open banking and direct-debit mandates | emerging | Rising in EA via PSP layers. | `open-banking-and-direct-debit-mandates` |

## 15 - Security, privacy, continuity (entirely new pillar)

| Gap | Severity | Why it matters | Stub |
|---|---|---|---|
| Finance data privacy and retention | critical | Statutory retention minima, lawful basis, cross-border transfer rules. | `finance-data-privacy-and-retention` |
| Finance cybersecurity controls | critical | Payment-system hardening, posting/approval privilege, MFA. | `finance-cybersecurity-controls` |
| BCP/DR for finance | high | Payroll fallback, bank-payment fallback, tabletops. | `business-continuity-and-disaster-recovery-finance` |

## 16 - UX and presentation

| Gap | Severity | Why it matters | Stub |
|---|---|---|---|
| Finance accessibility and inclusive design | high | Existing UI/UX skills do not explicitly cover WCAG/RTL for finance. | `finance-accessibility-and-inclusive-design` |
| Finance mobile and offline patterns | high | Mobile and intermittent connectivity dominate EA operating context. | `finance-mobile-and-offline-patterns` |

## 17 - AI, automation, and emerging (entirely new pillar)

| Gap | Severity | Why it matters | Stub |
|---|---|---|---|
| AI in finance governance | critical | LLM-augmented finance is here; doctrine must define guardrails. | `ai-in-finance-governance` |
| RPA and automation controls for finance | high | Bots that post or approve need SoD, kill-switch, identity. | `rpa-and-automation-controls-for-finance` |
| Digital assets and crypto accounting | emerging | Increasing client exposure; IAS 38 vs IAS 2 vs IFRS 9 choice non-obvious. | `digital-assets-and-crypto-accounting` |
| Carbon and emissions accounting | emerging | Pairs with IFRS S2; internal carbon-pricing schemes emerging. | `carbon-and-emissions-accounting` |

## Severity tally

| Severity | Count |
|---|---:|
| critical | 27 |
| high | 30 |
| medium | 11 |
| emerging | 8 |
| **Total gaps closed as active doctrine skills** | **76** |

Last reviewed: 2026-05-25. Next review due: 2026-08-25.
