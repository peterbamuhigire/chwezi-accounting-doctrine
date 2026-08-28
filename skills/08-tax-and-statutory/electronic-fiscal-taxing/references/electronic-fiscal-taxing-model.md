# Electronic Fiscal Taxing Model

This reference is self-contained and was prepared from the supplied EFRIS
materials, the accounting doctrine, and implementation analysis. It is an
independent operational synthesis, not a reproduction of a manual.

## Boundary model

| Layer | Owns | Does not own |
|---|---|---|
| Commercial source | Customer, product, price, quantity, payment, invoice identity | Authority FDN or provider cryptography |
| Accounting | Recognition, tax-code selection, net/tax/gross, posting, reversals | Provider retry mechanics |
| Fiscal gateway | Validation, envelope, signing/encryption, transport, response parsing | Rewriting posted ledger history |
| Authority | Fiscal acceptance, FDN, verification code, QR, authority reports | BIRDC's internal GL policy |
| Reconciliation | Comparison, ageing, triage, evidence, sign-off | Silent correction of either source |

## Universal fiscal-document lifecycle

```text
draft -> validated -> queued -> submitted -> accepted
                              |             |
                              v             v
                         rejected      reconciled
                              |
                         retry/dead-letter/manual exception
```

Corrections are linked documents. An original invoice remains visible; a credit
note reduces an accepted supply when authorised, and a debit note increases it
when authorised. Accounting entries use approved reversal or adjustment paths.

## Tenant/client profile

The profile is the minimum configuration boundary for a single client or tenant:

- legal name, tax ID, VAT status, fiscal document mode, currency;
- branch/place-of-business and device assignments;
- provider environment, endpoint reference, key/certificate references;
- catalogue/dictionary versions and effective dates;
- offline limits/deadlines, operator permissions, and evidence retention;
- source-register snapshot and reviewer approval.

Single-client mode may resolve one profile implicitly. Multi-tenant mode must
resolve it from trusted session/JWT context, never from a body or query field.

## Control-account reconciliation

At each close, compare the population by tenant, branch, document class, and
cutover period:

1. commercial invoices and corrections;
2. fiscal accepted/rejected/queued population;
3. FDN/verification/QR evidence;
4. net, tax, and gross totals;
5. output-tax control account and AR/cash postings;
6. provider reports or Z-report equivalents;
7. unresolved and aged exceptions.

Differences are classified as timing, mapping, authority rejection, duplicate,
manual exception, historical scope, or true accounting error. Each class has an
owner and correction path.

## Evidence minimum

Retain the source document hash, request hash, response hash, tenant/profile
identifier, actor, timestamps, attempt number, provider status, FDN/verification
code/QR where returned, error code/message, and reviewer action. Redact secrets,
private keys, tokens, and unneeded personal data.
