# Example - May 2026 Monthly Pack

Entity: Chwezi Demo Ltd  
Period: May 2026  
Framework: IFRS for SMEs  
Book: Tax book  
Release state: `pass-with-caveats`

## Pack index

| # | Report | Status | Evidence path |
|---|---|---|---|
| 1 | Trial balance | complete | `reports/2026-05/tb-summary.pdf` |
| 2 | GL detail | complete | `exports/2026-05/gl-detail.csv` |
| 3 | Journal listing | complete | `exports/2026-05/journal-listing.csv` |
| 4 | Financial statements | complete | `reports/2026-05/financial-statements.pdf` |
| 5 | AR ageing | complete | `reports/2026-05/ar-ageing.pdf` |
| 6 | AP ageing | complete | `reports/2026-05/ap-ageing.pdf` |
| 7 | Inventory valuation | complete | `reports/2026-05/inventory-valuation.pdf` |
| 8 | Fixed-asset register | complete | `reports/2026-05/fixed-assets.pdf` |
| 9 | Payroll tie-out | complete | `reports/2026-05/payroll-tieout.pdf` |
| 10 | Reconciliation packs | complete | `evidence/chwezi-demo/2026-05/reconciliations/` |
| 11 | Tax pack | caveat | `tax/2026-05/` |
| 12 | Management accounts | complete | `reports/2026-05/management-pack.pdf` |
| 13 | Auditor export index | complete | `audit-export-chwezi-demo-2026-05/00-index.md` |

## Release decision

`pass-with-caveats`: all close blockers are cleared. The VAT source-register entry remains draft and tax values are not final statutory output. Management pack release is permitted with the caveat disclosed.

## Drilldown sample

| Report line | Drilldown path | Result |
|---|---|---|
| Sales - Goods UGX 128,450,000 | SOCI -> account 4000 -> J-2026-05-12-0042 -> POS receipt | Ties to source receipt and EFRIS queue state. |
| Bank - Stanbic UGX 42,180,000 | SFP -> account 1100 -> bank reconciliation pack | Ties to statement closing balance. |
| Output VAT UGX 23,121,000 | SFP -> account 2100 -> VAT schedule | Caveated by source-register status. |

## Sign-off

| Role | Name | Time | Decision |
|---|---|---|---|
| Preparer | Jane Doe | 2026-06-04T17:10:00+03:00 | Submitted |
| Reviewer | Peter Bamuhigire | 2026-06-05T09:20:00+03:00 | Approved with tax caveat |
| Approver | Not required monthly |  |  |

## Caveat carried forward

| Caveat | Owner | Due | Release impact |
|---|---|---|---|
| Uganda VAT source-register entry is draft, not verified-current. | Tax Reviewer | 2026-06-12 | Blocks final statutory filing, does not block management pack release. |

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
