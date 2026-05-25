# Event to Journal Map

| Event | Debit | Credit | Notes |
|---|---|---|---|
| VAT-inclusive cash sale | Cash gross | Revenue net; VAT control | Tax code requires source-register key for final output. |
| Customer receipt against invoice | Bank or mobile money | Accounts receivable control | Does not credit revenue again. |
| Supplier bill | Expense or asset; recoverable tax where applicable | Accounts payable control | Evidence attachment required. |
| Supplier payment | Accounts payable control | Bank or mobile money | Clears open item. |
| Payroll run | Payroll expenses; employer costs | Payroll clearing; statutory liabilities | Country source gates required. |
| Inventory sale | COGS | Inventory control | Requires cost layer or average-cost evidence. |
| Asset depreciation | Depreciation expense | Accumulated depreciation | Run is idempotent per asset-period. |
| Reversal | Mirror original debits and credits with signs reversed | Mirror original | Original remains posted and linked. |

## Mapping rules

- Feature modules emit business events; the posting service owns journal construction.
- Control accounts always include subledger references.
- Tax and statutory controls always include source-register references when output is final.
- Every mapping has at least one success fixture and one failure fixture when implemented.
