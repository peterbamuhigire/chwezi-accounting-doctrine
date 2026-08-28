# Uganda EFRIS API Envelope and Security

This is an implementation-facing accounting control reference distilled from
the supplied API documents. It is not a substitute for the current URA pack.

## Envelope controls

The supplied v24 material describes an outer request with `data`, `globalInfo`,
and `returnStateInfo`. `data` may contain base64 content, a signature, and data
description fields such as code type, encryption code, and compression flag.
The global section carries interface code, exchange ID/UUID, request time,
application ID, taxpayer/device identity, operator and environment metadata.

Controls:

- Generate a unique exchange ID and preserve it with the source/idempotency key.
- Use the authority's exact timestamp format and synchronise server time; the
  supplied material describes a narrow client/server time tolerance.
- Treat `returnStateInfo` and the inner response code as separate evidence.
- Store redacted request/response hashes and the exact provider version; do not
  store private keys, AES keys, passwords, or bearer material in logs.
- Parse provider status codes into stable internal states without discarding the
  original code/message.

## Key-management controls

The supplied S2S guides describe a public/private-key and symmetric-key flow,
including a daily key retrieval sequence and signing of protected content.
Because the documents contain version-sensitive and potentially inconsistent
algorithm/field details, the production implementation must:

1. obtain the authorised current algorithm and key lifecycle;
2. store key material in an approved secret manager or protected host store;
3. scope keys to a tenant/client fiscal profile and environment;
4. rotate, revoke, test, and audit key versions;
5. separate test and production keys and endpoints;
6. prove that retries cannot accidentally use another tenant's key.

The accounting release gate is not satisfied merely because a cryptographic
library can produce a syntactically valid signature.

## Time and replay controls

Record UTC and local authority-facing time, monotonic attempt sequence, source
document hash, idempotency key, exchange ID, response code, and retry reason.
On timeout, query or reconcile using the original identity before retrying. A
new key is a new side-effect request and requires explicit business approval.
