---
name: internal-controls-library
description: Library of internal controls embedded in finance / accounting workflows. Segregation of duties, maker-checker, approval thresholds, supplier and payroll master-data controls, petty cash and cash drawer controls, inventory master-data controls, tax / rate table controls, audit-log review, exception monitoring, fraud / error indicators. Use whenever designing or reviewing access control, approval, audit trail, fraud detection, or internal-control attestation in a finance / accounting context.
---

# Internal Controls Library

## Overview

Internal controls are embedded in workflows, not written only as policy text. Each control has: trigger, owner, mechanism, evidence, review cadence, exception handling, and audit-log linkage.

## Required first reads

- `doctrine/accounting-finance-doctrine.md`
- `doctrine/references/ledger-invariants.md`
- `doctrine/references/role-conditioned-shell.md`
- `doctrine/references/required-patterns.md`
- `doctrine/references/forbidden-patterns.md`

## Core controls

### Segregation of duties (SoD)

Maker, checker, approver, accountant, controller, auditor, administrator. Same person cannot end-to-end:

- Create a supplier and approve a payment to that supplier.
- Post a journal and approve it.
- Modify payroll master and approve a payroll run.
- Reopen a locked period and post into it.
- Edit a tax rate and produce a tax return that uses it.

The role registry enforces the conflicts.

### Maker-checker

Applies to: payments, refunds, credit notes, manual journals, opening balances, tax settings, supplier master changes, payroll master changes, period reopen, allocation rules.

Maker creates → status `awaiting-approval` → checker reviews → status `approved` → posting service commits → status `posted`.

### Approval thresholds

Configured per entity, per action, per role. E.g.:

- Cashier refund ≤ UGX 50,000 self-approved.
- Manager refund ≤ UGX 500,000 manager-approved.
- Accountant refund ≤ UGX 5,000,000 accountant + controller.
- Above threshold: controller + CFO.

Thresholds carry verification-current state (rates change; verify at adoption).

### Supplier master-data controls

- Adding a supplier requires Accountant + Controller approval.
- Changing supplier bank or mobile-money details requires re-approval and a confirmation by independent contact.
- Master-data change history retained.
- Duplicate detection on add (name / TIN / bank account).

### Payroll master-data controls

- New employee setup: HR + Payroll + Accountant.
- Salary change: HR + Payroll + Accountant; reviewed by Controller monthly.
- Recipient (bank / mobile-money) change: confirmation by employee plus HR.
- Termination: HR + Payroll; final-pay reviewed.

### Petty cash controls

- Imprest amount fixed per location.
- Reconciliation cadence: weekly minimum.
- Replenishment via approved expense report.
- Cash count by independent role periodically.

### Cash drawer controls

- Cash drawer opened by cashier (recorded).
- Close drawer: counted vs computed; variance flagged.
- Variance > threshold escalates to manager.
- Drawer cannot be closed silently with variance.

### Inventory master-data controls

- New SKU / item: Inventory Manager + Accountant.
- UOM change: Inventory Manager + Accountant + Controller (because of historic cost effect).
- Valuation method per item-class fixed by entity policy.
- Obsolescence / write-off: Inventory Manager + Accountant.
- Standard cost change: Inventory Manager + Controller; effective dated; legacy unaffected.

### Tax / rate table controls

- Tax rate add or change: Tax Reviewer + Controller.
- Source-register entry required.
- Effective period must be specified.
- Recheck date set per `live-rate-verification-protocol.md`.

### Audit-log review

- Daily review by Controller of high-risk actions (refunds above threshold, reversals, period reopens, master-data changes).
- Monthly review by Internal Audit of full audit-log sample.
- Exceptions raised within 24 hours of detection.

### Exception monitoring

Continuous monitoring of:

- Duplicate suppliers (matching TIN, bank, mobile, name).
- Round-sum payments above threshold.
- Unexplained variances above threshold.
- Unmatched deposits ageing.
- Stale clearing items ageing.
- Backdated postings into open periods.
- Repeated reversals by the same actor.
- Period reopens.
- Supplier bank-detail changes followed by payment within 24 hours.
- Payroll changes followed by salary uplift within 24 hours.
- Tax-rate changes by non-Tax-Reviewer roles.

### Fraud / error indicator dashboards

- Indicator list above, each with threshold and owner.
- Weekly review at branch level by manager.
- Monthly review at entity level by Controller.
- Quarterly review at group level by CFO / Internal Audit.

## Control evidence

Each control has:

- Trigger description.
- Owner role.
- Mechanism (configuration, code path, scheduled review).
- Evidence type (audit log, report, sign-off).
- Cadence.
- Exception handling.

A control register is part of the management pack at year-end.

## Role-of-the-administrator boundary

The Administrator role can:

- Create users.
- Assign roles.
- Configure environments.
- Manage integrations.

The Administrator cannot:

- Approve a payment.
- Approve a journal reversal.
- Reopen a period.
- Edit a tax rate.
- Approve master-data changes.

Where an administrator action affects accounting (role assignment giving accounting power, environment promotion), Controller approval is required and the audit log records both signatures.

## Forbidden patterns

- Single user with all roles (blocker).
- Administrator with implicit accounting approval (blocker).
- Master-data changes without history (blocker).
- Audit-log review skipped for more than 7 consecutive days (major).
- Manual journals without maker-checker on amounts > 0 (blocker).
- Period reopen without dual approval (blocker).

## Acceptance evidence

- Control register with cadence and evidence.
- Configuration screenshots / exports.
- Audit-log sample review.
- Exception-monitoring dashboard.
- Sign-off log of monthly and quarterly reviews.

## Files

- `SKILL.md`.
- `references/sod-conflict-matrix.md`.
- `references/exception-indicators.md`.
- `examples/payment-approval-flow.md`.

Last reviewed: 2026-05-12. Next review due: 2026-11-12.

## Prerequisites

- Load `doctrine/accounting-finance-doctrine.md` before applying this skill.
- Load `governance/finance-accounting-quality-gate.md` when the output is a release, client artefact, SRS, SDS, proposal, business plan, or implementation plan.
- Use `doctrine/source-register/` for final statutory, tax, payroll, FX, EFRIS, eTIMS, or authority-template values.

## Inputs

| Artifact | Produced by | Required? | Validation |
|---|---|---|---|
| Finance context map | `finance-module-audit` | Required | Entity, framework, jurisdiction, modules, users, and deployment context are named. |
| Doctrine baseline | Doctrine owner | Required | Doctrine version and reporting framework are stated. |
| Source-register snapshot | `tax-statutory-source-register-and-country-packs` | Required for final statutory output | Entries are `verified-current` or reviewer-approved `verified-with-caveat`. |
| Ledger/posting context | `ledger-posting-engine-core` | Required when postings are affected | Posting boundary, CoA mappings, control accounts, dimensions, and period state are known. |

## Outputs

| Artifact | Consumed by | Acceptance evidence |
|---|---|---|
| Skill-specific decision record | Implementer, reviewer, quality gate | Scope, assumptions, chosen treatment, rejected alternatives, and caveats are recorded. |
| Implementation or workflow contract | Software, SRS, SDS, proposal, or business-plan engine | Contract names inputs, outputs, controls, evidence, and failure conditions. |
| Acceptance evidence | Finance quality gate | Tests, fixtures, examples, source links, reviewer sign-off, or evidence-pack references are present. |
| Plain-language explanation | Client, owner, manager, operator | Business meaning is stated before technical accounting treatment where client-facing. |

## Decision Rules

- Prefer IFRS for SMEs for typical SME entities unless full IFRS, local law, donor requirements, or client policy requires otherwise.
- Treat every money-touching workflow as ledger, control, reconciliation, evidence, and reporting scope.
- Do not finalize statutory values without source-register support and reviewer status.
- Use business-language output for operators and accountant-language output for ledger, reporting, and audit users.
- Escalate uncertain framework, tax, or statutory interpretations to the required reviewer role instead of presenting them as final.

## Acceptance Evidence

- Inputs and outputs above are present or explicitly marked not applicable.
- Relevant quality-gate blockers have been checked and no blocker remains unresolved.
- Examples or fixtures cover at least one happy path and one failure or caveat path for this skill's domain.
- Reviewer role, review date, and open caveats are recorded for release-grade artefacts.

## Anti-Patterns

- Treating draft planning assumptions as final statutory or accounting facts.
- Hiding tax, payroll, FX, or authority-template caveats in prose instead of source-register state.
- Producing technically correct accounting output without a plain-language layer for non-accountant users.
- Closing a remediation or implementation item without observable evidence.

## Required References

- `doctrine/accounting-finance-doctrine.md`.
- `governance/finance-accounting-quality-gate.md`.
- `docs/reference-manifest.md` for declared reference states.
- Domain-specific references listed earlier in this skill.

## Examples

- Include at least one normal workflow example for this skill's domain.
- Include at least one exception, rejection, reversal, stale-source, or reviewer-caveat example where the domain can fail.

## Review Metadata

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
