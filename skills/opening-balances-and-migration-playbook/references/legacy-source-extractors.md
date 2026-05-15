# Legacy Source Extractors

Extractor guidance for common legacy sources. Extractors stage data only; they do not post accounting entries.

## QuickBooks

| Extract | Required fields |
|---|---|
| Trial balance | Account, account type, debit, credit, currency, as-of date. |
| Customer open invoices | Customer, invoice number, date, due date, balance, currency. |
| Supplier open bills | Supplier, bill number, date, due date, balance, currency. |
| Item list | SKU, description, quantity on hand, average cost, inventory value. |
| Fixed assets | Asset name, acquisition date, cost, accumulated depreciation if available. |

## Tally

| Extract | Required fields |
|---|---|
| Ledger balances | Ledger name, group, opening, debit, credit, closing. |
| Outstanding receivables | Party, voucher, date, amount, ageing. |
| Outstanding payables | Party, voucher, date, amount, ageing. |
| Stock summary | Item, godown/location, quantity, rate, value. |

## Sage

| Extract | Required fields |
|---|---|
| Nominal trial balance | Account code, account name, balance, period. |
| Debtors | Customer, document, date, outstanding amount. |
| Creditors | Supplier, document, date, outstanding amount. |
| Bank | Account, statement balance, reconciled date. |

## Excel and manual records

Minimum controls:

- File hash and archive path.
- Owner of the spreadsheet.
- Extract date and conversion date.
- Header validation.
- Totals row cross-check.
- Reviewer sign-off before staging import.

## Normalisation rules

- Dates convert to `YYYY-MM-DD`.
- Money uses decimal values with separate currency.
- Empty account mappings route to Migration Suspense.
- Customer and supplier names are matched to canonical master records.
- Raw source rows are preserved in staging for audit.

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
