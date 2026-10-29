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

**Commit:** recorded after verification in the cycle history.
