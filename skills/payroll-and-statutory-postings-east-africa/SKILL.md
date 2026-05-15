---
name: payroll-and-statutory-postings-east-africa
description: Use when designing, reviewing, or testing gross-to-net payroll, PAYE, NSSF, LST, WHT, payroll clearing, employer and employee contribution splits, payslip-to-GL reconciliation, and statutory source gates for East Africa country packs.
metadata:
  portable: true
  compatible_with:
    - claude-code
    - codex
---

# Payroll and Statutory Postings East Africa

<!-- dual-compat-start -->
## Use When

Use when payroll journals, gross-to-net schedules, statutory deductions, payroll clearing, payslip tie-outs, or East Africa country payroll gates are in scope.

## Do Not Use When

Do not use to hardcode final PAYE, NSSF, LST, WHT, levy, relief, threshold, or deadline values.

## Required Inputs

Country, payroll run, employee master, component map, source-register snapshot, approval state, payslip evidence, and payment route.

## Workflow

Validate source gates, post approved payroll through the posting service, reconcile payslips to GL, and block stale statutory output.

## Quality Standards

Separate employer and employee obligations, source-backed final statutory values, balanced payroll journals, and payslip-to-GL traceability.

## Anti-Patterns

Hardcoded statutory values, netting employer and employee lines, edited released payroll journals, and copied country rules.

## Outputs

Payroll journals, statutory liability schedules, stale-rate blockers, payment clearing evidence, and payslip reconciliation fixtures.

## References

Load the required references and examples listed below before implementation or review.
<!-- dual-compat-end -->

## Prerequisites

- Read `doctrine/references/live-rate-verification-protocol.md`.
- Read `tax-statutory-source-register-and-country-packs`.
- Read `ledger-posting-engine-core`.
- Confirm country, payroll period, employee population, payroll components, approved statutory surfaces, payroll clearing accounts, and reviewer roles.
- Do not use final PAYE, NSSF, LST, WHT, levy, relief, threshold, or deadline values unless the source register supports them.

## Inputs

| Artifact | Produced by | Required? | Validation |
|---|---|---|---|
| Payroll run event | Payroll module | Required | Period, country, employee list, components, approval state, and idempotency key present. |
| Employee master | HR/payroll | Required | Tax identifiers, statutory enrollment status, contract type, cost center, and bank/mobile-money details present. |
| Payroll component map | Controller | Required | Earnings, deductions, employer costs, net pay, and clearing accounts mapped. |
| Source-register snapshot | Tax statutory skill | Required for final statutory output | All statutory values usable for country and period. |
| Payslip evidence | Payroll module | Required | Payslip totals tie to payroll register and journal lines. |

## Outputs

| Artifact | Consumed by | Acceptance evidence |
|---|---|---|
| Payroll journal | GL, close process | Gross pay, deductions, employer costs, liabilities, and net-pay clearing balance. |
| Statutory liability schedule | Tax pack | PAYE, NSSF, LST, WHT, or country-specific liabilities tie to GL. |
| Payslip-to-GL reconciliation | Employee support, audit pack | Payslip totals reconcile to payroll register and control accounts. |
| Stale-rate rejection | Payroll workflow | Final run blocks when source entries are missing or stale. |
| Payment clearing journal | Bank reconciliation | Net pay and statutory payments clear liabilities through bank or mobile money. |

## Decision Rules

1. Payroll posting starts from approved gross-to-net payroll events, not manual GL entry.
2. Employee deductions and employer contributions are separate lines and separate liability or expense mappings.
3. Statutory deductions by country require verified source-register entries for final output.
4. Draft payroll simulations may use planning placeholders only when visibly caveated.
5. Net pay posts to payroll clearing until bank or mobile-money payment evidence clears it.
6. Payroll liabilities remain open until statutory payment evidence and return schedule tie out.
7. Reversals preserve payslip, payroll register, and statutory return lineage.
8. Cross-country payroll must not share statutory calculations without country-specific verification.

## Acceptance Evidence

- `examples/payroll-journal-fixture.md` proves gross, deductions, employer cost, liabilities, and clearing.
- `examples/statutory-liability-schedule.md` proves liability schedule to GL tie-out without final rates.
- `examples/stale-rate-rejection.md` proves missing or expired source-register entries block final payroll.
- `examples/payslip-to-gl-reconciliation.md` proves payslip totals tie to journal and statutory schedule.
- `references/domain-acceptance-tests.md` is the minimum implementation test set.

## Anti-Patterns

- Hardcoding PAYE, NSSF, LST, WHT, reliefs, thresholds, or filing deadlines.
- Netting employer contributions against employee deductions.
- Posting payroll expense only when cash is paid if accrual accounting applies.
- Editing a payroll journal after payslips have been released.
- Paying statutory liabilities without tying the payment to the filed schedule.
- Copying Uganda payroll rules into Kenya, Rwanda, Tanzania, or South Africa.

## Required References

- `references/payroll-event-model.md`
- `references/statutory-source-gates.md`
- `references/domain-acceptance-tests.md`
- `tax-statutory-source-register-and-country-packs/references/source-register-contract.md`
- `ledger-posting-engine-core/references/posting-service-contract.md`
- `doctrine/references/live-rate-verification-protocol.md`

## Examples

- `examples/payroll-journal-fixture.md`
- `examples/statutory-liability-schedule.md`
- `examples/stale-rate-rejection.md`
- `examples/payslip-to-gl-reconciliation.md`

## Review Metadata

| Field | Value |
|---|---|
| Owner role | Payroll accounting specialist |
| Reviewer roles | Country tax reviewer, controller, HR/payroll owner |
| Last reviewed | 2026-05-15 |
| Next review due | 2026-08-15 |
| Release state | Draft until country statutory gates are validator-enforced |
| Caveat | No final statutory rates are embedded; final payroll output depends on the source register. |

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
