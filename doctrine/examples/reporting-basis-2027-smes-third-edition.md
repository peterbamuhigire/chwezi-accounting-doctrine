# Reporting Basis Fixture - 2027 IFRS for SMEs Third Edition Transition

## Fixture Metadata

| Field | Value |
|---|---|
| Fixture id | RB-2027-SMES-3E |
| Entity type | Private SME with no public accountability |
| Reporting period | 2027-01-01 to 2027-12-31 |
| Reporting period start | 2027-01-01 |
| Framework | IFRS for SMEs with third-edition transition assessment |
| Transition assumption | Third edition must be considered for 2027+ SME reporting |
| Country framework source state | draft |
| Reviewer | pending |

## Reporting-Basis Block

```text
Reporting basis: IFRS for SMEs 2025 third edition transition assessment
Reporting period start: 2027-01-01
Transition assumption: The IFRS for SMEs third edition must be considered. Old-edition SME wording is blocked unless a transition caveat and reviewer approval are attached.
Country framework source state: draft
Reviewer: pending
Release caveat: Planning fixture only. Final output requires source archive, country framework verification, and technical reviewer sign-off.
```

## Business Meaning

The entity may still be an SME, but 2027 reporting cannot assume the old SME edition without a transition review. Management needs a visible transition assumption before relying on reports or proposals.

## Accounting Treatment

- Route SME basis checks through `../references/ifrs-for-smes-third-edition-transition.md`.
- Confirm the entity remains eligible for IFRS for SMEs.
- Identify accounting policies, report templates, disclosures, and implementation tests affected by the third edition.
- Require reviewer approval before final financial statements, audit packs, or implementation acceptance tests.

## Evidence And Caveat

| Evidence | State |
|---|---|
| IFRS for SMEs official page: https://www.ifrs.org/content/ifrs/home/issued-standards/ifrs-for-smes/ | Source identified from uplift report; archive required. |
| Country framework source register | Draft; final statutory output blocked. |

## Expected Validator Result

- Passes the reporting-basis presence check.
- Triggers IFRS for SMEs third-edition transition checks.
- Fails any 2027+ SME output that applies old-edition wording silently.
- Remains blocked for final statutory output because source archive and reviewer evidence are pending.

Last reviewed: 2026-05-14. Next review due: 2026-08-14.
