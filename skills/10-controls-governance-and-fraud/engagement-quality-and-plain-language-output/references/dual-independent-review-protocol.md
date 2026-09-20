# Dual Independent Review Protocol

Source: adapted from the `santa-method` skill (`skills/santa-method/SKILL.md`,
metadata origin: Ronald Skelton — Founder, RapportScore.ai) in the
`Engineering Context Compiler` (ECC) repository. Imported because the
underlying failure mode is the same one accounting review chains exist to
control: a single reviewer shares the preparer's blind spots, framing, and
systematic errors. ECC's contribution is the *independence and convergence
mechanics* — this file adapts those mechanics to accounting review; it does
not import any ECC accounting content (ECC has none).

## Relationship to the standard reviewer matrix

`references/reviewer-matrix.md` defines a **sequential chain**: preparer →
technical/tax reviewer → Controller → final approver. That chain is
sufficient for most outputs and stays the default.

This protocol defines a **stricter, parallel** review for the narrow tier of
outputs where a single reviewer's blind spot is an unacceptable risk. It does
not replace the reviewer matrix; it adds a second, independent reviewer at
the same stage for that tier, and gates release on both reviewers passing.

## When this protocol is required

Use dual independent review, in addition to (not instead of) the standard
reviewer matrix, when the output is:

- A financial statement or disclosure note going to a client, lender, donor,
  regulator, or board, in `final` or `approved-with-caveats` status.
- A statutory filing (tax return, regulatory return, audit export).
- A figure or schedule that will be relied on for a credit, investment, or
  compliance decision by a party outside the preparing team.

Do not use it for internal drafts, working papers, or `review-ready` status
output still inside the preparing team — the standard reviewer-matrix chain
covers those. This mirrors the "when to activate" boundary in the source
skill: publication/consumption-facing output with compliance stakes, not
internal exploratory work.

## Core contract

1. **Two independent reviewers.** Both hold a role authorised in
   `references/reviewer-matrix.md` for the output type (e.g. Controller +
   Tax Reviewer for a VAT-bearing statement; Technical Reviewer + Controller
   for a consolidation note). Neither may be the preparer.
2. **No shared context.** Reviewer B and Reviewer C each receive the same
   draft output and the same rubric (below), independently. Neither sees the
   other's findings before returning a verdict. If both reviewers are human,
   this means literally not discussing the draft with each other until both
   verdicts are recorded; if either reviewer is an AI agent, it means
   separate agent invocations with no shared conversation state.
3. **Same rubric, structured verdict.** Each reviewer returns, per criterion
   below: `PASS` or `FAIL` with the specific issue cited. Prose-only review
   is not acceptable evidence for this protocol — record the structured
   verdict in the sign-off record (see template below).
4. **Both must PASS.** If either reviewer returns `FAIL` on any criterion,
   the release state is `fail` per `governance/finance-accounting-quality-gate.md`,
   not `pass-with-caveats`. An issue caught by only one reviewer is still a
   real issue — that is the entire justification for a second reviewer.
5. **Fix and re-review, fresh reviewers per round.** Fix only the flagged
   issues. Re-run both reviewers on the corrected output. Reviewers must not
   carry memory of the prior round's findings into the next round's verdict
   (anchoring bias) — a rejected draft goes back to both reviewers as if for
   the first time, alongside the change log of what was fixed.
6. **Maximum three rounds, then escalate.** If the output has not converged
   to two `PASS` verdicts after three rounds, escalate to a named senior
   reviewer (Controller or CFO) for a decision outside this protocol. Do not
   loop indefinitely.

## Rubric

### General criteria (every dual-review output)

| Criterion | Pass condition | Failure signal |
|---|---|---|
| Framework and basis stated | `Framework:` header present and matches the entity's adopted basis | Missing or mismatched framework header |
| Figures trace to source | Every reported figure traces to a ledger balance, reconciliation, or source-register entry | Figure with no traceable source or stale source-register entry |
| Internal consistency | No contradiction between statement, note, and management commentary | Note says one figure, statement shows another |
| No invented values | No rate, threshold, source, or reviewer name that cannot be traced to a real record | Any value that reads as plausible but is unverifiable — see this engine's "never invent" rule in `rules/common/core.md` |
| Caveats present and correctly worded | Every caveat names the affected figure, the limitation, permitted use, owner, and due date, per `references/quality-and-ethics-gates.md` | Caveat missing one of those fields, or a material caveat omitted |

### Compliance-sensitive extension (client-facing figures and disclosures)

Adapted directly from `santa-method`'s "Compliance-Sensitive (regulated,
legal, financial)" rubric extension:

| Criterion | Pass condition | Failure signal |
|---|---|---|
| No outcome guarantees | No language implying a guaranteed tax, audit, or financial outcome | "This will pass audit" / "guaranteed refund" style language |
| No unsubstantiated claims | Every claim about performance, compliance, or position is evidenced | Claim with no evidence pointer |
| Required disclaimers present | Non-assurance status, professional-review requirement, and framework limitations stated where applicable | Disclaimer silently dropped from a client version of a report |
| Approved terminology only | No informal or invented terms for statutory concepts (e.g. do not rename "output VAT control" or improvise a term for a standard's concept) | Ad hoc renaming of a controlled term |
| Jurisdiction-appropriate language | Statutory references match the entity's actual jurisdiction and current source-register snapshot | Reference to a rate, form, or authority from the wrong jurisdiction or a stale snapshot |

## Sign-off record

Extend the standard sign-off template (`examples/sign-off-template.md`) with
two independent verdicts instead of one reviewer decision:

```yaml
output_id: MAY-2026-CLIENT-FINANCIAL-STATEMENTS
entity: Example Entity
period: 2026-05
status: review-ready
version: 1
preparer:
  name: "<name>"
  role: Accountant
  signed_at: "<timestamp>"
dual_independent_review:
  round: 1
  reviewer_b:
    name: "<name>"
    role: Controller
    verdict: PASS | FAIL
    checks: [{criterion: "...", result: "PASS|FAIL", detail: "..."}]
    signed_at: "<timestamp>"
  reviewer_c:
    name: "<name>"
    role: Tax Reviewer
    verdict: PASS | FAIL
    checks: [{criterion: "...", result: "PASS|FAIL", detail: "..."}]
    signed_at: "<timestamp>"
  gate_result: pass | fail        # pass only if both verdicts are PASS
tax_source_register_state: "verified-current snapshot reference"
caveats:
  - "..."
```

A gate run with only one reviewer's verdict recorded is `NOT ASSESSED` for
the dual-review requirement, not a pass — the same discipline as this
engine's general missing-evidence rule.

## What this protocol does not change

- It does not replace the source-register verification requirement (still
  route current/uncertain statutory values through the source register).
- It does not authorise a `pass` state with an unresolved blocker from
  `governance/finance-accounting-quality-gate.md` — the dual-review gate is
  additive to, not a substitute for, the B-series blockers.
- It does not apply a "batch sampling" shortcut (ECC's Pattern C) to
  individual statutory filings or board-level disclosures — sampling is only
  appropriate for large batches of low-individual-stakes items (e.g. a bulk
  set of routine reconciliation notes), never for the single set of figures
  a client, lender, or regulator will rely on.
