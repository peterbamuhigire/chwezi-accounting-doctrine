# Retail VAT POS Journal Pack

Benchmark target: Big 4 audit-ready working paper for a retail day-end close pack  
Framework: IFRS for SMEs, with Uganda statutory source-register caveats  
Running example: Chwezi Retail Uganda Ltd, Store KLA-01  
Period: 2026-06-30 day-end fixture  
Last verified: 2026-07-08  

This worked example demonstrates the complete path from retail source events to journals, subledger controls, reconciliation, financial-statement impact, and audit evidence. It is a reusable exemplar, not client fact. Uganda statutory values in this example are controlled by `docs/source-registers/ifrs-tax-statutory-2026.md`.

## 1. Scope Boundary

Use this pack when a retail or POS workflow includes VAT-inclusive sales, EFRIS evidence, cash drawer close, card/mobile-money settlement, refunds, stock movement, and month-end reporting. Do not use it for final statutory filings unless the source-register keys remain current and a named tax reviewer signs off.

Related skills:

- `skills/11-sector-and-fund-accounting/retail-and-pos-accounting-pack/SKILL.md`
- `skills/04-subledgers-and-operations/pos-and-cash-drawer-management/SKILL.md`
- `skills/01-foundations/ledger-posting-engine-core/SKILL.md`
- `skills/08-tax-and-statutory/tax-statutory-source-register-and-country-packs/SKILL.md`
- `skills/06-close-consolidation-and-reporting/audit-ready-reporting-pack/SKILL.md`

## 2. Source Events

| Event ID | Source document | Summary | Gross UGX | Source evidence |
|---|---|---:|---:|---|
| POS-2026-06-30-001 | POS Z-read Z-KLA01-20260630 | VAT-inclusive standard-rated sales, split tender | 11,800,000 | POS Z-read, EFRIS receipt batch, cashier audit log |
| POS-2026-06-30-002 | Refund R-KLA01-883 | Customer refund linked to original receipt | (236,000) | Return authorization, original receipt, manager approval |
| POS-2026-06-30-003 | Cash count C-KLA01-20260630 | Drawer counted UGX 3,535,000 against expected UGX 3,540,000 | (5,000 variance) | Blind count sheet, cashier sign-off, manager review |
| POS-2026-06-30-004 | Card batch VISA-KLA01-20260630 | Card settlement gross UGX 4,720,000 less fee UGX 94,400 | 4,625,600 net deposit | Gateway batch, bank statement line |
| POS-2026-06-30-005 | MoMo batch MOMO-KLA01-20260630 | Mobile-money settlement gross UGX 2,360,000 less fee UGX 23,600 | 2,336,400 net deposit | Provider statement, bank statement line |
| POS-2026-06-30-006 | COGS batch INV-KLA01-20260630 | Weighted-average cost of goods sold for sold SKUs | 6,250,000 | Inventory movement report, SKU cost layer report |

## 3. Source Register Dependencies

| Source key | Use in this pack | State |
|---|---|---|
| `UG-VAT-STANDARD-RATE` | VAT split at 18% for fixture sales and refund. | `verified-current-with-conflict-watch` |
| `UG-EFRIS` | EFRIS receipt/e-invoice evidence required for VAT-registered taxpayer. | `verified-current` |

If either key is stale or blocked at release, the pack remains valid as a teaching fixture but cannot support client statutory output.

## 4. VAT Decomposition

Standard-rated sales are VAT-inclusive.

| Item | Gross UGX | Net UGX | VAT UGX | Formula |
|---|---:|---:|---:|---|
| Sales before refund | 11,800,000 | 10,000,000 | 1,800,000 | Gross / 1.18 |
| Refund | (236,000) | (200,000) | (36,000) | Gross / 1.18 |
| Net sales after refund | 11,564,000 | 9,800,000 | 1,764,000 | Net of refund |

## 5. Journal Entries

### JE-001 VAT-Inclusive Sales by Tender

| Account | Dr UGX | Cr UGX | Dimension | Evidence |
|---|---:|---:|---|---|
| Cash on Hand - Store KLA-01 | 3,540,000 | - | Store KLA-01 | POS tender report |
| Card Settlement Clearing | 4,720,000 | - | Store KLA-01 | Card batch |
| Mobile Money Settlement Clearing | 2,360,000 | - | Store KLA-01 | MoMo batch |
| Customer Refund Liability/Clearing | 1,180,000 | - | Store KLA-01 | Pending settlement split in POS close |
| Sales Revenue - Retail Goods | - | 10,000,000 | Store KLA-01 | EFRIS batch |
| Output VAT Control | - | 1,800,000 | Uganda VAT | `UG-VAT-STANDARD-RATE` |

Control: debits equal credits at UGX 11,800,000. Tax is not stored in memo text; it is posted to Output VAT Control.

### JE-002 Customer Refund

| Account | Dr UGX | Cr UGX | Dimension | Evidence |
|---|---:|---:|---|---|
| Sales Returns and Allowances | 200,000 | - | Store KLA-01 | Return authorization |
| Output VAT Control | 36,000 | - | Uganda VAT | Credit note / EFRIS evidence |
| Customer Refund Liability/Clearing | - | 236,000 | Store KLA-01 | Original receipt link |

Control: refund links to original sale and manager approval; accounting remains pending if inspection or EFRIS credit note evidence is missing.

### JE-003 Card and Mobile-Money Settlement Fees

| Account | Dr UGX | Cr UGX | Dimension | Evidence |
|---|---:|---:|---|---|
| Bank - Operating Account | 6,962,000 | - | Store KLA-01 | Bank statement |
| Merchant and Mobile-Money Fees | 118,000 | - | Store KLA-01 | Gateway/provider fee report |
| Card Settlement Clearing | - | 4,720,000 | Store KLA-01 | Card batch |
| Mobile Money Settlement Clearing | - | 2,360,000 | Store KLA-01 | MoMo batch |

Control: clearing accounts reach zero only when settlement net deposits and fees match provider evidence.

### JE-004 Cash Drawer Variance

| Account | Dr UGX | Cr UGX | Dimension | Evidence |
|---|---:|---:|---|---|
| Cash Short and Over | 5,000 | - | Store KLA-01 | Blind count variance |
| Cash on Hand - Store KLA-01 | - | 5,000 | Store KLA-01 | Manager review |

Control: the variance is recorded and routed to the exception register; it is not hidden in sales or cashier notes.

### JE-005 Cost of Goods Sold

| Account | Dr UGX | Cr UGX | Dimension | Evidence |
|---|---:|---:|---|---|
| Cost of Goods Sold - Retail Goods | 6,250,000 | - | Store KLA-01 | Inventory movement report |
| Inventory - Retail Goods | - | 6,250,000 | Store KLA-01 | Weighted-average cost layer report |

Control: inventory subledger must tie to GL inventory control after posting.

## 6. Reconciliation Workpaper

| Control account | Expected balance | Evidence | Exception status |
|---|---:|---|---|
| Cash on Hand - Store KLA-01 | 3,535,000 | Blind count sheet after variance posting | Clear |
| Card Settlement Clearing | 0 | Provider batch + bank deposit + fee posting | Clear |
| Mobile Money Settlement Clearing | 0 | Provider batch + bank deposit + fee posting | Clear |
| Output VAT Control | 1,764,000 credit | VAT split schedule + EFRIS batch/credit note | Clear for fixture; final return blocked without current source-register snapshot |
| Inventory - Retail Goods | Prior balance less 6,250,000 plus receipts/transfers | Inventory valuation report | Requires month-end stock count tie-out |

## 7. Financial Statement Impact

| Statement area | Impact |
|---|---|
| Revenue | UGX 9,800,000 net sales after refund. |
| Cost of sales | UGX 6,250,000 COGS. |
| Gross profit | UGX 3,550,000 before merchant fees and cash variance. |
| Operating expenses | UGX 118,000 merchant/mobile-money fees; UGX 5,000 cash shortage. |
| Current assets | Cash/bank increase by settlement net amounts; inventory decreases. |
| Current liabilities | Output VAT Control credit UGX 1,764,000 until return/payment. |

## 8. Audit Evidence Index

| Evidence ID | File or record | Required fields | Reviewer test |
|---|---|---|---|
| EV-001 | POS Z-read | Store, date, cashier/session, tender split, gross sales, refunds, tax summary | Agree gross sales to JE-001 and refund to JE-002. |
| EV-002 | EFRIS batch | FDN/receipt IDs, TIN, invoice date, VAT amounts, credit note reference | Agree VAT to Output VAT Control and source key. |
| EV-003 | Cash count sheet | Opening float, counted cash, expected cash, variance, signatures | Reperform expected cash and confirm variance approval. |
| EV-004 | Card gateway batch | Gross, fees, net, transaction IDs, settlement date | Agree clearing to bank deposit and fee line. |
| EV-005 | Mobile-money provider statement | Gross, fees, net, transaction IDs, settlement date | Agree clearing to bank deposit and fee line. |
| EV-006 | Inventory movement report | SKU, quantity, cost method, cost amount, stock movement ID | Agree COGS and inventory credit to subledger. |
| EV-007 | Audit log | Actor, timestamp, posting service version, idempotency key, evidence checksum | Confirm no direct journal write path. |

## 9. Validation Checklist

| Check | Pass/fail rule |
|---|---|
| Double entry | Every journal balances by currency and book. |
| VAT split | Gross, net, and VAT are separated; VAT posts to Output VAT Control. |
| Source register | Each statutory amount has source key and review state. |
| Period state | Posting period is open or governed reopened. |
| Idempotency | Every source event has a unique idempotency key. |
| Reconciliation | Tender clearing accounts are zero or explained in exception register. |
| Evidence | Every report line drills to source document, evidence file, and audit log. |
| Reviewer route | Controller and tax reviewer are named for release-grade output. |

## 10. Edge Cases

| Edge case | Required handling |
|---|---|
| EFRIS unavailable at sale time | Queue invoice/receipt issuance with outage evidence; block VAT return pack until EFRIS evidence is reconciled. |
| Chargeback after settlement | Reverse tender clearing impact through chargeback receivable/expense route; do not restate original sale without policy approval. |
| Refund before stock inspection | Operational refund may proceed, but inventory return remains in quarantine until disposition evidence is recorded. |
| Stale VAT source key | Block final statutory pack and route to tax reviewer; keep management reporting caveated. |
| Cash variance above threshold | Escalate to manager/controller, attach investigation evidence, and keep drawer close in exception state. |

## 11. Common Mistakes

- Posting gross sales entirely to revenue without Output VAT Control.
- Netting merchant fees against revenue instead of showing fee expense unless policy and framework support net presentation.
- Closing settlement clearing accounts without bank/provider evidence.
- Treating POS Z-read totals as audit evidence without EFRIS and tender settlement corroboration.
- Hiding cash shortages in discounts or sales returns.
- Letting the inventory subledger and GL inventory account drift after COGS posting.

## 12. Release Sign-Off

| Role | Required assertion |
|---|---|
| Preparer | Source events, journals, reconciliation, and evidence index are complete. |
| Controller | Control accounts tie out; exceptions are resolved or formally owned. |
| Tax reviewer | VAT source key, EFRIS evidence, and return-pack caveats are current. |
| Systems reviewer | Posting service invariants, idempotency, and audit log are intact. |
