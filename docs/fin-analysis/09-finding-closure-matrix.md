# Finding Closure Matrix

Prepared: 2026-05-15
Source: `.codex-report-v2-extract.md`

## Closure State Legend

| State | Meaning |
|---|---|
| Open | Required implementation evidence is absent or not inspected. |
| Evidence skeleton added | Documentation or sample structure exists, but it is not enough to close the finding. |
| Ready for reviewer | Implementation evidence appears present and needs reviewer sign-off. |
| Closed | Evidence exists, validation passes, and reviewer sign-off is recorded. |

## Matrix

| Finding | Required closure evidence | Current report-v2 documentation state | Residual caveat |
|---|---|---|---|
| F-001 Current standards | Standards-transition decision tree, IFRS 18 transition file, IFRS for SMEs third edition file, 2026/2027 fixtures, reviewer sign-off. | Open in this documentation scope. The required evidence remains listed for implementers. | 2027+ outputs must carry transition caveats until files, fixtures, and review exist. |
| F-002 Executability | Validator scripts, local or CI command, validation report with zero blockers. | Open in this documentation scope. | No 90+ claim without saved validation output. |
| F-003 Source verification | Source-register schema, Uganda source files, verified-current states, stale-source failure fixture. | Open in this documentation scope. | Final statutory values remain draft unless backed by verified-current or approved caveat entries. |
| F-004 Core accounting engine | `ledger-posting-engine-core` skill, posting contract, invariant tests, examples. | Open in this documentation scope. | Ledger behavior can still diverge across consumers. |
| F-005 Reference completeness | Reference manifest with no undeclared missing release-required files. | Open in this documentation scope. | Missing promised files must be classified before release. |
| F-006 Presentation quality | Mojibake scan result with zero matches. | Open in this documentation scope. | Client-facing materials should not be released until scan is clean. |
| F-007 Integration | Mirror script root default, dry-run log, release ledger entry. | Open in this documentation scope. | Consumer engines need dry-run evidence before mirroring claims. |
| F-008 Skill composition | All active skills normalized with Inputs/Outputs and validator pass. | Open in this documentation scope. | Skill composability remains a re-score limiter. |
| F-009 Country coverage | Skeleton country packs with authority hierarchy and no final-rate leakage. | Open in this documentation scope. | Kenya, Rwanda, Tanzania, and South Africa must remain skeleton/draft unless verified. |
| F-010 Domain coverage | Inventory, fixed assets, payroll, consolidation skills with examples and tests. | Open in this documentation scope. | Common client domains remain under-specified. |
| F-011 Layman usability | Three-layer output pattern in templates and validator check. | Evidence skeleton added through fin-analysis guidance. | Closure still requires template adoption and validation. |
| F-012 Quality management | Engagement quality skill/reference, role matrix, ethics/independence caveats, reviewer sign-off workflow. | Evidence skeleton added through release manifest and audit-export signoff templates. | Closure still requires reviewer matrix adoption in the doctrine and actual sign-offs. |

## Closure Rules

A finding is not closed by prose alone. Closure requires:

- local files or generated evidence,
- validation output where applicable,
- named owner,
- named reviewer,
- date,
- residual caveat or waiver when evidence is incomplete.

The re-score request should attach this matrix with the state column updated from the evidence repository, not from intention.
