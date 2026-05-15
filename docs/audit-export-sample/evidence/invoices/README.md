# Invoice Evidence Placeholder

Store invoice evidence files here for the sample bundle.

Required index fields for populated bundles:

| Field | Requirement |
|---|---|
| Source document ID | Must match `ledger/source-document-map.csv`. |
| File name | Stable, non-ambiguous file name. |
| Counterparty | Customer or supplier name. |
| Date | Invoice date. |
| Amount | Gross, tax, and net where applicable. |
| Hash | SHA-256 hash recorded in `hashes/sha256sums.txt`. |

This folder currently contains no audit evidence.
