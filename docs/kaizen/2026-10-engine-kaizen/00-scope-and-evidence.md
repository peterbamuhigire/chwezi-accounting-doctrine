# Chwezi Accounting Doctrine — scope and practitioner evidence

**Cycle date:** 2026-10-29
**Branch / starting commit:** `kaizen/2026-10` / `ff33ff14`
**Reporting basis:** IFRS for SMEs third edition, explicitly early-applied for
the synthetic exercise; an entity applying the third edition before annual
periods beginning 2027-01-01 must disclose early application. The IFRS
Foundation identifies 2027-01-01 as the third edition's effective start and
permits earlier application ([official standard page](https://www.ifrs.org/issued-standards/ifrs-for-smes/),
accessed 2026-10-29). This is a training fixture, not a client report or
professional opinion.

## Scope and operating conditions

- Repository: this local `chwezi-accounting-doctrine` checkout only.
- Read first: `README.md`, `AGENTS.md`, `doctrine/accounting-finance-doctrine.md`,
  `doctrine/references/ledger-invariants.md`, the finance release gate, the
  finance Kaizen skill, and the applicable routed skills and references.
- Standard/currentness material: available checkout `chwezi-research-engine`;
  its Portfolio Kaizen Standard, Currentness Gate, `source-evaluation`, and
  `source-verification` were read. The prompt's `digital-research-engine`
  directory was absent. This is an observed path mismatch; no facts from the
  missing checkout are claimed.
- No uncommitted policy files existed at start. The checkout was clean at
  `ff33ff14`; the root agent also retained `/tmp/chwezi-portfolio-kaizen/pre-pull.json`.
- No canonical doctrine file was changed. No third-party model call, live tax
  filing, source contact, production posting, host PowerShell install, public
  submission, push, or PR was performed.
- Full accounting tasks below were manually re-performed from the local router
  and skill guidance as synthetic desktop exercises. They are not client or
  production transaction runs, not independent review, and not Tier 3 model
  evaluations.

## Practitioner task 1 — one month of trading activity

### Request and routes

**Request:** take a small Uganda trading entity through a month with a credit
purchase, a sale with an EFRIS e-invoice, a mobile-money receipt, a sales return,
payroll with PAYE, NSSF and LST, and close; check journals, reversals, and dated
source keys.

**Router selection:** `accounts-payable-and-supplier-management`,
`ifrs-revenue-recognition`, `electronic-fiscal-taxing`,
`bank-and-mobile-money-reconciliation`, `payroll-and-statutory-postings-east-africa`,
`month-end-and-year-end-close-playbook`, `financial-statements-preparation`,
`audit-ready-reporting-pack`, and `audit-pbc-and-evidence-management`.
For the sales return the revenue route also points to the pricing/refunds
workflow. These routes are appropriate for the requested transaction, tax,
subledger, close, statement and PBC outputs.

### Assumptions and source state

All transaction amounts below are **fixture inputs selected for this exercise**;
they describe no real entity. The synthetic entity is VAT-registered and uses
UGX. It early-applies the IFRS for SMEs third edition. The fixture has no
external source documents, taxpayer identity, employee master, actual EFRIS
responses or bank/provider statement.

URA's current VAT page states an 18% standard rate for standard-rated supplies
and says VAT-registered taxpayers are required to issue EFRIS e-invoices
([URA VAT page](https://ura.go.ug/en/value-added-tax-vat/), accessed
2026-10-29). The URA EFRIS page describes credit/debit-note adjustments for
returns and an e-credit note/e-debit note where an invoice is incorrect
([URA EFRIS page](https://ura.go.ug/en/efris/), accessed 2026-10-29). The
URA page also says its FY 2026/27 PAYE schedule applies from 2026-07-01 after
the 2026 amendment ([URA PAYE-change notice](https://ura.go.ug/en/changes-to-paye-return-form-following-the-income-tax-amendment-act-2026/),
accessed 2026-10-29). The NSSF Uganda membership page states an employee
contribution of 5% and employer contribution of 10% of gross monthly wages
([NSSF membership page](https://www.nssfug.org/about-us/membership/), accessed
2026-10-29). These primary-page observations do not substitute for a named
Uganda tax reviewer or a preserved source snapshot. The Uganda VAT and EFRIS
machine-register entries remain `draft`; the PAYE entry remains `draft`; the
NSSF entry is `verified-current` for its stated contribution scope.

The URA LST source trail did not establish a current municipality, period,
calculation base, or applicable schedule. LST is therefore **NOT_ASSESSED** and
must not be computed from remembered or historic bands. This keeps payroll and
close release blocked.

### Reperformed entries

**Fixture events:** purchase 10 units at UGX 100,000 each on credit; sell 8 units
at UGX 250,000 each on credit; customer pays the sale through mobile money;
customer returns 1 unit; the exercise assumes a mobile-money refund for the
return; one employee has UGX 500,000 monthly gross pay and is a resident with no
other employment.

| Journal / status | Account | Debit UGX | Credit UGX |
|---|---|---:|---:|
| Capital fixture | Cash | 1,000,000 | — |
| Capital fixture | Share capital | — | 1,000,000 |
| Purchase, illustrative / source gate open | Inventory | 1,000,000 | — |
| Purchase, illustrative / source gate open | Input VAT | 180,000 | — |
| Purchase, illustrative / source gate open | Accounts payable | — | 1,180,000 |
| Sale, illustrative / source gate open | Accounts receivable | 2,360,000 | — |
| Sale, illustrative / source gate open | Sales | — | 2,000,000 |
| Sale, illustrative / source gate open | Output VAT | — | 360,000 |
| Sale cost recognition | Cost of sales | 800,000 | — |
| Sale cost recognition | Inventory | — | 800,000 |
| Mobile-money receipt | Mobile-money settlement clearing | 2,360,000 | — |
| Mobile-money receipt | Accounts receivable | — | 2,360,000 |
| Sales-return credit note, illustrative | Sales returns | 250,000 | — |
| Sales-return credit note, illustrative | Output VAT | 45,000 | — |
| Sales-return credit note, illustrative | Accounts receivable | — | 295,000 |
| Return-to-stock | Inventory | 100,000 | — |
| Return-to-stock | Cost of sales | — | 100,000 |
| Mobile-money refund, fixture assumption | Accounts receivable | 295,000 | — |
| Mobile-money refund, fixture assumption | Mobile-money settlement clearing | — | 295,000 |
| PAYE, illustrative schedule only | Payroll expense | 500,000 | — |
| PAYE, illustrative schedule only | PAYE payable | — | 38,250 |
| PAYE, illustrative schedule only | Employee NSSF payable | — | 25,000 |
| PAYE, illustrative schedule only | Net wages payable | — | 436,750 |
| Employer NSSF, illustrative schedule only | Employer contribution expense | 50,000 | — |
| Employer NSSF, illustrative schedule only | Employer NSSF payable | — | 50,000 |

The PAYE illustration applies the URA-published resident monthly band for
chargeable income between UGX 485,001 and UGX 10,000,000: UGX 33,750 plus 30%
of the excess over UGX 485,000. On fixture gross/chargeable pay UGX 500,000,
the calculation is UGX 33,750 + 30% × UGX 15,000 = UGX 38,250
([URA PAYE page](https://ura.go.ug/en/domestic-taxes/paye-rates/), accessed
2026-10-29). NSSF employee and employer illustration amounts use the official
page's 5%/10% split on fixture gross pay ([NSSF membership page](https://www.nssfug.org/about-us/membership/),
accessed 2026-10-29). All statutory lines remain illustrative because the
required register and independent review gates have not been closed.

**Balance check:** each listed journal balances. The combined transaction
fixture debits and credits are UGX 8,940,000 on each side. The purchase, sale and credit-note
tax treatments remain draft-only; the scenario's journal arithmetic is not a
final tax position. The real EFRIS acknowledgement/FDN, source invoice, GRN,
credit note, payroll register and provider evidence were not supplied; no FDN,
TIN, employee identity, event reference or provider confirmation was invented.

**Provisional close outputs from fixture inputs only:**

| Trial-balance line | Debit UGX | Credit UGX |
|---|---:|---:|
| Cash | 1,000,000 | — |
| Inventory | 300,000 | — |
| Mobile-money settlement clearing | 2,065,000 | — |
| Accounts payable | — | 1,180,000 |
| Input VAT (asset) less output VAT (liability) presented net for this fixture | — | 135,000 |
| PAYE payable | — | 38,250 |
| NSSF payable (employee plus employer) | — | 75,000 |
| Net wages payable | — | 436,750 |
| Share capital | — | 1,000,000 |
| Net sales (gross line) | — | 2,000,000 |
| Sales returns | 250,000 | — |
| Cost of sales, net of returned goods | 700,000 | — |
| Payroll expense | 500,000 | — |
| Employer contribution expense | 50,000 | — |
| **Total** | **4,865,000** | **4,865,000** |

The trial balance includes unclosed income and expense accounts; the UGX 500,000
profit subtotal is not a second TB line. Fixture profit before income tax is
sales UGX 2,000,000 less returns UGX 250,000, cost of sales UGX 700,000,
payroll UGX 500,000, and employer NSSF UGX 50,000. The fixture SFP cross-foot is
an internal arithmetic check: assets UGX 3,365,000; liabilities UGX 1,865,000;
equity UGX 1,500,000. The retained-earnings roll-forward assumes opening retained
earnings of zero and no distributions. The cash plus mobile-money ledger
balances roll from zero by fixture capital cash of UGX 1,000,000 and net
mobile-money activity of UGX 2,065,000. The mobile-money clearing account is
not treated as a reconciled cash equivalent until provider evidence and the
entity's cash-equivalent assessment exist. The statement of cash flows is
therefore **NOT_ASSESSED**; the provisional SFP/SOCI figures are not release
statements. Income-tax provision and the LST line are not supplied, so the
actual close cannot be certified.

| PBC index key (fixture-only) | Required evidence | Observed status |
|---|---|---|
| `purchase` | Supplier invoice, GRN, supplier account, EFRIS validation if applicable, VAT source key | No source evidence supplied; draft VAT gate |
| `sale` | Sales contract/order, approved sales invoice and EFRIS response, tax mapping, AR entry | No transaction document or EFRIS response supplied |
| `receipt` | Provider statement/export, matching reference, receipt journal, fee detail | No provider statement; clearing not reconciled |
| `return` | Return authorisation, goods-receipt evidence, EFRIS credit note/adjustment response, AR effect | No source evidence or authority response supplied |
| `payroll` | Approved payroll run, employee residency/master data, payslip, PAYE/NSSF source keys, LST evidence | LST NOT_ASSESSED; final payroll blocked |
| `close` | Final TB, GL, AP/AR/inventory control ties, VAT/PAYE/NSSF schedules, review evidence | Fixture cross-foot only; close release blocked |

**Observed outcome:** the router chose the right skill families, and the
guidance correctly prevents final statutory release without source-state and
review evidence. It does not produce a final close because current LST,
invoice/receipt evidence, source-register releases and reviewer sign-off are
missing. This is an appropriately blocked outcome, not a successful client
close.

## Practitioner task 2 — material prior-period posting error after close

**Request:** review an error discovered after close and check whether the engine
uses reversal and re-posting in an open period, prohibits update/delete, and
names the IFRS for SMEs basis.

**Router selection:** `ifrs-accounting-policies-changes-errors-ias8`,
`period-locking-and-data-immutability`, and `ledger-posting-engine-core`;
the route is appropriate. I read the selected skill, its `source-basis.md` and
`implementation-rules.md`, plus the canonical ledger invariants.

**Observed output:** the local rules require a named framework; an immutable
posting trail; reversal/correction journals; a closed-period gate; and reviewer
routing. They prohibit editing/deleting posted history and say locked/archived
periods require an approved open-period adjustment path. The framework is
IFRS for SMEs Section 10, Accounting Policies, Estimates and Errors. The
current third-edition source describes material prior-period error correction
retrospectively in the first statements authorised after discovery, by
restating comparatives or, where relevant, opening balances; impracticability
uses the earliest practicable period ([IFRS Foundation third-edition text,
paragraphs 10.19–10.23](https://www.ifrs.org/content/dam/ifrs/publications/ifrs-for-smes/english/2025/ifrs-for-smes.pdf?bypass=on),
accessed 2026-10-29).

**Gap found:** the router-selected skill has no discrete after-close worked
example that distinguishes financial-statement retrospective restatement from
immutable ledger correction in an open period. The general controls are
present, but the response to this exact practitioner question must be inferred
from several sources. This risks omitting Section 10 comparative disclosure
while still forbidding unsafe prior-period ledger edits. Severity: **major**
for output readiness; no unsafe direction was found in the selected text.

**Expected safe disposition for this synthetic case:** keep the posted original
journal; do not update/delete it; post a linked equal-and-opposite reversal and
correcting entry in the first approved open period (or use the governed reopen
workflow if authorised); retain the error schedule and source trail. Separately
evaluate materiality, retrospective restatement, comparatives/opening equity,
impracticability and Section 10 disclosures. This is a workflow synthesis of
the local immutable-ledger rule and IFRS Foundation Section 10, not a claim
that IFRS prescribes a specific Chwezi posting service operation.

## Practitioner task 3 — trial balance, statements and PBC evidence index

**Request:** assemble a trial balance, financial statements and PBC index from
the trading scenario; check statement cross-footing, cash and retained earnings
roll-forward, and subledger/control-account reconciliation.

**Router selection:** `financial-statements-preparation`,
`audit-ready-reporting-pack`, `month-end-and-year-end-close-playbook`, and
`audit-pbc-and-evidence-management`; appropriate. The selected guidance requires
statement-to-ledger traceability, financial-statement cross-footing, source
evidence and controller sign-off.

**Observed result:** the fixture trial balance above balances and its simplified
SFP figures cross-foot. AR rolls to nil only if the assumed receipt and refund
are completed. AP remains UGX 1,180,000. Inventory carries UGX 300,000. The
mobile-money control balance is UGX 2,065,000 but cannot be reconciled to a
provider statement. VAT's computed net liability of UGX 135,000 is illustrative
only and the actual eligibility/source matching is unverified. PAYE and NSSF
are illustrative; LST is unresolved. The PBC list is a useful index skeleton,
but it cannot point to source artefacts that were not supplied.

**Observed gaps:** no actual statement, subledger export, source documents,
historical/opening account balances, statement notes, income-tax provision,
reviewer names/signatures, approved EFRIS evidence or provider reports were
provided. The product cannot claim a final trial balance or PBC pack from the
synthetic values. Consequently cash-flow classification, tax/control-account
tie-out, statement print fidelity and professional acceptance are
**NOT_ASSESSED**. The report correctly stops release rather than inventing
evidence.

## Defect register (before changes)

| ID / severity | Defect or gap | Exact file and line(s) | Evidence / effect |
|---|---|---|---|
| A1 / Major | The Section 10 skill lacks a focused after-close error example that couples immutable reversal/re-posting with financial-statement retrospective-restatement requirements. | `skills/03-ifrs-specialised-standards/ifrs-accounting-policies-changes-errors-ias8/SKILL.md` lines 57–81; `references/implementation-rules.md` lines 1–64 | Practitioner task 2 required synthesising the framework and ledger control; a scenario-specific worked example/fixture would make both layers explicit. |
| A2 / Minor, recurrence | One shared reference-contract row contained control bytes corrupting the initial letters of `framework`, `functional_currency`, `account_code`, and `amount`. The same row occurred in 74 skill reference files. | `skills/**/references/implementation-rules.md`, data-contract row (line 30 in the Section 10 reference) | Raw-byte inspection found four C0 bytes per row, one identical row per affected file. Baseline strict mojibake gate passed because it checked mojibake signatures but not C0 controls. All 74 rows are repaired and the new scan reports zero. |
| A3 / Major blocker | Uganda LST/current source state prevents a final payroll close; final WHT/Tax/return mapping also requires review. | `doctrine/source-register/uganda/lst.yaml` lines 1–27; `paye.yaml` lines 20–39; `wht.yaml` lines 1–19; `vat.yaml` lines 1–26; `efris.yaml` lines 1–17 | LST base/schedule remains NOT_ASSESSED; other values are draft or overdue. This is a source/reviewer gap, not permission to invent rates or promote values. |
| A4 / Major, environment | The plugin lacks the Codex-compatible marketplace entry and the Claude manifest omits plugin-level description and author fields. | `.claude-plugin/plugin.json`; `.claude-plugin/marketplace.json`; no Codex compatibility or repo-local catalog manifest existed at baseline | The recorded baseline Claude CLI passed with warnings for missing description/author in plugin and marketplace metadata. No Codex compatibility manifest or `.agents/plugins/marketplace.json` existed. Current local structure has since been added; public/OpenAI acceptance is NOT_ASSESSED. |
| A5 / Open, cross-engine | Three sampled consumers point to the finance engine, but two retain device-specific paths and Business Plan retains copied tax-rate instructions. | Consumer files listed in `06-next-cycle.md`; this repository `doctrine/accounting-finance-doctrine.md` lines 5, 164–172 | Root-resolved aliases for Dev Engine and SDLC were inspected read-only; Business Plan was also inspected. No other engine is edited. |

### Post-baseline QA finding

During review of the retained practitioner output, I found and corrected an
internal double-count in the draft trial balance: profit was shown both as a
separate equity line and through the unclosed revenue/expense accounts. The
combined source journal total was also understated by that presentation error.
The final trial balance excludes a separate profit line; its debits and credits
cross-foot at UGX 4,865,000. The combined transaction journals cross-foot at
UGX 8,940,000. This was an authoring error in the first scenario write-up, not
an observed engine instruction. It was corrected before the score re-measure.

Other evidence gaps are recorded in `01-baseline-scorecard.md` and
`04-validation-record.md`; they are not scored as defects that this cycle can
close without reviewer, platform, or source authority.
