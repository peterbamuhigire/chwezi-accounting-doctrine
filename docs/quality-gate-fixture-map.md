# Quality Gate Fixture Map

Purpose: map every finance quality-gate blocker in `governance/finance-accounting-quality-gate.md` to an existing check, present fixture, or planned fixture. Planned rows are acceptable for `pass-with-caveats`; final statutory, ledger-affecting, or client-facing release needs the planned rows replaced by present automated checks or reviewed fixtures.

| Blocker | Area | Fixture or check | State | Evidence path | Notes |
|---|---|---|---|---|---|
| B-001 | Doctrine and framework | Framework header checklist | planned | `doctrine/examples/reporting-basis-2026.md` | Planned 2026 reporting-basis fixture. |
| B-002 | Doctrine and framework | Explicit framework-selection checklist | planned | `doctrine/references/standards-transition-2027.md` | Must block US GAAP unless selected by client policy. |
| B-003 | Doctrine and framework | Unsupported costing method rejection fixture | planned | `skills/inventory-costing-and-stock-accounting/examples/rejected-lifo-ifrs.md` | Planned inventory skill. |
| B-004 | Doctrine and framework | Mixed framework policy-change checklist | planned | `doctrine/references/standards-transition-2027.md` | Planned transition reference. |
| B-010 | Ledger | Posting-service boundary invariant | planned | `skills/ledger-posting-engine-core/references/invariant-tests.md` | Planned ledger skill. |
| B-011 | Ledger | Balanced journal fixture | present | `doctrine/examples/vat-inclusive-posting.md` | Present positive example; automated negative fixture remains planned. |
| B-012 | Ledger | Reversal-only correction fixture | present | `doctrine/examples/reversal-pattern.md` | Present correction pattern. |
| B-013 | Ledger | Locked-period rejection fixture | planned | `skills/ledger-posting-engine-core/examples/locked-period-adjustment.md` | Planned ledger skill. |
| B-014 | Ledger | Audit-log field checklist | present | `doctrine/references/ledger-invariants.md` | Present doctrine reference; executable test remains planned. |
| B-015 | Ledger | Reposting-after-edit rejection fixture | present | `doctrine/examples/reversal-pattern.md` | Present reversal pattern. |
| B-020 | CoA | Controlled account taxonomy check | present | `doctrine/references/chart-of-accounts.md` | Present CoA reference. |
| B-021 | CoA | VAT control-account decomposition fixture | present | `doctrine/examples/vat-inclusive-posting.md` | Present example. |
| B-022 | CoA | Control-account subledger tie-out checklist | planned | `skills/ledger-posting-engine-core/references/invariant-tests.md` | Planned ledger skill. |
| B-023 | CoA | Migration suspense zero or waiver fixture | planned | `skills/opening-balances-and-migration-playbook/examples/sme-cutover-pack-2026-04-30.md` | Declared planned example. |
| B-030 | Tax and statutory | Hardcoded statutory value scan | present | `tools/check-source-register.ps1` | Present source-register gate; deeper code scanning belongs in consumer repos. |
| B-031 | Tax and statutory | Net/tax/gross VAT-inclusive posting fixture | present | `doctrine/examples/vat-inclusive-posting.md` | Present example. |
| B-032 | Tax and statutory | Tax-code effective-period checklist | present | `doctrine/examples/vat-inclusive-posting.md` | Present example notes require effective periods. |
| B-033 | Tax and statutory | Return-template verified-version check | planned | `doctrine/source-register/uganda/efris.yaml` | Planned source-register entries. |
| B-034 | Tax and statutory | Return-pack vs automated-filing language checklist | present | `doctrine/references/tax-vat-and-returns.md` | Present doctrine reference. |
| B-040 | Live-rate | verified-current source-register check | present | `tools/check-source-register.ps1` | Present validator; entries are planned. |
| B-041 | Live-rate | Recheck-date staleness check | present | `tools/check-source-register.ps1` | Present validator. |
| B-042 | Live-rate | Verifier and date metadata check | present | `tools/check-source-register.ps1` | Present validator. |
| B-050 | Migration | Opening-balance sign-off checklist | planned | `skills/opening-balances-and-migration-playbook/references/cutover-pack.md` | Declared planned reference. |
| B-051 | Migration | Trial-balance-only migration rejection fixture | planned | `skills/opening-balances-and-migration-playbook/examples/sme-cutover-pack-2026-04-30.md` | Declared planned example. |
| B-060 | Reconciliation | Reconciliation plan checklist | present | `skills/bank-and-mobile-money-reconciliation/SKILL.md` | Active skill. |
| B-061 | Reconciliation | Reconciliation triage UI example | planned | `skills/finance-ui-pattern-library/examples/reconciliation-triage.md` | Declared planned example. |
| B-062 | Reconciliation | Feed-before-match rejection rule | present | `skills/bank-and-mobile-money-reconciliation/SKILL.md` | Active skill. |
| B-070 | UX | Posted-record destructive verb lint | present | `skills/finance-ui-pattern-library/references/lint-checks.md` | Present lint rule L-01. |
| B-071 | UX | Gross-only display lint/checklist | present | `skills/finance-ui-pattern-library/references/lint-checks.md` | Present lint rule L-07. |
| B-072 | UX | Drilldown affordance checklist | present | `doctrine/references/required-patterns.md` | Present required pattern. |
| B-073 | UX | Semantic color lint | present | `skills/finance-ui-pattern-library/references/lint-checks.md` | Present lint rule L-02. |
| B-074 | UX | Controlled status taxonomy lint | present | `skills/finance-ui-pattern-library/references/lint-checks.md` | Present lint rule L-05 and status taxonomy reference. |
| B-075 | UX | Print stylesheet checklist | present | `doctrine/references/print-fidelity.md` | Present print fidelity reference. |
| B-076 | UX | Role-conditioned shell checklist | present | `doctrine/references/role-conditioned-shell.md` | Present role shell reference. |
| B-080 | Proposals and business plans | Vendor-replacement caveat checklist | present | `integration/deprecation-list.md` | Present deprecation guidance. |
| B-081 | Proposals and business plans | Country-context permanent fact source gate | present | `tools/check-source-register.ps1` | Present validator; country source entries are planned. |
| B-082 | Proposals and business plans | Business-plan framework header checklist | planned | `doctrine/examples/reporting-basis-2026.md` | Planned reporting-basis fixture. |
| B-083 | Proposals and business plans | Third-party-product-first language checklist | present | `integration/deprecation-list.md` | Present deprecation guidance. |
| B-090 | Reviewers | Required reviewer role matrix | planned | `skills/engagement-quality-and-plain-language-output/SKILL.md` | Planned engagement-quality skill. |
| B-091 | Reviewers | Final release sign-off checklist | planned | `docs/validation-report-template.md` | Template present; role matrix remains planned. |

## Coverage Summary

| Metric | Value |
|---|---|
| Blockers in quality gate | 40 |
| Mapped rows | 40 |
| Present evidence rows | 25 |
| Planned evidence rows | 15 |
| External-only rows | 0 |
| Deprecated-only rows | 0 |

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
