# Chwezi Accounting Doctrine baseline — 2026-10-29

## Baseline evidence snapshot and scoring correction

The pre-change repository state was `ff33ff14` on `kaizen/2026-10`; the
checkout was clean at start, and the parent portfolio recorded its pre-pull
inventory outside this repository. The scorecard itself was **not frozen
before implementation**, as the prompt required. These baseline ratings were
reconstructed after the experiments from the recorded pre-change files,
validator output and practitioner observations. This is a process deviation;
it prevents a claim that the ratings were contemporaneously frozen.

The first post-cycle draft carried provisional baseline scores of 74, 72, 67,
63, 42, 50, 70, 62, 52 and 84 (raw mean 63.6). Root review found that the high
scores, especially above 65, were not supported by extraordinary or broad
evidence and that the scores were too generous relative to unassessed product,
accessibility, routing and reviewer evidence. I preserve those superseded
ratings here as correction history, not as a measured freeze. The table below
contains the corrected baseline reassessment; final scores are reassessed in
`05-final-report.md`. Neither pass was an independent audit. No change to the
canonical accounting doctrine is included in this cycle.

The supplied prompt named `digital-research-engine`; that checkout/path was not
present here. The matching Portfolio Kaizen Standard and Currentness Gate were
read from the available `chwezi-research-engine` checkout, together with its
`source-evaluation` and `source-verification` skills. This path mismatch is an
environment observation, not evidence that the absent checkout has been
inspected.

## Scorecard

The ten dimensions are equally weighted. `Raw overall = mean of the ten raw
dimension scores`; published score is `min(raw overall, 65)`. Scores are an
evidence-bounded maintainer assessment, not an independent auditor opinion.
Open statutory, reviewer, execution and release gates remain blockers
independently of this score.

| Dimension | Raw /100 | Evidence inspected | Deficiency at baseline |
|---|---:|---|---|
| Doctrine | 58 | `doctrine/accounting-finance-doctrine.md`, ledger invariants, finance quality gate and 108-skill inventory | Core boundaries are documented, but this cycle sampled rather than re-audited all output families and had no professional acceptance. |
| Taxonomy and routing | 60 | `README.md`, `docs/router-map.md`, and 108 active skill paths | Inventory and route map exist, but no executed labelled query set establishes precision@1 or broad routing performance. |
| Skill depth | 55 | Three task routes and selected skill/reference content; 136 example files counted | Coverage varies; the example count is only a size proxy and broad workflow quality was not measured. |
| Applied proof | 54 | Baseline 20-test Python run and 12-check strict gate, including 63 accounting assertions | Tests cover deterministic checks, not end-to-end user/model behavior, Windows PowerShell 5.1 or controller acceptance. |
| Standards currency | 38 | Source-register inventory and official source review recorded in `00-scope-and-evidence.md` | 11 source records required recheck; multiple statutory entries were draft, and cross-jurisdiction review was incomplete. |
| Output readiness | 48 | Existing journal, EFRIS and payroll examples; the three synthetic task observations | No independently reviewed assembled statement/PBC pack, source support, or client-ready output was demonstrated. |
| Accessibility and inclusion | 50 | Accessibility/UX skill routes were located | No rendered, assistive-technology or inclusive-output evaluation was performed. |
| Production and handoff | 48 | Installer, Claude plugin/marketplace, Codex policy helper and CI definitions inspected | No native install/use flow was executed and there was no repository-local Codex catalogue or file-cap guard. |
| Hygiene | 44 | Baseline file count, source dates, local-link scan, path scan and 12-check gate | The local-link scan passed, but a repeated control-byte defect, overdue source reviews and machine-specific historical references remained. |
| Safety and integrity | 60 | Finance quality gate, source-state refusal, reversal/approval controls, baseline tests | Statutory outputs were blocked pending review, and live professional acceptance, privacy/system security review and user behavior were unassessed. |

**Corrected baseline raw mean:** 51.5/100. **Calculation:** (58 + 60 + 55 + 54 + 38 + 48 + 50 + 48 + 44 + 60) / 10 = 515 / 10. **Standard published capped score:** 51.5/100 (`min(51.5, 65)`). **User-requested initial-baseline cap:** 45/100 (`min(51.5, 45)`). Both caps are applied to the same raw mean; the raw dimension scores are not altered to meet either cap. **Blockers:** final statutory outputs using draft, expired or
unverified register entries; Windows PowerShell 5.1 and remote CI are
unassessed; no professional controller acceptance for the three scenario
outputs.

## Measured inputs

| Measure | Baseline observation |
|---|---|
| Registered native validator | `tools/validate-doctrine.ps1 -Strict` registers 12 checks in `tools/validate-doctrine.ps1` lines 40–52. Run in a disposable `mcr.microsoft.com/powershell` container on a read-only working-tree copy, with `python-is-python3` and `python3-yaml` installed only inside the ephemeral container: strict parent exit 0, state `pass`, 12/12 checks pass, 0 blockers/high/medium/caveats; 0 findings. Windows PowerShell 5.1 remains `NOT_ASSESSED`. |
| Python tests | `python -m unittest discover -s tests -p 'test_*.py' -v`: 20 tests passed, 0 failures, exit 0. This is the observed local count, superseding the September report's count for its earlier snapshot. |
| Routing precision@1 | `NOT_ASSESSED`: no labeled query/expected-skill dataset was found or executed. |
| Owned routing negatives | `NOT_ASSESSED`: repo has router-map negative-control tests, but no inventory demonstrating per-skill owned negative examples. |
| Fixture coverage (3 positives + 2 owned negatives per skill) | `NOT_ASSESSED`; no such complete skill-indexed coverage was found. The repository has 108 active skills and 7 Markdown/JSON files under `tests` counted as fixture candidates, not a complete routing dataset. |
| Worked-example depth | 136 skill example Markdown files; 1 file has at least 100 lines. This count is a size proxy only, not a quality verdict. |
| Broken links | Baseline strict gate's `tools/check-links.ps1`: exit 0; 182 local links checked, 0 broken local links, 12 external links seen. External HTTP liveness was not checked by this local-link result. |
| Machine-specific links/paths | At least 4 Markdown files contain Unix home-directory path references; additional Windows local web-root references occur in dated audit/history records. This is a search observation, not a complete link-integrity count. |
| Dangling cross-engine references | Full corpus count `NOT_ASSESSED`. The three named consumer engines were resolved through their canonical aliases and sampled read-only; exact copied/path mismatches are carried to `06-next-cycle.md`. The task-specified Digital Research checkout name/path was absent; matching research governance was read under `chwezi-research-engine`. |
| Expired source records | 11 records have `expires_or_recheck_due` dates before 2026-10-29 in `doctrine/source-register/`; see `00-scope-and-evidence.md`. A past review date means recheck is due, not that the source claim is false. |
| Repository file cap | 793 filesystem file entries including `.git`; 756 outside `.git`; 747 Git-tracked files at baseline. All are below the 5,000-file ceiling; the package-oriented count uses a separate documented exclusion policy and will be repeated before release. |
| Remote CI | `NOT_ASSESSED`: no push or remote CI execution in this cycle. |
| PowerShell / Windows-native route | `NOT_ASSESSED`: neither `pwsh` nor `powershell.exe` is installed. No host installation was attempted. |
| Tier 3 behavioral/model runs | `NOT_ASSESSED`; none requested or run. |

## Correction history and baseline risks carried forward

| Dimension | Superseded first-draft baseline | Corrected baseline | Reason for correction |
|---|---:|---:|---|
| Doctrine | 74 | 58 | The 74 assumed broad adherence without a cross-family re-audit or controller evidence. |
| Taxonomy and routing | 72 | 60 | Inventory and maps do not establish routing quality or precision@1. |
| Skill depth | 67 | 55 | File counts and selected route samples do not establish broad operational depth. |
| Applied proof | 63 | 54 | Deterministic baseline checks do not test client/model behavior or professional acceptance. |
| Standards currency | 42 | 38 | The unresolved expired/draft record set was more substantial than the prior score reflected. |
| Output readiness | 50 | 48 | No assembled independent client-ready pack was demonstrated. |
| Accessibility and inclusion | 70 | 50 | Routes existed, but no accessibility evaluation was run. |
| Production and handoff | 62 | 48 | Install/use flows had not been run and Codex packaging/cap checks were absent. |
| Hygiene | 52 | 44 | Link success did not offset repeated control-byte corruption and overdue sources. |
| Safety and integrity | 84 | 60 | The controls were present, but professional acceptance and live-output evidence were missing. |

1. Recheck due dates and current source admission must remain separate: elapsed
   dates call for review, while draft or unsupported statutory values stay
   blocked from final output.
2. PowerShell 7 on Linux is observed; Windows PowerShell 5.1 and remote CI are
   not observed. The local PowerShell 7 pass does not establish Windows parity.
3. The September finding of 1/108 portable-contract compliance is historical
   evidence only; this cycle did not rerun that canonical scan, so the current
   status remains `NOT_ASSESSED`.
4. The OpenAI model release check is current-sensitive; the official API
   changelog records GPT-6.1 Terra released 2026-10-26. The prior dated model
   fit comparison cannot by itself satisfy this cycle's release/catalogue gate.
