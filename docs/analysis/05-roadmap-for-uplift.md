# Roadmap for Uplift

This roadmap was the original sequence for turning the 76 gap-stubs into release-grade skills. On 2026-05-25, the gap-closure pass converted all 76 stubs to active doctrine skills with source-basis references, implementation rules, and worked examples. The remaining roadmap is now a reviewer-signoff and depth-expansion plan, not a stub-remediation plan. Sequencing is driven by:

1. **Dependency chain** — foundational skills first, derivative skills later.
2. **Consumer-engine demand** — what `proposal-skills`, `srs-skills`, `business-plan-skills`, and `web-dev` will hit first on real client work.
3. **Reviewer concentration** — group work that needs the same reviewer to minimise context-switching.
4. **Score uplift per unit of effort** — pillars with `0` scores yield the largest jumps.

## Wave 1 - Doctrine spine completion (target +8 points -> 70/100)

Goal: close the foundational gaps that everything else depends on. Reviewers: IFRS reviewer, accounting systems architect, tax reviewer.

| Skill | Reviewer |
|---|---|
| `01-foundations/chart-of-accounts-design-and-governance` | accounting systems architect |
| `01-foundations/period-locking-and-data-immutability` | accounting systems architect |
| `01-foundations/functional-and-presentation-currency` | IFRS reviewer + tax reviewer |
| `03-ifrs-specialised-standards/ifrs-accounting-policies-changes-errors-ias8` | IFRS reviewer |
| `03-ifrs-specialised-standards/ifrs-events-after-reporting-period-ias10` | IFRS reviewer |
| `03-ifrs-specialised-standards/ifrs-related-party-disclosures-ias24` | IFRS reviewer |
| `02-ifrs-core-standards/ifrs-foreign-currency-translation-ias21` | IFRS reviewer |
| `03-ifrs-specialised-standards/ifrs-fair-value-measurement-ifrs13` | IFRS reviewer |

## Wave 2 - Primary statements and disclosures (target +8 points -> 78/100)

Goal: enable end-to-end financial-statement generation. Reviewer: IFRS reviewer + reporting owner.

| Skill | Reviewer |
|---|---|
| `07-financial-statements-and-disclosures/financial-statements-preparation` | reporting owner + IFRS reviewer |
| `07-financial-statements-and-disclosures/cash-flow-statement-ias7` | reporting owner + IFRS reviewer |
| `07-financial-statements-and-disclosures/notes-and-disclosure-pack` | reporting owner + IFRS reviewer |
| `07-financial-statements-and-disclosures/going-concern-and-viability-assessment` | controller + auditor liaison |
| `06-close-consolidation-and-reporting/audit-pbc-and-evidence-management` | controller + auditor liaison |

## Wave 3 - AR, AP, treasury, and high-frequency IFRS (target +7 points -> 85/100)

Goal: complete the operating-finance picture. Reviewers: controller, treasury, IFRS reviewer.

| Skill | Reviewer |
|---|---|
| `05-receivables-payables-and-treasury/accounts-receivable-and-credit-management` | controller |
| `05-receivables-payables-and-treasury/accounts-payable-and-supplier-management` | controller |
| `05-receivables-payables-and-treasury/cash-flow-forecasting-and-treasury` | treasury reviewer |
| `05-receivables-payables-and-treasury/fx-management-and-hedging` | treasury reviewer + IFRS reviewer |
| `05-receivables-payables-and-treasury/banking-facilities-and-covenants` | treasury reviewer |
| `02-ifrs-core-standards/ifrs-property-plant-equipment-ias16` | IFRS reviewer |
| `02-ifrs-core-standards/ifrs-intangible-assets-ias38` | IFRS reviewer |
| `02-ifrs-core-standards/ifrs-employee-benefits-ias19` | IFRS reviewer + payroll reviewer |
| `02-ifrs-core-standards/ifrs-borrowing-costs-ias23` | IFRS reviewer |

## Wave 4 - FP&A pillar (target +5 points -> 90/100)

Goal: enable business-plan-skills and proposal-skills to produce honest projections. Reviewer: controller, management accountant.

| Skill | Reviewer |
|---|---|
| `09-budgeting-fpa-and-costing/budgeting-and-rolling-forecasts` | management accountant |
| `09-budgeting-fpa-and-costing/variance-analysis-and-kpi-reporting` | management accountant |
| `09-budgeting-fpa-and-costing/cost-accounting-methods` | management accountant |
| `09-budgeting-fpa-and-costing/scenario-and-sensitivity-modelling` | management accountant |
| `09-budgeting-fpa-and-costing/pricing-discounts-rebates-and-refunds` | management accountant + IFRS reviewer |

## Wave 5 - Sector packs and project accounting (target +6 points -> 96/100)

Goal: cover every client type named in the README. Reviewer: sector specialist per pack.

| Skill | Reviewer |
|---|---|
| `11-sector-and-fund-accounting/ngo-and-fund-accounting` | NGO specialist |
| `11-sector-and-fund-accounting/school-and-education-accounting-pack` | education specialist |
| `11-sector-and-fund-accounting/clinic-and-healthcare-accounting-pack` | healthcare specialist |
| `11-sector-and-fund-accounting/retail-and-pos-accounting-pack` | retail specialist |
| `11-sector-and-fund-accounting/agribusiness-and-cooperative-pack` | agribusiness specialist |
| `11-sector-and-fund-accounting/hospitality-and-restaurant-pack` | hospitality specialist |
| `11-sector-and-fund-accounting/real-estate-and-property-pack` | real-estate specialist |
| `11-sector-and-fund-accounting/fintech-and-payments-pack` | fintech specialist |
| `13-project-and-contract-accounting/project-and-contract-accounting` | IFRS reviewer + PM lead |
| `13-project-and-contract-accounting/construction-contract-accounting` | IFRS reviewer + construction PM |
| `13-project-and-contract-accounting/professional-services-time-and-materials` | services controller |

## Wave 6 - Specialised IFRS, controls, tax mechanics, sector follow-ups (target +3 points -> 99/100)

| Skill | Reviewer |
|---|---|
| `03-ifrs-specialised-standards/ifrs-business-combinations-ifrs3` | IFRS reviewer |
| `03-ifrs-specialised-standards/ifrs-investment-property-ias40` | IFRS reviewer |
| `03-ifrs-specialised-standards/ifrs-associates-and-joint-arrangements` | IFRS reviewer |
| `03-ifrs-specialised-standards/ifrs-share-based-payment-ifrs2` | IFRS reviewer |
| `03-ifrs-specialised-standards/ifrs-discontinued-operations-ifrs5` | IFRS reviewer |
| `03-ifrs-specialised-standards/ifrs-first-time-adoption-ifrs1` | IFRS reviewer |
| `03-ifrs-specialised-standards/ifrs-segment-reporting-ifrs8` | IFRS reviewer |
| `03-ifrs-specialised-standards/ifrs-earnings-per-share-ias33` | IFRS reviewer |
| `03-ifrs-specialised-standards/ifrs-insurance-contracts-ifrs17` | IFRS reviewer (where in scope) |
| `04-subledgers-and-operations/petty-cash-and-imprest-management` | controls owner |
| `04-subledgers-and-operations/pos-and-cash-drawer-management` | controls owner + retail specialist |
| `04-subledgers-and-operations/expense-management-and-staff-claims` | controls owner |
| `08-tax-and-statutory/indirect-tax-vat-mechanics` | tax reviewer |
| `08-tax-and-statutory/withholding-tax-and-treaties` | tax reviewer |
| `08-tax-and-statutory/transfer-pricing-documentation` | tax reviewer |
| `08-tax-and-statutory/e-invoicing-and-fiscal-device-integration` | tax reviewer + integration owner |
| `10-controls-governance-and-fraud/forensic-accounting-and-anti-fraud` | controls owner |
| `10-controls-governance-and-fraud/aml-kyc-and-suspicious-transaction-reporting` | compliance reviewer |
| `10-controls-governance-and-fraud/whistleblowing-and-finance-ethics` | ethics reviewer |
| `10-controls-governance-and-fraud/sox-style-icfr-documentation` | controls owner |
| `06-close-consolidation-and-reporting/continuous-close-and-flash-reporting` | close owner |

## Wave 7 - Cross-cutting, public sector, emerging (target +1 point -> 100/100)

| Skill | Reviewer |
|---|---|
| `12-public-sector-and-ipsas/ipsas-public-sector-overlay` | public-sector reviewer |
| `12-public-sector-and-ipsas/government-procurement-and-fiscal-controls` | public-sector reviewer |
| `12-public-sector-and-ipsas/donor-funded-project-fiscal-compliance` | NGO/donor specialist |
| `14-systems-integration-and-data/erp-and-finance-system-integration-patterns` | integration owner |
| `14-systems-integration-and-data/bank-feed-and-payment-gateway-integration` | integration owner |
| `14-systems-integration-and-data/finance-data-contracts-and-warehouse-models` | data owner |
| `14-systems-integration-and-data/open-banking-and-direct-debit-mandates` | integration owner |
| `15-security-privacy-and-continuity/finance-data-privacy-and-retention` | privacy reviewer |
| `15-security-privacy-and-continuity/finance-cybersecurity-controls` | security reviewer |
| `15-security-privacy-and-continuity/business-continuity-and-disaster-recovery-finance` | resilience reviewer |
| `16-ux-and-presentation/finance-accessibility-and-inclusive-design` | UX reviewer |
| `16-ux-and-presentation/finance-mobile-and-offline-patterns` | UX reviewer |
| `07-financial-statements-and-disclosures/integrated-and-sustainability-reporting-s1-s2` | sustainability reviewer |
| `17-ai-automation-and-emerging/ai-in-finance-governance` | doctrine owner + AI governance |
| `17-ai-automation-and-emerging/rpa-and-automation-controls-for-finance` | controls owner |
| `17-ai-automation-and-emerging/digital-assets-and-crypto-accounting` | IFRS reviewer |
| `17-ai-automation-and-emerging/carbon-and-emissions-accounting` | sustainability reviewer |

## Definition of Done Per Closed Gap Skill

A closed gap skill is considered client-release-ready when:

1. SKILL.md body replaces the stub Workflow / Decision Rules / Acceptance Evidence sections with substantive content sourced from canonical doctrine and current authoritative standards or regulators where applicable. Completed for doctrine closure.
2. At least one worked example exists under `examples/`. Completed in the closure pass.
3. At least two reference files exist under `references/`, each citing canonical doctrine and authoritative source classes. Completed in the closure pass.
4. The skill is registered in `docs/reference-manifest.md` with owner, reviewer, and release impact.
5. Any statutory values cited are sourced from `doctrine/source-register/` entries marked `verified-current`.
6. Reviewer sign-off is recorded in the SKILL.md Review Metadata block, including reviewer name and date.
7. The skill's `status: draft` frontmatter line is removed or replaced with `status: active`. Completed in the closure pass.
8. `tools/validate-doctrine.ps1` continues to pass.

## Watch-outs

- **Reviewer bandwidth is the binding constraint.** Waves 1-3 concentrate IFRS-reviewer load. Plan around this.
- **Sector packs need sector specialists.** Do not let a generalist reviewer sign these off; sector-specific accounting nuance is where most engagements fail.
- **The source register must lead.** No skill should quote final statutory values ahead of verified-current country-pack source-register entries.
- **The 25-skill cap was lifted to 120.** If aggregate skill count starts approaching 120 (currently 102), revisit category granularity rather than the cap.

Last reviewed: 2026-05-25. Next review due: 2026-08-25.
