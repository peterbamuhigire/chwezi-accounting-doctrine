# Payroll Event Model

## Payroll run command

| Field | Required | Notes |
|---|---|---|
| `payroll_run_id` | yes | Stable run identifier. |
| `country` | yes | ISO code; drives statutory source gates. |
| `period` | yes | Payroll period. |
| `employee_lines` | yes | One line per employee and component. |
| `gross_earnings` | yes | Basic pay, allowances, overtime, bonuses, benefits where applicable. |
| `employee_deductions` | yes | Statutory and voluntary deductions separated. |
| `employer_contributions` | yes | Employer costs separated from employee deductions. |
| `net_pay` | yes | Payable to employees. |
| `component_account_map` | yes | Expense, liability, clearing, and statutory accounts. |
| `idempotency_key` | yes | Required for posting. |
| `approval_state` | yes | Draft runs cannot post final journals. |

## Posting shape

- Debit payroll expenses for gross earnings.
- Debit employer statutory or benefit expenses where applicable.
- Credit payroll clearing for net pay.
- Credit statutory liability accounts for deductions and employer obligations.
- Credit other deduction liabilities for loans, SACCO, medical, or garnishments where applicable.
