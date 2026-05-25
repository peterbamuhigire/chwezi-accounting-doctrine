# Fixture: Statutory Liability Schedule

## Schedule columns

| Column | Required |
|---|---|
| Employee ID | yes |
| Gross taxable base | yes |
| Employee deduction | yes |
| Employer contribution | where applicable |
| Liability account | yes |
| Source-register key | yes for final |
| Payslip reference | yes |
| Journal line ID | yes |

## Pass criteria

- Schedule total equals GL liability account movement.
- Each final statutory value has a usable source-register key.
- Filing-ready output is blocked when source evidence is draft or stale.
