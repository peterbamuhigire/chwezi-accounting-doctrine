# Fixture: VAT-Inclusive Cash Sale

## Source event

- Event type: `cash_sale`
- Currency: entity currency
- Gross amount: `118.00`
- Tax treatment: VAT-inclusive placeholder
- Source-register dependency: VAT code must reference a verified-current or approved caveat entry before final output.

## Expected journal

| Account | Debit | Credit | Evidence |
|---|---:|---:|---|
| Cash on hand or bank | 118.00 | 0.00 | Receipt or POS Z-report. |
| Sales revenue | 0.00 | 100.00 | Sales invoice or receipt. |
| VAT control | 0.00 | 18.00 | Source-register-backed VAT tax code. |

## Pass criteria

- Debits equal credits.
- Revenue is net of tax.
- VAT line is first-class and uses a tax control account.
- Final output is blocked until the VAT source-register key is usable.
