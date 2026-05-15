# IFRS for SMEs Third Edition Transition

This reference controls IFRS for SMEs outputs around the 2025 third edition and its 2027 effective-date trigger. It should be read with `standards-transition-2027.md` and `ifrs-for-smes-default.md`.

## Official Source

IFRS for SMEs official page: https://www.ifrs.org/content/ifrs/home/issued-standards/ifrs-for-smes/

The uplift report records that the IFRS for SMEs Standard was updated in February 2025, with the new edition effective for periods beginning on or after 2027-01-01. This file treats that as a transition trigger. Archive capture and technical reviewer sign-off are still required before final release.

## Trigger

Apply this transition check when:

- Framework is IFRS for SMEs.
- Reporting period begins on or after 2027-01-01.
- Early application of the third edition is elected for an earlier period.
- A proposal, SRS, report pack, or accounting policy note covers future SME reporting periods.

## Required Checks

| Area | Doctrine check | Blocker condition |
|---|---|---|
| Basis label | Output states whether it uses the 2015 edition, the 2025 third edition, or a transition assumption. | Output says only `IFRS for SMEs` for 2027+ periods. |
| Entity eligibility | Public accountability assessment remains current. | SME framework applied to an entity requiring full IFRS. |
| Transition assessment | Third-edition impact review is listed for accounting policies, reports, and disclosures. | Old-edition treatment applied silently for 2027+ periods. |
| Early application | Client instruction, jurisdiction support, and reviewer approval are attached. | Early application claimed without evidence. |
| Country overlay | Local reporting framework source state is visible. | Country framework is draft or missing while final statutory compliance is claimed. |

## Implementation Consequences

- Existing SME templates remain usable for 2026 periods, subject to issued-not-yet-effective disclosure where relevant.
- 2027+ SME outputs must carry a third-edition transition block until reviewed.
- Client onboarding must record whether the entity remains eligible for IFRS for SMEs.
- Proposal and SRS templates must not promise final 2027 SME reporting without the transition caveat.

## Required Acceptance Evidence

| Evidence | Minimum requirement |
|---|---|
| Source evidence | Official IFRS Foundation URL, archive snapshot, access date, reviewer name. |
| Fixture | `../examples/reporting-basis-2027-smes-third-edition.md`. |
| Reviewer note | Technical reviewer confirms transition assumptions and early-application treatment if relevant. |
| Validator rule | Old-edition SME wording in 2027+ output is flagged unless caveated. |

## Caveat Text

Use this caveat until review evidence exists:

```text
IFRS for SMEs third edition transition source identified from the IFRS Foundation official page. This output is not final SME reporting advice until archive evidence and technical reviewer approval are attached.
```

Last reviewed: 2026-05-14. Next review due: 2026-08-14.
