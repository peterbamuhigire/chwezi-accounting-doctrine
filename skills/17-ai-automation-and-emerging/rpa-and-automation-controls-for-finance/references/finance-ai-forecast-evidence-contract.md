# B03-A01 — Finance AI forecast evidence contract

Status: IMPLEMENTED CONTRACT, internal doctrine fixture. It does not authorise
posting, approval, statutory reporting, tax treatment, or an IFRS conclusion.

## Purpose and boundary

The contract makes a forecast model's evidence chain inspectable from source
events through a deterministic baseline, model proposal, reviewer decision, and
release record. An AI may classify, explain, or propose scenarios. It may not
approve a judgement, post a journal, reopen a period, or release an external
report without the governed human route.

The reporting basis, entity, period, functional currency, scenario name, and
reviewer role are mandatory. Current tax, statutory, exchange-rate, or IFRS
claims require a verified-current source-register entry; otherwise the affected
output is `BLOCKED` or `NOT_ASSESSED`.

## Evidence contract

| Field | Required content | Failure state |
|---|---|---|
| `contract_id` | Stable case identity and version | Reject duplicate or missing identity |
| `scope` | Entity, reporting basis, jurisdiction, currency, period, scenario | `BLOCKED` if incomplete |
| `source_snapshot` | Source document IDs, extraction time, period, checksum, owner | `BLOCKED` if absent or stale |
| `actuals_baseline` | Reconciled actuals and control-account tie-out reference | `BLOCKED` if unreconciled |
| `drivers` | Named driver, value, unit, source, assumption/fact label, owner | `NOT_ASSESSED` for unsupported driver |
| `method` | Deterministic formula, model version, prompt/input hash, fallback | Reject opaque or unversioned result |
| `forecast_output` | Period-by-period values, currency, scenario, uncertainty band | `BLOCKED` if units or periods mismatch |
| `control_checks` | Balance, period, duplicate, currency, reconciliation, and completeness checks | `BLOCKED` on any failed check |
| `review` | Preparer, reviewer role, decision, date, comments, exception IDs | `PENDING_REVIEW` until signed |
| `release` | Internal-use scope, caveats, expiry/recheck date | Do not release outside scope |

Facts, assumptions, estimates, model inferences, and reviewer decisions must be
stored as separate values. A model output is a proposal until the reviewer
accepts it. The evidence record must retain the rejected proposal when a
fallback or override is used.

## Deterministic baseline and model boundary

The baseline is reproducible without the model:

```text
closing_cash[t] = opening_cash[t]
                 + receipts[t]
                 - operating_payments[t]
                 - investing_payments[t]
                 - financing_payments[t]
```

The model may propose a driver adjustment, but the contract recomputes the
bridge from stored inputs. The result is accepted only when the model output,
recomputed bridge, and source snapshot agree within a predeclared rounding
tolerance. Any difference is an exception, not a hidden correction.

The fallback is the last accepted deterministic forecast with the new source
slice explicitly marked missing. It never invents a rate, tax amount, standard,
cash receipt, or payment.

## Required normal and failure paths

| Path | Expected result | Evidence retained |
|---|---|---|
| Reconciled actuals plus reviewed drivers | `PENDING_REVIEW` then `ACCEPTED` | Baseline, formula, model output, bridge, sign-off |
| Missing source document or checksum | `BLOCKED` | Missing-source exception and owner |
| Stale or unverified statutory/tax/IFRS input | `NOT_ASSESSED` | Source-register ID, state, attempted check |
| Duplicate submission | Reject before mutation | Idempotency key and duplicate event record |
| Locked period or proposed posting | Reject; route to approved service | Period state and reviewer decision |
| Model disagrees with deterministic bridge | Hold release | Both values, variance, cause, resolution |
| Reviewer rejects the proposal | Use approved fallback or remain blocked | Rejected output and rejection reason |

## Reviewer decision record

The reviewer records one of `ACCEPTED`, `ACCEPTED_WITH_CAVEATS`, `REJECTED`, or
`BLOCKED`, with the decision basis, unresolved exceptions, next review date,
and whether any human override changed the proposal. A blank reviewer name is
not a sign-off; if no named reviewer is available, the state remains
`PENDING_REVIEW`.

## Acceptance checks

- Recompute the bridge from the stored source snapshot and obtain the same
  values, units, periods, and currency.
- Prove that no journal table, period state, or posted history is mutated by
  the forecast workflow.
- Submit the same `contract_id` and idempotency key twice; the second attempt
  is rejected or quarantined without a second effect.
- Remove the source-register entry or mark it stale; the affected claim is
  blocked and is not silently replaced with memory.
- Remove the reviewer record; release remains `PENDING_REVIEW`.

Evidence here proves a contract and testable decision boundary. It does not
prove a deployed model, production data quality, current statutory compliance,
or professional acceptance; those remain `NOT_ASSESSED` until independently
reviewed.

