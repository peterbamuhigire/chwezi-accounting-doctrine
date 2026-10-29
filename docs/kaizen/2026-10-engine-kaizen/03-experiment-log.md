# Experiment log — 2026-10

## A2 — scan and repair forbidden text-control bytes

**Hypothesis.** The text gate will detect non-tab C0 control bytes and DEL in
configured text files, while allowing ordinary tabs. A scoped repeat scan will
find the corrupted contract rows that the earlier mojibake-only check missed.

**Pre-change observation.** Raw-byte inspection found one identical damaged
data-contract line in 74 `implementation-rules.md` files. Each line contained
four control bytes: form-feed replaced the initial letters in `framework` and
`functional_currency`, and bell replaced the initial letters in `account_code`
and `amount`. The exact before/after mapping was:

```text
Before: period_id, <0x0C>ramework, jurisdiction, <0x0C>unctional_currency, ... posting_date, <0x07>ccount_code, dimension_set, <0x07>mount, ...
After:  period_id, framework, jurisdiction, functional_currency, ... posting_date, account_code, dimension_set, amount, ...
```

The same byte sequence occurred once per affected file. No distinct malformed
text pattern was included in this repair. All 74 affected reference rows were
restored to the readable field names; the untouched fields and surrounding
content were preserved.

**Small change retained.** `tools/check-mojibake.ps1` now scans configured text
extensions for forbidden C0 bytes and DEL and reports `MOJIBAKE-003`; tab,
line-feed and carriage-return are not flagged. A disposable fixture exercises
both sides of the boundary: bell is rejected; tab is accepted. The new negative
control is registered by `tools/validate-doctrine.ps1`.

**Verification.** On the post-change checkout:

- `python3 -m unittest discover -s tests -p 'test_*.py' -v` — exit 0; 20 tests
  passed.
- `git diff --check` — exit 0.
- The full strict doctrine gate ran in an ephemeral `mcr.microsoft.com/powershell`
  container against a disposable checkout copy — exit 0; 13 registered checks
  passed, 0 blocker/high/medium/caveat findings. The mojibake subcheck scanned
  718 configured text files and found 0 mojibake signatures and 0 control-byte
  lines. The focused negative control passed 2 of 2 cases.
- A separate raw-byte scan of the configured text extensions found 0 remaining
  forbidden control-byte lines. Python cache files were excluded from this text
  scan; the gate itself scans only its configured text extensions.

**Task recheck.** The task-2 Section 10 data-contract row is now readable and
all four field names are preserved. The practitioner response continues to
block unsupported final output. This experiment repairs text integrity; it does
not by itself prove the statutory or practitioner evidence gaps are closed.

**Measure and decision.** The detected recurrence set moved from 74 identical
corrupt text rows to zero. Both failure and permitted-tab controls behave as
expected. Retained. No fixture data, canonical doctrine, or client output was
changed.

**Commit:** `34a0874` (`fix(accounting): catch control-byte corruption in reference contracts`).

## Practitioner-output QA correction — trial-balance presentation

During final review, I found a double-count in my first draft of task 3: the
UGX 500,000 fixture profit subtotal was presented as a separate credit in the
trial balance while the underlying revenue and expense accounts were still
listed. I removed that duplicate line and labelled profit as a derived
statement subtotal. Recalculation from the listed fixture journals gives
combined transaction-journal debits and credits of UGX 8,940,000 each; the
unclosed trial-balance accounts total UGX 4,865,000 on each side. The assets,
liabilities and equity cross-foot now uses the derived profit only in the SFP
retained-earnings presentation. This was an authoring error in the scenario
record, not an instruction emitted by the engine. No client figures were used.

## A1 — focused material prior-period error example

**Hypothesis.** A Section 10 task response will distinguish the immutable
open-period ledger correction from IFRS for SMEs retrospective financial-
statement correction, and will block release until the source evidence,
materiality workpaper and reviewer approval are complete.

**Change retained.** The routed Section 10 worked example now presents a
synthetic four-journal illustration: original prior-period entry, linked
reversal, corrected posting and current-period profit normalisation. It labels
the amount and account classification as fixture assumptions, requires the
controller-approved prior-period adjustment mapping, and separates the Chwezi
posting pattern from the IFRS Foundation requirement in paragraphs 10.19–10.23.
Tax effects and actual materiality remain `NOT_ASSESSED`. A small Python
acceptance test checks the four journal rows balance and that the example names
immutability, Section 10, retrospective treatment and materiality review.

**Task recheck.** Task 2 was repeated against the updated example and official
IFRS Foundation third-edition text. The route remains the Section 10 skill,
period-locking, and ledger-posting guidance. The response now gives the example
as a route, keeps history immutable, and distinguishes the report restatement
from the implementation sequence. The source distinction is a synthesis of
Chwezi's canonical reversal pattern and IFRS Foundation Section 10; IFRS is not
described as prescribing Chwezi service operations.

**Verification.** `python3 -m unittest discover -s tests -p 'test_*.py' -v` —
exit 0; 21 tests passed. `git diff --check` — exit 0. The full strict doctrine
gate ran in a disposable PowerShell container on a copied checkout — exit 0;
13/13 registered checks, zero findings; local links checked 183 with zero
broken. No paid model run or client evidence was used.

**Measure and decision.** The formerly generic example now covers the observed
closed-period error case and calls out the required ledger/reporting split.
The text and arithmetic acceptance checks pass. Retained. A true external-model
routing precision score and a 3-positive/2-negative skill-specific routing
fixture remain `NOT_ASSESSED`; this cycle has not claimed either.

**Commit:** to be recorded after the separate A1 commit is created.
