# Microcopy Style

Voice and tone guide for non-accountant finance users. Copy must explain the business event first and keep accounting mechanics behind the workflow.

## Principles

- Use verbs that describe the user's task.
- Say what happened and what the user can do next.
- Avoid blame.
- Keep error messages recoverable.
- Show approval state clearly.
- Never hide a financial consequence in a toast only.

## Patterns

| Situation | Good copy | Avoid |
|---|---|---|
| Save failed | We could not save this sale. Check the connection and try again. | Invalid request. |
| Approval needed | Your manager will review this refund. We will notify you when it is approved. | Awaiting checker. |
| Locked period | May 2026 is locked. Ask the accountant to reopen it before recording this. | Period state error. |
| Missing evidence | Add the supplier bill before submitting this payment. | Evidence required. |
| Drawer variance | Counted cash is UGX 12,500 less than expected. Add a note for your manager. | Cash mismatch. |
| Reversal | This receipt is posted. Reverse and re-do it instead of editing it. | Cannot edit posted journal. |

## Button labels

Use direct verbs:

- Record sale.
- Receive payment.
- Submit refund.
- Ask manager.
- Add bill.
- Pay supplier.
- Close drawer.
- Reverse and re-do.

Do not use nouns as primary actions:

- Sale.
- Payment.
- Refund.
- Journal.

## Error template

```text
<What failed in business words>. <Why if known>. <Next action>.
```

Example:

```text
We could not submit this supplier payment. The supplier bill is missing. Add the bill, then submit again.
```

## Review checklist

- No accounting jargon on cashier, clerk, manager, or helper surfaces.
- Every blocking message names the next action.
- Approval-pending records show who reviews next.
- Posted records never offer Edit or Delete.
- Offline copy distinguishes saved locally from synced and posted.

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
