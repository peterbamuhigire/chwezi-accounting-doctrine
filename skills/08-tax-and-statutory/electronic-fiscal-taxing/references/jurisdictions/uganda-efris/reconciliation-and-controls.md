# Uganda EFRIS Reconciliation and Controls

## Daily control

For each active tenant/client and branch, produce a triage view containing:

1. source invoices and correction documents;
2. queue/submission attempts and current state;
3. accepted FDN, verification code, QR and response evidence;
4. net, tax, gross, currency and payment totals;
5. GL revenue, output-tax, AR/cash and stock/COGS references;
6. provider report/Z-report population where available;
7. exceptions by age, severity, owner, next action and reviewer.

## Exception classes

| Exception | First action | Do not do |
|---|---|---|
| Missing response | Reconcile original key/exchange ID | Create a second key blindly |
| Provider rejection | Preserve code, correct source data, resubmit under approved rule | Edit accepted history |
| Amount mismatch | Compare line/tax decomposition and currency conversion | Force totals to match by journal plug |
| FDN missing after acceptance | Investigate atomic persistence and provider query | Print as fiscal without evidence |
| Duplicate response | Keep one authoritative result, link duplicates | Count duplicate as new sale |
| Ageing offline/manual item | Escalate against verified deadline | Hide it from close |

## Evidence and sign-off

The close pack must include source-register snapshot, population query, exception
register, ageing, reconciliation result, reviewer name/role/date, and any
approved adjustments. A clean result means the population was tested; it does
not mean missing provider evidence was ignored.
