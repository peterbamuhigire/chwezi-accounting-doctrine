# B03-A02 — Rolling forecast and cash bridge fixture

This is a fictional, test-labelled fixture. It is an internal planning example,
not a client forecast, tax computation, IFRS conclusion, or liquidity assurance.

## Scope and inputs

| Field | Value |
|---|---|
| Entity | `TEST-ENTITY-01` |
| Reporting basis | `management-planning-basis; confirm engagement basis before use` |
| Functional currency | `TEST-CURRENCY` |
| Horizon | Three monthly periods: `P1`, `P2`, `P3` |
| Opening cash | 10,000 at the start of P1 |
| Actual source snapshot | `TEST-SRC-AR-AP-001`, reconciled for P1 opening balances |
| Reviewer route | Management accountant prepares; controller reviews |

All amounts are test units. The fixture intentionally contains no tax rate,
exchange rate, legal threshold, or standard conclusion.

## Driver and cash bridge

| Period | Opening cash | Receipts | Operating payments | Investing payments | Financing payments | Closing cash |
|---|---:|---:|---:|---:|---:|---:|
| P1 | 10,000 | 8,000 | 6,500 | 1,000 | 0 | 10,500 |
| P2 | 10,500 | 7,500 | 7,000 | 0 | 500 | 10,500 |
| P3 | 10,500 | 9,000 | 7,200 | 1,500 | 0 | 10,800 |

The deterministic formula is:

```text
closing = opening + receipts - operating_payments - investing_payments - financing_payments
```

The roll-forward check is `next opening = prior closing`. The fixture passes:

```text
P1 = 10,000 + 8,000 - 6,500 - 1,000 - 0 = 10,500
P2 = 10,500 + 7,500 - 7,000 - 0 - 500 = 10,500
P3 = 10,500 + 9,000 - 7,200 - 1,500 - 0 = 10,800
```

## Evidence and control checks

| Check | Normal result | Failure path |
|---|---|---|
| Source snapshot and checksum | Present and reconciled | Hold forecast; create missing-source exception |
| Currency and period identity | Same for all rows | Reject mixed currency/period rows |
| Bridge arithmetic | Three rows balance | Reject and retain variance; never round it away |
| Opening-to-closing roll-forward | P2/P3 openings tie | Block release until tie-out is repaired |
| Duplicate event key | Unique per source period | Quarantine duplicate; no second effect |
| Locked period | Forecast-only, no posting | Reject any posting request; use approved posting service |
| Reviewer sign-off | Controller decision recorded | Remain `PENDING_REVIEW` |

## Failure fixture

For a negative test, change P2 operating payments to `7,200` while leaving
closing cash at `10,500`. The recomputed closing cash is `10,300`; the fixture
must return `BRIDGE_MISMATCH`, retain both values, and prevent acceptance.
Removing `TEST-SRC-AR-AP-001` must return `MISSING_SOURCE` and prevent any
fallback from becoming an accepted fact. Reusing a source event key must return
`DUPLICATE_EVENT` without changing the bridge.

## Reviewer workpaper fields

Record the preparer, reviewer role, decision, decision date, source IDs,
reconciliation result, exceptions, fallback used (if any), and recheck date.
The fixture is accepted only after an independent reviewer re-performs the
three rows and signs the decision record.

