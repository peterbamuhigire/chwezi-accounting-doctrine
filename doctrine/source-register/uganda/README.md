# Uganda Source Register Seed Pack

Uganda entries have different states. The NSSF entry is the sole verified-current exception identified in the source-register overview. PAYE is **draft** after the 2026 amendment was announced: the superseded historical schedule is retained separately, while the current URA-published schedule awaits independent country-tax review and an archived source snapshot. LST is **draft** because the effective date and gross/net calculation base are not resolved by the accessible current authority material. Neither PAYE nor LST supports final output. VAT, WHT, income-tax, EFRIS, exchange-rate, and other unverified statutory entries remain blocked for final use.

## Seed Authorities From Uplift Report

| Topic | Official or institutional source | Current use |
|---|---|---|
| VAT, income tax | URA Taxation Handbook FY 2024-25: https://ura.go.ug/wp-content/uploads/2024/12/Taxation-Handbook-FY-2024-25.pdf | Historical/draft source seed; not current evidence for post-amendment tax periods. |
| WHT | URA WHT page: https://ura.go.ug/en/witholding-tax/; URA 2026 effective-date notice: https://ura.go.ug/en/effective-date-of-the-income-tax-amendment-act-2026-and-the-excise-duty-amendment-act-2026/ | Draft only; direct fetch of the current WHT page timed out, and transaction-specific 2026 changes require the enacted Act and reviewer. Final use blocked. |
| PAYE | URA PAYE rates: https://ura.go.ug/en/domestic-taxes/paye-rates/; URA 2026 amendment notices: https://ura.go.ug/en/changes-to-paye-return-form-following-the-income-tax-amendment-act-2026/ and https://ura.go.ug/en/effective-date-of-the-income-tax-amendment-act-2026-and-the-excise-duty-amendment-act-2026/ | The authority pages show a schedule effective 2026-07-01 and direct July/August return review. Current register entry is draft pending statutory reviewer reconciliation and source archiving. |
| LST | Local Governments (Amendment) (No. 2) Act, 2008; KCCA Local Service Tax FAQ: https://kcca.go.ug/uDocs/Local_Service_Tax_FAQs.pdf; current KCCA eCitie page links to its LST FAQ. | Current register entry is draft. The exact effective period and gross/net calculation base need statutory and local-authority reconciliation; final payroll use is blocked. |
| EFRIS | URA EFRIS Handbook FY 2024-25: https://ura.go.ug/storage/2025/01/THE-EFRIS-HANDBOOK-2024-25-2.pdf | Draft e-invoicing evidence seed; current platform rules require review. |
| NSSF | NSSF Uganda membership page: https://www.nssfug.org/about-us/membership/ | One bounded membership/contribution entry is verified-current through 2026-11-16; benefit, amnesty, penalty, arrears, and classification cases remain outside its scope. |
| Uganda reporting framework | IFAC Uganda profile: https://www.ifac.org/about-ifac/membership/profile/uganda | Institutional source seed; not final jurisdictional framework verification. |
| IFRS for SMEs implementation support | ICPAU resource page: https://www.icpau.co.ug//resources/ifrs-smes-implementation-guidelines | Institutional source seed; requires reviewer review for use in final policy wording. |

## Release Gate

Before any Uganda final statutory output ships:

- Each consumed topic must have a source-register entry in `verified-current` state or reviewer-approved `verified-with-caveat` state.
- The entry must identify the reviewer, access date, effective period, and archive snapshot.
- The output must show source state and caveat text where any caveat remains.
- Draft entries in this folder must fail final-output validation.

Last reviewed: 2026-05-14. Next review due: 2026-08-14.
