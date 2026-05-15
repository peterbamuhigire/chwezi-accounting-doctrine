# Example - Reconciliation Triage

Desktop and tablet workflow, comfortable density, role = Accountant.

## Screen contract

Purpose: resolve imported bank, mobile-money, POS, or card statement lines against ledger lines without editing imported evidence.

## Layout

```text
Header: account | provider | period | ageing summary | export evidence pack
Filters: unmatched | partial | exception | pending evidence | date range | amount
Left pane: imported statement lines
Centre actions: Match | Split | Unmatch | Mark exception | Create posting
Right pane: candidate ledger lines
Detail drawer: raw evidence | match metadata | audit log | notes
```

## Imported line card

| Field | Rule |
|---|---|
| Amount | MoneyCell, currency explicit when mixed. |
| Value date | Primary match date. |
| External reference | Raw value preserved. |
| Counterparty | Displayed as imported; canonical match shown separately. |
| Age | Days since value date or period close, whichever is later. |
| Match state | StatusChip. |

## Required flows

1. Exact match: select one imported line and one ledger line, then `Match`.
2. Split match: select one imported line and multiple ledger lines; system verifies total.
3. Net settlement: create fee posting, then match the residual.
4. Exception: assign owner, reason, and due date.
5. Evidence pack: export only after reviewer sign-off or explicit draft watermark.

## Guardrails

- Imported rows cannot be deleted or edited.
- Re-import uses supersede, retaining the original import and checksum.
- Posting commands go through maker-checker where required.
- Locked-period postings require the reopen workflow.
- Ambiguous automatic matches are presented as candidates, not committed silently.

## Acceptance checks

- Ageing summary count equals the filtered line states.
- Manual match stores actor, timestamp, and rule ID.
- Split match cannot pass with a residual unless marked `partial-match`.
- Evidence pack includes import file checksum and parser version.

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
