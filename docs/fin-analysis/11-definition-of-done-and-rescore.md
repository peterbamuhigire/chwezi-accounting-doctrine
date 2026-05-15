# Definition Of Done And Re-Score Narrative

Prepared: 2026-05-15
Source: `.codex-report-v2-extract.md`

## Definition Of Done For A 90+ Re-Evaluation

Before asking for a re-score, the repository should show:

- `tools/validate-doctrine.ps1` or equivalent runs and produces a saved validation report.
- Zero blocker findings remain.
- Zero high findings remain, or every high finding has a named waiver, owner, and expiry.
- All final statutory claims are backed by source-register entries.
- Uganda has verified-current source entries for active statutory surfaces.
- Kenya, Rwanda, Tanzania, and South Africa packs are explicitly draft/skeleton unless verified.
- IFRS 18 and IFRS for SMEs third edition transition files exist and are referenced by doctrine.
- `ledger-posting-engine-core` exists with examples and failure fixtures.
- The active skill catalogue is capped at 25 and every skill has Inputs/Outputs.
- A reference manifest accounts for every declared file.
- Mojibake scan is clean.
- Mirror dry-run succeeds.
- An audit-export sample bundle exists.
- Reviewer sign-off matrix exists and includes accounting, tax, tooling, doctrine owner, and delivery roles.
- A release manifest records source commit, validation state, source-register state, standards basis, and open caveats.

## Conditional Re-Score Narrative

Use the following narrative only after the definition of done is met:

> The doctrine package has moved from a strong written guidance set to a governed doctrine engine. The current release includes executable validation, a source-register schema, Uganda verified-source seed pack, 2027 standards transition handling for IFRS 18 and IFRS for SMEs third edition, a canonical ledger posting-engine skill, normalized skill contracts, missing domain skills, reference manifest, mirror dry-run evidence, and an audit-export sample. Remaining caveats are limited to non-Uganda country packs and any jurisdiction-specific statutory values not yet marked verified-current.

## Current Honest Narrative

Until the evidence exists and is reviewed, use this narrative:

> The doctrine package remains a strong foundation with a documented path to a defensible 90+ score. The report-v2 uplift documentation now defines the target evidence package, finding closure matrix, implementation backlog, audit export sample skeleton, release manifest, and re-score definition of done. The repository should still be treated as pass-with-caveats until validation, source-register evidence, standards-transition files, skill normalization, and reviewer sign-offs are complete.

## Residual Caveats To Carry Forward

- Do not claim final statutory compliance unless the source-register entry is verified-current or reviewer-approved verified-with-caveat.
- Do not use non-Uganda country packs for final rates until jurisdiction-specific review is complete.
- Do not treat PDF/report placeholders in the audit export sample as actual financial statements.
- Do not treat the release manifest template as a completed release manifest until commit, validation output, source-register state, standards basis, hashes, and sign-offs are filled.
- Do not claim Big Four-equivalent assurance; this doctrine can encode professional discipline, but assurance requires engagement scope, independence, evidence, review, and sign-off.
