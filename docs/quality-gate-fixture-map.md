# Quality Gate Fixture Map

Purpose: map every finance quality-gate blocker in `governance/finance-accounting-quality-gate.md` to an existing check, present fixture, or reviewed fixture. Final statutory, ledger-affecting, or client-facing release still requires the relevant source-register entries, reviewer approvals, and consumer-repo executable tests where the blocker depends on live implementation code.

| Blocker | Area | Fixture or check | State | Evidence path | Notes |
|---|---|---|---|---|---|
| B-001 | Doctrine and framework | Framework header checklist | present | `docs/quality-gate-fixtures/framework-selection-checks.md#fixture-missing-framework-header` | Reviewed fail/pass fixture for missing `Framework:` header. |
| B-002 | Doctrine and framework | Explicit framework-selection checklist | present | `docs/quality-gate-fixtures/framework-selection-checks.md#fixture-us-gaap-without-client-selection` | Blocks US GAAP unless selected by client policy evidence. |
| B-003 | Doctrine and framework | Unsupported costing method rejection fixture | present | `docs/quality-gate-fixtures/unsupported-costing-method-rejection.md` | Reviewed LIFO rejection fixture. |
| B-004 | Doctrine and framework | Mixed framework policy-change checklist | present | `docs/quality-gate-fixtures/framework-selection-checks.md#fixture-mixed-framework-policy-change` | Reviewed mixed-framework policy-change fixture. |
| B-010 | Ledger | Posting-service boundary invariant | present | `docs/quality-gate-fixtures/ledger-boundary-and-lock-fixtures.md#fixture-direct-journal-line-write` | Reviewed direct-write rejection fixture; executable tests remain consumer-repo responsibility. |
| B-011 | Ledger | Balanced journal fixture | present | `docs/quality-gate-fixtures/journal-balance-and-audit-fixtures.md#fixture-single-sided-ledger-effect` | Reviewed single-sided rejection and balanced journal fixture. |
| B-012 | Ledger | Reversal-only correction fixture | present | `doctrine/examples/reversal-pattern.md` | Present correction pattern. |
| B-013 | Ledger | Locked-period rejection fixture | present | `docs/quality-gate-fixtures/ledger-boundary-and-lock-fixtures.md#fixture-locked-period-posting` | Reviewed locked-period fail/pass fixture. |
| B-014 | Ledger | Audit-log field checklist | present | `docs/quality-gate-fixtures/journal-balance-and-audit-fixtures.md#fixture-missing-audit-log-fields` | Reviewed missing-audit-fields rejection fixture. |
| B-015 | Ledger | Reposting-after-edit rejection fixture | present | `doctrine/examples/reversal-pattern.md` | Present reversal pattern. |
| B-020 | CoA | Controlled account taxonomy check | present | `doctrine/references/chart-of-accounts.md` | Present CoA reference. |
| B-021 | CoA | VAT control-account decomposition fixture | present | `doctrine/examples/vat-inclusive-posting.md` | Present example. |
| B-022 | CoA | Control-account subledger tie-out checklist | present | `docs/quality-gate-fixtures/control-account-tieout-fixture.md` | Reviewed control-account tie-out fixture. |
| B-023 | CoA | Migration suspense zero or waiver fixture | present | `docs/quality-gate-fixtures/migration-cutover-fixtures.md#fixture-migration-suspense-not-cleared` | Reviewed suspense-zero fixture. |
| B-030 | Tax and statutory | Hardcoded statutory value scan | present | `tools/check-source-register.ps1` | Present source-register gate; deeper code scanning belongs in consumer repos. |
| B-031 | Tax and statutory | Net/tax/gross VAT-inclusive posting fixture | present | `doctrine/examples/vat-inclusive-posting.md` | Present example. |
| B-032 | Tax and statutory | Tax-code effective-period checklist | present | `doctrine/examples/vat-inclusive-posting.md` | Present example notes require effective periods. |
| B-033 | Tax and statutory | Return-template verified-version check | present | `docs/quality-gate-fixtures/return-template-version-check.md` | Reviewed source-register-backed return-template fixture. |
| B-034 | Tax and statutory | Return-pack vs automated-filing language checklist | present | `doctrine/references/tax-vat-and-returns.md` | Present doctrine reference. |
| B-040 | Live-rate | verified-current source-register check | present | `tools/check-source-register.ps1` | Present validator; Uganda NSSF contribution entry is verified-current, other statutory entries remain draft until separately verified. |
| B-041 | Live-rate | Recheck-date staleness check | present | `tools/check-source-register.ps1` | Present validator. |
| B-042 | Live-rate | Verifier and date metadata check | present | `tools/check-source-register.ps1` | Present validator. |
| B-050 | Migration | Opening-balance sign-off checklist | present | `docs/quality-gate-fixtures/migration-cutover-fixtures.md#fixture-missing-opening-balance-sign-off` | Reviewed opening-balance sign-off fixture. |
| B-051 | Migration | Trial-balance-only migration rejection fixture | present | `docs/quality-gate-fixtures/migration-cutover-fixtures.md#fixture-trial-balance-only-migration` | Reviewed trial-balance-only rejection fixture. |
| B-060 | Reconciliation | Reconciliation plan checklist | present | `skills/bank-and-mobile-money-reconciliation/SKILL.md` | Active skill. |
| B-061 | Reconciliation | Reconciliation triage UI example | present | `docs/quality-gate-fixtures/reconciliation-triage-fixture.md` | Reviewed downloadable-report rejection and triage-UI fixture. |
| B-062 | Reconciliation | Feed-before-match rejection rule | present | `skills/bank-and-mobile-money-reconciliation/SKILL.md` | Active skill. |
| B-070 | UX | Posted-record destructive verb lint | present | `skills/finance-ui-pattern-library/references/lint-checks.md` | Present lint rule L-01. |
| B-071 | UX | Gross-only display lint/checklist | present | `skills/finance-ui-pattern-library/references/lint-checks.md` | Present lint rule L-07. |
| B-072 | UX | Drilldown affordance checklist | present | `doctrine/references/required-patterns.md` | Present required pattern. |
| B-073 | UX | Semantic color lint | present | `skills/finance-ui-pattern-library/references/lint-checks.md` | Present lint rule L-02. |
| B-074 | UX | Controlled status taxonomy lint | present | `skills/finance-ui-pattern-library/references/lint-checks.md` | Present lint rule L-05 and status taxonomy reference. |
| B-075 | UX | Print stylesheet checklist | present | `doctrine/references/print-fidelity.md` | Present print fidelity reference. |
| B-076 | UX | Role-conditioned shell checklist | present | `doctrine/references/role-conditioned-shell.md` | Present role shell reference. |
| B-080 | Proposals and business plans | Vendor-replacement caveat checklist | present | `integration/deprecation-list.md` | Present deprecation guidance. |
| B-081 | Proposals and business plans | Country-context permanent fact source gate | present | `tools/check-source-register.ps1` | Present validator; country-context facts still require verified source-register coverage per fact. |
| B-082 | Proposals and business plans | Business-plan framework header checklist | present | `docs/quality-gate-fixtures/framework-selection-checks.md#fixture-business-plan-framework-header` | Reviewed business-plan framework-header fixture. |
| B-083 | Proposals and business plans | Third-party-product-first language checklist | present | `integration/deprecation-list.md` | Present deprecation guidance. |
| B-090 | Reviewers | Required reviewer role matrix | present | `docs/quality-gate-fixtures/reviewer-signoff-fixtures.md#fixture-missing-required-reviewer-role` | Reviewed reviewer-role matrix fixture. |
| B-091 | Reviewers | Final release sign-off checklist | present | `docs/quality-gate-fixtures/reviewer-signoff-fixtures.md#fixture-missing-final-release-sign-off` | Reviewed final-release sign-off fixture. |

## Coverage Summary

| Metric | Value |
|---|---|
| Blockers in quality gate | 40 |
| Mapped rows | 40 |
| Present evidence rows | 40 |
| Planned evidence rows | 0 |
| External-only rows | 0 |
| Deprecated-only rows | 0 |

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
