# Skill Realignment

Assessment date: 2026-05-16
Current state: **complete and validator-backed**

## Current Catalogue

The active finance skill catalogue is now capped at **25** and `tools/check-skill-contracts.ps1` reports `pass`.

| # | Skill | Current state |
|---:|---|---|
| 1 | `finance-module-audit` | Active, normalized. |
| 2 | `audit-ready-reporting-pack` | Active with references and example pack. |
| 3 | `internal-controls-library` | Active with SoD, exception indicators, and payment-flow example. |
| 4 | `ledger-posting-engine-core` | Active with posting contract, fixtures, and invariant references. |
| 5 | `tax-statutory-source-register-and-country-packs` | Active with source-register discipline. |
| 6 | `bank-and-mobile-money-reconciliation` | Active with match rules, data model, provider quirks, and example. |
| 7 | `month-end-and-year-end-close-playbook` | Active with close templates and year-end extensions. |
| 8 | `opening-balances-and-migration-playbook` | Active with cutover references and example pack. |
| 9 | `management-accounting-dimensions` | Active with dimensions spec and allocation rules. |
| 10 | `inventory-costing-and-stock-accounting` | Active with costing fixtures and IFRS/SME constraints. |
| 11 | `fixed-assets-and-depreciation` | Active with asset lifecycle evidence. |
| 12 | `payroll-and-statutory-postings-east-africa` | Active with statutory-source gates. |
| 13 | `ifrs-for-smes-equivalents` | Active with SME/full IFRS mapping. |
| 14 | `ifrs-revenue-recognition` | Active with Section 23, IFRS 15, and example. |
| 15 | `ifrs-leases` | Active with exemption and full IFRS 16 references. |
| 16 | `ifrs-financial-instruments` | Active with Section 11, ECL, and effective-interest references. |
| 17 | `ias-impairment` | Active with indicator and VIU workpaper references. |
| 18 | `ias-provisions-contingencies` | Active with recognition and onerous-contract references. |
| 19 | `ias-income-tax-deferred-tax` | Active with temporary-difference and recognition references. |
| 20 | `ias-government-grants` | Active with grant-register and donor-restriction references. |
| 21 | `ias-agriculture` | Active with fair-value and cohort references. |
| 22 | `consolidation-and-intercompany` | Active with consolidation workflow and examples. |
| 23 | `finance-ux-for-non-accountants` | Active with vocabulary, microcopy, and cashier flow. |
| 24 | `finance-ui-pattern-library` | Active with tokens, components, examples, and lint checks. |
| 25 | `engagement-quality-and-plain-language-output` | Active with reviewer and plain-language evidence. |

## Validation Evidence

| Metric | Result |
|---|---:|
| Active finance skills | 25 |
| Planned skill directories | 0 |
| Declared references | 69 |
| Missing declared references | 0 |
| Quality-gate blockers covered | 40 / 40 |
| Planned quality-gate rows | 0 |

## Governance Rule

Do not add a 26th active finance skill without a written waiver. New depth should normally be added as references, examples, fixtures, or source-register entries under the existing 25-skill catalogue.
