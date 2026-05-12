# Integration Plan

How the new doctrine, skills, governance, and the rewritten `finance-module-audit` reach the four consumer engines, and how in-flight work adopts them.

## Mirror layout per engine

| Engine | Path | Doctrine destination | Skills destination |
|---|---|---|---|
| skills-web-dev | `C:\Users\Peter\.claude\skills` | `_doctrine/` | `skills/` (alongside existing skills, including the updated `finance-module-audit`) |
| srs-skills | `C:\wamp64\www\srs-skills` | `doctrine/` | `skills/finance/` |
| proposal-skills | `C:\wamp64\www\proposal-skills` | `doctrine/` | `skills/finance/` |
| business-plan-skills | `C:\wamp64\www\business-plan-skills` | `doctrine/` | `skills/finance/` |

The `finance-module-audit` skill lives inside `skills-web-dev` (at `C:\Users\Peter\.claude\skills\skills\finance-module-audit\`). The mirror also places it in the other engines under `skills/finance/finance-module-audit/` because all four engines need to be able to invoke the audit.

## Adoption order

1. **skills-web-dev** first (the runtime engine; auto-run trigger lives here).
2. **srs-skills** next (the implementation specifications driven by the doctrine).
3. **proposal-skills** (consumes the SRS acceptance criteria).
4. **business-plan-skills** (consumes the country-context + tax + framework decisions).

After mirror, each engine carries:

- `<doctrine-dest>/accounting-finance-doctrine.md`
- `<doctrine-dest>/references/…`
- `<doctrine-dest>/examples/…`
- `<doctrine-dest>/governance/finance-accounting-quality-gate.md`
- `<doctrine-dest>/governance/cleanup-backlog.md`
- `<doctrine-dest>/governance/how-to-reference-this-doctrine.md`
- `<doctrine-dest>/ADOPTION.md`
- `<skills-dest>/<one folder per skill from the new suite>`

## Wiring per engine

After the mirror, the engine's `CLAUDE.md` and `AGENTS.md` receive the **Finance & Accounting Trigger** block from `governance/how-to-reference-this-doctrine.md`. This is a manual edit per engine; the block is paste-verbatim.

Engine-specific reference files to be added directly into each engine (not part of the doctrine mirror):

### skills-web-dev

- `skills/_chwezi-finance-engine-skeletons/php-mysql/` — copy-paste skeletons: posting service, journal table DDL, period state machine, idempotency keys, audit-log table, posting tests.
- `skills/_chwezi-finance-engine-skeletons/reviewer-checklist.md` — PR review checklist that rejects direct `journal_lines` writes.

### srs-skills

- `skills/finance/requirement-id-library/` — reusable requirement IDs for ledger integrity, period close, tax handling, report generation, audit export, migration / opening balances, reconciliation.
- `skills/finance/acceptance-criteria-templates/` — templates aligned to the requirement-ID library.
- Update `09-governance-compliance/` finance reviewer list with Accountant, Controller, CFO / finance lead, Tax reviewer.

### proposal-skills

- `skills/finance/sector-annexes/` — one folder per sector: schools, clinics, NGOs, retail-pos, manufacturing, agribusiness, hospitality. Each contains: financial controls, reports, implementation roles, risks, acceptance evidence.

### business-plan-skills

- `skills/finance/coa-and-classification-sweep.md` — canonical IFRS-for-SMEs-aligned classification for COGS / cost of service, payroll, depreciation, finance costs, working capital, inventory, tax, cash flow.
- A backlog (not yet rewritten) of existing industry guides that need alignment.

## Deprecation notes

| Item | Replacement |
|---|---|
| Any existing LIFO references in srs-skills `inventory-management` and `modular-saas-architecture/module-config-example.php` | Convert to FIFO / weighted average; mark legacy LIFO data as `non-IFRS — do not apply unless explicitly requested`. |
| Hardcoded Uganda VAT / PAYE / NSSF / WHT / EFRIS values in `business-plan-skills/country-context/uganda/SKILL.md` | Convert to source-register-referenced verification-gated values. |
| US-GAAP-only language in any engine | Mark non-IFRS overlay. |
| Vendor-replacement language in proposal-skills | Pair with caveats and acceptance criteria. |
| Free-text status fields in any UI artefact | Replace with controlled status taxonomy. |
| Pre-existing `finance-module-audit/SKILL.md` (description without auto-run threshold) | Replaced by the new SKILL.md with auto-run trigger. |

The cleanup is applied per `governance/cleanup-backlog.md` with the user approving each change before it lands.

## In-flight work migration

For any in-flight branch, PR, draft proposal, draft SRS, or draft business plan that already touches finance:

1. Pull doctrine v1.0.0 into the engine (`mirror.ps1`).
2. Run the finance / accounting quality gate against the artefact.
3. If `fail`, do not merge / release; remediate per the finding register.
4. If `pass-with-caveats`, merge as draft only; do not release operationally.
5. If `pass`, proceed.

## Communication to other tools

- **Claude Code**: this CLAUDE.md trigger block is read at session start; the auto-run on `finance-module-audit` fires when finance scope is detected.
- **Codex**: the AGENTS.md trigger block is the equivalent. Codex must load the skill explicitly if invoked through a system prompt; the trigger documents this.
- **GitHub Copilot**: **caveat — Copilot does not read SKILL.md natively.** When working in a repo that uses these skills, the user should keep the engine's CLAUDE.md / AGENTS.md visible in the editor as a context anchor; for finance-touching files, the user pulls the doctrine reference inline as needed.
- **Any other agent**: same caveat — must explicitly load the doctrine and audit skill.

## Post-mirror verification

After mirror, run from each engine root:

```powershell
Test-Path "$pwd\$doctrine\accounting-finance-doctrine.md"
Test-Path "$pwd\$skills\finance-module-audit\SKILL.md"
Test-Path "$pwd\$doctrine\governance\finance-accounting-quality-gate.md"
Test-Path "$pwd\$doctrine\ADOPTION.md"
```

All four must return `True`.

## Rollback

Mirror is destructive within the destination folders (`robocopy /MIR`). If rollback is needed:

- The previous engine state should be in version control; revert the engine commit.
- The doctrine staging tree remains intact; no automatic rollback is necessary on the master.

## Next iteration

- Verify all live-rate topics in the source register (URA, KRA, NSSF, BoU, …).
- Build out Tier-3 skills (`ifrs-leases` full lessee model, `ifrs-financial-instruments` full IFRS 9, `ias-impairment` full annual-test) as client demand emerges.
- Add Kenya, Rwanda, Tanzania, South Africa country extensions.
- Update the cleanup backlog with concrete line numbers as each engine is swept.

Last reviewed: 2026-05-12. Next review due: 2026-11-12.
