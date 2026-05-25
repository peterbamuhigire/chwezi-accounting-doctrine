# Fixture: Stale Rate Rejection

## Setup

- Payroll run status: final requested.
- Country: UG.
- Required statutory source entry state: `stale`.

## Expected result

- Payroll run cannot finalize.
- No final payroll journal is posted.
- Exception names the stale source-register key.
- User can either refresh evidence or keep the run as draft simulation.
