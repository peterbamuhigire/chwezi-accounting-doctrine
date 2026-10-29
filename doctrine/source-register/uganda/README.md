# Uganda Source Register Seed Pack

Uganda entries have different states. The NSSF entry is the sole verified-current exception identified in the source-register overview. PAYE is **draft** after the 2026 amendment was announced: the superseded historical schedule is retained separately, while the current URA-published schedule awaits independent country-tax review and an archived source snapshot. LST is **draft** because the effective date and gross/net calculation base are not resolved by the accessible current authority material. Neither PAYE nor LST supports final output. VAT, WHT, income-tax, EFRIS, exchange-rate, and other unverified statutory entries remain blocked for final use.

## Seed Authorities From Uplift Report

| Topic | Official or institutional source | Current use |
|---|---|---|
| VAT, income tax | URA Taxation Handbook FY 2024-25: https://ura.go.ug/wp-content/uploads/2024/12/Taxation-Handbook-FY-2024-25.pdf | Historical/draft source seed; not current evidence for post-amendment tax periods. |
| WHT | URA WHT page: https://ura.go.ug/en/witholding-tax/; URA 2026 effective-date notice: https://ura.go.ug/en/effective-date-of-the-income-tax-amendment-act-2026-and-the-excise-duty-amendment-act-2026/ | Page opened 2026-10-29; transaction-specific 2026 changes still require enacted-law reconciliation and reviewer. Final use blocked. |
| PAYE | URA PAYE rates: https://ura.go.ug/en/domestic-taxes/paye-rates/; URA 2026 amendment notices: https://ura.go.ug/en/changes-to-paye-return-form-following-the-income-tax-amendment-act-2026/ and https://ura.go.ug/en/effective-date-of-the-income-tax-amendment-act-2026-and-the-excise-duty-amendment-act-2026/ | The authority pages show a schedule effective 2026-07-01 and direct July/August return review. Current register entry is draft pending statutory reviewer reconciliation and source archiving. |
| LST | Local Governments (Amendment) (No. 2) Act, 2008; KCCA Local Service Tax FAQ: https://kcca.go.ug/uDocs/Local_Service_Tax_FAQs.pdf; current KCCA eCitie page links to its LST FAQ. | Current register entry is draft. The exact effective period and gross/net calculation base need statutory and local-authority reconciliation; final payroll use is blocked. |
| EFRIS | URA FY 2026/27 handbook archive: https://ura.go.ug/download-category/efris-handbook/; additional-taxpayer notice: https://ura.go.ug/en/additional-taxpayers-required-to-use-efris/ | New source leads observed 2026-10-29; handbook contents and technical changes since the 2026-08-28 review remain NOT_ASSESSED. The new register item is draft. |
| NSSF | NSSF Uganda membership page: https://www.nssfug.org/about-us/membership/ | One bounded membership/contribution entry is verified-current through 2026-11-16; benefit, amnesty, penalty, arrears, and classification cases remain outside its scope. |
| Uganda reporting framework | IFAC Uganda profile: https://www.ifac.org/about-ifac/membership/profile/uganda | Institutional source seed; not final jurisdictional framework verification. |
| IFRS for SMEs implementation support | ICPAU resource page: https://www.icpau.co.ug//resources/ifrs-smes-implementation-guidelines | Institutional source seed; requires reviewer review for use in final policy wording. |

## Release Gate

Before any Uganda final statutory output ships:

- Each consumed topic must have a source-register entry in `verified-current` state or reviewer-approved `verified-with-caveat` state.
- The entry must identify the reviewer, access date, effective period, and archive snapshot.
- The output must show source state and caveat text where any caveat remains.
- Draft entries in this folder must fail final-output validation.

## October 2026 currentness check

**Access date:** 2026-10-29. **Follow-up review target:** 2026-11-29
(internal scheduling target, not a statutory date).

| Topic | Official-source observation | Support state and limit |
|---|---|---|
| PAYE | URA's live PAYE page and its 2026-09-07 notice show the resident monthly schedule effective from 2026-07-01 ([PAYE rates](https://ura.go.ug/en/domestic-taxes/paye-rates/), [notice](https://ura.go.ug/en/changes-to-paye-return-form-following-the-income-tax-amendment-act-2026/)). | Current regulator-page display verified for observation only; YAML entry remains `draft` pending independent law review and archived evidence. |
| NSSF | NSSF's current membership page states the employee/employer contribution split and remittance timing ([membership page](https://www.nssfug.org/about-us/membership/)). | Bounded entry remains `verified-current` for that stated scope only; other membership, penalty and benefit cases are outside scope. |
| VAT | URA's current page displays the standard-rated VAT rate ([VAT page](https://ura.go.ug/en/value-added-tax-vat/)). | Page claim observed; YAML rate and return-mapping entries remain `draft` pending law reconciliation, archive and reviewer approval. |
| WHT | The current URA WHT page opened on this date ([WHT page](https://ura.go.ug/en/witholding-tax/)); the 2026 amendment effective-date notice also identifies affected WHT returns ([notice](https://ura.go.ug/en/effective-date-of-the-income-tax-amendment-act-2026-and-the-excise-duty-amendment-act-2026/)). | Transaction-specific enacted-law reconciliation, reviewer approval and archive are NOT_ASSESSED; no rate is admitted for final use. This supersedes the earlier note that the live page fetch timed out. |
| LST | The current municipality-specific schedule and gross/net calculation base were not verified. | **NOT_ASSESSED**; no source found in this pass that resolves the applicable current local-authority schedule. Final payroll remains blocked. |
| EFRIS | URA's notice dated 2026-08-11 identifies additional sector obligations effective from 2025-07-01; its handbook archive lists a FY 2026/27 English handbook ([notice](https://ura.go.ug/en/additional-taxpayers-required-to-use-efris/), [archive](https://ura.go.ug/download-category/efris-handbook/)). | Obligation notice observed; the handbook was not opened and technical change comparison after 2026-08-28 is **NOT_ASSESSED**. Entry remains `draft`. |

Last reviewed: 2026-10-29. Next review due: 2026-11-29.
