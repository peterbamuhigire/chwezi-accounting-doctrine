---
name: tax-statutory-source-register-and-country-packs
description: Use when designing, reviewing, or validating tax, payroll, statutory, e-invoicing, exchange-rate, source-register, and country-pack behavior for Uganda, Kenya, Rwanda, Tanzania, South Africa, or future Chwezi country extensions, including which register entry applies on a date, its state and recheck date, and whether it may support final output.
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
9. Check an entry at the moment of use with `python tools/source_register_lookup.py --jurisdiction <CC> --register <stem> --date <YYYY-MM-DD> --json` (read-only); exit 3 means found but refused for final output.
10. Judge state, recheck date and archive for each entry on its own. A register file can hold several entries, and the first entry's state says nothing about the others.
11. A `verified-current` entry needs a named reviewer and an archive file that exists in the repository. A verifier note that a page was read again is an observation, not a review: keep such an entry out of final output until a reviewer is named, and report it.
12. A recheck date never precedes its access date, and it moves forward only after you have read the source again. An entry you did not re-verify keeps its date and shows as overdue.
13. Every source key cited in guidance, snapshots and examples must exist in the register. After any register or snapshot edit run `python tools/source_register_integrity.py`: exit 1 names the defect, and its attention list shows overdue draft entries and `verified-current` entries without a named reviewer.

## Capability Contract and Degraded Mode

| Capability | Used for | If it is unavailable |
|---|---|---|
| Read access to `doctrine/source-register/` | Every task | Stop. With no entry there is no final value: mark the output `NOT_ASSESSED`. |
| Python 3 with PyYAML | `tools/source_register_lookup.py` and `tools/source_register_integrity.py`; both are read-only, write nothing and need no network | Read the YAML entries directly and apply the schema state rules and decision rule 10 by hand. Record the tool checks as `NOT_ASSESSED`, not as passed. |
| Read access to the official source | Re-verifying a value, date or state | Leave the entry's state and recheck date unchanged, record that the source could not be reached, and do not present an older observation as current. |
| Write access to the register | A reviewed edit that names the source, access date and reviewer | Work read-only: report the proposed entry text and its evidence instead of editing. |

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
| Last reviewed | 2026-10-31 |
| Next review due | 2026-12-29 |
| Release state | Draft until validator enforces stale and missing source gates |
| Caveat | This skill intentionally contains no final statutory rates. |

Last reviewed: 2026-10-31. Next review due: 2026-12-29.
