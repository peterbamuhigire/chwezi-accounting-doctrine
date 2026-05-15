# Example - Contribution Margin by Branch

Entity: Chwezi Demo Ltd  
Period: May 2026  
Currency: UGX  
Dimensions: Branch, Product line

## Report

| Branch | Revenue | Variable costs | Contribution margin | Allocated fixed costs | Operating profit before central overhead |
|---|---:|---:|---:|---:|---:|
| Mukono | 128,450,000 | 74,200,000 | 54,250,000 | 12,000,000 | 42,250,000 |
| Jinja | 84,300,000 | 51,900,000 | 32,400,000 | 8,000,000 | 24,400,000 |
| Total | 212,750,000 | 126,100,000 | 86,650,000 | 20,000,000 | 66,650,000 |

## Drilldown

| Line | Drilldown |
|---|---|
| Mukono revenue | Branch Mukono -> account 4000 -> journal lines -> POS/source receipts. |
| Mukono variable costs | Branch Mukono -> account 5000 -> inventory issue journals -> stock movements. |
| Allocated fixed costs | Allocation rule `alloc-rent-branch-2026` -> basis values -> allocation journal. |

## Reconciliation to GL

| Check | Result |
|---|---|
| Revenue total ties to GL accounts 4000-4999 | Pass |
| Variable cost total ties to GL accounts 5000-5999 | Pass |
| Allocated fixed costs tie to approved allocation journal | Pass |
| Branch dimension present on required revenue and cost accounts | Pass |

## Caveat example

Jinja branch has UGX 1,250,000 of sales posted without product-line dimension due to a POS mapping error. The report remains draft until corrected or released as `pass-with-caveats` with Controller sign-off.

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
