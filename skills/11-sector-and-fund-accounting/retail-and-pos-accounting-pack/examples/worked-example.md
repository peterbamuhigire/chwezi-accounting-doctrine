# Worked Example - Retail And POS Accounting Pack

This fixture is illustrative. It is not a client fact pattern and does not provide statutory rates, legal advice, actuarial advice, or final IFRS conclusions.

## Scenario

A retailer asks the finance engine to process a daily store close and related omnichannel exceptions for Store KLA-02. The pack includes POS sales, cash drawer count, card and mobile-money settlement batches, one online pickup return, a category markdown event, a vendor-funded promotion claim, loyalty redemptions, and a weekly business review dashboard extract.

The source-register snapshot has no verified-current statutory rate in this fixture, so statutory outputs remain blocked. The engine may produce a controlled workpaper, reconciliation route, posting map, and exception register for reviewer approval.

## Evidence Pack

| Evidence | Status |
|---|---|
| Store day-end report | Present: store_id, cashier sessions, tenders, tax code placeholders, gross sales, discounts, refunds, and expected cash. |
| Cash count sheet | Present: opening float, cash sales, paid-in/out, counted cash, variance, preparer, and approver. |
| Settlement batches | Present: card batch, mobile-money batch, fees, refund references, bank-deposit references, and unmatched items. |
| Return authorisation | Present but incomplete: original order exists, inspection result exists, disposition code missing. |
| Markdown event | Present: category, SKUs, original price, markdown price, effective period, reason, and approver. |
| Promotion claim | Present but pending: vendor agreement attached, source sales extract attached, dispute status not yet confirmed. |
| Loyalty balance report | Present: points issued, redeemed, expired, customer balances, and programme policy reference. |
| WBR dashboard extract | Present: sales, gross margin, sell-through, return rate, shrink, and markdown rate with metric dictionary and source lineage. |
| Policy references | Present: references/source-basis.md, references/implementation-rules.md, references/retail-event-controls.md. |

## Processing Trace

1. Confirm reporting framework, jurisdiction, functional currency, store, channel, period, source systems, and reviewer route.
2. Separate operational completion from accounting release for every event.
3. Decompose POS and online transactions by SKU/category, tender, channel, discount, refund, and settlement batch.
4. Reconcile counted cash, card settlement, and mobile-money settlement to POS tenders and bank deposits.
5. Hold the return from sellable inventory until the disposition code is captured.
6. Route the markdown through margin and inventory valuation review using the approved reason, period, SKU/category, and approver.
7. Hold vendor funding recovery until agreement evidence, claim calculation, source transaction extract, and dispute status are complete.
8. Confirm loyalty issuance and redemption treatment follows the documented policy and reviewer route.
9. Verify each WBR financial KPI has metric definition, source lineage, refresh timestamp, and reconciliation status.
10. Prepare posting/reporting maps only through the governed posting route; do not write direct journal lines from the fixture.

## Illustrative Output

| Output item | Result |
|---|---|
| Decision status | Prepared for review, not auto-released. |
| Ledger impact | POS sales, tenders, fees, refunds, markdown impact, loyalty balances, and vendor claim routes mapped to accounts and dimensions, subject to review. |
| Reconciliation status | Cash/card/mobile-money matched except named settlement exceptions; return and vendor funding remain held. |
| Exception status | Statutory values blocked; return disposition missing; vendor funding dispute status pending. |
| Dashboard status | WBR metrics allowed only where drilldown and reconciliation state are attached. |
| Reviewer route | Controller reviews reconciliations and postings; sector specialist reviews retail operating-model assumptions; tax reviewer required if statutory values are introduced. |

## Acceptance Check

The fixture passes when an implementer can trace each retail source event from source document to account/dimension route, reconciliation workpaper, exception status, dashboard metric, and reviewer role without relying on unsupported facts or summary-only dashboard numbers.

Last reviewed: 2026-06-25.
