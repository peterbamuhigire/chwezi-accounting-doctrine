# Cutover Pack Template

The cutover pack is the signed evidence set for moving from a legacy system into Chwezi. It must be complete before the opening journal is posted.

## Header

```yaml
entity: "Chwezi Demo Ltd"
conversion_date: "2026-04-30"
timezone: "Africa/Kampala"
legacy_systems:
  - "QuickBooks Desktop"
  - "Excel stock sheets"
framework: "IFRS for SMEs"
book: "tax"
prepared_by: "Accountant"
reviewed_by: "Controller"
approved_by: "CFO"
release_state: "pass"
```

## Required schedules

| Schedule | Acceptance |
|---|---|
| Legacy trial balance | Balanced and mapped to Chwezi CoA. |
| CoA mapping | Every legacy account mapped or routed to Migration Suspense with reason. |
| Opening journal | Balanced by currency and book, posted through posting service. |
| AR open items | Sum ties to AR control. |
| AP open items | Sum ties to AP control. |
| Inventory | Quantity times unit cost ties to inventory control. |
| Fixed assets | Cost less accumulated depreciation ties to net book value. |
| Bank and mobile money | Statement closing balances tie to GL opening balances. |
| Cash and petty cash | Physical count evidence ties to GL opening balances. |
| Payroll and tax liabilities | Schedules tie to control accounts. |
| Migration suspense | Zero or formally waived. |

## Sign-off statement

```text
We confirm that the conversion date is recorded, the opening balances tie to legacy evidence, unresolved balances are disclosed, and the opening journal is ready for posting through the posting service.
```

## Rejection conditions

- Trial balance does not balance.
- Open subledger exists but is not migrated.
- Inventory uses LIFO.
- Tax balances lack supporting schedules.
- Suspense is non-zero without approved waiver.
- Opening journal bypasses posting service.

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
