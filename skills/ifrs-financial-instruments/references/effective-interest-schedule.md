# Effective-Interest Schedule

Use this template for loans, finance leases under Section 20, and amortised-cost financial instruments.

## Required inputs

| Field | Rule |
|---|---|
| Principal or initial carrying amount | Net of transaction costs where included in amortised cost. |
| Cash-flow dates | Contractual payment dates. |
| Cash-flow amounts | Principal, coupon, fees, transaction costs, premiums, discounts. |
| Effective interest rate | Rate that discounts expected cash flows to initial carrying amount. |
| Reassessment trigger | Modification, prepayment, default, or revised expected cash flows. |

## Schedule

| Period | Opening amortised cost | Interest income or expense | Cash received or paid | Closing amortised cost |
|---|---:|---:|---:|---:|
| 1 | 0 | 0 | 0 | 0 |
| 2 | 0 | 0 | 0 | 0 |

## Journal patterns

| Instrument | Debit | Credit |
|---|---|---|
| Borrowing interest | Interest expense | Borrowing liability or bank |
| Loan receivable interest | Loan receivable or bank | Interest income |
| Discount unwind | Instrument asset or liability | Interest income or expense, depending on side |

## Controls

- Opening and closing amortised cost must tie to the GL.
- Effective rate cannot be overwritten without modification evidence.
- Short-term trade receivables and payables normally remain at invoice amount when discounting is immaterial.
