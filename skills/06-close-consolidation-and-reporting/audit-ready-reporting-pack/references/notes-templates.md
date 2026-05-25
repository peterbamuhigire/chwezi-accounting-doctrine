# Notes Templates

Templates for notes to financial statements in an audit-ready reporting pack. Use these as structure, not as final statutory wording. Final figures and disclosures must tie to the ledger, source-register entries, and reviewer sign-off.

## Minimum note index

| Note | Title | Required source |
|---|---|---|
| 1 | Reporting entity | Entity master, registration details, period, framework. |
| 2 | Basis of preparation | Approved reporting basis and accounting policy register. |
| 3 | Significant accounting policies | Policy register and framework selection. |
| 4 | Critical judgements and estimates | Controller-approved estimates log. |
| 5 | Revenue | Revenue ledger, tax codes, customer analysis. |
| 6 | Cost of sales | Inventory and direct cost reports. |
| 7 | Employee benefits | Payroll register-to-GL reconciliation. |
| 8 | Taxation | Tax pack and source-register snapshot. |
| 9 | Trade receivables | AR ageing and allowance methodology. |
| 10 | Inventory | Inventory valuation and NRV test. |
| 11 | Property, plant, and equipment | Fixed-asset register and depreciation schedule. |
| 12 | Trade payables | AP ageing. |
| 13 | Provisions | Provisions roll-forward and recognition memo. |
| 14 | Related parties | Related-party register and transaction listing. |
| 15 | Events after reporting date | Post-balance-sheet events log. |
| 16 | Going concern | Management assessment and reviewer conclusion. |

## Note shell

```md
## Note <n> - <title>

### Policy

State the accounting policy in plain terms. Name whether the policy follows IFRS for SMEs or full IFRS. Do not quote standards at length.

### Current-period movement

| Description | Opening | Additions | Disposals | Reclassification | Closing |
|---|---:|---:|---:|---:|---:|
| <line> | 0 | 0 | 0 | 0 | 0 |

### Evidence

- Ledger report: `<path>`.
- Source schedule: `<path>`.
- Reviewer: `<name>, <role>, <date>`.
- Caveat: `<none or named caveat with owner and due date>`.
```

## Required controls

- Every note total ties to a report line or ledger schedule.
- Every estimate has a reviewer and date.
- Tax, payroll, FX, and authority-template values are not final unless source-register status permits final use.
- A note with a caveat remains draft unless the pack release state is `pass-with-caveats`.

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
