# Core Rules — Accounting Doctrine Engine

> Distilled from this engine's own `AGENTS.md`.

## Never invent a rate, threshold, source, reviewer, organisation, URL, quote, or test result

Missing evidence is marked as a gap, not filled with a plausible-sounding
value. This is the accounting-specific form of the same rule the digital
research engine and this engine's own AI-agent governance skills state
independently — evidence, not inference, is the currency here.

## A source-register entry is not promoted to "current" without verified evidence and the required reviewer

Draft status stays draft until both conditions are met. Promotion is a
deliberate, recorded action, not a default that happens when nobody objects.

## Build finance work in bounded, reconciled slices — never as an opaque batch

Frame the reporting or control decision, select one transaction flow or
statement area, inspect the applicable doctrine and source state, make the
smallest reversible change, exercise the normal / exception / reversal /
approval paths, reconcile the result, refine, then record evidence. A complete
ledger, model, or finance module produced as one undifferentiated batch has
skipped every checkpoint that would have caught an error early.

## Missing source, reviewer, reconciliation, control, or audit-trail evidence is `NOT ASSESSED`, never a pass

The same discipline as `windows-admin-engine-skills`: an unverifiable claim is
marked as unverifiable, not defaulted to success.

## Posted accounting history is never edited or deleted; corrections use a linked reversal or correction posting

Grounded in `doctrine/accounting-finance-doctrine.md` §5 ("Immutability") and
`doctrine/references/ledger-invariants.md` §3, and restated as forbidden
pattern #3 in `doctrine/references/forbidden-patterns.md`. This is the one
ledger invariant that is checkable in a single sentence and holds regardless
of jurisdiction, reporting framework, or transaction type — it governs how a
mistake is corrected, not what the correct accounting treatment is. Promoted
here because it is currently stated only inside longer doctrine prose and the
quality-gate blocker list, not in the always-on rules layer a consumer engine
reads first.
