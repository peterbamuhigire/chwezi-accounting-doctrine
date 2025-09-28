# Scorecard

Raw weighted total: 74/100. Capped audit total: 61/100. The cap is applied because this audit intentionally exposes the path from current state to 95+ rather than awarding production-certification scores.

| Dimension | Raw score | Points |
| --- | --- | --- |
| Richness | 17/20 | 17 |
| Robustness | 16/20 | 16 |
| World-Class Output Capability | 15/20 | 15 |
| Architecture & Discoverability | 10/15 | 10 |
| Composability & Reuse | 9/15 | 9 |
| Currency & Compliance | 7/10 | 7 |

## Richness

Raw score: 17/20.

The engine has 102 SKILL.md files, 243 reference-file hits, 0 template-file hits, and 133 example-file hits. This gives it substantial domain coverage, but the richness score is held back where references are not converted into reusable examples, current-source registers, or complete model outputs.

Top deficiencies:

- Some SKILL.md files have missing frontmatter fields, weakening self-indexing despite the engine claiming direct glob routing.
- Tax, statutory, IFRS, and live-rate guidance requires dated source registers and reviewer sign-off, not static doctrine alone.
- Worked examples exist but need many more sector-specific journal packs, reconciliation packs, disclosure examples, and conformance scans.

## Robustness

Raw score: 16/20.

Robustness is supported by routers/governance files (231 read), scripts/tests where present (9 script or script-like files), and explicit anti-slop or quality gates in the repository. It is limited by missing live validation, missing negative fixtures, weak automated checks, or incomplete failure-mode coverage depending on the engine.

Top deficiencies:

- Some SKILL.md files have missing frontmatter fields, weakening self-indexing despite the engine claiming direct glob routing.
- Tax, statutory, IFRS, and live-rate guidance requires dated source registers and reviewer sign-off, not static doctrine alone.
- Worked examples exist but need many more sector-specific journal packs, reconciliation packs, disclosure examples, and conformance scans.

## World-Class Output Capability

Raw score: 15/20.

The engine can produce credible specialist output in its domain, but the audit asks whether the output is indistinguishable from a top-tier firm. The current blocker is usually the same pattern: not enough finished exemplars, proof packs, rendered outputs, evaluator simulations, or audited workbooks to demonstrate repeatable excellence.

Top deficiencies:

- Some SKILL.md files have missing frontmatter fields, weakening self-indexing despite the engine claiming direct glob routing.
- Tax, statutory, IFRS, and live-rate guidance requires dated source registers and reviewer sign-off, not static doctrine alone.
- Worked examples exist but need many more sector-specific journal packs, reconciliation packs, disclosure examples, and conformance scans.

## Architecture & Discoverability

Raw score: 10/15.

The structure is discoverable enough to route by filesystem and frontmatter, but there are 76 skills missing name frontmatter and 76 missing description frontmatter. Empty directories (0) and large local project/example surfaces can also reduce routing clarity.

Top deficiencies:

- Some SKILL.md files have missing frontmatter fields, weakening self-indexing despite the engine claiming direct glob routing.
- Tax, statutory, IFRS, and live-rate guidance requires dated source registers and reviewer sign-off, not static doctrine alone.
- Worked examples exist but need many more sector-specific journal packs, reconciliation packs, disclosure examples, and conformance scans.

## Composability & Reuse

Raw score: 9/15.

Reuse is visible through references, templates, scripts, examples, cross-engine trigger blocks, and local governance. The gap is less about having reusable pieces and more about proving they compose into complete delivery workflows with stable contracts and acceptance criteria.

Top deficiencies:

- Some SKILL.md files have missing frontmatter fields, weakening self-indexing despite the engine claiming direct glob routing.
- Tax, statutory, IFRS, and live-rate guidance requires dated source registers and reviewer sign-off, not static doctrine alone.
- Worked examples exist but need many more sector-specific journal packs, reconciliation packs, disclosure examples, and conformance scans.

## Currency & Compliance

Raw score: 7/10.

Currency and compliance depend on dated source registers, official standards, live-rate or platform refresh protocols, and release gates. The score is constrained when standards are named but not tied to dated verification, reviewer sign-off, or automated freshness checks.

Top deficiencies:

- Some SKILL.md files have missing frontmatter fields, weakening self-indexing despite the engine claiming direct glob routing.
- Tax, statutory, IFRS, and live-rate guidance requires dated source registers and reviewer sign-off, not static doctrine alone.
- Worked examples exist but need many more sector-specific journal packs, reconciliation packs, disclosure examples, and conformance scans.
