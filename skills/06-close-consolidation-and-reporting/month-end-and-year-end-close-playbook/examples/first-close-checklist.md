# Example - First Close After Go-Live

Entity: Chwezi Demo Ltd  
First Chwezi period: May 2026  
Conversion date: 2026-04-30  
Close state: `pass-with-caveats`

## Enhanced first-close tasks

| Task | Owner | Evidence | Status |
|---|---|---|---|
| Confirm opening journal posted and locked | Controller | `migration/opening-journal.pdf` | Done |
| Tie AR opening items to AR control | Accountant | `tieouts/ar-opening.xlsx` | Done |
| Tie AP opening items to AP control | Accountant | `tieouts/ap-opening.xlsx` | Done |
| Tie inventory opening values to stock ledger | Inventory Manager | `tieouts/inventory-opening.xlsx` | Done |
| Reconcile bank opening balance to first bank statement | Accountant | `reconciliations/bank/stanbic-may-pack/` | Done |
| Review migration suspense | Controller | `migration/suspense-register.md` | Caveat |
| Validate POS product mappings | Manager + Accountant | `pos/product-map-review.md` | Done |
| Validate tax codes on first sales | Tax Reviewer | `tax/first-sales-tax-review.md` | Caveat |

## Release decision

The period can soft-close because no blocker remains. Two caveats are carried:

| Caveat | Owner | Due | Impact |
|---|---|---|---|
| Migration suspense UGX 350,000 awaiting legacy supplier support. | Controller | 2026-06-15 | Management pack disclosed; cannot archive until cleared or waived. |
| VAT source-register entry is draft. | Tax Reviewer | 2026-06-12 | Blocks final statutory filing only. |

## Reviewer conclusion

Opening balances tie to the posted opening journal. First-month subledger movements reconcile to control accounts. The close is released as `pass-with-caveats` with named owners and due dates.

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
