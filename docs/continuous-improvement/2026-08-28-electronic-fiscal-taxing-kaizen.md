# Kaizen Wave — Electronic Fiscal Taxing Doctrine

**Date:** 2026-08-28
**Engine:** Chwezi Accounting Doctrine
**Baseline:** 61/100 capped portfolio baseline; electronic-fiscal-taxing
coverage was fragmented between a generic legacy skill and unresolved EFRIS
source gaps.
**Target:** 95/100; the portfolio reporting cap remains `min(raw, 65)`.

## Observe

The legacy e-invoicing skill covered broad concepts but did not give a reusable
jurisdiction-neutral fiscal-tax model, a detailed Uganda source register, a
tenant/profile boundary, or a complete offline/evidence/reconciliation contract.
The BIRDC ERP had a generic queue and fake client, but no production EFRIS
contract.

## Baseline evidence

- Existing legacy skill: `skills/08-tax-and-statutory/e-invoicing-and-fiscal-device-integration/`.
- Existing BIRDC gaps: `docs/plans/efris-aug-26/01-system-baseline.md`.
- Supplied source corpus: eight named EFRIS Markdown books, kept outside the
  engine and independently synthesized.
- Currentness gap: authenticated URA S2S contract, credentials, UAT, and exact
  offline rules remain blocked until client onboarding evidence exists.

## Select and experiment

**Hypothesis:** a canonical general skill plus a focused Uganda reference tree
will reduce repeated rediscovery and prevent stale protocol details from being
mistaken for accounting authority, provided every live claim remains source-
register gated.

**Change:** add `electronic-fiscal-taxing`, add the Uganda references and worked
example, and convert the legacy skill into a compatibility route.

**Owner/review:** doctrine owner with tax reviewer and integration reviewer;
re-audit after the URA technical pack is promoted.

**Rollback:** restore the legacy skill body and remove the new route/references;
do not remove existing source-register history or client evidence.

## Check and standardise

Run doctrine validation, accounting invariants, source-state checks, skill
quick validation, and independent human review. Standardise only the references
that remain independently worded, source-traceable, and useful after the
supplied books are removed.

## Teach and re-measure

The accounting router map and compatibility route point new work to the general
skill. Re-measure source currency, skill depth, applied proof, and reconciliation
readiness when BIRDC completes URA onboarding. Remaining blockers stay visible.
