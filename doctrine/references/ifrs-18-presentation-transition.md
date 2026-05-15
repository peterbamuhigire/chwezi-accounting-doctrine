# IFRS 18 Presentation Transition

This reference controls full IFRS presentation outputs for reporting periods affected by IFRS 18. It should be read with `standards-transition-2027.md` and `full-ifrs-overlay.md`.

## Official Source

IFRS 18 official page: https://www.ifrs.org/issued-standards/list-of-standards/ifrs-18-presentation-and-disclosure-in-financial-statements/

The uplift report records that IFRS 18 is effective for annual reporting periods beginning on or after 2027-01-01 and replaces IAS 1. This file treats that as a transition trigger. Archive capture and technical reviewer sign-off are still required before final release.

## Trigger

Apply this transition check when:

- Framework is full IFRS.
- Reporting period begins on or after 2027-01-01.
- Early application of IFRS 18 is elected for an earlier period.
- A future-period proposal, SRS, implementation plan, or report builder discusses financial statement presentation.

## Required Checks

| Area | Doctrine check | Blocker condition |
|---|---|---|
| Basis label | Output states `Full IFRS with IFRS 18 transition` for 2027+ periods. | Basis absent or says only `IAS 1 presentation` for 2027+ full IFRS. |
| Primary statements | Presentation engine is routed through IFRS 18 review rather than IAS 1-only templates. | IAS 1-only template shipped without transition caveat. |
| Comparative information | Comparative-period handling is identified for the transition year. | Comparatives omitted from transition plan. |
| Notes and policy wording | Notes mention transition assumption and reviewer state. | Notes imply final compliance without reviewer approval. |
| Early application | Client instruction and reviewer approval are attached. | Early application claimed without evidence. |

## Implementation Consequences

- Report builders must keep the reporting-basis block visible.
- Template names should distinguish `full-ifrs-2026-baseline` from `full-ifrs-ifrs18-transition`.
- Any legacy IAS 1 wording in a 2027+ full IFRS output must be rewritten or caveated.
- Transition review is required before final financial statements, audit packs, proposals promising 2027 reports, or system acceptance tests.

## Required Acceptance Evidence

| Evidence | Minimum requirement |
|---|---|
| Source evidence | Official IFRS Foundation URL, archive snapshot, access date, reviewer name. |
| Fixture | `../examples/reporting-basis-2027-ifrs18.md`. |
| Reviewer note | Technical reviewer confirms transition assumptions and early-application treatment if relevant. |
| Validator rule | Stale IAS 1-only wording in 2027+ full IFRS output is flagged. |

## Caveat Text

Use this caveat until review evidence exists:

```text
IFRS 18 transition source identified from the IFRS Foundation official page. This output is not final IFRS presentation advice until archive evidence and technical reviewer approval are attached.
```

Last reviewed: 2026-05-14. Next review due: 2026-08-14.
