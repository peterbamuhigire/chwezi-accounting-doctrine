# Consolidation Domain Acceptance Tests

| Test | Expected result |
|---|---|
| Two-entity intercompany sale | Reciprocal balances match and are eligible for elimination. |
| Elimination journal | Revenue, expense, AR, and AP are eliminated at group level only. |
| Unmatched balance | Exception report names entity pair, amount, age, owner, and reason. |
| Unsigned local TB | Final consolidation is blocked or marked draft. |
| Group TB pack | Local TBs plus adjustments and eliminations equal group TB. |
| FX source gate | Reporting-currency translation blocks when rate evidence is missing or stale. |
| Reversal of elimination | Original run remains immutable; reversal or rerun is linked. |
| NCI caveat | NCI in scope requires specialist review or explicit caveat. |
