# Fixture: Payslip to GL Reconciliation

## Reconciliation

| Balance | Source | Expected |
|---|---|---:|
| Gross earnings | Payslips | 1,000.00 |
| Gross earnings | Payroll expense journal lines | 1,000.00 |
| Net pay | Payslips | 900.00 |
| Net pay | Payroll clearing credit | 900.00 |
| Statutory deductions | Payslips | 100.00 |
| Statutory liability credit | GL | 100.00 |

## Pass criteria

- Payslip totals equal payroll register.
- Payroll register equals posted journal lines.
- Statutory schedule equals liability control account.
