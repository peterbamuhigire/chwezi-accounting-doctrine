# Example: Stale Source Rejection

## Setup

A VAT return pack requests final output for country `UG`.

The source-register entry exists but `expires_or_recheck_due` is before the output date.

## Expected result

- Output state: rejected.
- Reason: source-register entry is stale.
- User-facing caveat: "This statutory value must be reverified from the authority source before final output."
- Reviewer action: refresh source evidence or mark output draft.
