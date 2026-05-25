# Example - Trial Balance Ledger Surface

Desktop, compact density, light theme, role = Accountant.

## Screen contract

Purpose: review the trial balance for May 2026, drill into account movements, export the report, and support close sign-off.

## Layout

```text
Top bar: EntityBookSwitcher | PeriodChip | RoleSwitcher | EnvironmentBanner
Toolbar: period selector | book selector | search | filters | export PDF | export CSV
Grid: account code | account name | opening | debit movement | credit movement | closing | status
Footer: debit total | credit total | imbalance indicator | reviewer state
```

## Grid fields

| Column | Component | Rule |
|---|---|---|
| Account | Text + drilldown | Opens account ledger. |
| Opening | MoneyCell | Drilldown to prior period closing. |
| Debit movement | MoneyCell | Drilldown to filtered GL detail. |
| Credit movement | MoneyCell | Drilldown to filtered GL detail. |
| Closing | MoneyCell | Drilldown to account balance report. |
| Status | StatusChip | Uses controlled taxonomy only. |

## Behaviour

- Money uses tabular numerals and right alignment.
- Closing balance on every row is drillable.
- Totals row is sticky and visible while scrolling.
- Filter state is reflected in the URL.
- Exported PDF includes print header, footer, page numbers, and sign-off boxes.
- Exported CSV includes account code, account name, period, currency, and all money columns as decimals.

## States

| State | UI response |
|---|---|
| Balanced | Footer shows `balanced` with neutral status. |
| Imbalanced | Footer shows the variance, blocks release, and links to exception report. |
| Period locked | Grid is read-only; adjustment buttons are hidden. |
| Source drilldown missing | Row status becomes `exception`; release is blocked. |

## Acceptance checks

- There is no summary amount without a drilldown.
- No status relies on colour alone.
- Print stylesheet is present.
- Accountant can reach journal line and source document within the drilldown path.
- Reviewer sign-off is recorded before release.

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
