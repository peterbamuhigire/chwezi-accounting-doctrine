# Improvement backlog — 2026-10

Baseline: 63.6/100 raw and capped at 63.6/100 in
[`01-baseline-scorecard.md`](01-baseline-scorecard.md). Every item targets an
eventual 95/100 raw score; target contributions below are planning hypotheses,
not earned points. The set contains five items. No item weakens source gates,
ledger immutability, double-entry, segregation or reviewer controls.

## Five Whys for observed defects

### A1 — no focused prior-period-error example

1. **Why did the routed answer require synthesis?** The Section 10 skill had
   general decision rules but no worked after-close example.
2. **Why was that distinction hard to apply?** Ledger reversal/re-posting and
   financial-statement retrospective restatement live in different references.
3. **Why were they not joined in one example?** Earlier coverage emphasised the
   posting and immutable-history contract.
4. **Why was this particular case not detected earlier?** No fixture tested a
   material error discovered after period close against both ledger and
   comparative-statement requirements.
5. **Why is the gap recurrent?** The skill's acceptance check requires examples
   generally but does not specify a closed-period correction case. Root cause:
   **proof/skill coverage**.

### A2 — corrupted data-contract field names escaped the text gate

1. **Why are field names unreadable?** Four control bytes replaced the first
   letters in four field names in the shared data-contract row: two form-feed
   bytes and two bell bytes.
2. **Why did the native text validator pass?** It searches known mojibake
   signature characters, not non-tab C0 controls.
3. **Why is there no check for those bytes?** Its cases cover common UTF-8
   decoding artifacts but not binary/control-byte corruption.
4. **Why was that negative case absent?** No recurrence fixture supplied a
   control byte through the scanned Markdown path.
5. **Why did it recur in active skill text?** No release check enforces a
   printable-text contract across documentation. Root cause:
   **validator/proof boundary**.

### A3 — statutory schedules cannot support final payroll and tax output

1. **Why is the synthetic payroll/close blocked?** The current LST municipality,
   applicable calculation base and schedule were not established; Uganda PAYE,
   VAT, EFRIS and WHT entries also lack complete independent review for final
   use.
2. **Why were the applicable values not established in this exercise?** The
   opened official pages did not resolve the LST schedule/base, and PAYE, VAT
   and WHT observations were not reconciled end-to-end to the applicable
   Finance Act, effective date and transaction facts.
3. **Why did source observations not become releasable register evidence?**
   Some entries are explicitly draft, and this cycle did not create a preserved
   archive or obtain a named jurisdiction reviewer.
4. **Why does the strict validator not establish all missing legal schedules?**
   It checks source-register structure and gate consistency; it cannot supply
   authoritative local facts or a professional conclusion absent those sources
   and review.
5. **Why does that evidence remain outside the cycle's available proof?** A
   named reviewer and complete source/review workflow were not supplied for the
   affected schedules. Root cause: **source lifecycle and independent-review
   coverage** (synthesis of observed source gaps and the release-control
   boundary; not a finding that the law or a source does not exist).

### A4 — two-host marketplace metadata is incomplete

1. **Why did Claude validation report warnings?** Its baseline validator passed
   with warnings because the plugin/marketplace entry lacked description and
   author fields; the Codex local marketplace entry was absent.
2. **Why are the hosts not both covered?** Existing packaging publishes a
   Claude Code marketplace manifest and leaves Codex to root `AGENTS.md` use.
3. **Why did that pass earlier checks?** The repo had no cross-host manifest
   and file-limit test.
4. **Why was packaging change missed?** Public/local manifests and plugin
   loading rules have changed and differ by host.
5. **Why can a future release repeat this gap?** No engine validator checks
   catalog roots, manifest identity, skill discovery or package-entry cap.
   Root cause: **packaging/tooling evidence**.

## Ranked plan

| Priority / ID | Gap and root cause | Exact change and hypothesis | Owner / date | Acceptance evidence | Risk and rollback | Target contribution toward 95 |
|---|---|---|---|---|---|---|
| P0 / A3 | Final Uganda statutory rates and the other-country payroll/tax schedules are not fully admitted for client use; independent review and LST source are missing. Root cause: source/reviewer evidence. | Keep every unreviewed source blocked; refresh only source observations verified in this cycle, record exact unresolved coverage, and route the remaining review to a named country reviewer. Hypothesis: current source claims become traceable without implying tax sign-off. | Cycle owner, 2026-10-29; independent country reviewer not yet assigned. | Updated source register plus date/scope/status record; final promotion requires official source/Act, archive, named reviewer and jurisdiction/date match. | No rate is promoted by this cycle; revert any date/status change that exceeds verified scope. Stop final payroll/tax output while gaps remain. | Protect safety/currency; contributes 0 verified final-release points until independent review. |
| P1 / A2 | Identical control-byte corruption in 74 reference contracts evaded the strict scan. Root cause: validator/proof. | Restore the four affected field names in all matching rows; extend the mojibake scanner to flag forbidden C0 controls while allowing tab; add negative regression fixture. Hypothesis: this class of text corruption fails the standard gate. | Kaizen owner, 2026-10-29. | Focused negative test rejects control byte and passes ordinary tab; raw scan finds 0 remaining text controls; all 13 registered checks and Python suite pass. | Scanner could flag legitimate binary-adjacent text; limit scan to configured text extensions and allow tab. Roll back scanner/test if clean fixtures regress; retain exact row repairs. | Hygiene +5 hypothesis; applied proof +2. |
| P1 / A1 | After-close material prior error lacked a routed worked example combining immutable ledger correction and retrospective financial-statement treatment. Root cause: skill/proof coverage. | Add a focused Section 10 example with separately identified Chwezi posting mechanics and IFRS reporting requirement, balanced fixture journals, and a document acceptance test. Hypothesis: a fresh practitioner retains posted history, uses the approved open-period adjustment path, and assesses material retrospective restatement. | Kaizen owner, 2026-10-29. | Task 2 rechecked; four fixture journals balance; Python suite tests example requirements and amounts; full 13-check native gate passes. A focused three-positive/two-negative expected-label fixture is retained; router execution and precision@1 remain NOT_ASSESSED. | Risk of overclaiming that IFRS prescribes Chwezi posting operations or presenting fixture mapping as universal. Cite the two sources separately, require controller/IFRS review, and leave actual tax/materiality effects NOT_ASSESSED. Remove example/test if source treatment or journal arithmetic fails. | Skill depth +4 hypothesis; applied proof/output readiness +3. |
| P1 / A4 | Baseline Claude validation passed with warnings for missing plugin/author metadata; no Codex compatibility entry or repo-local Codex catalog existed. Root cause: packaging adapters were not jointly checked. | Add truthful Claude description/author metadata, a `.codex-plugin/plugin.json` compatibility manifest with one supported `./skills/` root, a repo-local Codex marketplace catalog, and a 5,000-entry package/full-checkout count guard with negative tests. Use documented host-specific manifests; do not add a root portable manifest or claim public submission acceptance. Hypothesis: discovery roots and size limit become reproducible release checks. | Kaizen owner, 2026-10-29. | Claude CLI structural manifest/marketplace validation passes without manifest errors; record remaining nonblocking directory warnings. Native path checker resolves all listed skill directories, and cap checker measures both counts; negative fixtures reject missing skills and over-limit cases. Codex authenticated install/public listing remains NOT_ASSESSED. | A wrong `skills` discovery path could hide routes; compare Claude's explicit paths and Codex's root discovery against all active `SKILL.md` files. Roll back only new metadata/check if any path differs; preserve existing Claude hook controls. | Production/handoff +5 hypothesis; hygiene +1. |
| P2 / A5 | Consumer references include old local paths or re-state current tax instructions. Root cause: cross-engine handoff maintenance. | Record exact cross-engine mismatch files for their own next cycles. Do not edit any sibling checkout here. Hypothesis: an owned follow-up can remove copied or machine-specific routing without changing consumer scope. | Portfolio owners, next cycle. | Separate read-only sample and owner acceptance in each engine cycle. | No consumer content is copied or changed in this cycle. | Handoff +2 hypothesis. |

The target values are directional only. The cycle's final score is re-rated from
observed evidence; no contribution is awarded because prose or a test was merely
added.
