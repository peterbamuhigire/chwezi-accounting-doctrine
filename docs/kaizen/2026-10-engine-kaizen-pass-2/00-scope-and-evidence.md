# Chwezi Accounting Doctrine, kaizen pass 2: scope and practitioner evidence

**Cycle date:** 2026-10-31
**Branch / starting commit:** `kaizen/2026-10-pass2` created from `main` at `7bc6a02`
**Continuation of:** [`2026-10-engine-kaizen`](../2026-10-engine-kaizen/05-final-report.md)
(run on 2026-10-29). This cycle takes its open items as the primary backlog
input and confirms each one before acting.

## Step 0: preconditions

| Item | Observation |
|---|---|
| Starting branch and HEAD | `main`, `7bc6a02` |
| `git status --porcelain` at start | Empty (0 lines). No uncommitted policy files or other people's files were present, so nothing needed preserving. |
| Branch | `kaizen/2026-10-pass2`, created with `git switch -c` from that HEAD. Nothing pushed, tagged or opened as a pull request. |
| Standard and currentness gate | Read from the Digital Research engine checkout: the Portfolio Kaizen Standard (2026-08) and the Kaizen Currentness Gate. |
| Engine files read | `README.md`, `AGENTS.md`, `CLAUDE.md`, `CHANGELOG.md`, `docs/router-map.md`, the 29 October evidence folder (all seven files), `docs/audits/2026-09-06-kaizen.md`, the source register and its schema, `tools/validate-doctrine.ps1`, `tools/check-source-register.ps1`, `tools/source_register_lookup.py`. |
| Host constraints | No `pwsh`, no `pytest`. The registered PowerShell gate was run piece by piece in an existing local `mcr.microsoft.com/powershell` image with the network disabled and the checkout bind-mounted read-only (no package installed anywhere). That image has no Python, so the one Python-backed check (frontmatter YAML) ran on the host. Details are in `04-validation-record.md`. |

### Open items carried in from 29 October, and their status now

| 29 Oct item | Status confirmed today |
|---|---|
| Statutory source schedules not admitted (Uganda LST, WHT; other countries) | Still open. LST and WHT remain `draft` and refused by the lookup tool. See D3 and D5 for new findings inside the same area. |
| 10 overdue source rechecks | Still open and now measured per entry: 10 entries are past their recheck date at 2026-10-31 (list in the scorecard). |
| IFRS amendment final text not located | Still open. The consolidation-exception amendment is an exposure draft with a decision to proceed; no final text was published at the access date. |
| Section 10 route fixture never executed | Partly closed here: executed through the portfolio's Tier-2 lexical proxy, 5 of 5 labels correct. Live model routing remains `NOT_ASSESSED`. |
| Claude strict directory warnings, remote CI, Windows PowerShell 5.1 | Unchanged. Not actionable without a push or a Windows host. |
| September portable-contract scan (1 of 108) | Confirmed still open by running the scanner read-only: 1 of 108 fully compliant (capability 104, degraded mode 102, trigger 29, sections 21, anti-pattern 14, metadata 14). Degraded mode moved from 103 to 102 since September. |
| Cross-engine mismatches (Business Plan, SDLC path text) | Re-checked read-only at the end of the cycle; see `06-next-cycle.md`. |

## Step 1: practitioner tasks

The engine has no executable router: the router is `README.md` plus
`docs/router-map.md`, which an agent reads. Routing was therefore judged by
reading the router map, and cross-checked with the portfolio's shared lexical
routing index (a Tier-2 proxy, not live model routing) run read-only over this
engine's 108 skill descriptions.

### Task 1: one month of a small Uganda trading entity

**Request:** credit purchase, sale with an EFRIS e-invoice, mobile-money
receipt, sales return, payroll with PAYE, NSSF and LST, and close. Check that
every journal balances, every correction is a reversal and every rate resolves
to a dated source key.

**Router choice (by reading the router map):** `accounts-payable-and-supplier-management`,
`ifrs-revenue-recognition`, `electronic-fiscal-taxing`,
`bank-and-mobile-money-reconciliation`, `payroll-and-statutory-postings-east-africa`,
`pricing-discounts-rebates-and-refunds` (returns), `month-end-and-year-end-close-playbook`.
Appropriate for each leg. The lexical proxy ranked the intended skill first for
payroll, mobile money, close and purchase, and not first for the EFRIS sale
(it preferred `indirect-tax-vat-mechanics`, with `e-invoicing-and-fiscal-device-integration`
second) or the sales return (it preferred `accounts-receivable-and-credit-management`).
Both misses are overlaps between legitimately adjacent skills, not wrong routes,
and the proxy is not a router; they are recorded, not tuned against.

**Independent re-performance of the ledger.** The 29 October fixture journals
were re-entered into a separate script and recomputed, not copied from the
earlier document. Results:

| Check | Result |
|---|---|
| Each of the 10 journals balances | Yes. Combined debits and credits both 8,940,000. |
| Trial balance with input and output VAT gross | Debits and credits both 5,045,000. |
| Trial balance with VAT netted (the earlier presentation) | Debits and credits both 4,865,000, equal to the earlier figure. |
| Profit before tax | 500,000 (2,000,000 sales, less 250,000 returns, 700,000 cost of sales, 500,000 payroll, 50,000 employer NSSF). |
| Balance sheet with VAT netted | Assets 3,365,000 = liabilities 1,865,000 + equity 1,500,000. |
| PAYE on 500,000 | 33,750 + 30% x 15,000 = 38,250. Employee NSSF 25,000, employer NSSF 50,000, net pay 436,750. |

(A first draft of this check showed assets unequal to liabilities plus equity.
That was a mistake in the check script, which mixed gross input VAT in assets
with net VAT in liabilities. Netting both sides consistently closes it.)

**Rate resolution through the engine's own lookup tool** (as of 2026-10-31, for
an October 2026 transaction date):

| Register | Entry returned | Final use | Notes |
|---|---|---|---|
| PAYE | `UG-PAYE-RATES` | Refused (draft) | No archive snapshot. |
| NSSF | `UG-NSSF-MEMBERSHIP-CONTRIBUTIONS` | **Allowed** (exit 0) | See D5: the entry is `verified-current` without a named reviewer. |
| VAT | `UG-VAT-STANDARD-RATE`, `UG-VAT-RETURN-PACK-SOURCE` | Refused | Standard-rate entry reports "recheck overdue" although its own notes record a recheck on 2026-10-29. See D2. |
| LST | `UG-LST-RATES` | Refused | Applicable schedule and base not established. |
| WHT | `UG-WHT-RATES` | Refused | |
| EFRIS | handbook entries | Refused | |
| Income tax | `UG-INCOME-TAX-RULES` | Refused | |

The engine behaves correctly for a client-release gate: payroll and VAT output
stay blocked until a reviewer admits the sources. It is not a successful
statutory close, and the entity cannot be taken to a releasable close from the
register as it stands.

### Task 2: material prior-period posting error found after close

**Request:** treatment of a prior-period error found after close; confirm the
engine prescribes reversal and re-posting in an open period, never update or
delete, with the IFRS for SMEs basis named.

**Router choice:** `ifrs-accounting-policies-changes-errors-ias8`,
`period-locking-and-data-immutability`, `ledger-posting-engine-core`. The proxy
agreed for the main skill (first of 108 on a plain-language query; next best
`ifrs-events-after-reporting-period-ias10`).

**Result:** the routed skill now carries the worked example added on 29 October.
It keeps the posted original, posts a linked equal-and-opposite reversal and
the correction in the first approved open period, separates that ledger
mechanism from the Section 10 retrospective-restatement question, and names
IFRS for SMEs Section 10. No unsafe direction was found. The earlier cycle
cited paragraphs 10.19 to 10.23 of the third-edition text; the paragraph
numbers were not re-opened this cycle (`NOT_ASSESSED` for this pass).

### Task 3: trial balance, statements and PBC evidence index

**Request:** trial balance, statements and PBC index from the Task 1 entity;
check cross-footing, cash and retained-earnings roll-forward, subledger-to-control
reconciliation.

**Router choice:** `financial-statements-preparation`, `audit-ready-reporting-pack`,
`month-end-and-year-end-close-playbook`, `audit-pbc-and-evidence-management`.
Appropriate. A single compound query combining statements and PBC went to the
PBC skill under the proxy; the two intents are separate skills by design.

**Result:** the arithmetic checks in Task 1 reproduce the earlier trial balance
and balance sheet. Accounts receivable rolls to nil only because the receipt
and the refund are assumed. Cash-flow classification of the mobile-money
clearing balance, the income-tax provision and the LST line are
`NOT_ASSESSED`; no source documents, provider statement or approved EFRIS
responses exist for the fixture, so the PBC index is a skeleton.

## Defect register (before any change in this cycle)

| ID / severity | Defect or gap | Exact file and line(s) | Evidence |
|---|---|---|---|
| D1 / Major | The strict source-register gate reads the first `state` and `expires_or_recheck_due` in a file, not each entry. A `verified-current` entry that is not first in its file is never tested for an overdue recheck, and is not counted. | `tools/check-source-register.ps1` lines 34–43 (`Get-ScalarValue`), 108–137 | Fixture register file with a `draft` first entry and a `verified-current` second entry nine months overdue: gate returned `pass`, 0 findings, `verified_current_entries: 1` (the real NSSF entry). The Python lookup tool refused the same entry ("recheck overdue"). |
| D2 / Major | `UG-VAT-STANDARD-RATE` has a recheck date (2026-08-14) earlier than its access date (2026-10-29), while its own note says the next recheck is 2026-12-29. The lookup tool therefore reports "recheck overdue" for an entry that was just rechecked, and no rule compares the two dates. | `doctrine/source-register/uganda/vat.yaml` line 14 | Lookup output above; the gate has no recheck-after-access rule. |
| D3 / Major | Stale VAT registration threshold. The engine says URA live guidance shows UGX 150,000,000. URA's live VAT page and its FY2026-27 VAT guide (Vol. 2 Issue 3) now state UGX 300,000,000 a year and UGX 75,000,000 over three consecutive months. The key `UG-VAT-REG-THRESHOLD` exists only in markdown. | `references/uganda-statutory.md` line 15; `docs/source-registers/ifrs-tax-statutory-2026.md` line 36 | URA pages opened 2026-10-31 (see `04-validation-record.md`). Neither source states an effective date or names the Act. |
| D4 / Major | `references/uganda-statutory.md` cites seven source keys that do not exist in the machine-readable register (`UG-EFRIS`, `UG-LST`, `UG-NSSF-MANDATORY`, `UG-PAYE-2026-AMENDMENT`, `UG-PAYE-URA-LIVE`, `UG-VAT-REG-THRESHOLD`, `UG-WHT-GENERAL`). The snapshot is dated 2026-07-08 with review due 2026-08-08, and calls the VAT rate and NSSF "usable with reviewer sign-off" while the register holds VAT as `draft`. | `references/uganda-statutory.md` lines 3–4, 14–22 | Independent scan of backticked keys in all markdown outside the kaizen folders against the 29 register ids. No gate checks that cited keys resolve. |
| D5 / Major, escalated | `UG-NSSF-MEMBERSHIP-CONTRIBUTIONS` is `verified-current` but its `verifier` records a page recheck, not a named reviewer, and earlier history attributes it to an automated verification. The schema requires a named reviewer for `verified-current`. The lookup tool returns "final use allowed" for it. Its `effective_from` (2026-05-15) is the verification date, not a legal effective date, so lookups for earlier dates return no entry. | `doctrine/source-register/uganda/nssf.yaml` lines 8, 13; `doctrine/source-register/schema.yaml` `quality_gate_rules` | Lookup output above. The 5% and 10% values themselves match the official NSSF page opened today. Demoting the entry or naming a reviewer is a decision for Peter; see `06-next-cycle.md`. |
| D6 / Minor | Machine-specific absolute paths in active content: three sibling-engine paths in a governance how-to, one research-project path in a skill reference, one in a report template. AGENTS.md carries two more inside portfolio-managed blocks. | `governance/how-to-reference-this-doctrine.md` lines 89, 96, 103; `skills/11-sector-and-fund-accounting/retail-and-pos-accounting-pack/references/source-basis.md` line 18; `docs/validation-report-template.md` line 9; `AGENTS.md` lines 56, 139 | 47 matching lines in 21 tracked files outside the 29 October evidence folder; the rest are dated history or retired integration material. |
| D7 / Info | Portable contract scan: 1 of 108 fully compliant. Two skills fail one check each (`tax-statutory-source-register-and-country-packs`: capability contract; `finance-module-audit`: degraded mode). | scanner output, not a repository file | Needs domain-specific migration, as the September audit said. Not attempted in bulk. |

## Cross-engine boundary

Not re-opened until the end of the cycle; results are in `06-next-cycle.md`.
No other repository was edited.
