# Versioning and Changelog

## Semver

The doctrine, each skill, and the integration plan are versioned with semver:

- **MAJOR** — breaking changes to required patterns, forbidden patterns, controlled terminology, or the quality-gate contract.
- **MINOR** — additive doctrine (new reference file, new skill, additional country extension, new optional pattern).
- **PATCH** — clarifications, corrections, typo fixes, non-substantive expansion.

## File-level versioning

Every doctrine reference, every skill `SKILL.md`, and every example carries:

- Implicit version inherited from the master doctrine at `accounting-finance-doctrine.md` (front-matter `version`).
- An explicit `Last reviewed:` date and `Next review due:` date at the foot of the file.

## Changelog

Maintained at `../../integration/changelog-entries.md`. Every change records:

- Version
- Date
- Author
- Files changed
- Summary
- Affected consumer engines
- Migration notes (if any)
- Deprecation (if any)

## Deprecation policy

Deprecated patterns, terms, or files are listed in `../../integration/deprecation-list.md`. Each entry records:

- Deprecated item
- Reason
- Replacement
- Date deprecated
- Date for removal

Deprecation lasts at least one MINOR version cycle before removal. A MAJOR removal is announced one cycle in advance.

## Adoption

Each consumer engine records its adopted doctrine version in `<engine>/doctrine/ADOPTION.md`:

- Engine name
- Doctrine version adopted
- Adoption date
- Owner
- Reviewer
- Affected engine files
- Unresolved gaps

## Canonical-reference adoption

The mirror model is retired. Consumers resolve this engine through the global routing table and read the canonical files in place. On a version change, inspect affected contracts, update the consumer's adoption record and run its gates. Do not run historical mirror tooling or copy doctrine files unless the user explicitly requests a separate migration.

## Review cadence

Doctrine and skills are reviewed every six months at minimum. The `Next review due:` line is updated at each review even if no substantive change is made.

Last reviewed: 2026-05-12. Next review due: 2026-11-12.
