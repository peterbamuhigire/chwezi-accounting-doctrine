# Provider Quirks

Known import and matching issues for bank, mobile-money, POS, and card settlement evidence. Treat this as implementation guidance, not as a verified provider API contract.

## Mobile-money providers

| Provider | Quirk | Required handling |
|---|---|---|
| MTN MoMo Business | Statement reference may contain provider transaction ID and customer phone in one text field. | Tokenize reference, phone, and narrative separately; preserve raw field. |
| MTN MoMo Business | Fees may appear as separate lines or netted from settlement. | Support both itemised-fee and net-settlement split rules. |
| Airtel Money Business | Export date may differ from value date. | Match on value date; store export date as evidence metadata. |
| Airtel Money Business | Reversal references may point to the original provider ID. | Link reversal to original line and route to reversal workflow. |
| Any provider | Daily export can omit late-night transactions depending on cut-off. | Period import includes an overlap day and de-duplicates by provider ID. |

## Bank statements

| Pattern | Risk | Required handling |
|---|---|---|
| Narrative truncation | Reference token missing from CSV. | Fall back to amount + date rule and keep item for manual review when multiple candidates exist. |
| Same-day batch deposits | Many receipts clear as one bank line. | Use merge matching; store matched receipt IDs. |
| Bank charges hidden in net amount | Gross bank movement does not equal ledger receipt. | Split bank charge before matching. |
| Re-exported statement | Duplicate lines appear with a new file name. | Reject duplicate checksum; de-duplicate by external ID where checksum differs. |
| Reversal followed by correction | Original and correction both appear. | Preserve both rows and link through exception resolution. |

## POS and card acquirers

| Pattern | Required handling |
|---|---|
| POS Z-report tender totals differ from counted cash. | Post variance to Cash Over/Short with manager review above threshold. |
| Card acquirer settlement is net of fee. | Clear gross from Card Settlement Clearing and post fee expense separately. |
| Chargeback occurs after original close. | Reverse original sale through posting service; do not edit the closed record. |
| Settlement spans multiple sales days. | Match by acquirer batch ID and settlement date; disclose batch composition. |

## Import evidence

Every import stores:

- Provider or bank name.
- External account ID.
- Exported-at date if present.
- Retrieved-at timestamp.
- Retrieved-by user.
- File checksum.
- Raw file archive path.
- Parser version.

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
