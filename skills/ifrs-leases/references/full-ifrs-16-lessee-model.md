# Full IFRS 16 Lessee Model

Use this model when a full-IFRS lease is not short-term or low-value.

## Initial measurement

| Component | Rule |
|---|---|
| Lease liability | Present value of unpaid lease payments at commencement date. |
| Discount rate | Implicit rate if readily determinable; otherwise incremental borrowing rate. |
| ROU asset | Lease liability plus prepayments, initial direct costs, restoration provision, less incentives. |
| Lease term | Non-cancellable period plus reasonably certain extension options, less reasonably certain termination options. |

## Lease payments

Include:

- Fixed payments less lease incentives.
- In-substance fixed payments.
- Variable payments based on an index or rate, initially measured using commencement-date index or rate.
- Expected residual value guarantees.
- Purchase option exercise price when reasonably certain.
- Termination penalties when lease term assumes termination.

Exclude variable payments linked to future usage or sales until incurred.

## Subsequent schedule

| Period | Opening liability | Interest | Payment | Closing liability | ROU depreciation |
|---|---:|---:|---:|---:|---:|
| 1 | 0 | 0 | 0 | 0 | 0 |

## Journal patterns

| Event | Debit | Credit |
|---|---|---|
| Commencement | ROU asset | Lease liability, bank, restoration provision, incentives as applicable |
| Payment | Lease liability and interest expense | Bank |
| Depreciation | Depreciation expense - ROU | Accumulated depreciation - ROU |
| Remeasurement | ROU asset or P&L, depending on case | Lease liability, or reverse entry |

## Controls

- Lease register must reconcile current and non-current liability to GL.
- Modifications require reassessment and documented discount-rate treatment.
- Section 20 finance-lease schedules must not be labelled IFRS 16 unless full IFRS applies.
