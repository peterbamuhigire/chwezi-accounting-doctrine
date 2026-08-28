# Worked Example: Uganda EFRIS Fiscalisation Control

This example uses fictional identifiers and no client facts. It demonstrates
the control shape only; it does not assert a live URA rate, endpoint, response,
or legal conclusion.

## Inputs

- Framework: IFRS for SMEs; jurisdiction: Uganda; currency: UGX.
- Tenant profile: `tenant-demo`, fictional TIN `TIN-TEST-ONLY`, test environment.
- Source event: one approved B2B invoice with governed tax codes and product
  mappings; the buyer profile has a verified test TIN.
- Provider evidence: a recorded, explicitly test-labelled response fixture.

## Decision

The accounting service decomposes the invoice into net, tax, and gross, posts
through the approved sale-event service, and creates one fiscal queue item with
an immutable source hash and tenant-scoped idempotency key. The test adapter may
return a fixture FDN, but the result remains `test-accepted` and cannot unlock
production printing or be represented as URA evidence.

## Reconciliation

The workpaper links invoice ID, ledger journal, tax control account, queue ID,
request/response hashes, fixture ID, and reviewer. A timeout test repeats the
same key and proves no second invoice or journal is created. A changed payload
with the same key is quarantined.

## Acceptance evidence

- Source register marks the technical contract as test-labelled or verified.
- Invoice, ledger, fiscal queue, and evidence links are complete.
- Negative duplicate/replay and cross-tenant tests pass.
- Reviewer signs the test result; no production readiness is claimed.
