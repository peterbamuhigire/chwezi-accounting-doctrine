# Next cycle: open work, decisions and cross-engine handoff

## Decisions needed from Peter

1. **`UG-NSSF-MEMBERSHIP-CONTRIBUTIONS` (D5).** The entry is `verified-current`,
   so the lookup tool returns "final use allowed" for NSSF, but the schema
   requires a named reviewer and the entry's `verifier` records a page re-read.
   Either name the reviewer (and keep the state), or demote the entry to
   `verified-with-caveat` until one is named. I did not change it: it alters
   the engine's release posture for payroll. The 5% and 10% values themselves
   match the official NSSF page read on 2026-10-31. Its `effective_from`
   (2026-05-15) is the date it was verified, not a legal effective date, so a
   lookup for an earlier payroll date returns no entry; the legal effective date
   is `NOT_ASSESSED`. `tools/source_register_integrity.py` reports this entry
   as an attention item on every run until it is resolved.
2. **Should overdue draft entries fail a gate?** Today they are reported by the
   Python tool and refused by the lookup tool, but the PowerShell gate flags
   overdue entries only for `verified-*` states. Making seven overdue drafts a
   gate caveat would turn the strict state to `pass-with-caveats`. Not done;
   it changes the published gate behaviour.

## Open findings

1. **Statutory values still blocked from final output.** Uganda LST (schedule,
   base, municipality; recheck overdue since 2026-10-27), WHT (categories to be
   reconciled with the Income Tax (Amendment) Act 2026 and its effective date),
   VAT registration threshold (amending Act, commencement and gazette not
   located; URA's own pages state UGX 300,000,000), PAYE (reviewer and archive),
   and the EFRIS FY2026-27 handbook (contents not opened). Kenya, Rwanda,
   Tanzania and South Africa remain skeletons.
2. **Seven draft entries are past their recheck date:** `KE-ETIMS-SKELETON`,
   `KE-VAT-SKELETON`, `UG-EFRIS-HANDBOOK-2024-25`, `UG-EXCHANGE-RATE-SOURCE-HIERARCHY`,
   `UG-INCOME-TAX-RULES`, `UG-LST-RATES`, `UG-VAT-RETURN-PACK-SOURCE`. Move
   a recheck date only after reading the source again.
3. **Portable contract scan: 2 of 108.** The next smallest step is
   `finance-module-audit` (fails only the degraded-mode check). Add content only
   where it changes what an agent does when the target cannot be run or read;
   do not add headings to satisfy a pattern. 71 more skills fail only the
   capability-contract and degraded-mode checks and are the next tier. Both
   checks are regular-expression tests for a few words, so each skill needs real
   content about what it requires and how it behaves without it.
4. **Routing.** Two of 108 skills now have three positives and at least two
   owned negatives, executed through a Tier-2 lexical proxy. Live model routing
   and precision@1 stay `NOT_ASSESSED`.
5. **Skill depth.** 4 skills have no example file; only 1 of 136 examples has
   100 lines or more.
6. **IFRS.** The consolidation-exception amendment was not issued at the access
   date; recheck after year end. The third-edition paragraph numbers for Section
   10 (cited as 10.19 to 10.23 on 29 October) were not re-opened this cycle.
7. **Remote CI, Windows PowerShell 5.1, native `pwsh` on this workstation,
   Claude strict directory warnings** (unchanged from 29 October).
8. **Gate on hosts without Python.** `validate-doctrine.ps1` fails closed when
   `python` is absent (the frontmatter check). That is by design; record it
   rather than relax it.

## Cross-engine findings

Only this repository was edited. The three engines below were read on
2026-10-31 while other cycles were editing them on their own pass-2 branches
(each had uncommitted files), so these rows describe what was observed then,
not a settled state.

| Consumer or portfolio file | Observation | Accounting side | Handoff |
|---|---|---|---|
| `business-plan-skills`, `AGENTS.md` lines 368, 385 to 388, 391 | Still hard-code the checkout path of this engine. Line 430 carries a portfolio-managed path. | `README.md` router | Resolve through the engine catalogue; owner: Business Plan cycle. |
| `business-plan-skills`, `AGENTS.md` line 278 | Template instruction still says to replace Uganda PAYE bands, 30% corporate tax and 18% VAT. | `doctrine/source-register/uganda/paye.yaml`, `vat.yaml` (both `draft`) | Replace the copied figures with a source-register lookup requirement. |
| `srs-skills`, `AGENTS.md` line 201 | Now uses catalogue wording and no hard-coded path to this engine (changed since 29 October). `README.md` line 348 links the companion engine by repository. | `README.md` router | Confirm in the SDLC cycle that the change is committed. No copied accounting rule seen in the lines read. |
| `skills-web-dev` (dev engine), `AGENTS.md` line 76 | Treats the external accounting checkout as canonical, without a path. Machine paths at lines 40, 276 and 286 concern the research engine, design engine and portfolio craft file, not accounting. | `README.md` router | None for accounting. Full-corpus duplicate-rule detection was not performed. |
| `chwezi-engine-agents`, `catalog/engines.yaml` lines 65 to 71 and this repository's `.skills-engine/engine-manifest.yaml` `validation` block | Both register only `tools/validate-doctrine.ps1 -Strict` (manifest: Windows only). The Python checks added here are not registered. | `tools/source_register_integrity.py`, `tools/check_machine_paths.py`, `tools/route_proxy.py`, `python -m unittest discover -s tests -p 'test_*.py'` | Portfolio cycle: register them, with platforms. I did not edit the manifest because the portfolio package reads it. |
| `chwezi-engine-agents`, `evals/routing/baseline.json` | Lists six engines; the accounting engine has no entry. | `tests/router-map/fixtures/*.json` | Portfolio cycle: decide whether to import these fixtures into the shared routing baseline. |
| This repository, `AGENTS.md` lines 56 and 139 | Two portfolio-managed blocks name a Windows checkout path. `tools/check_machine_paths.py` allows exactly two lines for this file. | n/a | Portfolio owner: replace with catalogue wording, then set the ceiling in the tool to zero. |

## One small experiment for next time

Write three-positive, two-negative fixtures for the skills on the Task 1 path
that have none yet (`payroll-and-statutory-postings-east-africa`,
`indirect-tax-vat-mechanics`, `month-end-and-year-end-close-playbook`,
`financial-statements-preparation`, `audit-pbc-and-evidence-management`), run
them with `python tools/route_proxy.py --fixture <file>`, and change a skill
description only if a margin falls under 0.05 and the new wording is true of
the skill's content. Keep each fixture only if it catches something or protects
a neighbour; report the result as a Tier-2 lexical check, never as precision@1.

**Owner:** Accounting Doctrine maintainer. **Target:** next portfolio cycle.
**Re-audit date:** 2026-12-29 (the next source recheck date for the Uganda and
IFRS entries; an internal reminder, not a statutory deadline).
