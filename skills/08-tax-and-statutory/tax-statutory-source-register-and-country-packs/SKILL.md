---
name: tax-statutory-source-register-and-country-packs
description: Use when designing, reviewing, or validating tax, payroll, statutory, e-invoicing, exchange-rate, source-register, and country-pack behavior for Uganda, Kenya, Rwanda, Tanzania, South Africa, or future Chwezi country extensions.
metadata:
  portable: true
  compatible_with:
    - claude-code
    - codex
---

# Tax Statutory Source Register and Country Packs

<!-- dual-compat-start -->
## Use When

Use when statutory values, tax rules, payroll deductions, e-invoicing, exchange rates, source-register entries, or country packs are in scope.

## Do Not Use When

Do not use to invent final rates or deadlines; use it to require verified source evidence and country reviewer approval.

## Required Inputs

Jurisdiction, statutory surface, output status, source entry, authority evidence, reviewer, recheck date, and affected outputs.

## Workflow

Classify the output, check the country pack, validate source state and freshness, block unsafe final values, and record caveats for draft use.

## Quality Standards

Official-source first, date-stamped, reviewer-named, jurisdiction-specific, stale-source blocking, and no final statutory values without usable entries.

## Anti-Patterns

Hardcoded final rates, copied country rules, stale source use, missing archive evidence, and hidden statutory caveats.

## Outputs

Source-register snapshots, country-pack gate results, authority hierarchies, skeleton caveats, and final-output blockers.

## References

Load the required references and examples listed below before implementation or review.
<!-- dual-compat-end -->

## Prerequisites

- Read `doctrine/references/live-rate-verification-protocol.md`.
- Read `doctrine/references/country-extension-framework.md`.
- Read `doctrine/references/tax-vat-and-returns.md` when VAT or returns are in scope.
- Confirm jurisdiction, output type, authority hierarchy, filing period, reviewer, and whether the output is draft or final.
- Treat every rate, threshold, statutory schedule, exchange rate, e-invoicing rule, and filing deadline as live-source dependent.

## Inputs

| Artifact | Produced by | Required? | Validation |
|---|---|---|---|
| Country profile | Country-pack owner | Required | ISO code, currency, authorities, framework, and statutory surfaces present. |
| Source-register entry | Tax or statutory reviewer | Required for final statutory output | State, source tier, date accessed, verifier, recheck due, and affected outputs present. |
| Output request | Consumer workflow | Required | Draft or final state declared; country and statutory surface declared. |
| Authority evidence | Source-register reviewer | Required for promotion | Official source URL or local archive path captured. |
| Caveat approval | Reviewer | Required for `verified-with-caveat` final use | Named reviewer and caveat text attached. |

## Outputs

| Artifact | Consumed by | Acceptance evidence |
|---|---|---|
| Source-register snapshot | Posting engine, payroll, tax reports | Final outputs reference only usable states. |
| Country-pack gate result | Validator, release process | Missing, stale, draft, or superseded entries block final output. |
| Authority hierarchy | Reviewers, implementers | Tier 1 and Tier 2 sources preferred and documented. |
| Draft caveat | Proposals, planning artefacts | User-visible warning that final values must be verified. |
| Country skeleton | Future country implementation | No final rates leak into unverified packs. |

## Decision Rules

1. Final statutory output requires `verified-current` source entries or reviewer-approved `verified-with-caveat` entries.
2. `draft`, `stale`, `superseded`, and `no-source-found` entries cannot support final values.
3. Uganda may be seeded first, but every final entry still needs current official source evidence.
4. Kenya, Rwanda, Tanzania, and South Africa country packs remain skeletons until country reviewers promote entries.
5. Do not copy rates, deadlines, or return fields across countries.
6. EFRIS, eTIMS, and equivalent e-invoicing rules are country-specific statutory surfaces, not generic invoice settings.
7. Exchange-rate values used in final postings require a source entry for the rate type and date.
8. When source evidence conflicts, block final output and route to a named reviewer.

## Acceptance Evidence

- `references/source-register-contract.md` defines the minimum entry fields and state machine.
- `references/country-pack-gates.md` defines final-output blocking rules.
- `examples/source-register-entry-draft.md` shows a non-final planning entry.
- `examples/stale-source-rejection.md` shows the failure mode for expired evidence.
- `examples/country-pack-skeleton.md` shows a country pack that contains authority hierarchy but no final rates.
- Validator or review checklist confirms no final statutory value appears without a source-register dependency.

## Anti-Patterns

- Hardcoding final statutory rates in skills, examples, seed data, or proposal text.
- Treating regulator FAQs as enough when authoritative law or regulator pages are required.
- Shipping a return pack after the recheck date has passed.
- Reusing Uganda VAT, PAYE, NSSF, WHT, EFRIS, or exchange-rate values for another country.
- Hiding source uncertainty in footnotes instead of blocking final output.

## Required References

- `references/source-register-contract.md`
- `references/country-pack-gates.md`
- `references/authority-hierarchy-east-africa.md`
- `doctrine/references/live-rate-verification-protocol.md`
- `doctrine/references/country-extension-framework.md`
- `doctrine/references/tax-vat-and-returns.md`

## Examples

- `examples/source-register-entry-draft.md`
- `examples/stale-source-rejection.md`
- `examples/country-pack-skeleton.md`

## Review Metadata

| Field | Value |
|---|---|
| Owner role | Tax and statutory source-register owner |
| Reviewer roles | Country tax reviewer, controller, tooling reviewer |
| Last reviewed | 2026-05-15 |
| Next review due | 2026-08-15 |
| Release state | Draft until validator enforces stale and missing source gates |
| Caveat | This skill intentionally contains no final statutory rates. |

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
