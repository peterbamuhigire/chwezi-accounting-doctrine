# Sample Scan Report

## Executive Verdict

| Field | Result |
|---|---|
| Target | `sample-finance-module/` |
| Review type | codebase |
| Doctrine conformance | nonconformant-high |
| Release recommendation | revise before client release |
| Top blockers | Hard-coded tax rate; missing posting-service route; no evidence checksum |

## Findings

| Severity | Location | Doctrine | Finding | Risk | Alignment instruction | Acceptance check | Owner |
|---|---|---|---|---|---|---|---|
| high | `invoice.ts:42` | `tax-statutory-source-register-and-country-packs` | VAT rate appears hard-coded. | Stale statutory value may be released. | Load VAT rate from verified-current source-register entry and block posting when stale. | Unit test rejects stale source-register snapshot. | Tax reviewer |
| high | `journal.sql:12` | `ledger-posting-engine-core` | Journal line insert bypasses posting service. | Unbalanced or unaudited journals can enter GL. | Route through posting command with balance, idempotency, period, currency, and evidence checks. | Integration test proves direct insert path removed. | Engineering |
| medium | `receipts.md` | `audit-ready-reporting-pack` | Receipt evidence has no checksum field. | Auditor cannot prove source-file integrity. | Add evidence file hash and audit-log pointer. | Sample receipt drills to file hash and source document. | Controller |

## Acceptance Gate

- No direct ledger writes remain.
- All statutory values come from verified-current source-register entries.
- Every posted journal drills to source document, evidence file, actor, period, and audit log.
- Controller and tax reviewer sign-off are recorded.

Last reviewed: 2026-05-25.
