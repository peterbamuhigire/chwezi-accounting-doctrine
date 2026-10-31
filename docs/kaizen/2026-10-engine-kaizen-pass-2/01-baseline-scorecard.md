# Chwezi Accounting Doctrine baseline, kaizen pass 2: 2026-10-31

**Frozen before any engine change.** This file and `00-scope-and-evidence.md`
are committed on `kaizen/2026-10-pass2` before the first edit to any engine
file, so the commit order proves the freeze (the 29 October cycle could not
claim this). Starting commit: `7bc6a02`, clean tree.

Scores are an evidence-bounded maintainer assessment, not an independent audit.
The ten dimensions are equally weighted; `raw = mean of the ten`;
published score is `min(raw, 65)`. Open statutory, reviewer, execution and
release gates remain blockers whatever the number.

## Scorecard

| Dimension | 29 Oct final | Baseline now | Evidence inspected | Deficiency |
|---|---:|---:|---|---|
| Doctrine | 58 | 58 | Canonical doctrine, ledger invariants, finance quality gate; independent re-performance of the Task 1 ledger agrees with the earlier fixture | Not re-audited across all 17 skill families; no professional acceptance. One register entry breaks the schema's own named-reviewer rule (D5). |
| Taxonomy and routing | 63 | 62 | `README.md`, `docs/router-map.md`, 108 skill descriptions; Section 10 fixture run through the Tier-2 lexical proxy (5 of 5) | Only 1 of 108 skills has a labelled fixture; live routing and precision@1 remain `NOT_ASSESSED`; first Section 10 positive wins by a thin margin (0.292 against 0.285). |
| Skill depth | 60 | 60 | 136 example files, 1 of them 100 lines or more, 4 skills with no example files; portable contract scan 1 of 108 | Depth is uneven; contract migration needs domain work, not boilerplate. |
| Applied proof | 62 | 62 | 23 Python tests pass; the 17-check strict gate passes (16 PowerShell checks in an offline container, frontmatter check on the host) | Proof is deterministic structure and arithmetic; no model, client or controller run. The gate cannot run natively on this Linux host. |
| Standards currency | 46 | 44 | Source register (29 entries, 11 files); URA, NSSF and IFRS pages opened 2026-10-31 | 10 entries past recheck date; VAT threshold treatment stale against URA (D3); a recheck date earlier than its access date (D2); seven cited source keys missing from the register (D4). |
| Output readiness | 54 | 54 | Task 1 to 3 re-performance | Statements are arithmetic fixtures; LST, income-tax provision, cash-flow classification, source documents and reviewer sign-off absent. |
| Accessibility and inclusion | 50 | 50 | None new | No rendered or assistive-technology assessment. |
| Production and handoff | 62 | 60 | Packaging checks pass (108 skills on both host manifests); gate run split across container and host | No Linux-native route to the registered gate; remote CI and Windows PowerShell 5.1 unassessed. |
| Hygiene | 58 | 56 | Local links 197 checked, 0 broken; mojibake and control-byte scan clean (727 files); 47 machine-path lines in 21 files | Machine-specific paths in three active files (D6); overdue sources; a dangling-key class not guarded. |
| Safety and integrity | 60 | 58 | Lookup refuses draft, overdue and unarchived entries; reversal and approval controls preserved | Gate false negative on later entries in a file (D1); `verified-current` entry without a named reviewer returns "final use allowed" (D5). |

**Baseline raw mean:** 56.4/100 (564 / 10). **Published (capped) score:**
56.4/100 (`min(56.4, 65)`). **29 October final for comparison:** raw 57.3,
capped 57.3. The 0.9-point difference comes from defects found by new
checks today (D1 to D5), not from any change to the engine since 29 October
(HEAD is unchanged apart from this branch).

**Blockers (unchanged by score):** final statutory output on any draft,
overdue or unreviewed register entry; D5 until a reviewer is named or the
state is changed; Windows PowerShell 5.1, remote CI and live-model routing
unassessed.

## Measured inputs

| Measure | Baseline observation |
|---|---|
| Python tests | `python3 -m unittest discover -s tests -p 'test_*.py'`: 23 tests, exit 0. |
| Registered strict gate | 17 checks. 16 PowerShell checks run in an existing offline `mcr.microsoft.com/powershell` container with the checkout mounted read-only: all exit 0, state `pass`, 0 findings. The 17th (frontmatter YAML) is a thin wrapper over `tools/check_frontmatter_yaml.py`, run on the host: `pass`, 108 skills, exit 0. The aggregate `validate-doctrine.ps1` itself could not complete offline because it calls `python` inside the container (no Python there); a scratch runner mirrors its check list. Native `pwsh` on this host: `NOT_ASSESSED` (not installed). |
| Gate counts | 108 active skills; 0 missing declared references; 63 accounting-invariant assertions passed; 197 local links, 0 broken, 45 external links seen (liveness not tested); 727 text files scanned, 0 mojibake, 0 control bytes; 108 skills match both host manifests; full checkout 1,201 file entries, package-oriented 764, ceiling 5,000. |
| Source register | 11 files, 29 entries. 1 `verified-current`, 1 `superseded`, 27 `draft`. 10 entries are past their recheck date at 2026-10-31: `KE-ETIMS-SKELETON`, `KE-VAT-SKELETON`, `UG-EFRIS-HANDBOOK-2024-25`, `UG-EXCHANGE-RATE-SOURCE-HIERARCHY`, `UG-INCOME-TAX-RULES`, `UG-LST-RATES`, `UG-PAYE-RATES-THROUGH-2026-06-30` (superseded, historical), `UG-VAT-STANDARD-RATE`, `UG-VAT-RETURN-PACK-SOURCE`, `UG-WHT-RATES`. The gate reports `stale_entries: 0` for the same register (see D1 and the gate's design: it flags overdue only for `verified-*`). |
| Routing precision@1 (live) | `NOT_ASSESSED`: live model routing not run (no paid model calls). |
| Routing precision@1 (Tier-2 lexical proxy, owned Section 10 fixture) | 5 of 5 labels correct. On 11 practitioner queries written for this cycle, 8 of 11 first-ranked as expected; the 3 misses are overlaps between adjacent skills and are an informal sample, not a benchmark. |
| Owned negatives and fixture coverage | 1 of 108 skills has 3 positives and 2 owned negatives (`ifrs-accounting-policies-changes-errors-ias8`). 107 have none. |
| Worked-example depth | 136 example Markdown files; 1 has 100 lines or more (the longest, 113 lines, is a UI fixture); 4 of 108 skills have no example file. A size proxy only. 32 numeric debit/credit tables found in Markdown; 31 balance, 1 deliberately unbalanced (`rejected-unbalanced-entry.md`, a negative fixture). |
| Portable contract scan | Skill-engine-audit scanner, read-only: 1 of 108 fully compliant; capability contract 104, degraded mode 102, trigger 29, portable sections 21, five anti-patterns 14, portable metadata 14. |
| Broken links | 0 local (gate). |
| Machine-specific paths | 47 matching lines in 21 tracked files, outside the 29 October evidence folder. Active content: 3 files plus portfolio-managed blocks in `AGENTS.md` (2 lines); the rest are dated history (`docs/engine-upgrade-july-2026`, `docs/continuous-improvement`, `docs/analysis`) or retired integration notes. |
| Dangling cross-engine references | Sibling engine names appear in 10 active files (README, doctrine, governance, rules, two retail references, the kaizen skill); no skill names from other engines were found. Source keys: 7 keys cited in `references/uganda-statutory.md` do not exist in the register (D4). |
| Expired source records | 10 (list above). |
| Remote CI | `NOT_ASSESSED` (nothing pushed). |
| Windows PowerShell 5.1 | `NOT_ASSESSED`. |
| Tier 3 behavioural or model runs | `NOT_ASSESSED`; none run. |

## Correction note

The 29 October scorecard was reconstructed after its experiments rather than
frozen first. This one was written from measurements taken before any engine
edit. Where this baseline is lower than the 29 October final, the cause is
named in the table (new defects found by new checks).
