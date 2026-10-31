# README kaizen record: Chwezi Accounting Doctrine

Date: 2026-10-31. Branch `kaizen/2026-10-readme-kaizen`, cut from `main` at `bc767a9` with a clean working tree. This is a scoped cycle on `README.md` only, following Observe, Baseline, Select, Experiment, Check, Standardise, Teach, Re-measure. **It publishes no score.** The engine's published score is unchanged (see the README section "Quality and improvement").

The README is the engine's router in the portfolio routing table. Routing steps, the skill group tables and the PAYE lookup note therefore stayed in place. The cycle changed the front door, structure, wording and the walls of text around them.

## Observe

Baseline, measured on `main` with the readme-metrics helper (a portfolio kaizen script kept outside this repository).

| Measure | Baseline | Reading |
|---|---:|---|
| `words` | 7,216 | 2,200 of them are the 108-row skill table. |
| `h2` | 7 | Installation, Validation, Capabilities, Routing and use, DOMAIN PROMPT GENERATION CONTRACT, Quality and improvement, References. |
| `toc` | 0 | No contents list. |
| `first_cmd` | 13 | The first command sat behind two opening paragraphs of about 190 and 150 words, and the prerequisites. |
| `longest_sec` | 2,347 | Capabilities (both skill tables). Quality and improvement held 2,293 words. |
| `long_lines` | 43 | Paragraphs and table cells, up to 81 words in one cell. |
| `max_line` | 1,342 | The opening paragraph. |
| `sent_len` | 18.2 | Prose paragraphs only; list items are not counted by the helper. |
| `fre` | 37 | Difficult. |

What reads this README (found by `grep` over this repository and read-only over the sibling `chwezi-engine-agents` checkout):

- `chwezi-engine-agents/scripts/validate-prompt-capability.ps1` reads it as this engine's router and needs the strings `DOMAIN PROMPT GENERATION CONTRACT`, `docs/ai-prompting/domain-prompt-compilation-contract.md`, `Ready-to-paste prompt` and `Failure action`.
- `chwezi-engine-agents/scripts/validate-portfolio-craft.ps1` needs the heading `## Capabilities` (or `## Capability map`) among the first four H2 headings.
- `tests/test_runtime_orchestration_guidance.py` needs the file name `runtime-agnostic-orchestration-2026-09-07.md` in the README.
- `tools/source_register_integrity.py` and `tools/check_machine_paths.py` scan it. Every backticked source key must resolve, and no machine path may appear.
- `tools/check-links.ps1` resolves its local links. `AGENTS.md` and `docs/README.md` name the section "Validation".
- `chwezi-engine-agents/scripts/generate_engine_tour.py` reads only the H1. `skill_graph.py` and `skill_fanin.py` read its skill links as sets.
- No tracked file links `README.md#anchor` (the preservation check counted 0).

## Select

| Item | Decision | Reason |
|---|---|---|
| R1 Front door | Applied | Two plain paragraphs on what it is and who it serves, a six-fact "At a glance" and a three-step "Start here". |
| R2 Contents | Applied | The list sits at the end of "Start here". An H2 "Contents" would come third and `## Capabilities` must stay within the first four H2 headings. |
| R3 Structure | Applied | Longest H2 fell from 2,347 to 1,050 words. The 108-row table became four catalogue H2 sections with an H3 per category. |
| R4 Task table | Applied | 12 rows, taken from the tasks in the two routing fixtures plus the close, audit, scan and fund-accounting tasks. Every skill exists (checked by path). |
| R5 Walls of text | Applied | Opening paragraphs, Boundaries, install, validation, score and findings became short paragraphs or lists. Table detail moved into notes under the table. |
| R6 Plain English | Applied | Short sentences, active voice, no new terms. |
| R7 Say it once | Applied | Plugin commands appear once. The October section is tightened and its process narrative moved to a detail page. |
| R8 Relocate | Applied in part | Moved: the source list and the full October notes. Kept: the skill catalogue (the router uses it), validation (named by `AGENTS.md`), date gates (short, perishable). |

Deliberate changes that a reader of the diff should expect:

1. Routing step 2 said "the table above". The catalogue now sits below, so the step links the catalogue. All other routing text is unchanged.
2. The "Category" column is gone from the 108-row table; each category heading carries it. All 108 rows were checked against `find skills -name SKILL.md` (108 of 108 linked).
3. Installation and Validation now follow the catalogue, as in the skeleton. The two Claude plugin commands appear only in "Start here".
4. "Start here" step 3 uses `--register vat`, which exits 3 today. The PAYE lookup row and its note stay in the Validation table.
5. The DOMAIN PROMPT GENERATION CONTRACT heading is now H3 under "Routing and use". The heading text and both markers are unchanged.
6. "What the October 2026 kaizen improved" is now an H2 (the same anchor). A "Contributing and licence" section was added from `LICENSE` and the plugin author field; it adds no new rule.
7. No fact was corrected.

## Experiment

| Commit | Theme | Change |
|---|---|---|
| `72d693c` | Structure and front door | At a glance, Start here, contents, task table, split routing, group table and four catalogue sections. Installation, Validation and Quality kept their old text. |
| `aaa73f9` | Plain English | Installation, Validation and Quality rewritten as short lists. Table cells cut to about 35 words. |
| `b298f54` | Relocation | `docs/cited-sources.md` and `docs/kaizen/2026-10-31-october-changes-detail.md` added. The October section tightened. `docs/README.md` indexes both. |
| `29bb289` | Structure | Code blocks indented so the three start steps render as one list. |
| this commit | Record | This file, the CHANGELOG entry and a README link to this record. |

## Check

Validators that run on this host, run before the first edit and after the last one. Exit codes are identical.

| Command | Before | After |
|---|---:|---:|
| `python3 -m unittest discover -s tests -p 'test_*.py'` (56 tests) | 0 | 0 |
| `python3 tools/check_frontmatter_yaml.py --root .` | 0 | 0 |
| `python3 tools/source_register_integrity.py` | 0 | 0 |
| `python3 tools/check_machine_paths.py` | 0 | 0 |
| `python3 tools/route_proxy.py --fixture tests/router-map/fixtures/section10-after-close.json` | 0 | 0 |
| `python3 tools/route_proxy.py --fixture tests/router-map/fixtures/source-register-skill.json` | 0 | 0 |
| `python3 tools/source_register_lookup.py --jurisdiction UG --register paye --date 2026-10-15` | 3 | 3 |
| `python3 tests/agent-integration/test_accounting_agent_contract.py` | 0 | 0 |
| `node hooks/test-destructive-bash-gate.js` (61 of 61) | 0 | 0 |
| `node hooks/test-plugin-hook-config.js` (7 of 7) | 0 | 0 |
| `node scripts/generate-plugin-manifest.js --engine . --check` (108 skills) | 0 | 0 |

`NOT_ASSESSED`, because this host has no PowerShell (`pwsh`): `tools/validate-doctrine.ps1 -Strict` and its 17 checks, including `check-links.ps1`, `check-mojibake.ps1` and `check-repository-discovery.ps1`, and the two portfolio scripts `validate-prompt-capability.ps1` and `validate-portfolio-craft.ps1`. These were approximated, not run:

- A Python copy of the `check-links.ps1` rule found 0 broken of 222 local links in the changed Markdown files: the README, the CHANGELOG, the docs index, the two moved pages and this record.
- A scan of the changed files found no control byte or DEL and none of the mojibake characters the check looks for.
- A Python check found the four prompt-contract strings and the orchestration file name in the README (case-sensitive), and `## Capabilities` as the fourth H2 heading.

This is evidence that the PowerShell checks are unlikely to fail on the README. It is not evidence that they were run.

Preservation check (`readme-preserve-check.py` over `main` and the final tree):

```text
links: old README 180 targets; new README 156; moved to docs 29; LOST 0
commands: old README 26; kept in README 26; moved to docs 0; LOST 0
anchors: 0 README.md#anchor links in tracked files; BROKEN 0
in-page links: 13 anchors used; BROKEN 0
RESULT: OK
```

The 29 moved links are the source list, now in `docs/cited-sources.md`. No replacement or removal needed an explanation.

Metrics after, on the final README:

| Measure | Baseline | After | Target | Met |
|---|---:|---:|---|---|
| `words` | 7,216 | 6,049 | 7,577 or fewer; 6,494 aimed | Yes (-16.2%) |
| `h2` | 7 | 14 | none | n/a |
| `toc` | 0 | 1 | 1 | Yes |
| `first_cmd` | 13 | 24 | 40 or fewer | Yes |
| `longest_sec` | 2,347 | 1,050 | 1,500 or fewer; 1,200 preferred | Yes |
| `long_lines` | 43 | 15 | 21 or fewer | Yes (-65%) |
| `max_line` | 1,342 | 451 | 700 or fewer | Yes |
| `sent_len` | 18.2 | 11.4 | 16.5 or fewer | Yes |
| `fre` | 37 | 47 | 37 or more; 42 aimed | Yes |

Notes on the numbers:

- `first_cmd` rose because the two paragraphs on what the engine is and who it serves now come before the first command. It is still on line 24.
- `sent_len` counts prose paragraphs only. Counting list items too (code spans removed, tables excluded), the mean fell from 17.2 to 10.2 words.
- The largest paragraph is now 47 words, the largest list item 66 words and the largest table cell 24 words (link targets excluded).
- Fifteen lines still exceed 300 characters. Four are routing steps 1 to 4 (356 to 451 characters), kept word for word. One is a catalogue row whose description is the router's text. One is the PAYE lookup row, which must keep its note. Nine are lines of the October section (eight items and one introductory paragraph, 304 to 411 characters and 47 to 66 words each), long because of code spans and commit hashes.

Facts re-measured on 2026-10-31 for the numbers kept in the README: 108 skills and 17 categories (`find`), per-category counts, 56 tests, 17, 10 and 6 tests in the three new test files, 61 and 7 hook cases, 17 registered gate checks (`tools/validate-doctrine.ps1`), 30 register entries (28 `draft`, 1 `verified-current`, 1 `superseded`), the seven overdue draft entries, the 2026-11-17 failure (`INT-008`, exit 1 with `--as-of 2026-11-17`), the single NSSF error with `--as-of 2026-12-30`, the routing margins +0.145 and +0.143, and exit 3 for the `vat` and `paye` lookups. Carried over from the evidence files and not re-run: the register negative controls (1 to 3), the native Claude and Codex installs, the two failing test names on 2026-11-17, the scores, and the PowerShell results.

## Standardise

Conventions for anyone who edits this README.

**Order.** Title and purpose; At a glance; Start here (with the contents list); Routing and use; Capabilities; the catalogue sections; Installation; Validation; Quality and improvement; What the October 2026 kaizen improved; References; Contributing and licence.

**Limits** (measure with the readme-metrics helper):

| Limit | Value |
|---|---|
| Words per H2 section | 1,200 or fewer |
| Paragraph length | About 90 words or fewer |
| Table cell | About 35 words or fewer; move detail to notes under the table |
| Mean sentence length | 16 words or fewer |
| First fenced command | Within the first 40 lines |
| Contents list | Before the third H2 heading |

**Interfaces that must not break:**

- Keep `## Capabilities` among the first four H2 headings.
- Keep the four prompt-contract strings and the orchestration file name listed under Observe.
- Keep the heading "Validation", which `AGENTS.md` and `docs/README.md` name.
- Change the five routing steps only with a doctrine review, and say so in the commit.
- Write source keys in backticks only when they exist in `doctrine/source-register/`.
- Put no drive letter or home path in the README.
- Avoid the characters that `tools/check-mojibake.ps1` flags.

**Facts to re-measure when you touch them.**

| Fact in the README | Command |
|---|---|
| 108 skills, 17 categories | `find skills -name SKILL.md \| wc -l` and `find skills -mindepth 1 -maxdepth 1 -type d \| wc -l` |
| 56 tests; exit codes in the Validation table | The commands in that table |
| 30 register entries and their states | `python3 tools/source_register_integrity.py` and the YAML under `doctrine/source-register/` |
| Overdue entries and date gates | `python3 tools/source_register_integrity.py --as-of <date>` |
| 17 gate checks | The `$checks` list in `tools/validate-doctrine.ps1` |
| Score | The latest `05-final-report.md` under `docs/kaizen/` |

The perishable parts are "At a glance", "Open findings that matter to a user" and "Date-triggered gates". Update them whenever the register or the score changes.

## Teach

1. Edit the router sections (routing steps, group tables, contract markers) only with a reason, and run the preservation check before you commit.
2. Add a number to the README only with its command next to it, and update "At a glance" when the number moves.
3. Put long lists in `docs/` and leave a summary and a link in the README.

## Re-measure and next cycle

- No score is published for this cycle. Re-measure the metrics with the helper after the next README edit and compare with the table above.
- Run `tools/validate-doctrine.ps1 -Strict`, `validate-prompt-capability.ps1` and `validate-portfolio-craft.ps1` on a host with PowerShell. They are `NOT_ASSESSED` here.
- Cross-engine finding: `chwezi-engine-agents/scripts/validate-prompt-capability.ps1` sets `WorkspaceRoot` and `CoordinatorRoot` defaults to Windows checkout paths (lines 3 and 4). Both are parameters, so the script runs elsewhere when they are passed. It reads this README as the router, so any structural edit to the README should re-run it. That repository was not edited.
- Suggested, not done because tests were out of scope: a small test in this repository that asserts the README interfaces listed under Standardise, so a future edit cannot break the portfolio scripts unnoticed.
- The nine long lines in the October section could shrink further once the register decisions in `06-next-cycle.md` of pass 2 close and that section can drop its open-item notes.
