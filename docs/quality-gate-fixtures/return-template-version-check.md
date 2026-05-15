# Return Template Version Check

Quality gate blocker covered: `B-033`.

## Fixture: Unverified Return Template

Fail input:

```yaml
return-pack: uganda-vat
template-version: "URA VAT return fields"
source-register-entry: null
verified-current: false
```

Expected finding: `B-033`.

## Fixture: Verified Return Template

Pass input:

```yaml
return-pack: uganda-vat
template-version: "URA VAT return template reviewed 2026-05-15"
source-register-entry: "UG-VAT-RETURN-PACK-SOURCE"
source-register-state: verified-current
source-register-recheck-due: "2026-08-15"
reviewer: "Tax reviewer"
```

Expected result: no `B-033` finding only when the source-register entry is verified-current or reviewer-approved verified-with-caveat and still within recheck date.

Review check: template field names, filing period, source authority, reviewer, and archive evidence must be recorded before any return pack is labelled ready for filing.

Last reviewed: 2026-05-15. Next review due: 2026-11-15.
