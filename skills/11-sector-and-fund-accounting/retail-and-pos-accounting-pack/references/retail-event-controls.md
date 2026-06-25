# Retail Event Controls and Acceptance Fixtures

This reference is self-contained doctrine guidance for retail accounting and finance-control workflows. It was prepared from the internal digital-research-engine project `umbrex-retail-playbooks-engine-enhancement` and existing Chwezi accounting doctrine. It is not a substitute for the full accounting standard, statutory authority, contract, or reviewer judgement.

## Retail Control Principle

Retail source events often start outside the ledger: POS, e-commerce, WMS, loyalty, vendor portals, planogram systems, or dashboards. A finance-safe retail system treats those events as evidence-bearing inputs, reconciles them to subledgers and control accounts, and routes judgemental treatment to a reviewer.

## Minimum Retail Source Event Fields

Every retail event that can affect accounting, margin, inventory, customer balance, supplier recovery, or management reporting should carry:

- event_id;
- event_type;
- source_system;
- source_document_ref;
- actor_id or integration_id;
- role;
- event_timestamp;
- business_date;
- entity_id;
- store_id or fulfilment_node_id where applicable;
- channel;
- SKU/category where applicable;
- customer_id where applicable and permitted;
- vendor_id where applicable;
- amount, currency, tax code, net/tax/gross split where applicable;
- original_transaction_ref where applicable;
- reason_code;
- approval_ref where applicable;
- evidence_ref;
- idempotency_key;
- reconciliation_status.

## Acceptance Fixtures

### 1. POS Day-End and Tender Settlement

**Given** a store has POS sales with cash, card, and mobile-money tenders for the trading day.

**When** day-end close runs.

**Then** the system must:

1. reconcile expected cash to counted cash;
2. match card and mobile-money tenders to provider settlement batches or mark them unmatched;
3. route fees, chargebacks, refunds, and variances to an exception queue;
4. prevent ledger posting for unresolved material variance unless an approved exception exists;
5. preserve receipt, tender, cashier, batch, and deposit evidence.

**Blocked output:** A daily sales journal that combines all tenders without settlement evidence.

### 2. Return, Refund, and Disposition

**Given** a customer return is initiated against an original sale.

**When** the item is inspected.

**Then** the accounting route must depend on disposition:

| Disposition | Required finance route |
|---|---|
| Sellable restock | Reverse or adjust sale/refund according to policy, return unit to inventory, reconcile refund tender. |
| Quarantine | Hold inventory status pending quality decision; no sellable stock increase. |
| Repair/rework | Capture cost and status; route to reviewer if material. |
| Vendor return | Link to vendor claim or credit note route. |
| Disposal/damage | Route to write-down/write-off approval and evidence. |

**Blocked output:** A refund with no original transaction link, no return inspection, or no stock disposition.

### 3. Markdown and Net Realisable Value Review

**Given** a markdown event reduces the selling price of aged or seasonal stock.

**When** the markdown is approved and becomes effective.

**Then** the finance workflow must:

1. preserve original price, markdown price, SKU/category, reason, approver, and effective period;
2. report markdown value separately from ordinary discounting;
3. route material markdowns to inventory valuation review where stock value may exceed recoverable amount;
4. expose markdown rate in management reporting by category, store/channel, and event.

**Blocked output:** A markdown treated only as a display-price change with no event log or margin reporting.

### 4. Promotion, Coupon, and Manual Discount

**Given** a promotion or coupon can combine with another offer.

**When** checkout applies the offer stack.

**Then** the system must check:

1. offer eligibility;
2. allowed or blocked stacking;
3. funding source;
4. margin floor or approval route;
5. source event for finance reporting.

**Blocked output:** Manual discounts above threshold without approver, reason, and cashier/transaction evidence.

### 5. Gift Card, Store Credit, and Customer Wallet

**Given** value is issued to a customer for later redemption.

**When** issuance, redemption, expiry, or cancellation occurs.

**Then** the system must maintain a customer-balance subledger and reconcile it to the appropriate liability or policy-approved account route.

**Blocked output:** Gift cards or store credits recorded only as sales at issuance without policy review.

### 6. Loyalty Points and Rewards

**Given** the retail programme issues points, vouchers, rewards, or tier benefits.

**When** points are earned, redeemed, expired, cancelled, or adjusted.

**Then** the workflow must separate:

- marketing measurement;
- customer balance;
- accounting policy judgement;
- fraud/abuse controls;
- expiry and breakage assumptions where applicable.

**Blocked output:** Loyalty liabilities, breakage, or reward cost treatment asserted without reviewer route.

### 7. Vendor Funding, Rebates, and Trade Spend

**Given** a vendor agreement includes allowances, rebates, co-op funding, scanbacks, or promotional support.

**When** the retailer claims recovery.

**Then** the claim must link to:

1. agreement clause or approved term;
2. source sale, purchase, promotion, compliance, or display evidence;
3. claim calculation;
4. vendor invoice/credit note or receivable route;
5. dispute status;
6. recovery reconciliation.

**Blocked output:** Supplier income or receivable recorded from an unsupported spreadsheet estimate.

### 8. Shrink, Stock Count, and Loss Prevention

**Given** a stock count or investigation identifies a variance.

**When** the variance exceeds tolerance.

**Then** the system must route the event to approval with:

- count sheet;
- SKU/category/store;
- book quantity/value;
- physical quantity/value;
- reason code;
- investigation status;
- approver;
- posting/reversal route;
- management reporting flag.

**Blocked output:** Automatic stock write-off from a count variance without approval and evidence.

### 9. Private Label Landed Cost

**Given** private-label inventory includes product cost, freight, duty, packaging, inspection, wastage, or rework.

**When** inventory is received or released from quality hold.

**Then** the cost build-up must document allocation basis, evidence, and reviewer route for judgemental or material components.

**Blocked output:** Private-label margin reporting that ignores freight, duty, packaging, or quality/rework cost where material.

### 10. Retail KPI Dashboard and Weekly Business Review

**Given** a dashboard displays sales, margin, markdown, return, shrink, vendor recovery, stock cover, or POS settlement metrics.

**When** a user opens the metric.

**Then** the dashboard must expose:

- metric definition;
- source system;
- refresh timestamp;
- transformation rule;
- reconciliation state;
- drilldown to source events or approved management-accounting dataset;
- owner and action log where used in weekly business review.

**Blocked output:** Dashboard summary values without drilldown affordance or reconciliation state.

## Reviewer Routes

| Matter | Minimum reviewer route |
|---|---|
| POS/cash/card/mobile-money settlement | Controller or accountant |
| Inventory costing, markdown valuation, shrink write-off | Controller; inventory accountant where available |
| Loyalty/gift card/customer wallet policy | Accountant/controller; legal/tax reviewer where statutory treatment is uncertain |
| Vendor funding recognition or recovery | Controller; contract owner; tax reviewer where applicable |
| Private-label landed cost | Controller; procurement/supply-chain owner |
| Retail KPI used in management accounts | Controller or FP&A owner |

## Release Gate

The retail/POS pack can be used for internal doctrine, proposals, SRS, business plans, and implementation design after this reference is loaded. Client-facing statutory, tax, audit, or accounting-policy conclusions remain blocked until current-source verification and named reviewer sign-off are recorded.

Last reviewed: 2026-06-25. Next review due: 2026-11-25.
