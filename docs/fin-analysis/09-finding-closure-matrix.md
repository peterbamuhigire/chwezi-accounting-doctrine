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
| F-001 Current standards | Standards-transition decision tree, IFRS 18 transition file, IFRS for SMEs third edition file, 2026/2027 fixtures, reviewer sign-off. | Ready for reviewer. Transition files and fixtures exist and validation passes. | Human IFRS reviewer sign-off is still required before marking closed. |
| F-002 Executability | Validator scripts, local or CI command, validation report with zero blockers. | Ready for reviewer. `tools/validate-doctrine.ps1` reports `pass` with zero findings. | Keep the saved validation report attached to release evidence. |
| F-003 Source verification | Source-register schema, Uganda source files, verified-current states, stale-source failure fixture. | Partially ready for reviewer. Source-register validation passes and Uganda NSSF is verified-current for the scoped mandatory contribution rule. | VAT, PAYE, WHT, income-tax, EFRIS, and exchange-rate entries remain draft and cannot support final statutory output until separately verified. |
| F-004 Core accounting engine | `ledger-posting-engine-core` skill, posting contract, invariant tests, examples. | Ready for reviewer. Core skill, references, examples, and quality-gate fixtures exist. | Consumer repos still need executable posting-service tests when adopting the doctrine. |
| F-005 Reference completeness | Reference manifest with no undeclared missing release-required files. | Ready for reviewer. Skill contract validation reports zero missing declared references. | Future declared files must be added or classified before release. |
| F-006 Presentation quality | Mojibake scan result with zero matches. | Ready for reviewer. Mojibake validation reports zero matches. | Continue running the scan before client-facing exports. |
| F-007 Integration | Mirror script root default, dry-run log, release ledger entry. | Ready for reviewer. `integration/mirror.ps1 -DryRun` succeeds from the repository root. | Actual mirroring should be done only for an approved release. |
| F-008 Skill composition | All active skills normalized with Inputs/Outputs and validator pass. | Ready for reviewer. Skill contract validation passes with 25 active finance skills and zero findings. | Keep the 25-skill cap unless a waiver is recorded. |
| F-009 Country coverage | Skeleton country packs with authority hierarchy and no final-rate leakage. | Ready for reviewer. Non-Uganda packs remain skeleton/draft and are source-register gated. | Kenya, Rwanda, Tanzania, and South Africa must remain non-final until jurisdiction review is complete. |
| F-010 Domain coverage | Inventory, fixed assets, payroll, consolidation skills with examples and tests. | Ready for reviewer. Domain skills and declared references/examples exist. | Consumer implementations still need module-specific acceptance tests. |
| F-011 Layman usability | Three-layer output pattern in templates and validator check. | Ready for reviewer. Quality-gate fixture map has 40 present evidence rows and zero planned rows. | Final client packs still require reviewer-approved wording. |
| F-012 Quality management | Engagement quality skill/reference, role matrix, ethics/independence caveats, reviewer sign-off workflow. | Ready for reviewer. Engagement-quality skill, reviewer fixtures, and sign-off templates exist. | Closure requires named reviewer sign-offs for the release being scored. |

## Closure Rules

A finding is not closed by prose alone. Closure requires:

- local files or generated evidence,
- validation output where applicable,
- named owner,
- named reviewer,
- date,
- residual caveat or waiver when evidence is incomplete.

The re-score request should attach this matrix with the state column updated from the evidence repository, not from intention.
