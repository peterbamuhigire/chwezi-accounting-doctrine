# Uganda Source Register Seed Pack

Uganda entries are draft seeds until a named reviewer verifies the current source, captures an archive snapshot, and updates the state. They do not support final VAT, PAYE, NSSF, WHT, income-tax, EFRIS, exchange-rate, or statutory reporting output in their current state.

## Seed Authorities From Uplift Report

| Topic | Official or institutional source | Current use |
|---|---|---|
| VAT, PAYE, WHT, income tax | URA Taxation Handbook FY 2024-25: https://ura.go.ug/wp-content/uploads/2024/12/Taxation-Handbook-FY-2024-25.pdf | Draft source seed; final values require reviewer extraction and archive. |
| EFRIS | URA EFRIS Handbook FY 2024-25: https://ura.go.ug/storage/2025/01/THE-EFRIS-HANDBOOK-2024-25-2.pdf | Draft e-invoicing evidence seed; current platform rules require review. |
| NSSF | NSSF Uganda membership page: https://www.nssfug.org/about-us/membership/ | Draft payroll statutory seed; final contribution treatment requires review. |
| Uganda reporting framework | IFAC Uganda profile: https://www.ifac.org/about-ifac/membership/profile/uganda | Institutional source seed; not final jurisdictional framework verification. |
| IFRS for SMEs implementation support | ICPAU resource page: https://www.icpau.co.ug//resources/ifrs-smes-implementation-guidelines | Institutional source seed; requires reviewer review for use in final policy wording. |

## Release Gate

Before any Uganda final statutory output ships:

- Each consumed topic must have a source-register entry in `verified-current` state or reviewer-approved `verified-with-caveat` state.
- The entry must identify the reviewer, access date, effective period, and archive snapshot.
- The output must show source state and caveat text where any caveat remains.
- Draft entries in this folder must fail final-output validation.

Last reviewed: 2026-05-14. Next review due: 2026-08-14.
