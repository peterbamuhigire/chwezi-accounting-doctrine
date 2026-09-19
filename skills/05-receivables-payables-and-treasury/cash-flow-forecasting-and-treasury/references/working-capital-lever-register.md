# B07-A02 — Working-capital lever register

Use this register to move from a cash or ratio signal to a controlled,
reviewable management action. It does not authorise changing customer terms,
supplier commitments, credit impairment, tax treatment, or journal postings.

## Register schema

| Field | Required content |
|---|---|
| Lever ID | Stable ID, owner, and date opened |
| Signal | Source metric, period, scope, baseline, and locator |
| Hypothesis | Falsifiable explanation, kept separate from fact |
| Action | Smallest reversible operating experiment |
| Guardrail | Service, credit, supplier, covenant, fraud, and accounting boundary |
| Measure | Before/after metric and observation window |
| Evidence | AR/AP ageing, source events, cash bridge, reconciliation, exceptions |
| Decision rights | Preparer, approver, controller, and escalation role |
| Stop/rollback | Trigger and recovery action |
| Status | Proposed / pilot / accepted / rejected / blocked |

## Initial test-labelled register

| ID | Signal and baseline | Lever experiment | Guardrail and measure | Owner/status |
|---|---|---|---|---|
| WC-001 | TEST-AR ageing increased in P2; exact value pending source tie-out | Test a reminder sequence for a labelled customer cohort | No unilateral credit-policy change; measure valid receipts and disputes | AR lead / proposed |
| WC-002 | TEST-AP due-date concentration in P2; supplier schedule pending | Re-sequence approved payments within existing terms | No late fee, covenant, or supplier-criticality breach; measure cash timing and exceptions | AP lead / proposed |
| WC-003 | TEST inventory days signal; stock count not yet reconciled | Pilot purchase-order review for one category | No stock write-down or posting; measure service level and aged stock | Operations / blocked pending count |

Values are intentionally test-labelled. A source or reconciliation gap keeps a
lever `BLOCKED`; it cannot become a management fact by repetition.

## Control boundaries

- A lever changes a workflow or asks a question; it does not write the ledger.
- Any posting, impairment, provision, tax treatment, covenant conclusion, or
  customer/supplier contract change follows its owning approval and reviewer
  route.
- Evidence must tie to source documents, period, currency, dimension, and the
  AR/AP or inventory control account where applicable.
- A duplicate action key is rejected or quarantined; the register records the
  original action and any reversal.
- A locked period remains locked. A cash forecast cannot be used to bypass a
  posting service, reconciliation, or segregation of duties.

## Review decisions

The controller records `ACCEPT`, `ACCEPT_WITH_CAVEATS`, `REJECT`, or `BLOCK`,
with source IDs, unresolved exceptions, expected cash effect, customer/service
impact, rollback owner, and re-audit date. A cash improvement without retained
source and exception evidence is not a success measure.

## Failure tests

1. Remove the ageing source or control-account tie-out: status becomes
   `BLOCKED`.
2. Propose a lever that changes a posted amount directly: reject with
   `POSTING_BOUNDARY`.
3. Reuse a lever/action key: reject with `DUPLICATE_ACTION` and no second
   effect.
4. Omit the reviewer decision: keep `PENDING_REVIEW` and do not standardise.

