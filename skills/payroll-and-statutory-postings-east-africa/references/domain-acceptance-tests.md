# Payroll Domain Acceptance Tests

| Test | Expected result |
|---|---|
| Gross-to-net payroll posting | Payroll expense, deductions, employer costs, liabilities, and net-pay clearing are balanced. |
| Employer vs employee split | Employee deduction and employer contribution use separate lines and mappings. |
| Payslip tie-out | Payslip totals equal payroll register, journal lines, and employee net-pay schedule. |
| Stale statutory source | Final payroll blocks when a required source entry is stale or missing. |
| Payroll payment clearing | Bank or mobile-money payment clears payroll clearing and statutory liability when paid. |
| Reversal | Reversal preserves payslip and statutory schedule lineage. |
| Locked period | Payroll posting to locked period is rejected unless reopened. |
| Cross-country run | Each country uses its own source-register entries. |
