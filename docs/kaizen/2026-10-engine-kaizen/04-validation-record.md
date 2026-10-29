# Validation record — 2026-10

## Commands and results

Commands were run against the working tree after the retained A1, A2 and A4
changes. The PowerShell gate ran in a disposable `mcr.microsoft.com/powershell`
container with a read-only bind of a copied checkout. Python/YAML prerequisites
were installed only inside that disposable container. Nothing was installed
into the host environment.

| Command / evidence | Result | Scope and limit |
|---|---|---|
| `python3 -m unittest discover -s tests -p 'test_*.py' -v` | Exit 0; 23 tests passed. | Includes the Section 10 example and two expected-route-fixture integrity tests, plus existing source-register, approval, frontmatter and source-to-report tests. The route fixture is not a router execution or precision benchmark. |
| `& /workspace/tools/validate-doctrine.ps1 -RepoRoot /workspace -Strict -Json` | Exit 0; `doctrine_validation=pass`; 17/17 registered checks passed; 0 blocker/high/medium/caveat findings. | Exact command inside the disposable container; checkout mounted read-only at `/workspace`. PowerShell 7.4.2 on Linux. 108 active skills; 0 missing declared references; 63 accounting invariant assertions passed. Windows PowerShell 5.1 and remote CI remain `NOT_ASSESSED`. |
| Gate `mojibake` and negative control | 723 configured text files scanned; 0 mojibake matches and 0 forbidden control-byte matches. Bell rejected; tab permitted. | Exact repaired contract row is recorded in the A2 experiment; no broader byte-normalisation was performed. |
| Gate `links` | 185 local links checked; 0 broken; 28 external links observed. | Link checker does not establish external HTTP liveness. |
| Gate `source-register` | 11 register files; 29 source entries; 1 `verified-current`; 9 `draft`; 0 stale entries. | Status counts are schema observations, not an independent legal opinion. |
| Gate `package-file-count` | Pre-evidence-commit snapshot: full checkout 1,176 file entries; package-oriented count 764; hard limit 5,000. Both checks passed. | The full count includes `.git` and changes as commits add objects. The checker excludes `.git`, `.cache`, `cache`, `__pycache__`, `node_modules`, `.venv` and `venv` from its package-oriented count. Its maximum parameter rejects values above 5,000. No files were removed to satisfy the cap. |
| Gate `plugin-packaging` and negative controls | 108 active skill paths exactly match Codex recursive discovery and Claude's explicit path set. Seven negative/edge controls pass, including same-count path substitution, duplicate paths, traversal, symlink escape and case-distinct directories on Linux. | Code selects ordinal comparison on Linux and ordinal-ignore-case on Windows. The checker fails closed on manifest paths that traverse a symlink/reparse point. Windows execution remains `NOT_ASSESSED`. |
| Gate package-count negative controls | Under-limit full/package counts accepted; over-limit case rejected with `PACKAGE-001` and `PACKAGE-002`; configured maximum 5,001 rejected with `PACKAGE-000`. Three controls pass. | Disposable fixtures. |
| `claude plugin validate --json .claude-plugin/plugin.json` | Exit 0; manifest errors 0, manifest warnings 0. Directory scan reports nonblocking `ICON_MISSING` and a root `CLAUDE.md` context warning. | The existing root guidance and hook settings were preserved. |
| `claude plugin validate --json .claude-plugin/marketplace.json` | Exit 0; errors 0, warnings 0. | Native local marketplace manifest check. |
| `claude plugin validate --strict --json .claude-plugin/plugin.json` | Exit 1. | Strict directory mode treats the nonblocking icon and root `CLAUDE.md` warnings as failure. The plugin manifest itself has no errors or warnings. This warning state is reported, not hidden or worked around. |
| Native Codex local marketplace install | After commit `9857cbb`, in a no-network Debian bookworm-slim container with the repository mounted read-only at `/engine` and the Codex 0.165.0 static binary mounted read-only: `codex plugin marketplace add . --json`, `codex plugin add accounting@chwezi-accounting-doctrine-local --json`, and `codex plugin list --json` all succeeded. The installed cache contained 108 `SKILL.md` files. | Container-local config/cache only; no host credentials or configuration were mounted. Marketplace name is `chwezi-accounting-doctrine-local`; plugin name is `accounting`. These exact commands are now in `README.md`. This demonstrates local install, not public listing acceptance. |
| Native Claude marketplace install/details | Root portfolio agent's isolated native Claude Code test log reports successful marketplace addition, installation of `accounting@chwezi-accounting`, and plugin details listing 108 skills. | Claude marketplace name is `chwezi-accounting`; plugin name is `accounting`. The CLI reported one plugin user-config option was not yet set and suggested `plugin configure`; the plugin installation itself succeeded. |
| Codex wrong-selector attempt | The first root-runner attempt used `accounting@chwezi-accounting`, which is the Claude marketplace name; the Codex catalogue is named `chwezi-accounting-doctrine-local`. | This was a runner selector mismatch. The corrected actual Codex selector above installed successfully; no product manifest change was needed. |
| `git diff --check` | Exit 0 after final edits. | Whitespace/conflict-marker hygiene only. |

The baseline strict validator was run before changes: 12/12 checks passed with
0 findings. The current gate has 17 registered checks; the five additional
checks are the control-byte negative test, full/package file-count check and
its negative control, and plugin-packaging check and its negative control.

## Practitioner recheck

Tasks 1–3 were manually repeated using synthetic inputs in `00-scope-and-evidence.md`.
Task 1 remains correctly blocked from statutory close: LST schedule/base and
independent reviewer are missing; source documents, EFRIS response and provider
statement were not supplied. Task 2 now has a routed after-close illustration
and acceptance test. Task 3's synthetic trial balance and SFP arithmetic
cross-foot; statements, cash-flow classification, source evidence, actual
control-account reconciliations and professional acceptance remain
`NOT_ASSESSED`. The trial-balance double-count found in the author's first task
3 draft was corrected and disclosed in the scope file and experiment log.

The touched Section 10 skill now has a static three-positive/two-negative
expected-label fixture; target labels and router-map discoverability are tested.
Execution against an actual router and precision@1 remain `NOT_ASSESSED`.
No Tier 3 behavioural/model run was requested or performed. No client data,
posting, filing or paid call was used.

## Currency and source observations

Access dates below are 2026-10-29. URLs are direct official sources already
recorded in the relevant source-register entries and country README files.
These are bounded source observations, not legal sign-off.

| Topic | Official source observation and register action | Residual status |
|---|---|---|
| IFRS for SMEs third edition | IFRS Foundation standard page and issued third-edition text: effective for periods beginning on or after 2027-01-01; earlier application is permitted. See [`ifrs-advanced-2026.yaml`](../../../doctrine/source-register/ifrs/ifrs-advanced-2026.yaml), [standard page](https://www.ifrs.org/issued-standards/ifrs-for-smes/), and [issued text](https://www.ifrs.org/content/dam/ifrs/publications/ifrs-for-smes/english/2025/ifrs-for-smes.pdf?bypass=on). | Register entry remains draft for human IFRS review/archive. The IFRS Foundation's 2026-10-29 update says it decided to proceed with a targeted consolidation exception amendment and expects issuance before end-2026; final text was not located, so its final effect is `NOT_ASSESSED`. [Official update](https://www.ifrs.org/news-and-events/news/2026/10/iasb-decision-october-2026-meeting/). |
| IFRS 18 | Official issued-standard page and issued text identify 2027-01-01 effective date, early application, and transition. See [`ifrs-advanced-2026.yaml`](../../../doctrine/source-register/ifrs/ifrs-advanced-2026.yaml), [IFRS 18 page](https://www.ifrs.org/issued-standards/list-of-standards/ifrs-18-presentation-and-disclosure-in-financial-statements/), and [issued text](https://www.ifrs.org/content/dam/ifrs/publications/html-standards/english/2026/issued/ifrs18.html). | Entry remains draft; no full statement-template impact review was performed. |
| Uganda PAYE | URA's current PAYE schedule and 2026 amendment notice were opened; the schedule states changes effective 2026-07-01. [`paye.yaml`](../../../doctrine/source-register/uganda/paye.yaml), [URA rates](https://ura.go.ug/en/domestic-taxes/paye-rates/), [URA notice](https://ura.go.ug/en/changes-to-paye-return-form-following-the-income-tax-amendment-act-2026/). | Draft; no named reviewer or full Finance Act reconciliation. |
| Uganda NSSF | Official NSSF membership page states the employee/employer contribution split and payment timing for the reviewed scope. [`nssf.yaml`](../../../doctrine/source-register/uganda/nssf.yaml), [NSSF membership](https://www.nssfug.org/about-us/membership/). | `verified-current` only for the entry's stated scope; this is not a review of all payroll obligations. |
| Uganda VAT and EFRIS | URA VAT page gives the standard-rated rate and EFRIS obligation; EFRIS page describes adjustment documents. EFRIS notice dated 2026-08-11 identifies additional sector scope from 2025-07-01. [`vat.yaml`](../../../doctrine/source-register/uganda/vat.yaml), [`efris.yaml`](../../../doctrine/source-register/uganda/efris.yaml), [VAT](https://ura.go.ug/en/value-added-tax-vat/), [EFRIS](https://ura.go.ug/en/efris/). | VAT remains draft. FY 2026/27 EFRIS handbook is listed in the official archive but its technical contents were not opened; technical changes since 2026-08-28 are `NOT_ASSESSED`. The sector notice was not expanded into an independent legal interpretation. |
| Uganda LST and WHT | URA current WHT page was opened, but its post-amendment categories were not reconciled. The official-source search did not establish current municipality-specific LST bands and calculation base. | LST: no source found in this pass that establishes applicable schedule/base; `NOT_ASSESSED`. WHT: draft pending Act-to-category reconciliation and reviewer. |
| Kenya | Official KRA VAT and Finance Act 2026 pages were opened; the VAT page exposes current standard/zero/withholding categories and the Finance Act page identifies amended tax Acts. | Full legal reconciliation, payroll schedules and eTIMS technical scope remain `NOT_ASSESSED`; Kenya source register remains incomplete. See [`kenya/README.md`](../../../doctrine/source-register/kenya/README.md). |
| Rwanda | Official RRA withholding-tax page and 2025 tax handbook were located. | Full 2026 schedule reconciliation not performed; see [`rwanda/README.md`](../../../doctrine/source-register/rwanda/README.md). |
| Tanzania | Official-source search did not find a current TRA 2026 schedule suitable to establish PAYE, VAT, WHT and payroll obligations in this pass. | Reported as “no source found in the official-source search performed”; not a claim of global nonexistence. See [`tanzania/README.md`](../../../doctrine/source-register/tanzania/README.md). |
| South Africa | Official SARS FY 2026/27 tax guide, employer tables and VAT guide were located. | Full PAYE/VAT/WHT/UIF/SDL statutory reconciliation not performed; see [`south-africa/README.md`](../../../doctrine/source-register/south-africa/README.md). |

Internal recheck target for these live source surfaces is 2026-11-29; it is a
review reminder, not a source's statutory expiry date. The post-review scan
found 10 source entries with recheck dates before 2026-10-29. Expired dates
remain due for recheck; draft or unverified rates are not promoted. Sources
were not contacted and source archives were not created in this cycle.

## Packaging basis and limits

The official Claude Code plugin references document the Claude manifest and
marketplace entry points ([plugin reference](https://code.claude.com/docs/en/plugins-reference),
[marketplace guide](https://code.claude.com/docs/en/plugin-marketplaces), accessed
2026-10-29). OpenAI's official plugin guide and submission references document
the Codex compatibility manifest and catalogue/package requirements
([plugin package guide](https://developers.openai.com/plugins/build/plugins),
[submission fields](https://developers.openai.com/plugins/deploy/submission),
[submission errors](https://developers.openai.com/plugins/deploy/submission-errors),
accessed 2026-10-29). Because this repository already uses a multi-path Claude
skill layout, the cycle added the documented `.codex-plugin/plugin.json`
compatibility entry with one `./skills/` root and a local Codex catalogue. It
did not add a portable root `plugin.json`, which could take precedence over the
compatibility entry and alter package discovery. The local checker proves
structural path resolution; it does not prove public-upload eligibility or
listing acceptance. Public submission was not requested or attempted.

## Model policy currentness

OpenAI's release notes record GPT-6.1 Terra's release on 2026-10-26
([official model release notes](https://help.openai.com/en/articles/9624314-model-release-notes));
the current official [model directory](https://developers.openai.com/api/docs/models)
lists model capabilities and availability.
The official Codex model catalogue and local Codex model cache list `gpt-6.1-sol`,
`gpt-6-astra`, `gpt-6.1-terra`, `gpt-6-sol` and `gpt-6-luna`, including high
reasoning availability. This is a catalogue observation, not proof of the
active account's entitlement or the running session's selected model. Relative
quality, latency and cost evidence for accounting tasks and active
runtime/account availability are `NOT_ASSESSED`. Retain the explicitly required
`gpt-6-luna`/high policy; no policy edit or runtime-switch claim was made.
