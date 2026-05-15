# Example - Payment Approval Flow

Scenario: Supplier payment of UGX 8,500,000 to Kampala Office Supplies Ltd.

## Actors

| Actor | Role | Allowed action |
|---|---|---|
| Jane Doe | Accountant | Prepare payment. |
| Peter Bamuhigire | Controller | Review and approve. |
| Amina Kato | Administrator | No payment approval rights. |

## Flow

1. Accountant selects approved supplier bill `BILL-2026-05-018`.
2. System checks supplier status, bank details, bill approval, and AP balance.
3. Accountant submits payment request.
4. Status becomes `awaiting-approval`.
5. Controller reviews bill, supplier bank detail history, and cash position.
6. Controller approves.
7. Posting service commits payment journal.
8. Audit log records maker, checker, time, evidence, and journal reference.

## Controls applied

| Control | Evidence |
|---|---|
| Maker-checker | Maker and checker are different users. |
| Supplier master-data control | No bank-detail change in prior 24 hours. |
| Threshold approval | Amount requires Controller approval. |
| Evidence attachment | Supplier bill and payment instruction are attached. |
| Period state | Payment date is in an open period. |

## Rejection example

If Jane Doe also has Controller role and attempts to approve her own payment, the system rejects the approval:

```text
This payment needs a different reviewer. Ask another authorised reviewer to approve it.
```

The record remains `awaiting-approval`, and the attempted self-approval is logged as a SoD event.

## Acceptance result

Payment can release only when the independent approval exists, the supplier details are current, and the period is open.

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
