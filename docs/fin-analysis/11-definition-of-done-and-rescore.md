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

After the 2026-05-15 evidence hardening work, use this narrative until human reviewer sign-off and broader statutory-source review are complete:

> The doctrine package has moved from pass-with-caveats to validator-clean release evidence. The local doctrine validator reports pass with zero blocker, high, medium, or caveat findings; all declared skill references exist; all 40 finance quality-gate blockers map to present evidence; the mirror dry-run succeeds; and the source register includes one verified-current Uganda NSSF mandatory-contribution entry. Remaining caveats are professional-review caveats: VAT, PAYE, WHT, income-tax, EFRIS, and exchange-rate entries remain draft, non-Uganda country packs remain skeletons, and a scored release still needs named reviewer sign-off.

## Residual Caveats To Carry Forward

- Do not claim final statutory compliance unless the source-register entry is verified-current or reviewer-approved verified-with-caveat.
- Do not treat Uganda NSSF verification as verification of VAT, PAYE, WHT, income-tax, EFRIS, or exchange-rate rules.
- Do not use non-Uganda country packs for final rates until jurisdiction-specific review is complete.
- Do not treat PDF/report placeholders in the audit export sample as actual financial statements.
- Do not treat the release manifest template as a completed release manifest until commit, validation output, source-register state, standards basis, hashes, and sign-offs are filled.
- Do not claim Big Four-equivalent assurance; this doctrine can encode professional discipline, but assurance requires engagement scope, independence, evidence, review, and sign-off.
