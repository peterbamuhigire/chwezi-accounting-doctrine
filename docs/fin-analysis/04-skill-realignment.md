# Skill Realignment

Maximum total skills: **25**
Current skills: **18**
Recommended additions: **7**
Recommended final count: **25**

## Principle

Do not increase quality by endlessly adding skills. Increase quality by making each skill deeper, reference-backed, tested, and composable. A skill should exist only when it captures a repeatable, high-risk workflow that downstream engines must execute consistently.

## Recommended 25 Skills

### Tier 0: Doctrine Spine And Gates

| # | Skill | Decision |
|---|---|---|
| 1 | `finance-module-audit` | Keep and normalize. |
| 2 | `audit-ready-reporting-pack` | Keep and deepen. |
| 3 | `internal-controls-library` | Keep and deepen. |
| 4 | `ledger-posting-engine-core` | Add. |
| 5 | `tax-statutory-source-register-and-country-packs` | Add. |

### Tier 1: Operating Finance Workflows

| # | Skill | Decision |
|---|---|---|
| 6 | `bank-and-mobile-money-reconciliation` | Keep and deepen. |
| 7 | `month-end-and-year-end-close-playbook` | Keep and deepen. |
| 8 | `opening-balances-and-migration-playbook` | Keep and deepen. |
| 9 | `management-accounting-dimensions` | Keep and deepen. |
| 10 | `inventory-costing-and-stock-accounting` | Add. |
| 11 | `fixed-assets-and-depreciation` | Add. |
| 12 | `payroll-and-statutory-postings-east-africa` | Add. |

### Tier 2: Standards Modules

| # | Skill | Decision |
|---|---|---|
| 13 | `ifrs-for-smes-equivalents` | Keep and update. |
| 14 | `ifrs-revenue-recognition` | Keep and deepen. |
| 15 | `ifrs-leases` | Keep and deepen. |
| 16 | `ifrs-financial-instruments` | Keep and deepen. |
| 17 | `ias-impairment` | Keep and deepen. |
| 18 | `ias-provisions-contingencies` | Keep and deepen. |
| 19 | `ias-income-tax-deferred-tax` | Keep and deepen. |
| 20 | `ias-government-grants` | Keep and deepen. |
| 21 | `ias-agriculture` | Keep and deepen. |
| 22 | `consolidation-and-intercompany` | Add. |

### Tier 3: UX And Commercial Output

| # | Skill | Decision |
|---|---|---|
| 23 | `finance-ux-for-non-accountants` | Keep and deepen. |
| 24 | `finance-ui-pattern-library` | Keep and deepen. |
| 25 | `engagement-quality-and-plain-language-output` | Add. |

## Required Skill Contract

Every skill should include:

- prerequisites
- when the skill applies
- inputs
- outputs
- non-negotiables
- decision rules
- implementation or workflow contract
- anti-patterns
- acceptance evidence
- read-next links
- directly resolvable references

## Depth Strategy

Use references and examples for depth:

```text
skills/<skill-name>/
  SKILL.md
  references/
    decision-rules.md
    implementation-contract.md
    acceptance-tests.md
  examples/
    happy-path.md
    failure-case.md
```

Promote a reference to a new skill only when it becomes a recurring workflow with distinct inputs, outputs, and quality gates.
