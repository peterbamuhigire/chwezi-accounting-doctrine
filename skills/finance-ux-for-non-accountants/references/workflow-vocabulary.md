# Workflow Vocabulary

Allowed plain-language verbs for non-accountant finance surfaces. Do not expose debit, credit, CoA code, journal ID, subledger, accrual, clearing, or manual journal terminology on these surfaces.

## Verbs

| Verb | User meaning | Accounting service action |
|---|---|---|
| Record a sale | A customer bought goods or services. | Posts sale, tax, receipt or receivable, and inventory cost where applicable. |
| Receive payment | A customer has paid. | Clears receivable or records deposit/receipt. |
| Refund | Money should go back to the customer. | Creates refund request, then reversal or credit note after approval. |
| Record an expense | The business paid for an expense. | Posts expense, tax, and payment. |
| Buy stock | Stock was purchased. | Posts inventory, supplier liability or payment, and tax. |
| Receive a bill | A supplier invoice was received. | Posts liability and related expense or inventory. |
| Pay a supplier | A supplier was paid. | Clears payable and records withholding where applicable. |
| Run payroll | Pay staff for the period. | Posts gross pay, net pay, and statutory liabilities. |
| Close my drawer | Cashier finished the shift. | Moves tender clearing to cash on hand and records variance. |
| Match a payment | A payment should be linked to a sale or invoice. | Clears the relevant open item or records a customer deposit. |
| Count stock | Physical stock count was performed. | Posts approved stock adjustment if variance exists. |
| Mark damaged | Stock cannot be sold normally. | Posts inventory adjustment after approval. |
| Issue a credit note | Customer balance should be reduced. | Posts credit note and tax reversal where applicable. |

## Status words

| Status | Use on workflow surface |
|---|---|
| Draft | User has not submitted yet. |
| Waiting for approval | A manager or accountant must review. |
| Approved | Request passed review and is ready to post or has posted. |
| Posted | The record is final in the books. |
| Needs attention | User can fix or add information. |
| Reversed | The original was cancelled through a reversal. |

## Forbidden labels

- Delete.
- Debit.
- Credit.
- Journal.
- Clearing account.
- Subledger.
- Accrual.
- Contra.
- Suspense.
- Post to GL.

## Replacement labels

| Avoid | Use |
|---|---|
| Post to GL | Save to records |
| Journal reversal | Reverse and re-do |
| Clearing mismatch | Payment needs matching |
| Suspense item | Needs accountant review |
| Debit/Credit | Money in / Money out, where role-appropriate |

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
