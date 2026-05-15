# Standards Transition 2027

This reference defines how Chwezi outputs select the reporting basis for periods around the 2027 standards transition. It is a doctrine control, not a substitute for professional review.

## Evidence Sources

| Source | Use in doctrine | Verification state |
|---|---|---|
| IFRS 18 official page: https://www.ifrs.org/issued-standards/list-of-standards/ifrs-18-presentation-and-disclosure-in-financial-statements/ | Full IFRS presentation transition; IFRS 18 effective-date trigger and IAS 1 replacement caveat. | Source identified from uplift report; archive and reviewer sign-off required before final release. |
| IFRS for SMEs official page: https://www.ifrs.org/content/ifrs/home/issued-standards/ifrs-for-smes/ | IFRS for SMEs third edition transition trigger. | Source identified from uplift report; archive and reviewer sign-off required before final release. |
| IFRS Required 2026 page: https://www.ifrs.org/news-and-events/news/2026/01/now-available-ifrs-accounting-standards-required-2026-two-editions/ | 2026 baseline for IASB pronouncements required at 2026-01-01. | Source identified from uplift report; archive and reviewer sign-off required before final release. |

## Framework Selection

Every output with financial statement, accounting policy, statutory, or implementation impact must state one of these bases:

| Basis | Use before 2027-01-01 period start | Use for periods beginning on or after 2027-01-01 |
|---|---|---|
| IFRS for SMEs 2015 edition | Default for eligible SMEs unless local framework or client policy says otherwise. | Do not use silently; add transition assessment and old-edition caveat. |
| IFRS for SMEs 2025 third edition | Issued standard may be considered where early application is allowed and approved. | Trigger third-edition transition checks. |
| Full IFRS Required 2026 baseline | Full IFRS baseline for 2026 reporting periods. | Use only as comparative/baseline context; IFRS 18 transition must be considered. |
| Full IFRS with IFRS 18 transition | Issued-not-yet-effective disclosure or early-application path only. | Trigger IFRS 18 presentation and disclosure checks. |

## Effective-Date Decision Tree

1. Is the entity publicly accountable or otherwise required to use full IFRS?
   - Yes: use the full IFRS path.
   - No: evaluate IFRS for SMEs, subject to jurisdiction, client policy, and reviewer approval.
2. Does the reporting period begin on or after 2027-01-01?
   - Yes: trigger IFRS 18 and/or IFRS for SMEs third edition transition checks.
   - No: use the required 2026 baseline, with issued-not-yet-effective disclosure where relevant.
3. Is early application elected?
   - Yes: require entity policy, jurisdiction support, client instruction, reviewer approval, and note disclosure.
   - No: block early-application wording.
4. Is the country framework verified?
   - Yes: apply the country source-register state and local statutory overlay.
   - No: mark the output as planning draft only.

## Early-Application Policy

Early application is allowed only when all of the following are present:

- Entity reporting framework supports the election.
- Jurisdictional framework or regulator does not prohibit it.
- Client instruction is explicit and dated.
- Technical reviewer approves the basis.
- The output discloses the early-application fact and transition assumptions.

Missing evidence is a blocker for final output.

## Proposal And SRS Language

Future-period projects must carry this block:

```text
Reporting basis: <IFRS for SMEs 2015 | IFRS for SMEs 2025 third edition | Full IFRS Required 2026 | Full IFRS with IFRS 18 transition>
Reporting period start: <YYYY-MM-DD>
Transition assumption: <none | IFRS 18 considered | IFRS for SMEs third edition considered | early application elected>
Country framework source state: <verified-current | verified-with-caveat | draft | stale | not applicable>
Reviewer: <name/role/date or pending>
Release caveat: <required caveat text>
```

## Quality-Gate Blockers

- Full IFRS output for a period beginning on or after 2027-01-01 uses IAS 1-only presentation language without IFRS 18 transition consideration.
- SME output for a period beginning on or after 2027-01-01 applies the old IFRS for SMEs edition without a transition caveat.
- Early-application wording appears without client instruction and reviewer approval.
- Country framework is marked draft, stale, superseded, no-source-found, or missing while the output claims final statutory compliance.
- Reporting basis is absent from a proposal, SRS, report pack, financial statement, management account, or implementation fixture.

## Required Fixtures

| Fixture | Expected state |
|---|---|
| `../examples/reporting-basis-2026.md` | Uses current 2026 baseline and discloses issued-not-yet-effective standards where relevant. |
| `../examples/reporting-basis-2027-ifrs18.md` | Triggers IFRS 18 presentation checks and blocks IAS 1-only language. |
| `../examples/reporting-basis-2027-smes-third-edition.md` | Triggers IFRS for SMEs third edition checks and blocks old-edition silence. |

## Output Pattern

Client-facing outputs must include three layers:

| Layer | Required content |
|---|---|
| Business meaning | Plain-language effect of the selected basis and transition. |
| Accounting treatment | Framework, transition standard, recognition/presentation area, and affected reports. |
| Evidence and caveat | Official source URL, source state, reviewer state, country source-register state, and open caveats. |

Last reviewed: 2026-05-14. Next review due: 2026-08-14.
