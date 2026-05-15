# Remediation Roadmap

Assessment date: 2026-05-16
Current score: **94 / 100**

The original stabilization, core-skill, standards-transition, and evidence-package workstreams are implemented. The remaining roadmap is about source completeness, reviewer sign-off, and real consumer adoption tests.

## Phase 1: Source-Complete Uganda Pack

Target score after phase: **96 / 100**

| Work item | Owner | Acceptance evidence |
|---|---|---|
| Verify Uganda VAT entries | Tax reviewer | `vat.yaml` marked `verified-current` or approved `verified-with-caveat`, with archive evidence. |
| Verify Uganda PAYE entries | Payroll tax reviewer | `paye.yaml` marked verified and linked to official source evidence. |
| Verify Uganda WHT entries | Tax reviewer | `wht.yaml` verified by transaction category and effective period. |
| Verify Uganda income-tax entries | Tax reviewer | `income-tax.yaml` verified for scoped corporation/presumptive/advance-tax rules. |
| Verify EFRIS source entry | Tax systems reviewer | `efris.yaml` verified for scoped invoice evidence fields and caveats. |
| Verify exchange-rate source hierarchy | Controller reviewer | `exchange-rates.yaml` names official rate source, scope, and recheck cadence. |

## Phase 2: Reviewer-Signed Release

Target score after phase: **97 / 100**

| Work item | Owner | Acceptance evidence |
|---|---|---|
| Complete release manifest | Doctrine owner | Release manifest filled with commit, validation state, source-register state, standards basis, and caveats. |
| Accounting reviewer sign-off | Accounting reviewer | Signed review note attached to release evidence. |
| Tax reviewer sign-off | Tax reviewer | Signed source-register scope and caveat review. |
| Tooling reviewer sign-off | Tooling owner | Validator and mirror dry-run evidence reviewed. |
| Delivery reviewer sign-off | Delivery lead | Plain-language and client-output caveats reviewed. |

## Phase 3: Consumer Engine Enforcement

Target score after phase: **98 / 100**

| Work item | Owner | Acceptance evidence |
|---|---|---|
| Mirror approved release to consumer engines | Integration owner | Mirror run log and adoption records. |
| Add posting-boundary tests in consumer repos | Engineering owner | Direct ledger writes fail; posting-service path passes. |
| Add source-register gates in consumer repos | Engineering owner + tax reviewer | Draft source entries cannot produce final statutory output. |
| Add report-output lint checks | UX/tooling owner | Three-layer output, print fidelity, and drilldown checks pass. |

## Phase 4: Multi-Country Release Packs

Target score: **99+ only after verified packs exist**

| Work item | Owner | Acceptance evidence |
|---|---|---|
| Kenya verified pack | Kenya tax reviewer | KRA/eTIMS entries verified-current for scoped outputs. |
| Rwanda verified pack | Rwanda tax reviewer | Authority hierarchy and source entries verified-current. |
| Tanzania verified pack | Tanzania tax reviewer | Authority hierarchy and source entries verified-current. |
| South Africa verified pack | South Africa tax reviewer | Authority hierarchy and source entries verified-current. |

## Current Recommendation

Do not spend the next cycle adding new skills. Spend it verifying sources, recording reviewer decisions, and proving consumer enforcement.
