# Independent review: validation-state aggregation

Verdict: no actionable defect found in the current patch to
`tools/validate-doctrine.ps1` and the new
`tests/validation-state/scripts/Test-ValidationStateNegativeControls.ps1`.
The reported aggregation defects are corrected, and the new test participates
in the principal validator (synthesis; [implementation](../../tools/validate-doctrine.ps1#L16),
[test](../../tests/validation-state/scripts/Test-ValidationStateNegativeControls.ps1#L16),
and reviewer execution below).

Scope: local software behaviour only; accounting/reporting basis is not
applicable to this code review. Read the root agent guide, README, accounting
doctrine, accounting Kaizen skill, adoption plan, and quality gates; applied
the engineering audit and evidence instructions already read in this session.
No other patch, engine, ledger, statutory claim, or source-state repair was
reviewed or changed. Only this report was written.

## Findings and integration assessment

- Empty results, missing or invalid state, missing or incorrectly typed exit
  evidence, and non-success child exits now return failure before normal state
  aggregation. Existing failure-over-caveat-over-pass precedence remains intact.
  Evidence: [aggregation function](../../tools/validate-doctrine.ps1#L16) and
  the baseline comparison below (synthesis).
- The parent captures the child process exit and overwrites any supplied
  `exit_code` field before aggregation. The new harness extracts the actual
  function AST, checks parser/function availability, and evaluates explicit
  expectations without recursively invoking the parent. Its failure branch
  emits a failing report and exits unsuccessfully. Evidence:
  [parent integration](../../tools/validate-doctrine.ps1#L51) and
  [test harness](../../tests/validation-state/scripts/Test-ValidationStateNegativeControls.ps1#L4)
  (synthesis).
- No new filesystem mutation or hidden success path was established in these
  changes. The standalone test and parent integration both completed
  successfully in reviewer execution. This is a bounded patch verdict, not
  certification of finance outputs or the entire validator (synthesis).

## Reviewer execution evidence

Standalone command:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File tests/validation-state/scripts/Test-ValidationStateNegativeControls.ps1 -Strict -Json
```

Observed report: state `pass`, empty findings. Case definitions are in the
[test source](../../tests/validation-state/scripts/Test-ValidationStateNegativeControls.ps1#L16).

Independent baseline comparison: extracted `Get-ValidationState` from
`git show HEAD:tools/validate-doctrine.ps1` and the working file using the
PowerShell parser. Renamed the baseline function in memory; executed neither
parent script during this comparison. Synthetic inputs were supplied directly
to each function. These are observed terminal results, reproduced verbatim:

```text
empty: baseline=pass; patched=fail
unknown: baseline=pass; patched=fail
child failure with pass: baseline=pass; patched=fail
mixed pass and caveat: baseline=pass-with-caveats; patched=pass-with-caveats
mixed caveat and fail: baseline=fail; patched=fail
upper-case state: baseline=pass; patched=fail
missing state: baseline=pass; patched=fail
boolean exit: baseline=pass; patched=fail
```

Parent integration command, without a report-file argument:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File tools/validate-doctrine.ps1 -Strict -Json
```

Reviewer extracted the aggregate and new child result from the returned JSON.
Observed terminal summary, reproduced verbatim:

```text
parent_exit=0; aggregate=pass
validation-state-negative-controls: state=pass; exit=0
```

Test limits: non-success child evidence was exercised as synthetic function
input, not by replacing an installed child script with a failing process.
The parent exit-capture and final failure-exit path were inspected in source.
PowerShell Core and non-Windows execution remain `NOT_ASSESSED`. No deliberate
ledger/source writes, report export, or networking was performed.

Currentness disposition: `NO_TIME_SENSITIVE_CLAIMS` about external standards,
rates, laws, or platform support. Evidence is context-bound to this local
snapshot; recheck if the scoped implementation changes. Professional finance
sign-off and production behaviour are outside this review.

## Snapshot

Baseline observed with `git rev-parse HEAD`:
`3905514bae0eb651e7f6b9ca65771cd250f4b5eb`.
Working-file hashes observed with `Get-FileHash`:

```text
tools/validate-doctrine.ps1
BFA6D1863741D83F141A49D5F63539198140AB3FE92CA2CDFE34BA4422A7ACB7
tests/validation-state/scripts/Test-ValidationStateNegativeControls.ps1
84816F325215FFC1B1622EF2CADC9F1CC50C578BA0D3E6EAEB9BF6F4D6B49441
```

Editorial check: findings and verdict stay within code and execution evidence;
no numerical grade, external currentness assertion, or finance-release claim
is assigned. Documentation and route changes remain with the main worker.

## Addendum: YAML validation extension

Verdict: no actionable defect found in the new Python checker, PowerShell
wrapper, Python tests, or their parent-gate integration. This extends the
review scope only to those additions. Description-edit totals and prose
preservation were not independently audited; CI dependencies and documentation
remain with the main worker.

The checker parses frontmatter using `yaml.safe_load`, requires a mapping,
checks directory identity and a non-empty string description, and converts
parse/read failures into failing findings. Empty discovery also fails. The
wrapper forwards Python's process exit, and the parent captures it through the
previously reviewed aggregation path. Evidence:
[checker](../../tools/check_frontmatter_yaml.py#L8),
[wrapper](../../tools/check-frontmatter-yaml.ps1#L5),
[parent registration](../../tools/validate-doctrine.ps1#L43), and execution
below (synthesis).

The existing tests cover malformed versus quoted colon-bearing descriptions,
non-mapping YAML, wrong identity, invalid description type, and empty discovery.
The independently run file currently contains two test methods, with subtests
inside the parsing test; the actual count is recorded below rather than
adopting the supplied summary. Evidence:
[test definitions](../../tests/test_frontmatter_yaml.py#L12) and the primary
execution output below. This count difference is not an implementation finding.

### YAML extension execution record

Executed:

```powershell
python -m unittest discover -s tests -p test_frontmatter_yaml.py -v
powershell.exe -NoProfile -ExecutionPolicy Bypass -File tools/check-frontmatter-yaml.ps1 -Strict -Json
powershell.exe -NoProfile -ExecutionPolicy Bypass -File tools/validate-doctrine.ps1 -Strict -Json
```

Observed unittest summary, reproduced verbatim:

```text
Ran 2 tests in 0.014s

OK
```

The standalone wrapper returned a passing YAML report with empty findings.
For a process-level empty-catalogue probe, passed the existing repository
directory `tests/validation-state` as `-RepoRoot`; it has no `skills` tree.
For unavailable execution, launched the wrapper in a child Windows PowerShell
process with that child's `PATH` cleared. No installed dependencies or parent
environment settings were changed. Observed summaries, reproduced verbatim:

```text
empty_scope: exit=1; state=fail; code=YAML-EMPTY
python_unavailable: exit=1; stdout_empty=True; error_present=True
parent: exit=0; aggregate=pass
yaml_child: state=pass; exit=0
```

Supplementary in-memory probes mocked discovery and file reads for a synthetic
`skills/demo/SKILL.md`. Missing opening delimiter, missing closing delimiter,
empty mapping, and unsupported YAML tag each returned `fail` with `YAML-001`.
No fixture files were written. These probes supplement the committed tests;
they are not claimed as additional discovered test methods.

Limits: missing PyYAML was not separately injected; actual unreadable-file and
invalid-encoding failures were inspected in the exception handler but not
exercised. Non-Windows execution remains `NOT_ASSESSED`. This establishes local
validation behaviour, not statutory correctness or domain-rule compliance.

Reviewed extension snapshot, observed with `Get-FileHash`:

```text
tools/check_frontmatter_yaml.py
1DB87B80F92D4DFA8D6758B6CF9CAE2B77745F8EC19701D3FECA9C836DB5E7F4
tools/check-frontmatter-yaml.ps1
C6366AC60C039CAEFEB69A8447252EB438EF1C922368CBCAD16D6387216B718E
tests/test_frontmatter_yaml.py
D037295D896694DB0D10AD8C102B9989ACE736327B7645232AA3D04F4AF1C1DA
tools/validate-doctrine.ps1
1D1C7C75D1F7E5B8A0878CC7DBCEA0E40F3D3189C0A593FCD4EF23A32740C298
```
