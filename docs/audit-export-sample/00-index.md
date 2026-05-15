# Audit Export Sample Index

Purpose: demonstrate the required audit export bundle shape for report-v2 release evidence.

Status: skeleton only. This folder is not a real audit pack and should not be used as evidence of financial statement values until populated, reconciled, hashed, and signed off.

## Bundle Contents

| Path | Purpose | Current state |
|---|---|---|
| `manifest.yaml` | Bundle metadata, release reference, contents, caveats. | Placeholder. |
| `reports/trial-balance.md` | Trial balance report placeholder. | Placeholder. |
| `reports/profit-or-loss.md` | Profit or loss report placeholder. | Placeholder. |
| `reports/financial-position.md` | Financial position report placeholder. | Placeholder. |
| `reports/cash-movement.md` | Cash movement report placeholder. | Placeholder. |
| `reports/tax-control-reconciliation.md` | Tax control reconciliation placeholder. | Placeholder. |
| `ledger/journals.csv` | Journal header structure. | Headers only. |
| `ledger/journal-lines.csv` | Journal-line header structure. | Headers only. |
| `ledger/source-document-map.csv` | Drilldown map from source to journal/evidence. | Headers only. |
| `evidence/` | Source-document placeholder folders. | README placeholders. |
| `signoffs/` | Preparer, reviewer, and controller signoff templates. | Template placeholders. |
| `hashes/` | Hash method and checksum file. | Instructions and placeholder checksum file. |

## Required Drilldown Chain

Every final report value must support this chain:

```text
Report line -> account -> journal -> journal line -> source document -> evidence file -> audit-log entry
```

## Release Rule

Before this sample can support a re-score, it must include sample values, reconciled ledger rows, source-document references, reviewer sign-offs, and regenerated hashes.
