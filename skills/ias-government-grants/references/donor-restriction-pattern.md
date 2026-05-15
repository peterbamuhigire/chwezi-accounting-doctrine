# Donor Restriction Pattern

Donor restrictions are tracked with dimensions and release rules. The accounting model must preserve both donor accountability and IFRS reporting.

## Dimension pattern

| Dimension | Purpose |
|---|---|
| `grant` | Identifies the funding agreement. |
| `donor` | Identifies the funder or government agency. |
| `restriction` | Unrestricted, purpose-restricted, time-restricted, capital-restricted, or repayable. |
| `budget_line` | Donor budget category for utilisation reporting. |
| `project` | Operational project or programme. |

## Restriction states

| State | Meaning | Accounting action |
|---|---|---|
| `received-not-earned` | Cash received before conditions are met. | Credit deferred income or repayable assistance. |
| `eligible-cost-incurred` | Cost satisfies donor rules. | Release deferred income under accrual model or recognise under performance model. |
| `condition-met` | Milestone, time, or activity condition satisfied. | Recognise income for the satisfied portion. |
| `restricted-balance` | Funds remain restricted for donor use. | Retain restriction dimension and fund-balance reporting. |
| `repayable` | Condition failed or funds disallowed. | Recognise liability and stop income release. |

## Journal patterns

| Event | Debit | Credit |
|---|---|---|
| Cash grant received before condition met | Bank | Deferred income - grants |
| Eligible cost incurred | Expense or asset | Bank, payable, or supplier control |
| Grant income released | Deferred income - grants | Donor or grant income |
| Disallowed amount repayable | Grant income or expense | Repayable government assistance |

## Controls

- Every donor-funded journal carries `grant`, `restriction`, and `budget_line` where donor reporting is required.
- Disallowed costs remain visible; do not silently reclassify them to unrestricted funding.
- Donor reports reconcile to the GL, bank receipts, and deferred-income roll-forward.
