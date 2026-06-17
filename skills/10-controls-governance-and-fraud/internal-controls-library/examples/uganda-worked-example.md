# Uganda Worked Example - Internal Controls Library

This is an illustrative fixture. It is not a client fact pattern and does not provide statutory rates or legal advice. All UGX figures below are ILLUSTRATIVE org-policy benchmarks (board-set thresholds and mandate), not statutory amounts; statutory rates (PAYE, NSSF, VAT, WHT) are not set here and flow through the source register / Statutory Schedule (verify current). See `doctrine/references/uganda-ngo-financial-management-patterns.md`. No human reviewer names are used; actors are role-based.

Scenario: A small Ugandan NGO disburses a supplier payment of UGX 6,000,000 to a field-services vendor, passing through the full segregation chain with an amount-tiered authorisation matrix and a dual-signatory bank mandate.

## Actors (role-based)

| Actor | Role | Allowed action |
|---|---|---|
| Programme Officer | Requester | Raise the payment request; cannot approve or sign. |
| Finance Officer | Checker | Check budget, documents, and accountability; cannot approve own check. |
| Executive Director | Approver | Approve within management tier; on the bank mandate. |
| Treasurer / second signatory | Co-signatory | Second of "any 2 of 3" on the bank mandate. |
| Accountant | Disburse and account | Prepare the disbursement and the posting; cannot approve. |
| Internal Audit | Reviewer | Independent post-disbursement review. |

## Authorisation Matrix (illustrative org-policy, not statutory)

| Tier | Limit (UGX, illustrative) | Approver |
|---|---|---|
| Operational | <= 1,000,000 | Finance/Admin Manager |
| Management | <= 10,000,000 | Executive Director |
| Board | > 10,000,000 | Treasurer / Board |

The UGX 6,000,000 payment falls in the management tier -> Executive Director approval, then dual-signatory disbursement.

## Segregation Chain (request -> check -> approve -> disburse -> account -> review)

1. Programme Officer raises payment request against approved supplier invoice `INV-2026-06-014` and the activity budget line.
2. Finance Officer checks budget availability, supporting documents, and prior accountability; status becomes `awaiting-approval`.
3. Executive Director (management tier) reviews and approves; no person occupies two adjacent control roles and no one approves in their own favour.
4. Bank mandate: any 2 of 3 named signatories sign (Executive Director + Treasurer); the principal signatory is on all accounts.
5. Accountant prepares the disbursement and the posting via the posting service (not a direct table write).
6. Internal Audit performs independent post-disbursement review; audit log records actor, time, evidence, and journal reference.

## Controls applied

| Control | Evidence |
|---|---|
| Segregation of duties | Request, check, approve, disburse, and review are different roles; no adjacent-role overlap. |
| Amount-tiered authorisation | UGX 6,000,000 routed to the management tier (Executive Director). |
| Dual-signatory bank mandate | Any 2 of 3 signatories; principal signatory present. |
| Maker-checker | Maker (Accountant) and approver (Executive Director) are different users. |
| Evidence attachment | Supplier invoice, approval, and activity budget line attached. |

## Rejection example

If the Programme Officer (requester) also attempts to approve the payment, the system rejects it:

```text
This payment needs a different reviewer. Ask another authorised reviewer to approve it.
```

The record remains `awaiting-approval`, and the attempted self-approval is logged as a SoD event. A single-signatory disbursement is likewise blocked by the dual-mandate rule.

## Acceptance result

Payment can release only when each segregation-chain role is held by a different actor, the amount is approved at the correct authorisation tier, two of the three mandated signatories sign, the posting goes through the posting service, and independent review follows. No statutory rate is asserted; thresholds and the mandate are illustrative org-policy to confirm against the client's board-approved manual.

Last reviewed: 2026-06-17. Next review due: 2026-12-17.
