# Reference Manifest

Purpose: classify repository references so validators can distinguish a broken promise from an intentionally planned, external, or deprecated artifact.

State values:

| State | Meaning |
|---|---|
| present | File or directory exists in this repository and is expected to resolve. |
| planned | Required by the doctrine roadmap, but not implemented in this workstream. |
| external | Deliberately outside this repository, usually an official authority or consumer-engine path. |
| deprecated | Historical reference retained for migration context; it must not be used as release evidence. |

## Repository Evidence

| Path | State | Owner | Release impact | Notes |
|---|---|---|---|---|
| `tools/validate-doctrine.ps1` | present | tooling | release gate | Orchestrates local validation checks. |
| `tools/check-mojibake.ps1` | present | tooling | release gate | Scans common corrupted glyph signatures. |
| `tools/check-skill-contracts.ps1` | present | tooling | release gate | Checks skill frontmatter, section contract, declared files, and quality-gate map coverage. |
| `tools/check-source-register.ps1` | present | tooling | release gate | Validates source-register presence and entry metadata when available. |
| `tools/check-links.ps1` | present | tooling | release gate | Validates local Markdown links. |
| `tools/close-gap-stubs.ps1` | present | tooling | doctrine maintenance | Converts draft gap stubs into active doctrine skills with source-basis, implementation-rules, and example files. |
| `tools/invoke-doctrine-conformance-scan.ps1` | present | tooling | doctrine conformance facility | Scans a target system, codebase, plan, proposal, or prose artefact against finance doctrine risk patterns. |
| `.github/workflows/doctrine-validation.yml` | present | tooling | release gate | Runs the validator on GitHub Actions. |
| `docs/validation-report-template.md` | present | tooling | release evidence | Human-readable validation report template. |
| `docs/quality-gate-fixture-map.md` | present | doctrine owner | release evidence | Maps finance quality-gate blockers to checks, fixtures, or planned fixtures. |
| `docs/fin-analysis/02-system-scorecard-100.md` | present | doctrine owner | evidence input | Current scorecard. Do not edit in this workstream. |
| `docs/fin-analysis/03-findings-register.md` | present | doctrine owner | evidence input | Finding register F-001 through F-012. Do not edit in this workstream. |
| `integration/mirror.ps1` | present | integration owner | caveated release evidence | Repo-relative default appears already present; this worker did not edit it. |

## Doctrine References

| Path | State | Owner | Release impact | Notes |
|---|---|---|---|---|
| `doctrine/accounting-finance-doctrine.md` | present | doctrine owner | release evidence | Canonical doctrine. |
| `doctrine/references/chart-of-accounts.md` | present | doctrine owner | release evidence | Core CoA reference. |
| `doctrine/references/country-extension-framework.md` | present | doctrine owner | release evidence | Country extension model. |
| `doctrine/references/design-anti-patterns.md` | present | doctrine owner | release evidence | Finance design anti-patterns. |
| `doctrine/references/design-system-finance-accounting.md` | present | doctrine owner | release evidence | Finance design system. |
| `doctrine/references/forbidden-patterns.md` | present | doctrine owner | release evidence | Forbidden accounting patterns. |
| `doctrine/references/full-ifrs-overlay.md` | present | IFRS reviewer | caveated release evidence | Needs 2027 transition addendum. |
| `doctrine/references/ifrs-for-smes-default.md` | present | IFRS reviewer | caveated release evidence | Needs third-edition transition addendum. |
| `doctrine/references/ledger-invariants.md` | present | accounting systems architect | release evidence | Ledger invariant doctrine. |
| `doctrine/references/live-rate-verification-protocol.md` | present | tax reviewer | caveated release evidence | Protocol exists; source-register implementation is planned. |
| `doctrine/references/policy-hierarchy.md` | present | doctrine owner | release evidence | Framework and policy hierarchy. |
| `doctrine/references/print-fidelity.md` | present | UX reviewer | release evidence | Print fidelity requirements. |
| `doctrine/references/required-patterns.md` | present | doctrine owner | release evidence | Required patterns list. |
| `doctrine/references/requirement-id-library.md` | present | doctrine owner | release evidence | Requirement IDs. |
| `doctrine/references/role-conditioned-shell.md` | present | UX reviewer | release evidence | Finance shell reference. |
| `doctrine/references/status-taxonomy.md` | present | UX reviewer | release evidence | Controlled finance states. |
| `doctrine/references/tax-vat-and-returns.md` | present | tax reviewer | caveated release evidence | Must consume source-register before final statutory output. |
| `doctrine/references/terminology-glossary.md` | present | doctrine owner | release evidence | Controlled terminology. |
| `doctrine/references/uganda-compliance-caveats.md` | present | tax reviewer | caveated release evidence | Uganda caveats; values remain verification-gated. |
| `doctrine/references/versioning-and-changelog.md` | present | doctrine owner | release evidence | Versioning reference. |
| `doctrine/references/standards-transition-2027.md` | present | IFRS reviewer | caveated release evidence | Transition reference exists; reviewer sign-off still required. |
| `doctrine/references/ifrs-18-presentation-transition.md` | present | IFRS reviewer | caveated release evidence | IFRS 18 transition reference exists; reviewer sign-off still required. |
| `doctrine/references/ifrs-for-smes-third-edition-transition.md` | present | IFRS reviewer | caveated release evidence | IFRS for SMEs third-edition reference exists; reviewer sign-off still required. |
| `doctrine/examples/reporting-basis-2026.md` | present | IFRS reviewer | caveated release evidence | Acceptance fixture exists. |
| `doctrine/examples/reporting-basis-2027-ifrs18.md` | present | IFRS reviewer | caveated release evidence | Acceptance fixture exists. |
| `doctrine/examples/reporting-basis-2027-smes-third-edition.md` | present | IFRS reviewer | caveated release evidence | Acceptance fixture exists. |

## Source Register

| Path | State | Owner | Release impact | Notes |
|---|---|---|---|---|
| `doctrine/source-register/README.md` | present | tax reviewer | caveated release evidence | Operating guide exists; entries are currently draft. |
| `doctrine/source-register/schema.yaml` | present | tax reviewer | caveated release evidence | Schema exists; validator treats it as container metadata. |
| `doctrine/source-register/uganda/vat.yaml` | present | tax reviewer | blocks final statutory output | Uganda VAT entry exists but is not verified-current. |
| `doctrine/source-register/uganda/paye.yaml` | present | tax reviewer | blocks final statutory output | Uganda PAYE entry exists but is not verified-current. |
| `doctrine/source-register/uganda/nssf.yaml` | present | tax reviewer | release evidence | Uganda NSSF mandatory contribution entry is verified-current for the scoped rule fields; other payroll/tax surfaces remain verification-gated. |
| `doctrine/source-register/uganda/wht.yaml` | present | tax reviewer | blocks final statutory output | Uganda WHT entry exists but is not verified-current. |
| `doctrine/source-register/uganda/income-tax.yaml` | present | tax reviewer | blocks final statutory output | Uganda income-tax entry exists but is not verified-current. |
| `doctrine/source-register/uganda/efris.yaml` | present | tax reviewer | blocks final statutory output | Uganda EFRIS entry exists but is not verified-current. |
| `doctrine/source-register/uganda/exchange-rates.yaml` | present | tax reviewer | blocks final statutory output | Uganda exchange-rate entry exists but is not verified-current. |
| `doctrine/source-register/kenya/README.md` | present | Kenya tax reviewer | blocks final Kenya statutory output | Skeleton only until verified. |
| `doctrine/source-register/kenya/vat.yaml` | present | Kenya tax reviewer | blocks final Kenya statutory output | KRA VAT entry exists but is not verified-current. |
| `doctrine/source-register/kenya/etims.yaml` | present | Kenya tax reviewer | blocks final Kenya statutory output | eTIMS entry exists but is not verified-current. |
| `doctrine/source-register/rwanda/README.md` | present | Rwanda tax reviewer | blocks final Rwanda statutory output | Skeleton only until verified. |
| `doctrine/source-register/tanzania/README.md` | present | Tanzania tax reviewer | blocks final Tanzania statutory output | Skeleton only until verified. |
| `doctrine/source-register/south-africa/README.md` | present | South Africa tax reviewer | blocks final South Africa statutory output | Skeleton only until verified. |

## Skill Catalogue

| Path | State | Owner | Release impact | Notes |
|---|---|---|---|---|
| `skills/06-close-consolidation-and-reporting/audit-ready-reporting-pack/SKILL.md` | present | reporting owner | release evidence | Active skill. |
| `skills/04-subledgers-and-operations/bank-and-mobile-money-reconciliation/SKILL.md` | present | reconciliation owner | release evidence | Active skill. |
| `skills/06-close-consolidation-and-reporting/finance-module-audit/SKILL.md` | present | doctrine owner | release evidence | Active skill. |
| `skills/16-ux-and-presentation/finance-ui-pattern-library/SKILL.md` | present | UX owner | release evidence | Active skill. |
| `skills/16-ux-and-presentation/finance-ux-for-non-accountants/SKILL.md` | present | UX owner | release evidence | Active skill. |
| `skills/03-ifrs-specialised-standards/ias-agriculture/SKILL.md` | present | IFRS reviewer | release evidence | Active skill. |
| `skills/03-ifrs-specialised-standards/ias-government-grants/SKILL.md` | present | IFRS reviewer | release evidence | Active skill. |
| `skills/03-ifrs-specialised-standards/ias-impairment/SKILL.md` | present | IFRS reviewer | release evidence | Active skill. |
| `skills/03-ifrs-specialised-standards/ias-income-tax-deferred-tax/SKILL.md` | present | IFRS reviewer | release evidence | Active skill. |
| `skills/03-ifrs-specialised-standards/ias-provisions-contingencies/SKILL.md` | present | IFRS reviewer | release evidence | Active skill. |
| `skills/02-ifrs-core-standards/ifrs-financial-instruments/SKILL.md` | present | IFRS reviewer | release evidence | Active skill. |
| `skills/02-ifrs-core-standards/ifrs-for-smes-equivalents/SKILL.md` | present | IFRS reviewer | release evidence | Active skill. |
| `skills/02-ifrs-core-standards/ifrs-leases/SKILL.md` | present | IFRS reviewer | release evidence | Active skill. |
| `skills/02-ifrs-core-standards/ifrs-revenue-recognition/SKILL.md` | present | IFRS reviewer | release evidence | Active skill. |
| `skills/10-controls-governance-and-fraud/internal-controls-library/SKILL.md` | present | controls owner | release evidence | Active skill. |
| `skills/10-controls-governance-and-fraud/finance-doctrine-conformance-scanner/SKILL.md` | present | doctrine owner | release evidence | Active conformance-scanner facility for codebases, systems, plans, proposals, and prose artefacts. |
| `skills/01-foundations/management-accounting-dimensions/SKILL.md` | present | management accounting owner | release evidence | Active skill. |
| `skills/06-close-consolidation-and-reporting/month-end-and-year-end-close-playbook/SKILL.md` | present | close owner | release evidence | Active skill. |
| `skills/06-close-consolidation-and-reporting/opening-balances-and-migration-playbook/SKILL.md` | present | migration owner | release evidence | Active skill. |
| `skills/01-foundations/ledger-posting-engine-core/SKILL.md` | present | accounting systems architect | caveated release evidence | Active skill present; review metadata still needs normalization. |
| `skills/08-tax-and-statutory/tax-statutory-source-register-and-country-packs/SKILL.md` | present | tax reviewer | caveated release evidence | Active skill present; review metadata still needs normalization. |
| `skills/04-subledgers-and-operations/inventory-costing-and-stock-accounting/SKILL.md` | present | inventory accounting specialist | caveated release evidence | Active skill present; review metadata still needs normalization. |
| `skills/04-subledgers-and-operations/fixed-assets-and-depreciation/SKILL.md` | present | accounting specialist | caveated release evidence | Active skill present; review metadata still needs normalization. |
| `skills/04-subledgers-and-operations/payroll-and-statutory-postings-east-africa/SKILL.md` | present | payroll reviewer | caveated release evidence | Active skill present; review metadata still needs normalization. |
| `skills/06-close-consolidation-and-reporting/consolidation-and-intercompany/SKILL.md` | present | reporting specialist | caveated release evidence | Active skill present; review metadata still needs normalization. |
| `skills/10-controls-governance-and-fraud/engagement-quality-and-plain-language-output/SKILL.md` | present | delivery lead | caveated release evidence | Active skill present; review metadata still needs normalization. |

## Declared Skill References And Examples

| Path | State | Owner | Release impact | Notes |
|---|---|---|---|---|
| `skills/06-close-consolidation-and-reporting/audit-ready-reporting-pack/references/notes-templates.md` | present | reporting owner | release evidence | Exists. |
| `skills/06-close-consolidation-and-reporting/audit-ready-reporting-pack/references/auditor-export-format.md` | present | reporting owner | release evidence | Exists. |
| `skills/06-close-consolidation-and-reporting/audit-ready-reporting-pack/examples/may-2026-monthly-pack.md` | present | reporting owner | release evidence | Exists. |
| `skills/04-subledgers-and-operations/bank-and-mobile-money-reconciliation/references/match-rules.md` | present | reconciliation owner | release evidence | Exists. |
| `skills/04-subledgers-and-operations/bank-and-mobile-money-reconciliation/references/data-model.sql` | present | reconciliation owner | release evidence | Exists. |
| `skills/04-subledgers-and-operations/bank-and-mobile-money-reconciliation/references/provider-quirks.md` | present | reconciliation owner | release evidence | Exists. |
| `skills/04-subledgers-and-operations/bank-and-mobile-money-reconciliation/examples/mtn-momo-month-end.md` | present | reconciliation owner | release evidence | Exists. |
| `skills/16-ux-and-presentation/finance-ui-pattern-library/references/tokens.md` | present | UX owner | release evidence | Exists. |
| `skills/16-ux-and-presentation/finance-ui-pattern-library/references/components.md` | present | UX owner | release evidence | Exists. |
| `skills/16-ux-and-presentation/finance-ui-pattern-library/references/print-stylesheet-template.md` | present | UX owner | release evidence | Exists. |
| `skills/16-ux-and-presentation/finance-ui-pattern-library/references/lint-checks.md` | present | UX owner | release evidence | Exists. |
| `skills/16-ux-and-presentation/finance-ui-pattern-library/examples/cashier-record-sale.md` | present | UX owner | release evidence | Exists. |
| `skills/16-ux-and-presentation/finance-ui-pattern-library/examples/ledger-trial-balance.md` | present | UX owner | release evidence | Exists. |
| `skills/16-ux-and-presentation/finance-ui-pattern-library/examples/reconciliation-triage.md` | present | UX owner | release evidence | Exists. |
| `skills/16-ux-and-presentation/finance-ux-for-non-accountants/references/workflow-vocabulary.md` | present | UX owner | release evidence | Exists. |
| `skills/16-ux-and-presentation/finance-ux-for-non-accountants/references/microcopy-style.md` | present | UX owner | release evidence | Exists. |
| `skills/16-ux-and-presentation/finance-ux-for-non-accountants/examples/cashier-day-flow.md` | present | UX owner | release evidence | Exists. |
| `skills/03-ifrs-specialised-standards/ias-agriculture/references/fair-value-methodology.md` | present | IFRS reviewer | release evidence | Exists. |
| `skills/03-ifrs-specialised-standards/ias-agriculture/references/cohort-data-model.md` | present | IFRS reviewer | release evidence | Exists. |
| `skills/03-ifrs-specialised-standards/ias-agriculture/examples/birdc-layer-flock-q2-2026.md` | present | IFRS reviewer | release evidence | Exists. |
| `skills/03-ifrs-specialised-standards/ias-government-grants/references/grant-register-schema.md` | present | IFRS reviewer | release evidence | Exists. |
| `skills/03-ifrs-specialised-standards/ias-government-grants/references/donor-restriction-pattern.md` | present | IFRS reviewer | release evidence | Exists. |
| `skills/03-ifrs-specialised-standards/ias-government-grants/examples/ngo-restricted-grant-cycle.md` | present | IFRS reviewer | release evidence | Exists. |
| `skills/03-ifrs-specialised-standards/ias-impairment/references/indicator-checklist.md` | present | IFRS reviewer | release evidence | Exists. |
| `skills/03-ifrs-specialised-standards/ias-impairment/references/value-in-use-workpaper-template.md` | present | IFRS reviewer | release evidence | Exists. |
| `skills/03-ifrs-specialised-standards/ias-income-tax-deferred-tax/references/temporary-difference-catalog.md` | present | IFRS reviewer | release evidence | Exists. |
| `skills/03-ifrs-specialised-standards/ias-income-tax-deferred-tax/references/recognition-checklist.md` | present | IFRS reviewer | release evidence | Exists. |
| `skills/03-ifrs-specialised-standards/ias-income-tax-deferred-tax/examples/sme-tax-provision-2026-04.md` | present | IFRS reviewer | release evidence | Exists. |
| `skills/03-ifrs-specialised-standards/ias-provisions-contingencies/references/recognition-decision-tree.md` | present | IFRS reviewer | release evidence | Exists. |
| `skills/03-ifrs-specialised-standards/ias-provisions-contingencies/references/onerous-contract-test.md` | present | IFRS reviewer | release evidence | Exists. |
| `skills/02-ifrs-core-standards/ifrs-financial-instruments/references/section-11-impairment.md` | present | IFRS reviewer | release evidence | Exists. |
| `skills/02-ifrs-core-standards/ifrs-financial-instruments/references/ifrs-9-ecl-simplified-trade-receivables.md` | present | IFRS reviewer | release evidence | Exists. |
| `skills/02-ifrs-core-standards/ifrs-financial-instruments/references/effective-interest-schedule.md` | present | IFRS reviewer | release evidence | Exists. |
| `skills/02-ifrs-core-standards/ifrs-for-smes-equivalents/references/full-ifrs-to-sme-mapping.md` | present | IFRS reviewer | release evidence | Exists. |
| `skills/02-ifrs-core-standards/ifrs-for-smes-equivalents/references/client-profile-decision-tree.md` | present | IFRS reviewer | release evidence | Exists. |
| `skills/02-ifrs-core-standards/ifrs-leases/references/exemption-test.md` | present | IFRS reviewer | release evidence | Exists. |
| `skills/02-ifrs-core-standards/ifrs-leases/references/full-ifrs-16-lessee-model.md` | present | IFRS reviewer | release evidence | Exists. |
| `skills/02-ifrs-core-standards/ifrs-revenue-recognition/references/section-23-summary.md` | present | IFRS reviewer | release evidence | Exists. |
| `skills/02-ifrs-core-standards/ifrs-revenue-recognition/references/ifrs-15-five-step.md` | present | IFRS reviewer | release evidence | Exists. |
| `skills/02-ifrs-core-standards/ifrs-revenue-recognition/examples/multi-element-software-licence-plus-support.md` | present | IFRS reviewer | release evidence | Exists. |
| `skills/10-controls-governance-and-fraud/internal-controls-library/references/sod-conflict-matrix.md` | present | controls owner | release evidence | Exists. |
| `skills/10-controls-governance-and-fraud/internal-controls-library/references/exception-indicators.md` | present | controls owner | release evidence | Exists. |
| `skills/10-controls-governance-and-fraud/internal-controls-library/examples/payment-approval-flow.md` | present | controls owner | release evidence | Exists. |
| `skills/01-foundations/management-accounting-dimensions/references/dimensions-spec.md` | present | management accounting owner | release evidence | Exists. |
| `skills/01-foundations/management-accounting-dimensions/references/allocation-rules-pattern.md` | present | management accounting owner | release evidence | Exists. |
| `skills/01-foundations/management-accounting-dimensions/examples/contribution-margin-by-branch.md` | present | management accounting owner | release evidence | Exists. |
| `skills/06-close-consolidation-and-reporting/month-end-and-year-end-close-playbook/references/close-task-template.md` | present | close owner | release evidence | Exists. |
| `skills/06-close-consolidation-and-reporting/month-end-and-year-end-close-playbook/references/year-end-extras.md` | present | close owner | release evidence | Exists. |
| `skills/06-close-consolidation-and-reporting/month-end-and-year-end-close-playbook/examples/first-close-checklist.md` | present | close owner | release evidence | Exists. |
| `skills/06-close-consolidation-and-reporting/opening-balances-and-migration-playbook/references/cutover-pack.md` | present | migration owner | release evidence | Exists. |
| `skills/06-close-consolidation-and-reporting/opening-balances-and-migration-playbook/references/legacy-source-extractors.md` | present | migration owner | release evidence | Exists. |
| `skills/06-close-consolidation-and-reporting/opening-balances-and-migration-playbook/examples/sme-cutover-pack-2026-04-30.md` | present | migration owner | release evidence | Exists. |

## External Sources

| Path | State | Owner | Release impact | Notes |
|---|---|---|---|---|
| `https://www.ifrs.org/news-and-events/news/2026/01/now-available-ifrs-accounting-standards-required-2026-two-editions/` | external | IFRS reviewer | source evidence | Official IFRS Required 2026 source. |
| `https://www.ifrs.org/content/ifrs/home/issued-standards/ifrs-for-smes/` | external | IFRS reviewer | source evidence | Official IFRS for SMEs source. |
| `https://www.ifrs.org/issued-standards/list-of-standards/ifrs-18-presentation-and-disclosure-in-financial-statements/` | external | IFRS reviewer | source evidence | Official IFRS 18 source. |
| `https://www.iaasb.org/publications/2025-handbook-international-quality-management-auditing-review-other-assurance-and-related-services` | external | assurance reviewer | source evidence | IAASB 2025 Handbook source. |
| `https://www.ethicsboard.org/standards-pronouncements` | external | ethics reviewer | source evidence | IESBA standards source. |
| `https://www.ifac.org/about-ifac/membership/profile/uganda` | external | tax reviewer | source evidence | IFAC Uganda profile. |
| `https://www.icpau.co.ug/resources/ifrs-smes-implementation-guidelines` | external | tax reviewer | source evidence | ICPAU IFRS for SMEs guidance page. |
| `https://ura.go.ug/wp-content/uploads/2024/12/Taxation-Handbook-FY-2024-25.pdf` | external | tax reviewer | source evidence | URA Taxation Handbook seed source. |
| `https://ura.go.ug/storage/2025/01/THE-EFRIS-HANDBOOK-2024-25-2.pdf` | external | tax reviewer | source evidence | URA EFRIS Handbook seed source. |
| `https://www.nssfug.org/about-us/membership/` | external | payroll reviewer | source evidence | NSSF Uganda seed source. |
| `https://kra.go.ke/individual/filing-paying/types-of-taxes/value-added-tax` | external | Kenya tax reviewer | source evidence | KRA VAT seed source. |
| `https://www.kra.go.ke/online-services/etims` | external | Kenya tax reviewer | source evidence | KRA eTIMS seed source. |

## Deprecated References

| Path | State | Owner | Release impact | Notes |
|---|---|---|---|---|
| `C:\wamp64\www\_chwezi-doctrine` | deprecated | integration owner | must not support release | Historical mirror master path flagged by F-007; use repo-relative `integration/mirror.ps1` default or explicit override instead. |

Last reviewed: 2026-05-15. Next review due: 2026-11-15.

