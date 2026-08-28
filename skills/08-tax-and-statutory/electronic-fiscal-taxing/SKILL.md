---
name: electronic-fiscal-taxing
description: Use when designing, reviewing, or operating electronic fiscal taxation, e-invoicing, e-receipting, fiscal-device, or authority-reporting controls; load a jurisdiction reference such as Uganda EFRIS for verified local mechanics and keep tax administration separate from ledger truth.
metadata:
  portable: true
  category: 08-tax-and-statutory
  compatible_with:
    - claude-code
    - codex
---

# Electronic Fiscal Taxing

This is the accounting and control doctrine for electronic fiscal taxation. It
turns a jurisdiction's authority-facing requirements into tax-code, document,
ledger, evidence, reconciliation, and reviewer controls. It is jurisdiction-
neutral at the core; Uganda EFRIS is the first detailed reference pack.

<!-- dual-compat-start -->
## Use When

- An ERP, POS, mobile sales app, or billing system must issue fiscal documents.
- A tax authority requires electronic invoice, receipt, fiscal-device, or
  transaction-report submission.
- A client operates one legal entity or multiple tenants with distinct tax IDs.
- Online, offline, retry, correction, void, credit-note, or debit-note behavior
  affects tax evidence or accounting reconciliation.
- A controller needs to reconcile authority acknowledgements to invoices,
  VAT control accounts, stock, payments, and audit evidence.

## Do Not Use When

Do not use this skill as a substitute for current statutory verification, legal
advice, a tax opinion, a full accounting framework, or the web implementation
of an API adapter. Use the implementation skill in the web-dev engine for code;
use the jurisdiction pack here for the accounting and control interpretation.

## Prerequisites

- Read `doctrine/accounting-finance-doctrine.md` and the finance quality gate.
- Read `tax-statutory-source-register-and-country-packs` when a current rule,
  threshold, rate, deadline, or authority protocol is involved.
- Read the selected jurisdiction reference and its source register.
- Identify the reporting framework, entity/tenant, currency, period, owner, and
  required tax/accounting reviewer before making a release claim.

## Inputs

| Artifact | Required | Acceptance condition |
|---|---:|---|
| Entity or tenant profile | yes | Legal identity, tax ID, jurisdiction, currency, branches, and reviewer are named |
| Source-event pack | yes | Invoice/receipt, actor, date, amounts, tax codes, payment, and evidence pointer exist |
| Current source-register snapshot | yes for statutory output | Each live rule is verified-current or explicitly blocked |
| Accounting policy and CoA map | yes | Net, tax, gross, receivable/cash, and correction treatment are defined |
| Fiscal provider contract | yes for activation | Version, credentials owner, environment, and response semantics are recorded |

## Outputs

| Artifact | Consumer | Acceptance condition |
|---|---|---|
| Fiscal accounting policy | Controller and implementer | Separates authority obligations, ledger treatment, and judgement |
| Fiscal-document mapping | Integration and QA | Every source field maps to a governed tax/document field or a named exception |
| Reconciliation workpaper | Close owner and auditor | Authority result, invoice, tax control, payment, and exception states tie out |
| Exception and evidence register | Reviewer and operations | Missing, rejected, stale, duplicated, or manual documents have owner and due date |
| Reviewer release record | Finance and compliance owner | Framework, source state, tests, caveats, and sign-off route are explicit |

## Non-negotiables

1. EFRIS or another authority platform is a tax-administration boundary, not a
   replacement for the general ledger or the approved posting service.
2. Decompose VAT-inclusive transactions into net, tax, and gross. Route tax to
   governed control accounts; do not hide it in free text or provider payloads.
3. Never hardcode a current rate, threshold, deadline, endpoint, code, or return
   template. Use a verified-current source-register row or block release.
4. A provider acknowledgement is immutable evidence. Corrections use linked
   cancellation, credit-note, debit-note, or reversal workflows; posted history
   is not edited or deleted.
5. A fiscal status must distinguish `draft`, `queued`, `submitted`, `accepted`,
   `rejected`, `dead_letter`, `manual_exception`, `cancelled`, and `reconciled`.
6. Every tenant/client has an isolated fiscal identity and evidence chain. Never
   reuse a TIN, device, key, sequence, cached token, or offline store across
   tenants.
7. Reconciliation is a triage control, not a downloadable afterthought. Keep
   ageing, amount differences, missing FDNs, duplicate attempts, and reviewer
   action visible.

## Decision Rules

| Condition | Action | Risk avoided |
|---|---|---|
| Current authority rule and provider contract verified | Permit the documented workflow, subject to tests and reviewer sign-off | Stale or invented compliance behavior |
| Current source or credential is missing | Produce a qualified design and block production activation | False statutory readiness |
| Authority result is unknown after timeout | Preserve the same idempotency key, reconcile, then retry if allowed | Duplicate fiscal documents |
| Original document is posted and needs correction | Use a linked authority correction and accounting reversal/adjustment | Tampered history and tax mismatch |
| Offline operation is authorised | Use bounded offline state, evidence, upload deadline, and exception escalation | Uncontrolled unfiscalised sales |
| Tenant fiscal identity differs | Resolve profile by trusted tenant context and isolate queue/evidence | Cross-tenant filing or credential leakage |
| EFRIS and ledger totals differ | Hold reconciliation exception; do not silently alter either source | Hidden VAT or revenue drift |

## Core Workflow

1. **Frame scope.** Identify framework, jurisdiction, entity/tenant, fiscal
   document classes, source systems, accounting event, and reviewer.
2. **Verify authority facts.** Load the jurisdiction source register; classify
   each fact as current, caveated, historical, or blocked.
3. **Map accounting truth.** Define tax codes, effective periods, net/tax/gross
   decomposition, CoA accounts, source references, and correction postings.
4. **Map fiscal evidence.** Define seller, buyer, product, UOM, tax category,
   payment, document reference, authority response, verification artefacts, and
   tenant/device identity.
5. **Design states and exceptions.** Include validation rejection, timeout,
   duplicate, offline, manual exception, correction, cancellation, and replay.
6. **Reconcile.** Tie fiscal documents to invoices, tax control accounts,
   payments, stock, and reports. Age and assign every exception.
7. **Review and release.** Run the finance quality gate, source checks, control
   tests, and reviewer route. A blocked current fact prevents operational release.
8. **Standardise learning.** Record the Kaizen observation, experiment,
   validation evidence, owner, rollback, and next re-measurement date.

## Anti-Patterns

- Treating an FDN-shaped test value as a real fiscal acknowledgement. Fix: mark
  it test-only and require provider evidence.
- Posting tax from a provider response rather than the governed source event.
  Fix: reconcile both; the ledger posting service owns accounting.
- Sharing one fiscal profile or offline enabler among tenants. Fix: isolate by
  tenant/TIN and prove the boundary with negative tests.
- Issuing a corrected invoice by editing the original row. Fix: use linked
  authority and accounting correction documents.
- Retrying a timed-out submission with a new key. Fix: query/reconcile the old
  key, then retry the same idempotent operation.
- Treating an unverified offline deadline or tax rule as a permanent fact. Fix:
  keep it in the source register as caveated or blocked.

## Read Next

- `tax-statutory-source-register-and-country-packs`
- `e-invoicing-and-fiscal-device-integration` for legacy compatibility routing
- `ledger-posting-engine-core` and `reconciliation-and-cash-control`
- Web-dev engine: `electronic-fiscal-taxing`, `api-design-first`,
  `distributed-systems-patterns`, and `reliability-engineering`

## References

- [electronic-fiscal-taxing-model.md](references/electronic-fiscal-taxing-model.md)
- [Uganda EFRIS source register](references/jurisdictions/uganda-efris/source-register.md)
- [Uganda API and security](references/jurisdictions/uganda-efris/api-envelope-and-security.md)
- [Uganda document and tax mapping](references/jurisdictions/uganda-efris/document-and-tax-mapping.md)
- [Uganda offline and device operations](references/jurisdictions/uganda-efris/offline-device-and-operations.md)
- [Uganda reconciliation and controls](references/jurisdictions/uganda-efris/reconciliation-and-controls.md)
- [Worked example](examples/uganda-efris-worked-example.md)

## Acceptance Evidence

- Source-register entries identify source, version/date, state, verifier,
  recheck trigger, and unresolved conflict.
- A fiscal mapping exists for each document class in scope.
- A reconciliation workpaper and exception route exist.
- A reviewer can drill from report line to ledger, source document, provider
  evidence, and audit event.
- The release state is `pass`, `pass-with-caveats`, or `fail`; missing evidence
  is never silently treated as a pass.

## Review Metadata

| Field | Value |
|---|---|
| Owner role | Doctrine owner |
| Reviewer roles | Tax reviewer; country-pack owner; integration reviewer |
| Last reviewed | 2026-08-28 |
| Next review due | 2027-02-28 or on URA protocol/tax-law change |
| Release state | Active doctrine; production use remains source-register and reviewer gated |

<!-- dual-compat-end -->

Last reviewed: 2026-08-28. Next review due: 2027-02-28.
