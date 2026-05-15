# Example - Cashier Day Flow

Role: Cashier  
Entity: Chwezi Demo Ltd  
Branch: Mukono  
Period: May 2026  
Device: Android phone with intermittent connectivity

## Start shift

1. Cashier signs in and selects Mukono branch.
2. Home screen shows period `May 2026 open`, role `Cashier`, and drawer state `not opened`.
3. Cashier taps `Open drawer`.
4. Opening float is counted and submitted.

System effect: drawer session is opened; no sale is posted yet.

## Record sales

| Time | Action | User-facing result | Accounting effect |
|---|---|---|---|
| 09:12 | Record sale, cash | Receipt posted and printable. | Sale, VAT, cash tender clearing, and COGS posted. |
| 10:05 | Record sale, mobile money | Receipt saved; payment pending match. | Sale and mobile-money settlement clearing posted. |
| 11:40 | Offline sale | Status shows `saved on this device`. | Local queue waits for sync; user sees pending count. |

The cashier never sees account codes or journal lines.

## Refund request

Customer returns goods worth UGX 30,000. Cashier taps `Refund`, chooses the original receipt, adds reason `customer returned item`, and submits.

Result: status is `Waiting for approval`. Manager approves because the refund is under threshold. The system posts the reversal through the posting service.

## Exception during day

Mobile-money provider statement contains one payment with no sale reference.

User copy:

```text
One mobile-money payment needs matching. Send it to the accountant or match it to a sale.
```

Cashier chooses `Send to accountant`. The item enters the reconciliation queue with the cashier note.

## Close drawer

Expected cash: UGX 420,000  
Counted cash: UGX 417,500  
Variance: UGX 2,500 shortage

Because the variance is below the branch threshold, the cashier adds a note and submits. The manager reviews in the daily dashboard.

## End state

| Item | State |
|---|---|
| Drawer session | Closed |
| Cash sales | Posted |
| Offline sale | Synced and posted |
| Refund | Approved and reversed |
| Mobile-money exception | Assigned to Accountant |
| Evidence | Receipts and drawer-close count attached |

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
