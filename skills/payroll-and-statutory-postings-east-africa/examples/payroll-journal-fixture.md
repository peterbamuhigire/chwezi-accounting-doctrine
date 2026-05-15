# Fixture: Payroll Journal

## Setup

Planning amounts only; statutory values are placeholders and require source-register entries before final output.

| Component | Amount |
|---|---:|
| Gross earnings | 1,000.00 |
| Employee statutory deduction | 100.00 |
| Employer contribution | 50.00 |
| Net pay | 900.00 |

## Expected journal

| Account | Debit | Credit |
|---|---:|---:|
| Payroll expense | 1,000.00 | 0.00 |
| Employer contribution expense | 50.00 | 0.00 |
| Payroll clearing or net pay payable | 0.00 | 900.00 |
| Employee statutory liability | 0.00 | 100.00 |
| Employer statutory liability | 0.00 | 50.00 |

## Pass criteria

- Journal balances.
- Employee and employer obligations are separate.
- Final output is blocked until statutory source entries are usable.
