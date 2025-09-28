# Appendix: Full Content Inventory

This inventory was captured before the audit reports were written. It excludes VCS/cache/dependency internals: `.git`, `node_modules`, `.venv`, `venv`, `__pycache__`, and `.pytest_cache`.

## Empty Directories

None.

## Temp/Backup Artefacts

None.

## Duplicate Content Hash Groups (Sample)

None detected.

## Full Tree

```text
./
.gitignore (177 bytes)
README.md (10014 bytes)
.github/
  .github/workflows/
    doctrine-validation.yml (733 bytes)
docs/
  quality-gate-fixture-map.md (8275 bytes)
  reference-manifest.md (24251 bytes)
  release-manifest-template.yaml (4237 bytes)
  validation-report-current.json (3112 bytes)
  validation-report-template.md (2520 bytes)
  docs/analysis/
    00-index.md (2588 bytes)
    01-executive-summary.md (2263 bytes)
    02-category-reorganization.md (8305 bytes)
    03-gap-register.md (14838 bytes)
    04-skills-matrix.md (7460 bytes)
    05-roadmap-for-uplift.md (10946 bytes)
    06-methodology-and-evidence.md (6182 bytes)
    07-gap-closure-and-hardening.md (1857 bytes)
  docs/audit-export-sample/
    00-index.md (1843 bytes)
    manifest.yaml (1868 bytes)
    docs/audit-export-sample/evidence/
      docs/audit-export-sample/evidence/bank-statements/
        README.md (243 bytes)
      docs/audit-export-sample/evidence/invoices/
        README.md (539 bytes)
      docs/audit-export-sample/evidence/receipts/
        README.md (274 bytes)
    docs/audit-export-sample/hashes/
      README.md (785 bytes)
      sha256sums.txt (84 bytes)
    docs/audit-export-sample/ledger/
      journal-lines.csv (262 bytes)
      journals.csv (203 bytes)
      source-document-map.csv (205 bytes)
    docs/audit-export-sample/reports/
      cash-movement.md (444 bytes)
      financial-position.md (471 bytes)
      profit-or-loss.md (650 bytes)
      tax-control-reconciliation.md (690 bytes)
      trial-balance.md (527 bytes)
    docs/audit-export-sample/signoffs/
      controller.md (478 bytes)
      preparer.md (429 bytes)
      reviewer.md (440 bytes)
  docs/fin-analysis/
    00-index.md (2752 bytes)
    01-executive-summary.md (2772 bytes)
    02-system-scorecard-100.md (3696 bytes)
    03-findings-register.md (2997 bytes)
    04-skill-realignment.md (3089 bytes)
    05-remediation-roadmap.md (3302 bytes)
    06-implementation-standards-and-snippets.md (2700 bytes)
    07-standards-and-source-references.md (2137 bytes)
    08-target-90-evidence-package.md (2441 bytes)
    09-finding-closure-matrix.md (2428 bytes)
    10-implementation-backlog.md (3376 bytes)
    11-definition-of-done-and-rescore.md (2601 bytes)
    world-class-finance-engine-analysis.md (4334 bytes)
  docs/quality-gate-fixtures/
    control-account-tieout-fixture.md (854 bytes)
    framework-selection-checks.md (2151 bytes)
    journal-balance-and-audit-fixtures.md (1212 bytes)
    ledger-boundary-and-lock-fixtures.md (1170 bytes)
    migration-cutover-fixtures.md (1541 bytes)
    reconciliation-triage-fixture.md (904 bytes)
    return-template-version-check.md (988 bytes)
    reviewer-signoff-fixtures.md (1337 bytes)
    unsupported-costing-method-rejection.md (912 bytes)
    docs/quality-gate-fixtures/source-register-evidence/
      uganda-nssf-membership-2026-05-15.md (1156 bytes)
doctrine/
  accounting-finance-doctrine.md (13374 bytes)
  doctrine/examples/
    coa-seed-uganda-sme.md (9183 bytes)
    reconciliation-evidence-pack.md (4193 bytes)
    reporting-basis-2026.md (2617 bytes)
    reporting-basis-2027-ifrs18.md (2659 bytes)
    reporting-basis-2027-smes-third-edition.md (2388 bytes)
    reversal-pattern.md (4190 bytes)
    vat-inclusive-posting.md (3945 bytes)
  doctrine/references/
    chart-of-accounts.md (6254 bytes)
    country-extension-framework.md (3365 bytes)
    design-anti-patterns.md (4876 bytes)
    design-system-finance-accounting.md (8290 bytes)
    forbidden-patterns.md (4673 bytes)
    full-ifrs-overlay.md (4964 bytes)
    ifrs-18-presentation-transition.md (3013 bytes)
    ifrs-for-smes-default.md (6327 bytes)
    ifrs-for-smes-third-edition-transition.md (3106 bytes)
    ledger-invariants.md (5908 bytes)
    live-rate-verification-protocol.md (5767 bytes)
    policy-hierarchy.md (3664 bytes)
    print-fidelity.md (4120 bytes)
    required-patterns.md (4218 bytes)
    requirement-id-library.md (5766 bytes)
    role-conditioned-shell.md (4854 bytes)
    standards-transition-2027.md (5675 bytes)
    status-taxonomy.md (3897 bytes)
    tax-vat-and-returns.md (6098 bytes)
    terminology-glossary.md (5445 bytes)
    uganda-compliance-caveats.md (5138 bytes)
    uganda-ngo-financial-management-patterns.md (9865 bytes)
    uganda-public-sector-pfm.md (11772 bytes)
    versioning-and-changelog.md (2129 bytes)
  doctrine/source-register/
    README.md (3352 bytes)
    schema.yaml (3112 bytes)
    doctrine/source-register/kenya/
      README.md (1004 bytes)
      etims.yaml (806 bytes)
      vat.yaml (768 bytes)
    doctrine/source-register/rwanda/
      README.md (988 bytes)
    doctrine/source-register/south-africa/
      README.md (1057 bytes)
    doctrine/source-register/tanzania/
      README.md (996 bytes)
    doctrine/source-register/uganda/
      README.md (1920 bytes)
      efris.yaml (913 bytes)
      exchange-rates.yaml (957 bytes)
      income-tax.yaml (875 bytes)
      nssf.yaml (1343 bytes)
      paye.yaml (815 bytes)
      vat.yaml (1633 bytes)
      wht.yaml (840 bytes)
governance/
  cleanup-backlog.md (6888 bytes)
  finance-accounting-quality-gate.md (7703 bytes)
  how-to-reference-this-doctrine.md (4775 bytes)
integration/
  changelog-entries.md (5961 bytes)
  deprecation-list.md (2576 bytes)
  integration-plan.md (6861 bytes)
  mirror.ps1.retired (4515 bytes)
skills/
  skills/01-foundations/
    README.md (517 bytes)
    skills/01-foundations/chart-of-accounts-design-and-governance/
      SKILL.md (7135 bytes)
      skills/01-foundations/chart-of-accounts-design-and-governance/examples/
        worked-example.md (2458 bytes)
      skills/01-foundations/chart-of-accounts-design-and-governance/references/
        implementation-rules.md (3036 bytes)
        source-basis.md (1829 bytes)
    skills/01-foundations/functional-and-presentation-currency/
      SKILL.md (7066 bytes)
      skills/01-foundations/functional-and-presentation-currency/examples/
        worked-example.md (2455 bytes)
      skills/01-foundations/functional-and-presentation-currency/references/
        implementation-rules.md (3033 bytes)
        source-basis.md (1826 bytes)
    skills/01-foundations/ledger-posting-engine-core/
      SKILL.md (6935 bytes)
      skills/01-foundations/ledger-posting-engine-core/examples/
        customer-receipt-allocation.md (577 bytes)
        foreign-currency-bank-receipt.md (597 bytes)
        rejected-unbalanced-entry.md (408 bytes)
        reversal.md (593 bytes)
        supplier-bill-and-payment.md (740 bytes)
        vat-inclusive-cash-sale.md (797 bytes)
      skills/01-foundations/ledger-posting-engine-core/references/
        event-to-journal-map.md (1369 bytes)
        idempotency-and-reversal-rules.md (999 bytes)
        invariant-tests.md (1121 bytes)
        journal-entry-schema.md (1822 bytes)
        posting-service-contract.md (1822 bytes)
    skills/01-foundations/management-accounting-dimensions/
      SKILL.md (8795 bytes)
      skills/01-foundations/management-accounting-dimensions/examples/
        contribution-margin-by-branch.md (1485 bytes)
      skills/01-foundations/management-accounting-dimensions/references/
        allocation-rules-pattern.md (1716 bytes)
        dimensions-spec.md (2029 bytes)
    skills/01-foundations/period-locking-and-data-immutability/
      SKILL.md (7076 bytes)
      skills/01-foundations/period-locking-and-data-immutability/examples/
        worked-example.md (2455 bytes)
      skills/01-foundations/period-locking-and-data-immutability/references/
        implementation-rules.md (3033 bytes)
        source-basis.md (1826 bytes)
  skills/02-ifrs-core-standards/
    README.md (667 bytes)
    skills/02-ifrs-core-standards/ifrs-borrowing-costs-ias23/
      SKILL.md (7093 bytes)
      skills/02-ifrs-core-standards/ifrs-borrowing-costs-ias23/examples/
        worked-example.md (2495 bytes)
      skills/02-ifrs-core-standards/ifrs-borrowing-costs-ias23/references/
        implementation-rules.md (3073 bytes)
        source-basis.md (2423 bytes)
    skills/02-ifrs-core-standards/ifrs-employee-benefits-ias19/
      SKILL.md (7144 bytes)
      skills/02-ifrs-core-standards/ifrs-employee-benefits-ias19/examples/
        worked-example.md (2497 bytes)
      skills/02-ifrs-core-standards/ifrs-employee-benefits-ias19/references/
        implementation-rules.md (3075 bytes)
        source-basis.md (2425 bytes)
    skills/02-ifrs-core-standards/ifrs-financial-instruments/
      SKILL.md (8286 bytes)
      skills/02-ifrs-core-standards/ifrs-financial-instruments/references/
        effective-interest-schedule.md (1377 bytes)
        ifrs-9-ecl-simplified-trade-receivables.md (1484 bytes)
        section-11-impairment.md (1632 bytes)
    skills/02-ifrs-core-standards/ifrs-for-smes-equivalents/
      SKILL.md (10806 bytes)
      skills/02-ifrs-core-standards/ifrs-for-smes-equivalents/references/
        client-profile-decision-tree.md (1539 bytes)
        full-ifrs-to-sme-mapping.md (2359 bytes)
    skills/02-ifrs-core-standards/ifrs-foreign-currency-translation-ias21/
      SKILL.md (7148 bytes)
      skills/02-ifrs-core-standards/ifrs-foreign-currency-translation-ias21/examples/
        worked-example.md (2508 bytes)
      skills/02-ifrs-core-standards/ifrs-foreign-currency-translation-ias21/references/
        implementation-rules.md (3086 bytes)
        source-basis.md (2436 bytes)
    skills/02-ifrs-core-standards/ifrs-intangible-assets-ias38/
      SKILL.md (7130 bytes)
      skills/02-ifrs-core-standards/ifrs-intangible-assets-ias38/examples/
        worked-example.md (2497 bytes)
      skills/02-ifrs-core-standards/ifrs-intangible-assets-ias38/references/
        implementation-rules.md (3075 bytes)
        source-basis.md (2425 bytes)
    skills/02-ifrs-core-standards/ifrs-leases/
      SKILL.md (7768 bytes)
      skills/02-ifrs-core-standards/ifrs-leases/references/
        exemption-test.md (1534 bytes)
        full-ifrs-16-lessee-model.md (1836 bytes)
    skills/02-ifrs-core-standards/ifrs-property-plant-equipment-ias16/
      SKILL.md (7130 bytes)
      skills/02-ifrs-core-standards/ifrs-property-plant-equipment-ias16/examples/
        worked-example.md (2504 bytes)
      skills/02-ifrs-core-standards/ifrs-property-plant-equipment-ias16/references/
        implementation-rules.md (3082 bytes)
        source-basis.md (2432 bytes)
    skills/02-ifrs-core-standards/ifrs-revenue-recognition/
      SKILL.md (11227 bytes)
      skills/02-ifrs-core-standards/ifrs-revenue-recognition/examples/
        multi-element-software-licence-plus-support.md (1495 bytes)
      skills/02-ifrs-core-standards/ifrs-revenue-recognition/references/
        ifrs-15-five-step.md (1891 bytes)
        section-23-summary.md (1649 bytes)
  skills/03-ifrs-specialised-standards/
    README.md (1124 bytes)
    skills/03-ifrs-specialised-standards/ias-agriculture/
      SKILL.md (11009 bytes)
      skills/03-ifrs-specialised-standards/ias-agriculture/examples/
        birdc-layer-flock-q2-2026.md (1474 bytes)
      skills/03-ifrs-specialised-standards/ias-agriculture/references/
        cohort-data-model.md (2212 bytes)
        fair-value-methodology.md (2460 bytes)
    skills/03-ifrs-specialised-standards/ias-government-grants/
      SKILL.md (7495 bytes)
      skills/03-ifrs-specialised-standards/ias-government-grants/examples/
        ngo-restricted-grant-cycle.md (1247 bytes)
      skills/03-ifrs-specialised-standards/ias-government-grants/references/
        donor-restriction-pattern.md (1949 bytes)
        grant-register-schema.md (2017 bytes)
    skills/03-ifrs-specialised-standards/ias-impairment/
      SKILL.md (7496 bytes)
      skills/03-ifrs-specialised-standards/ias-impairment/references/
        indicator-checklist.md (1742 bytes)
        value-in-use-workpaper-template.md (1667 bytes)
    skills/03-ifrs-specialised-standards/ias-income-tax-deferred-tax/
      SKILL.md (10082 bytes)
      skills/03-ifrs-specialised-standards/ias-income-tax-deferred-tax/examples/
        sme-tax-provision-2026-04.md (1472 bytes)
      skills/03-ifrs-specialised-standards/ias-income-tax-deferred-tax/references/
        recognition-checklist.md (1458 bytes)
        temporary-difference-catalog.md (1826 bytes)
    skills/03-ifrs-specialised-standards/ias-provisions-contingencies/
      SKILL.md (7269 bytes)
      skills/03-ifrs-specialised-standards/ias-provisions-contingencies/references/
        onerous-contract-test.md (1388 bytes)
        recognition-decision-tree.md (1457 bytes)
    skills/03-ifrs-specialised-standards/ifrs-accounting-policies-changes-errors-ias8/
      SKILL.md (7131 bytes)
      skills/03-ifrs-specialised-standards/ifrs-accounting-policies-changes-errors-ias8/examples/
        worked-example.md (2513 bytes)
      skills/03-ifrs-specialised-standards/ifrs-accounting-policies-changes-errors-ias8/references/
        implementation-rules.md (3091 bytes)
        source-basis.md (2441 bytes)
    skills/03-ifrs-specialised-standards/ifrs-associates-and-joint-arrangements/
      SKILL.md (7116 bytes)
      skills/03-ifrs-specialised-standards/ifrs-associates-and-joint-arrangements/examples/
        worked-example.md (2507 bytes)
      skills/03-ifrs-specialised-standards/ifrs-associates-and-joint-arrangements/references/
        implementation-rules.md (3085 bytes)
        source-basis.md (2435 bytes)
    skills/03-ifrs-specialised-standards/ifrs-business-combinations-ifrs3/
      SKILL.md (7134 bytes)
      skills/03-ifrs-specialised-standards/ifrs-business-combinations-ifrs3/examples/
        worked-example.md (2501 bytes)
      skills/03-ifrs-specialised-standards/ifrs-business-combinations-ifrs3/references/
        implementation-rules.md (3079 bytes)
        source-basis.md (2429 bytes)
    skills/03-ifrs-specialised-standards/ifrs-discontinued-operations-ifrs5/
      SKILL.md (7077 bytes)
      skills/03-ifrs-specialised-standards/ifrs-discontinued-operations-ifrs5/examples/
        worked-example.md (2503 bytes)
      skills/03-ifrs-specialised-standards/ifrs-discontinued-operations-ifrs5/references/
        implementation-rules.md (3081 bytes)
        source-basis.md (2431 bytes)
    skills/03-ifrs-specialised-standards/ifrs-earnings-per-share-ias33/
      SKILL.md (7084 bytes)
      skills/03-ifrs-specialised-standards/ifrs-earnings-per-share-ias33/examples/
        worked-example.md (2498 bytes)
      skills/03-ifrs-specialised-standards/ifrs-earnings-per-share-ias33/references/
        implementation-rules.md (3076 bytes)
        source-basis.md (2426 bytes)
    skills/03-ifrs-specialised-standards/ifrs-events-after-reporting-period-ias10/
      SKILL.md (7124 bytes)
      skills/03-ifrs-specialised-standards/ifrs-events-after-reporting-period-ias10/examples/
        worked-example.md (2509 bytes)
      skills/03-ifrs-specialised-standards/ifrs-events-after-reporting-period-ias10/references/
        implementation-rules.md (3087 bytes)
        source-basis.md (2437 bytes)
    skills/03-ifrs-specialised-standards/ifrs-fair-value-measurement-ifrs13/
      SKILL.md (7113 bytes)
      skills/03-ifrs-specialised-standards/ifrs-fair-value-measurement-ifrs13/examples/
        worked-example.md (2503 bytes)
      skills/03-ifrs-specialised-standards/ifrs-fair-value-measurement-ifrs13/references/
        implementation-rules.md (3081 bytes)
        source-basis.md (2431 bytes)
    skills/03-ifrs-specialised-standards/ifrs-first-time-adoption-ifrs1/
      SKILL.md (7132 bytes)
      skills/03-ifrs-specialised-standards/ifrs-first-time-adoption-ifrs1/examples/
        worked-example.md (2499 bytes)
      skills/03-ifrs-specialised-standards/ifrs-first-time-adoption-ifrs1/references/
        implementation-rules.md (3077 bytes)
        source-basis.md (2427 bytes)
    skills/03-ifrs-specialised-standards/ifrs-insurance-contracts-ifrs17/
      SKILL.md (7089 bytes)
      skills/03-ifrs-specialised-standards/ifrs-insurance-contracts-ifrs17/examples/
        worked-example.md (2500 bytes)
      skills/03-ifrs-specialised-standards/ifrs-insurance-contracts-ifrs17/references/
        implementation-rules.md (3078 bytes)
        source-basis.md (2428 bytes)
    skills/03-ifrs-specialised-standards/ifrs-investment-property-ias40/
      SKILL.md (7089 bytes)
      skills/03-ifrs-specialised-standards/ifrs-investment-property-ias40/examples/
        worked-example.md (2499 bytes)
      skills/03-ifrs-specialised-standards/ifrs-investment-property-ias40/references/
        implementation-rules.md (3077 bytes)
        source-basis.md (2427 bytes)
    skills/03-ifrs-specialised-standards/ifrs-related-party-disclosures-ias24/
      SKILL.md (7123 bytes)
      skills/03-ifrs-specialised-standards/ifrs-related-party-disclosures-ias24/examples/
        worked-example.md (2505 bytes)
      skills/03-ifrs-specialised-standards/ifrs-related-party-disclosures-ias24/references/
        implementation-rules.md (3083 bytes)
        source-basis.md (2433 bytes)
    skills/03-ifrs-specialised-standards/ifrs-segment-reporting-ifrs8/
      SKILL.md (7133 bytes)
      skills/03-ifrs-specialised-standards/ifrs-segment-reporting-ifrs8/examples/
        worked-example.md (2497 bytes)
      skills/03-ifrs-specialised-standards/ifrs-segment-reporting-ifrs8/references/
        implementation-rules.md (3075 bytes)
        source-basis.md (2425 bytes)
    skills/03-ifrs-specialised-standards/ifrs-share-based-payment-ifrs2/
      SKILL.md (7131 bytes)
      skills/03-ifrs-specialised-standards/ifrs-share-based-payment-ifrs2/examples/
        worked-example.md (2499 bytes)
      skills/03-ifrs-specialised-standards/ifrs-share-based-payment-ifrs2/references/
        implementation-rules.md (3077 bytes)
        source-basis.md (2427 bytes)
  skills/04-subledgers-and-operations/
    README.md (638 bytes)
    skills/04-subledgers-and-operations/bank-and-mobile-money-reconciliation/
      SKILL.md (12789 bytes)
      skills/04-subledgers-and-operations/bank-and-mobile-money-reconciliation/examples/
        mtn-momo-month-end.md (3113 bytes)
      skills/04-subledgers-and-operations/bank-and-mobile-money-reconciliation/references/
        data-model.sql (2979 bytes)
        match-rules.md (3165 bytes)
        provider-quirks.md (2673 bytes)
    skills/04-subledgers-and-operations/expense-management-and-staff-claims/
      SKILL.md (7101 bytes)
      skills/04-subledgers-and-operations/expense-management-and-staff-claims/examples/
        worked-example.md (2452 bytes)
      skills/04-subledgers-and-operations/expense-management-and-staff-claims/references/
        implementation-rules.md (3030 bytes)
        source-basis.md (1825 bytes)
    skills/04-subledgers-and-operations/fixed-assets-and-depreciation/
      SKILL.md (6490 bytes)
      skills/04-subledgers-and-operations/fixed-assets-and-depreciation/examples/
        acquisition-fixture.md (468 bytes)
        disposal-gain-loss-fixture.md (560 bytes)
        impairment-indicator-checklist.md (468 bytes)
        monthly-depreciation-fixture.md (502 bytes)
        register-to-gl-tieout.md (408 bytes)
      skills/04-subledgers-and-operations/fixed-assets-and-depreciation/references/
        asset-register-fields.md (1279 bytes)
        depreciation-and-disposal-rules.md (877 bytes)
        domain-acceptance-tests.md (864 bytes)
    skills/04-subledgers-and-operations/inventory-costing-and-stock-accounting/
      SKILL.md (6209 bytes)
      skills/04-subledgers-and-operations/inventory-costing-and-stock-accounting/examples/
        fifo-costing-fixture.md (504 bytes)
        nrv-write-down-fixture.md (521 bytes)
        rejected-unsupported-costing-method.md (434 bytes)
        stock-count-variance-fixture.md (494 bytes)
        weighted-average-fixture.md (592 bytes)
      skills/04-subledgers-and-operations/inventory-costing-and-stock-accounting/references/
        domain-acceptance-tests.md (842 bytes)
        inventory-posting-rules.md (1187 bytes)
    skills/04-subledgers-and-operations/payroll-and-statutory-postings-east-africa/
      SKILL.md (6451 bytes)
      skills/04-subledgers-and-operations/payroll-and-statutory-postings-east-africa/examples/
        payroll-journal-fixture.md (807 bytes)
        payslip-to-gl-reconciliation.md (560 bytes)
        stale-rate-rejection.md (372 bytes)
        statutory-liability-schedule.md (571 bytes)
      skills/04-subledgers-and-operations/payroll-and-statutory-postings-east-africa/references/
        domain-acceptance-tests.md (880 bytes)
        payroll-event-model.md (1198 bytes)
        statutory-source-gates.md (965 bytes)
    skills/04-subledgers-and-operations/petty-cash-and-imprest-management/
      SKILL.md (7458 bytes)
      skills/04-subledgers-and-operations/petty-cash-and-imprest-management/examples/
        uganda-worked-example.md (4867 bytes)
        worked-example.md (2450 bytes)
      skills/04-subledgers-and-operations/petty-cash-and-imprest-management/references/
        implementation-rules.md (3028 bytes)
        source-basis.md (2308 bytes)
    skills/04-subledgers-and-operations/pos-and-cash-drawer-management/
      SKILL.md (7075 bytes)
      skills/04-subledgers-and-operations/pos-and-cash-drawer-management/examples/
        worked-example.md (2447 bytes)
      skills/04-subledgers-and-operations/pos-and-cash-drawer-management/references/
        implementation-rules.md (3025 bytes)
        source-basis.md (1820 bytes)
  skills/05-receivables-payables-and-treasury/
    README.md (533 bytes)
    skills/05-receivables-payables-and-treasury/accounts-payable-and-supplier-management/
      SKILL.md (7235 bytes)
      skills/05-receivables-payables-and-treasury/accounts-payable-and-supplier-management/examples/
        worked-example.md (2485 bytes)
      skills/05-receivables-payables-and-treasury/accounts-payable-and-supplier-management/references/
        implementation-rules.md (3063 bytes)
        source-basis.md (2437 bytes)
    skills/05-receivables-payables-and-treasury/accounts-receivable-and-credit-management/
      SKILL.md (7137 bytes)
      skills/05-receivables-payables-and-treasury/accounts-receivable-and-credit-management/examples/
        worked-example.md (2486 bytes)
      skills/05-receivables-payables-and-treasury/accounts-receivable-and-credit-management/references/
        implementation-rules.md (3064 bytes)
        source-basis.md (2438 bytes)
    skills/05-receivables-payables-and-treasury/banking-facilities-and-covenants/
      SKILL.md (7096 bytes)
      skills/05-receivables-payables-and-treasury/banking-facilities-and-covenants/examples/
        worked-example.md (2477 bytes)
      skills/05-receivables-payables-and-treasury/banking-facilities-and-covenants/references/
        implementation-rules.md (3055 bytes)
        source-basis.md (2429 bytes)
    skills/05-receivables-payables-and-treasury/cash-flow-forecasting-and-treasury/
      SKILL.md (7121 bytes)
      skills/05-receivables-payables-and-treasury/cash-flow-forecasting-and-treasury/examples/
        worked-example.md (2479 bytes)
      skills/05-receivables-payables-and-treasury/cash-flow-forecasting-and-treasury/references/
        implementation-rules.md (3057 bytes)
        source-basis.md (2431 bytes)
    skills/05-receivables-payables-and-treasury/fx-management-and-hedging/
      SKILL.md (7107 bytes)
      skills/05-receivables-payables-and-treasury/fx-management-and-hedging/examples/
        worked-example.md (2470 bytes)
      skills/05-receivables-payables-and-treasury/fx-management-and-hedging/references/
        implementation-rules.md (3048 bytes)
        source-basis.md (2422 bytes)
  skills/06-close-consolidation-and-reporting/
    README.md (590 bytes)
    skills/06-close-consolidation-and-reporting/audit-pbc-and-evidence-management/
      SKILL.md (7028 bytes)
      skills/06-close-consolidation-and-reporting/audit-pbc-and-evidence-management/examples/
        worked-example.md (2461 bytes)
      skills/06-close-consolidation-and-reporting/audit-pbc-and-evidence-management/references/
        implementation-rules.md (3039 bytes)
        source-basis.md (1823 bytes)
    skills/06-close-consolidation-and-reporting/audit-ready-reporting-pack/
      SKILL.md (10834 bytes)
      skills/06-close-consolidation-and-reporting/audit-ready-reporting-pack/examples/
        may-2026-monthly-pack.md (2439 bytes)
      skills/06-close-consolidation-and-reporting/audit-ready-reporting-pack/references/
        auditor-export-format.md (2884 bytes)
        notes-templates.md (2367 bytes)
    skills/06-close-consolidation-and-reporting/consolidation-and-intercompany/
      SKILL.md (6557 bytes)
      skills/06-close-consolidation-and-reporting/consolidation-and-intercompany/examples/
        elimination-entry-fixture.md (472 bytes)
        group-trial-balance-pack.md (466 bytes)
        two-entity-intercompany-sale.md (489 bytes)
        unmatched-balance-exception-report.md (427 bytes)
      skills/06-close-consolidation-and-reporting/consolidation-and-intercompany/references/
        consolidation-workflow.md (980 bytes)
        domain-acceptance-tests.md (787 bytes)
        intercompany-matching-rules.md (793 bytes)
    skills/06-close-consolidation-and-reporting/continuous-close-and-flash-reporting/
      SKILL.md (7048 bytes)
      skills/06-close-consolidation-and-reporting/continuous-close-and-flash-reporting/examples/
        worked-example.md (2464 bytes)
      skills/06-close-consolidation-and-reporting/continuous-close-and-flash-reporting/references/
        implementation-rules.md (3042 bytes)
        source-basis.md (1826 bytes)
    skills/06-close-consolidation-and-reporting/finance-module-audit/
      SKILL.md (11750 bytes)
      skills/06-close-consolidation-and-reporting/finance-module-audit/references/
        audit-protocol.md (4778 bytes)
        remediation-master-plan.md (3429 bytes)
        report-template.md (2534 bytes)
        scorecard.md (4794 bytes)
    skills/06-close-consolidation-and-reporting/month-end-and-year-end-close-playbook/
      SKILL.md (10638 bytes)
      skills/06-close-consolidation-and-reporting/month-end-and-year-end-close-playbook/examples/
        first-close-checklist.md (1730 bytes)
      skills/06-close-consolidation-and-reporting/month-end-and-year-end-close-playbook/references/
        close-task-template.md (5042 bytes)
        year-end-extras.md (1864 bytes)
    skills/06-close-consolidation-and-reporting/opening-balances-and-migration-playbook/
      SKILL.md (12939 bytes)
      skills/06-close-consolidation-and-reporting/opening-balances-and-migration-playbook/examples/
        sme-cutover-pack-2026-04-30.md (2071 bytes)
      skills/06-close-consolidation-and-reporting/opening-balances-and-migration-playbook/references/
        cutover-pack.md (1848 bytes)
        legacy-source-extractors.md (1831 bytes)
  skills/07-financial-statements-and-disclosures/
    README.md (519 bytes)
    skills/07-financial-statements-and-disclosures/cash-flow-statement-ias7/
      SKILL.md (7153 bytes)
      skills/07-financial-statements-and-disclosures/cash-flow-statement-ias7/examples/
        worked-example.md (2486 bytes)
      skills/07-financial-statements-and-disclosures/cash-flow-statement-ias7/references/
        implementation-rules.md (3064 bytes)
        source-basis.md (2789 bytes)
    skills/07-financial-statements-and-disclosures/financial-statements-preparation/
      SKILL.md (7229 bytes)
      skills/07-financial-statements-and-disclosures/financial-statements-preparation/examples/
        worked-example.md (2494 bytes)
      skills/07-financial-statements-and-disclosures/financial-statements-preparation/references/
        implementation-rules.md (3072 bytes)
        source-basis.md (3232 bytes)
    skills/07-financial-statements-and-disclosures/going-concern-and-viability-assessment/
      SKILL.md (7153 bytes)
      skills/07-financial-statements-and-disclosures/going-concern-and-viability-assessment/examples/
        worked-example.md (2500 bytes)
      skills/07-financial-statements-and-disclosures/going-concern-and-viability-assessment/references/
        implementation-rules.md (3078 bytes)
        source-basis.md (2803 bytes)
    skills/07-financial-statements-and-disclosures/integrated-and-sustainability-reporting-s1-s2/
      SKILL.md (7215 bytes)
      skills/07-financial-statements-and-disclosures/integrated-and-sustainability-reporting-s1-s2/examples/
        worked-example.md (2513 bytes)
      skills/07-financial-statements-and-disclosures/integrated-and-sustainability-reporting-s1-s2/references/
        implementation-rules.md (3091 bytes)
        source-basis.md (2396 bytes)
    skills/07-financial-statements-and-disclosures/notes-and-disclosure-pack/
      SKILL.md (7154 bytes)
      skills/07-financial-statements-and-disclosures/notes-and-disclosure-pack/examples/
        worked-example.md (2487 bytes)
      skills/07-financial-statements-and-disclosures/notes-and-disclosure-pack/references/
        implementation-rules.md (3065 bytes)
        source-basis.md (2790 bytes)
  skills/08-tax-and-statutory/
    README.md (495 bytes)
    skills/08-tax-and-statutory/e-invoicing-and-fiscal-device-integration/
      SKILL.md (7150 bytes)
      skills/08-tax-and-statutory/e-invoicing-and-fiscal-device-integration/examples/
        worked-example.md (2491 bytes)
      skills/08-tax-and-statutory/e-invoicing-and-fiscal-device-integration/references/
        implementation-rules.md (3069 bytes)
        source-basis.md (2767 bytes)
    skills/08-tax-and-statutory/indirect-tax-vat-mechanics/
      SKILL.md (7079 bytes)
      skills/08-tax-and-statutory/indirect-tax-vat-mechanics/examples/
        worked-example.md (2476 bytes)
      skills/08-tax-and-statutory/indirect-tax-vat-mechanics/references/
        implementation-rules.md (3054 bytes)
        source-basis.md (2752 bytes)
    skills/08-tax-and-statutory/tax-statutory-source-register-and-country-packs/
      SKILL.md (6381 bytes)
      skills/08-tax-and-statutory/tax-statutory-source-register-and-country-packs/examples/
        country-pack-skeleton.md (603 bytes)
        source-register-entry-draft.md (734 bytes)
        stale-source-rejection.md (472 bytes)
      skills/08-tax-and-statutory/tax-statutory-source-register-and-country-packs/references/
        authority-hierarchy-east-africa.md (923 bytes)
        country-pack-gates.md (1436 bytes)
        source-register-contract.md (1933 bytes)
    skills/08-tax-and-statutory/transfer-pricing-documentation/
      SKILL.md (7101 bytes)
      skills/08-tax-and-statutory/transfer-pricing-documentation/examples/
        worked-example.md (2480 bytes)
      skills/08-tax-and-statutory/transfer-pricing-documentation/references/
        implementation-rules.md (3058 bytes)
        source-basis.md (2756 bytes)
    skills/08-tax-and-statutory/withholding-tax-and-treaties/
      SKILL.md (7066 bytes)
      skills/08-tax-and-statutory/withholding-tax-and-treaties/examples/
        worked-example.md (2478 bytes)
      skills/08-tax-and-statutory/withholding-tax-and-treaties/references/
        implementation-rules.md (3056 bytes)
        source-basis.md (2754 bytes)
  skills/09-budgeting-fpa-and-costing/
    README.md (500 bytes)
    skills/09-budgeting-fpa-and-costing/budgeting-and-rolling-forecasts/
      SKILL.md (7453 bytes)
      skills/09-budgeting-fpa-and-costing/budgeting-and-rolling-forecasts/examples/
        uganda-worked-example.md (5260 bytes)
        worked-example.md (2482 bytes)
      skills/09-budgeting-fpa-and-costing/budgeting-and-rolling-forecasts/references/
        implementation-rules.md (3060 bytes)
        source-basis.md (3369 bytes)
    skills/09-budgeting-fpa-and-costing/cost-accounting-methods/
      SKILL.md (7079 bytes)
      skills/09-budgeting-fpa-and-costing/cost-accounting-methods/examples/
        worked-example.md (2474 bytes)
      skills/09-budgeting-fpa-and-costing/cost-accounting-methods/references/
        implementation-rules.md (3052 bytes)
        source-basis.md (2420 bytes)
    skills/09-budgeting-fpa-and-costing/pricing-discounts-rebates-and-refunds/
      SKILL.md (7108 bytes)
      skills/09-budgeting-fpa-and-costing/pricing-discounts-rebates-and-refunds/examples/
        worked-example.md (2488 bytes)
      skills/09-budgeting-fpa-and-costing/pricing-discounts-rebates-and-refunds/references/
        implementation-rules.md (3066 bytes)
        source-basis.md (2434 bytes)
    skills/09-budgeting-fpa-and-costing/scenario-and-sensitivity-modelling/
      SKILL.md (7099 bytes)
      skills/09-budgeting-fpa-and-costing/scenario-and-sensitivity-modelling/examples/
        worked-example.md (2485 bytes)
      skills/09-budgeting-fpa-and-costing/scenario-and-sensitivity-modelling/references/
        implementation-rules.md (3063 bytes)
        source-basis.md (2431 bytes)
    skills/09-budgeting-fpa-and-costing/variance-analysis-and-kpi-reporting/
      SKILL.md (7093 bytes)
      skills/09-budgeting-fpa-and-costing/variance-analysis-and-kpi-reporting/examples/
        worked-example.md (2486 bytes)
      skills/09-budgeting-fpa-and-costing/variance-analysis-and-kpi-reporting/references/
        implementation-rules.md (3064 bytes)
        source-basis.md (2432 bytes)
  skills/10-controls-governance-and-fraud/
    README.md (599 bytes)
    skills/10-controls-governance-and-fraud/aml-kyc-and-suspicious-transaction-reporting/
      SKILL.md (7116 bytes)
      skills/10-controls-governance-and-fraud/aml-kyc-and-suspicious-transaction-reporting/examples/
        worked-example.md (2497 bytes)
      skills/10-controls-governance-and-fraud/aml-kyc-and-suspicious-transaction-reporting/references/
        implementation-rules.md (3075 bytes)
        source-basis.md (2125 bytes)
    skills/10-controls-governance-and-fraud/engagement-quality-and-plain-language-output/
      SKILL.md (6764 bytes)
      skills/10-controls-governance-and-fraud/engagement-quality-and-plain-language-output/examples/
        independence-ethics-caveat-template.md (676 bytes)
        rejected-missing-plain-language-layer.md (473 bytes)
        sign-off-template.md (613 bytes)
      skills/10-controls-governance-and-fraud/engagement-quality-and-plain-language-output/references/
        plain-language-output-pattern.md (848 bytes)
        quality-and-ethics-gates.md (989 bytes)
        reviewer-matrix.md (1015 bytes)
    skills/10-controls-governance-and-fraud/finance-doctrine-conformance-scanner/
      SKILL.md (7362 bytes)
      skills/10-controls-governance-and-fraud/finance-doctrine-conformance-scanner/examples/
        sample-scan-report.md (1686 bytes)
      skills/10-controls-governance-and-fraud/finance-doctrine-conformance-scanner/references/
        output-template.md (1362 bytes)
        review-rubric.md (3608 bytes)
    skills/10-controls-governance-and-fraud/forensic-accounting-and-anti-fraud/
      SKILL.md (7086 bytes)
      skills/10-controls-governance-and-fraud/forensic-accounting-and-anti-fraud/examples/
        worked-example.md (2459 bytes)
      skills/10-controls-governance-and-fraud/forensic-accounting-and-anti-fraud/references/
        implementation-rules.md (3037 bytes)
        source-basis.md (2416 bytes)
    skills/10-controls-governance-and-fraud/internal-controls-library/
      SKILL.md (10453 bytes)
      skills/10-controls-governance-and-fraud/internal-controls-library/examples/
        payment-approval-flow.md (1705 bytes)
        uganda-worked-example.md (4087 bytes)
      skills/10-controls-governance-and-fraud/internal-controls-library/references/
        exception-indicators.md (1994 bytes)
        sod-conflict-matrix.md (2892 bytes)
    skills/10-controls-governance-and-fraud/sox-style-icfr-documentation/
      SKILL.md (7066 bytes)
      skills/10-controls-governance-and-fraud/sox-style-icfr-documentation/examples/
        worked-example.md (2453 bytes)
      skills/10-controls-governance-and-fraud/sox-style-icfr-documentation/references/
        implementation-rules.md (3031 bytes)
        source-basis.md (2410 bytes)
    skills/10-controls-governance-and-fraud/whistleblowing-and-finance-ethics/
      SKILL.md (7049 bytes)
      skills/10-controls-governance-and-fraud/whistleblowing-and-finance-ethics/examples/
        worked-example.md (2458 bytes)
      skills/10-controls-governance-and-fraud/whistleblowing-and-finance-ethics/references/
        implementation-rules.md (3036 bytes)
        source-basis.md (2415 bytes)
  skills/11-sector-and-fund-accounting/
    README.md (612 bytes)
    skills/11-sector-and-fund-accounting/agribusiness-and-cooperative-pack/
      SKILL.md (7085 bytes)
      skills/11-sector-and-fund-accounting/agribusiness-and-cooperative-pack/examples/
        worked-example.md (2463 bytes)
      skills/11-sector-and-fund-accounting/agribusiness-and-cooperative-pack/references/
        implementation-rules.md (3041 bytes)
        source-basis.md (2430 bytes)
    skills/11-sector-and-fund-accounting/clinic-and-healthcare-accounting-pack/
      SKILL.md (7107 bytes)
      skills/11-sector-and-fund-accounting/clinic-and-healthcare-accounting-pack/examples/
        worked-example.md (2467 bytes)
      skills/11-sector-and-fund-accounting/clinic-and-healthcare-accounting-pack/references/
        implementation-rules.md (3045 bytes)
        source-basis.md (2434 bytes)
    skills/11-sector-and-fund-accounting/fintech-and-payments-pack/
      SKILL.md (7088 bytes)
      skills/11-sector-and-fund-accounting/fintech-and-payments-pack/examples/
        worked-example.md (2455 bytes)
      skills/11-sector-and-fund-accounting/fintech-and-payments-pack/references/
        implementation-rules.md (3033 bytes)
        source-basis.md (2422 bytes)
    skills/11-sector-and-fund-accounting/hospitality-and-restaurant-pack/
      SKILL.md (7083 bytes)
      skills/11-sector-and-fund-accounting/hospitality-and-restaurant-pack/examples/
        worked-example.md (2461 bytes)
      skills/11-sector-and-fund-accounting/hospitality-and-restaurant-pack/references/
        implementation-rules.md (3039 bytes)
        source-basis.md (2428 bytes)
    skills/11-sector-and-fund-accounting/ngo-and-fund-accounting/
      SKILL.md (7452 bytes)
      skills/11-sector-and-fund-accounting/ngo-and-fund-accounting/examples/
        uganda-worked-example.md (4804 bytes)
        worked-example.md (2453 bytes)
      skills/11-sector-and-fund-accounting/ngo-and-fund-accounting/references/
        implementation-rules.md (3031 bytes)
        source-basis.md (2881 bytes)
    skills/11-sector-and-fund-accounting/real-estate-and-property-pack/
      SKILL.md (7082 bytes)
      skills/11-sector-and-fund-accounting/real-estate-and-property-pack/examples/
        worked-example.md (2459 bytes)
      skills/11-sector-and-fund-accounting/real-estate-and-property-pack/references/
        implementation-rules.md (3037 bytes)
        source-basis.md (2426 bytes)
    skills/11-sector-and-fund-accounting/retail-and-pos-accounting-pack/
      SKILL.md (11651 bytes)
      skills/11-sector-and-fund-accounting/retail-and-pos-accounting-pack/examples/
        worked-example.md (4390 bytes)
      skills/11-sector-and-fund-accounting/retail-and-pos-accounting-pack/references/
        implementation-rules.md (4263 bytes)
        retail-event-controls.md (8187 bytes)
        source-basis.md (2956 bytes)
    skills/11-sector-and-fund-accounting/school-and-education-accounting-pack/
      SKILL.md (7091 bytes)
      skills/11-sector-and-fund-accounting/school-and-education-accounting-pack/examples/
        worked-example.md (2466 bytes)
      skills/11-sector-and-fund-accounting/school-and-education-accounting-pack/references/
        implementation-rules.md (3044 bytes)
        source-basis.md (2433 bytes)
  skills/12-public-sector-and-ipsas/
    README.md (421 bytes)
    skills/12-public-sector-and-ipsas/donor-funded-project-fiscal-compliance/
      SKILL.md (7558 bytes)
      skills/12-public-sector-and-ipsas/donor-funded-project-fiscal-compliance/examples/
        uganda-worked-example.md (5068 bytes)
        worked-example.md (2482 bytes)
      skills/12-public-sector-and-ipsas/donor-funded-project-fiscal-compliance/references/
        implementation-rules.md (3060 bytes)
        source-basis.md (3285 bytes)
    skills/12-public-sector-and-ipsas/government-procurement-and-fiscal-controls/
      SKILL.md (7208 bytes)
      skills/12-public-sector-and-ipsas/government-procurement-and-fiscal-controls/examples/
        worked-example.md (2486 bytes)
      skills/12-public-sector-and-ipsas/government-procurement-and-fiscal-controls/references/
        implementation-rules.md (3064 bytes)
        source-basis.md (2986 bytes)
    skills/12-public-sector-and-ipsas/ipsas-public-sector-overlay/
      SKILL.md (7192 bytes)
      skills/12-public-sector-and-ipsas/ipsas-public-sector-overlay/examples/
        worked-example.md (2471 bytes)
      skills/12-public-sector-and-ipsas/ipsas-public-sector-overlay/references/
        implementation-rules.md (3049 bytes)
        source-basis.md (2832 bytes)
  skills/13-project-and-contract-accounting/
    README.md (422 bytes)
    skills/13-project-and-contract-accounting/construction-contract-accounting/
      SKILL.md (7090 bytes)
      skills/13-project-and-contract-accounting/construction-contract-accounting/examples/
        worked-example.md (2477 bytes)
      skills/13-project-and-contract-accounting/construction-contract-accounting/references/
        implementation-rules.md (3055 bytes)
        source-basis.md (2429 bytes)
    skills/13-project-and-contract-accounting/professional-services-time-and-materials/
      SKILL.md (7095 bytes)
      skills/13-project-and-contract-accounting/professional-services-time-and-materials/examples/
        worked-example.md (2485 bytes)
      skills/13-project-and-contract-accounting/professional-services-time-and-materials/references/
        implementation-rules.md (3063 bytes)
        source-basis.md (2437 bytes)
    skills/13-project-and-contract-accounting/project-and-contract-accounting/
      SKILL.md (7110 bytes)
      skills/13-project-and-contract-accounting/project-and-contract-accounting/examples/
        worked-example.md (2476 bytes)
      skills/13-project-and-contract-accounting/project-and-contract-accounting/references/
        implementation-rules.md (3054 bytes)
        source-basis.md (2428 bytes)
  skills/14-systems-integration-and-data/
    README.md (511 bytes)
    skills/14-systems-integration-and-data/bank-feed-and-payment-gateway-integration/
      SKILL.md (7106 bytes)
      skills/14-systems-integration-and-data/bank-feed-and-payment-gateway-integration/examples/
        worked-example.md (2479 bytes)
      skills/14-systems-integration-and-data/bank-feed-and-payment-gateway-integration/references/
        implementation-rules.md (3057 bytes)
        source-basis.md (2049 bytes)
    skills/14-systems-integration-and-data/erp-and-finance-system-integration-patterns/
      SKILL.md (7127 bytes)
      skills/14-systems-integration-and-data/erp-and-finance-system-integration-patterns/examples/
        worked-example.md (2481 bytes)
      skills/14-systems-integration-and-data/erp-and-finance-system-integration-patterns/references/
        implementation-rules.md (3059 bytes)
        source-basis.md (2051 bytes)
    skills/14-systems-integration-and-data/finance-data-contracts-and-warehouse-models/
      SKILL.md (7120 bytes)
      skills/14-systems-integration-and-data/finance-data-contracts-and-warehouse-models/examples/
        worked-example.md (2481 bytes)
      skills/14-systems-integration-and-data/finance-data-contracts-and-warehouse-models/references/
        implementation-rules.md (3059 bytes)
        source-basis.md (2051 bytes)
    skills/14-systems-integration-and-data/open-banking-and-direct-debit-mandates/
      SKILL.md (7080 bytes)
      skills/14-systems-integration-and-data/open-banking-and-direct-debit-mandates/examples/
        worked-example.md (2476 bytes)
      skills/14-systems-integration-and-data/open-banking-and-direct-debit-mandates/references/
        implementation-rules.md (3054 bytes)
        source-basis.md (2046 bytes)
  skills/15-security-privacy-and-continuity/
    README.md (417 bytes)
    skills/15-security-privacy-and-continuity/business-continuity-and-disaster-recovery-finance/
      SKILL.md (7125 bytes)
      skills/15-security-privacy-and-continuity/business-continuity-and-disaster-recovery-finance/examples/
        worked-example.md (2490 bytes)
      skills/15-security-privacy-and-continuity/business-continuity-and-disaster-recovery-finance/references/
        implementation-rules.md (3068 bytes)
        source-basis.md (2057 bytes)
    skills/15-security-privacy-and-continuity/finance-cybersecurity-controls/
      SKILL.md (7082 bytes)
      skills/15-security-privacy-and-continuity/finance-cybersecurity-controls/examples/
        worked-example.md (2471 bytes)
      skills/15-security-privacy-and-continuity/finance-cybersecurity-controls/references/
        implementation-rules.md (3049 bytes)
        source-basis.md (2038 bytes)
    skills/15-security-privacy-and-continuity/finance-data-privacy-and-retention/
      SKILL.md (7120 bytes)
      skills/15-security-privacy-and-continuity/finance-data-privacy-and-retention/examples/
        worked-example.md (2475 bytes)
      skills/15-security-privacy-and-continuity/finance-data-privacy-and-retention/references/
        implementation-rules.md (3053 bytes)
        source-basis.md (2042 bytes)
  skills/16-ux-and-presentation/
    README.md (460 bytes)
    skills/16-ux-and-presentation/finance-accessibility-and-inclusive-design/
      SKILL.md (7092 bytes)
      skills/16-ux-and-presentation/finance-accessibility-and-inclusive-design/examples/
        worked-example.md (2463 bytes)
      skills/16-ux-and-presentation/finance-accessibility-and-inclusive-design/references/
        implementation-rules.md (3041 bytes)
        source-basis.md (2052 bytes)
    skills/16-ux-and-presentation/finance-mobile-and-offline-patterns/
      SKILL.md (7064 bytes)
      skills/16-ux-and-presentation/finance-mobile-and-offline-patterns/examples/
        worked-example.md (2456 bytes)
      skills/16-ux-and-presentation/finance-mobile-and-offline-patterns/references/
        implementation-rules.md (3034 bytes)
        source-basis.md (2045 bytes)
    skills/16-ux-and-presentation/finance-ui-pattern-library/
      SKILL.md (8937 bytes)
      skills/16-ux-and-presentation/finance-ui-pattern-library/examples/
        cashier-record-sale.md (5881 bytes)
        ledger-trial-balance.md (2100 bytes)
        reconciliation-triage.md (2053 bytes)
      skills/16-ux-and-presentation/finance-ui-pattern-library/references/
        components.md (5721 bytes)
        lint-checks.md (4397 bytes)
        print-stylesheet-template.md (4587 bytes)
        tokens.md (4437 bytes)
    skills/16-ux-and-presentation/finance-ux-for-non-accountants/
      SKILL.md (11931 bytes)
      skills/16-ux-and-presentation/finance-ux-for-non-accountants/examples/
        cashier-day-flow.md (2183 bytes)
      skills/16-ux-and-presentation/finance-ux-for-non-accountants/references/
        microcopy-style.md (1973 bytes)
        workflow-vocabulary.md (2590 bytes)
  skills/17-ai-automation-and-emerging/
    README.md (446 bytes)
    skills/17-ai-automation-and-emerging/ai-in-finance-governance/
      SKILL.md (7117 bytes)
      skills/17-ai-automation-and-emerging/ai-in-finance-governance/examples/
        worked-example.md (2477 bytes)
      skills/17-ai-automation-and-emerging/ai-in-finance-governance/references/
        implementation-rules.md (3055 bytes)
        source-basis.md (2044 bytes)
    skills/17-ai-automation-and-emerging/carbon-and-emissions-accounting/
      SKILL.md (7144 bytes)
      skills/17-ai-automation-and-emerging/carbon-and-emissions-accounting/examples/
        worked-example.md (2499 bytes)
      skills/17-ai-automation-and-emerging/carbon-and-emissions-accounting/references/
        implementation-rules.md (3077 bytes)
        source-basis.md (2382 bytes)
    skills/17-ai-automation-and-emerging/digital-assets-and-crypto-accounting/
      SKILL.md (7070 bytes)
      skills/17-ai-automation-and-emerging/digital-assets-and-crypto-accounting/examples/
        worked-example.md (2467 bytes)
      skills/17-ai-automation-and-emerging/digital-assets-and-crypto-accounting/references/
        implementation-rules.md (3045 bytes)
        source-basis.md (2044 bytes)
    skills/17-ai-automation-and-emerging/rpa-and-automation-controls-for-finance/
      SKILL.md (7090 bytes)
      skills/17-ai-automation-and-emerging/rpa-and-automation-controls-for-finance/examples/
        worked-example.md (2470 bytes)
      skills/17-ai-automation-and-emerging/rpa-and-automation-controls-for-finance/references/
        implementation-rules.md (3048 bytes)
        source-basis.md (2047 bytes)
tools/
  check-links.ps1 (5018 bytes)
  check-mojibake.ps1 (3650 bytes)
  check-skill-contracts.ps1 (9829 bytes)
  check-source-register.ps1 (5028 bytes)
  close-gap-stubs.ps1 (30488 bytes)
  invoke-doctrine-conformance-scan.ps1 (12178 bytes)
  reorg-skills.ps1 (27740 bytes)
  repath-references.ps1 (4153 bytes)
  validate-doctrine.ps1 (4338 bytes)
```
