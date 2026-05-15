# Reporting Basis Fixture - 2027 Full IFRS With IFRS 18 Transition

## Fixture Metadata

| Field | Value |
|---|---|
| Fixture id | RB-2027-IFRS18 |
| Entity type | Public-interest entity or entity contractually required to use full IFRS |
| Reporting period | 2027-01-01 to 2027-12-31 |
| Reporting period start | 2027-01-01 |
| Framework | Full IFRS with IFRS 18 transition |
| Transition assumption | IFRS 18 presentation and disclosure checks required |
| Country framework source state | draft |
| Reviewer | pending |

## Reporting-Basis Block

```text
Reporting basis: Full IFRS with IFRS 18 transition
Reporting period start: 2027-01-01
Transition assumption: IFRS 18 must be considered for presentation and disclosure. IAS 1-only wording is blocked unless rewritten or explicitly caveated for transition context.
Country framework source state: draft
Reviewer: pending
Release caveat: Planning fixture only. Final output requires source archive, country framework verification, and technical reviewer sign-off.
```

## Business Meaning

The entity is in a 2027 reporting period and uses full IFRS, so the financial statement presentation workstream must account for IFRS 18. Management should not approve templates that simply reuse old IAS 1 wording.

## Accounting Treatment

- Route primary statement presentation through `../references/ifrs-18-presentation-transition.md`.
- Treat the 2026 full IFRS baseline as comparative context, not as the complete 2027 presentation basis.
- Identify affected report templates, accounting policy notes, comparative presentation, and disclosure wording.
- Require reviewer approval before final financial statements, audit packs, or implementation acceptance tests.

## Evidence And Caveat

| Evidence | State |
|---|---|
| IFRS 18 official page: https://www.ifrs.org/issued-standards/list-of-standards/ifrs-18-presentation-and-disclosure-in-financial-statements/ | Source identified from uplift report; archive required. |
| IFRS Required 2026 page: https://www.ifrs.org/news-and-events/news/2026/01/now-available-ifrs-accounting-standards-required-2026-two-editions/ | Source identified from uplift report; archive required. |
| Country framework source register | Draft; final statutory output blocked. |

## Expected Validator Result

- Passes the reporting-basis presence check.
- Triggers IFRS 18 transition checks.
- Fails any IAS 1-only 2027 full IFRS presentation output without caveat.
- Remains blocked for final statutory output because source archive and reviewer evidence are pending.

Last reviewed: 2026-05-14. Next review due: 2026-08-14.
