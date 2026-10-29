# Chwezi Accounting Doctrine baseline — 2026-10-29

## Freeze record

This scorecard was frozen on branch `kaizen/2026-10` at baseline commit
`ff33ff14` before implementation changes. The checkout was clean at start;
there were no uncommitted policy files to preserve or exclude. The parent
portfolio pre-pull snapshot is `/tmp/chwezi-portfolio-kaizen/pre-pull.json`.
No change to the canonical accounting doctrine is included in this cycle.

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
| Doctrine | 74 | `doctrine/accounting-finance-doctrine.md`, ledger invariants, quality gate, 108-skill inventory | Accounting boundaries are documented, but the complete doctrine was not independently re-reviewed against each output family in this cycle. |
| Taxonomy and routing | 72 | Root router, `docs/router-map.md`, 108 active skill paths, manifest lists 108 skill directories | No measured query set establishes routing precision@1; owned positive/negative routing fixture coverage is not demonstrated. |
| Skill depth | 67 | Three task routes and selected skills/references read; 136 example files counted | Example presence is not equivalent to depth: only one example file has at least 100 lines, and domain-wide applicability was not independently measured. |
| Applied proof | 63 | 20 Python unit tests pass; a disposable PowerShell 7 Linux-container run of the strict gate passed all 12 child checks, including 63 accounting assertions | No end-to-end model or client transaction pack was executed; Windows PowerShell 5.1 and client/controller acceptance were not assessed. |
| Standards currency | 42 | Source-register inventory; official source review recorded in `00-scope-and-evidence.md` | 11 source records have elapsed recheck dates; several tax records remain draft or block final use; cross-jurisdiction current tax was not fully verified. |
| Output readiness | 50 | Existing journal, EFRIS and payroll examples; observed route outcomes in `00-scope-and-evidence.md` | Statement and PBC output for the new scenario lacks an independently reviewed assembled pack. |
| Accessibility and inclusion | 70 | Root accessibility/UX routes and inclusive-design route identified | No rendered or screen-reader check was performed in this cycle. |
| Production and handoff | 62 | Installer, Claude plugin/marketplace files, Codex policy helper and CI definitions inspected | Install/use flows were not executed; no OpenAI portable package/marketplace metadata or 5,000-file guard exists at baseline. |
| Hygiene | 52 | Repo file count, source-register dates, path scan, recent Kaizen history, and the 12-check baseline strict validator | The local-link check passed, but machine-specific historical paths remain and 11 source recheck dates were overdue; external URL liveness was not tested. |
| Safety and integrity | 84 | Finance quality gate, source-state refusal, reversal and approval controls inspected; Python suite and disposable PowerShell suite passed | Statutory final-use gates are intentionally closed pending review; live professional acceptance remains unassessed. |

**Raw mean:** 63.6/100. **Calculation:** (74 + 72 + 67 + 63 + 42 + 50 + 70 + 62 + 52 + 84) / 10 = 636 / 10. **Published capped score:** 63.6/100 (`min(63.6,
65)`). **Blockers:** final statutory outputs using draft, expired or
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
| Machine-specific links/paths | At least 4 Markdown files contain `/home/` strings; additional historical `C:\wamp64\www\...` references occur in dated audit/history records. This is a search observation, not a complete link-integrity count. |
| Dangling cross-engine references | Full corpus count `NOT_ASSESSED`. The three named consumer engines were resolved through their canonical aliases and sampled read-only; exact copied/path mismatches are carried to `06-next-cycle.md`. The task-specified Digital Research checkout name/path was absent; matching research governance was read under `chwezi-research-engine`. |
| Expired source records | 11 records have `expires_or_recheck_due` dates before 2026-10-29 in `doctrine/source-register/`; see `00-scope-and-evidence.md`. A past review date means recheck is due, not that the source claim is false. |
| Repository file cap | 793 filesystem file entries including `.git`; 756 outside `.git`; 747 Git-tracked files at baseline. All are below the 5,000-file ceiling; the package-oriented count uses a separate documented exclusion policy and will be repeated before release. |
| Remote CI | `NOT_ASSESSED`: no push or remote CI execution in this cycle. |
| PowerShell / Windows-native route | `NOT_ASSESSED`: neither `pwsh` nor `powershell.exe` is installed. No host installation was attempted. |
| Tier 3 behavioral/model runs | `NOT_ASSESSED`; none requested or run. |

## Baseline risks carried forward

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
