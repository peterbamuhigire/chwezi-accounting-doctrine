# How to Reference This Doctrine

Each consumer engine references the doctrine in a slightly different way. This file gives the exact pattern.

## Common Pattern Across All Four Engines

After the mirror, every engine has:

```text
<engine-root>/
|-- doctrine/                                  # mirrored from this repository
|   |-- accounting-finance-doctrine.md
|   |-- references/...
|   |-- examples/...
|   |-- ADOPTION.md                            # records adopted version
|   `-- governance/
|       |-- finance-accounting-quality-gate.md
|       |-- cleanup-backlog.md
|       `-- how-to-reference-this-doctrine.md
|-- skills/                                    # mirrored finance skills
|   `-- ...                                    # see skill list
`-- existing engine content
```

Every consumer engine adds a "Finance & Accounting trigger" block to its `CLAUDE.md` and `AGENTS.md`.

## `CLAUDE.md` Block

```markdown
## Finance & Accounting Trigger

Load `doctrine/accounting-finance-doctrine.md` whenever the user's request, the artefact being generated, or the code being edited touches any of:

- Money flows: sales, purchases, payments, refunds, credit notes, expenses
- Stock and inventory
- Payroll
- Tax: VAT, PAYE, WHT, NSSF, income tax, customs, excise, EFRIS, eTIMS
- Grants, donations, donor restrictions
- Banking, mobile money, POS, card settlement, cash drawer
- Fixed assets
- Financial reports, management accounts, statutory returns
- Chart of Accounts, journals, ledger, posting services, period state, audit trail
- Reconciliation, close, migration, opening balances
- Internal controls, audit, evidence packs
- Any IFRS or IFRS for SMEs section

When the trigger fires:

1. Read `doctrine/accounting-finance-doctrine.md`.
2. Read the relevant doctrine reference file under `doctrine/references/`.
3. Read the relevant skill `SKILL.md` under `skills/`.
4. Apply the finance and accounting quality gate from `doctrine/governance/finance-accounting-quality-gate.md` to the generated artefact.
5. Record the gate run in the artefact manifest.

The `finance-module-audit` skill is the standard implementation harness for analysing any software system that has a finance or accounting element. It auto-runs whenever such a system is the subject of an analysis request. See `skills/06-close-consolidation-and-reporting/finance-module-audit/SKILL.md`.
```

## `AGENTS.md` Block

```markdown
## Finance & Accounting Trigger

Identical trigger conditions to the CLAUDE.md block above. Codex and other agents that do not natively read SKILL.md files must explicitly load the doctrine and relevant reference files into their context before generating finance-touching output.

For Codex specifically: include this block in any system prompt that operates inside this engine. Where the engine has a skill-loader script, run it with the relevant skill key before generation; otherwise read the SKILL.md and references inline.
```

## Per-Engine Specifics

### `skills-web-dev` At `C:\Users\Peter\.claude\skills`

- Doctrine mirrored to `skills/_doctrine/`.
- Finance skills mirrored to `skills/`.
- Existing finance skills are updated to reference the doctrine at the mirrored path.

### `srs-skills` At `C:\wamp64\www\srs-skills`

- Doctrine mirrored to `doctrine/`.
- Finance skills mirrored to `skills/finance/`.
- Every SRS, SDS, and test-plan template adds the finance and accounting trigger block to its preamble.
- Accountant, controller, CFO, and tax reviewer roles are added to required review lists.

### `proposal-skills` At `C:\wamp64\www\proposal-skills`

- Doctrine mirrored to `doctrine/`.
- Finance skills mirrored to `skills/finance/`.
- Sector annexes reference the doctrine and the relevant IFRS or IFRS for SMEs section.
- Vendor-replacement language is paired with the standard caveat block.

### `business-plan-skills` At `C:\wamp64\www\business-plan-skills`

- Doctrine mirrored to `doctrine/`.
- Finance skills mirrored to `skills/finance/`.
- Country-context files reference the doctrine and the live-rate verification protocol.
- Financial-projection templates add a framework header and consume the CoA statement-group taxonomy.

## Adoption Check

When an engine adopts a new doctrine version:

1. Run `integration/mirror.ps1 -DryRun`.
2. Run `integration/mirror.ps1` only after validation has no blockers.
3. Update `doctrine/ADOPTION.md` with the new version, adoption date, owner, reviewer, and affected engine files.
4. Run the engine's local quality-gate self-test where available.
5. Commit with the conventional message `doctrine: adopt v<semver>`.

Last reviewed: 2026-05-15. Next review due: 2026-11-15.

