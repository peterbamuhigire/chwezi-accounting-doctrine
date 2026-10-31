"""Read-only integrity check for the statutory source register.

Runs on any host with Python 3 and PyYAML; it does not need PowerShell. It
complements ``tools/check-source-register.ps1`` (the CI gate) and
``tools/source_register_lookup.py`` (the point-of-use lookup) by testing, for
every register entry and every source key cited in active documents:

Errors (exit 1):
- required fields present, state allowed, id well formed and unique (the field
  and state lists are read from ``doctrine/source-register/schema.yaml``);
- ``date_accessed_utc`` and ``expires_or_recheck_due`` parse, and the recheck
  date is not earlier than the access date;
- a ``verified-current`` or ``verified-with-caveat`` entry is not past its
  recheck date, and a ``verified-current`` entry has an archive snapshot that
  is a real file inside the repository (no placeholder, no traversal);
- every backticked source key in the active documents resolves to a register id.

Attention items (reported, never failing, because they need a human decision):
- entries of any state that are past their recheck date;
- ``verified-current`` entries whose ``verifier`` text does not name a reviewer.

The tool never writes and never reaches the network.

Usage:
    python tools/source_register_integrity.py [--as-of YYYY-MM-DD] [--json]
"""
from __future__ import annotations

import argparse
import datetime as _dt
import json
import re
import sys
from pathlib import Path

import yaml

REPO_ROOT = Path(__file__).resolve().parents[1]
DEFAULT_REGISTER_ROOT = REPO_ROOT / "doctrine" / "source-register"

# Active documents: guidance an agent reads while working. Dated history under
# docs/ and the retired integration notes are deliberately out of scope.
ACTIVE_DOCUMENT_ROOTS = ("references", "skills", "doctrine", "governance",
                         "templates", "examples", "rules")
ACTIVE_DOCUMENT_FILES = ("README.md",)

VERIFIED_STATES = ("verified-current", "verified-with-caveat")
ARCHIVE_PLACEHOLDER = re.compile(r"^(capture-required|NOT_CAPTURED)", re.IGNORECASE)
URL_SCHEME = re.compile(r"^[A-Za-z][A-Za-z0-9+.-]*://")
REVIEWER_PLACEHOLDER = re.compile(r"pending|not[_ ]assessed", re.IGNORECASE)
REVIEWER_WORD = re.compile(r"reviewer|approved by|signed off", re.IGNORECASE)


class IntegrityReadError(Exception):
    """A register file or the schema could not be read."""


def _load_yaml(path: Path):
    try:
        with path.open("r", encoding="utf-8-sig") as handle:
            return yaml.safe_load(handle)
    except (OSError, UnicodeError, yaml.YAMLError) as exc:
        raise IntegrityReadError(f"cannot read {path}: {exc}") from exc


def _date(value, with_time: bool = False):
    """Return a date for an ISO date (or ISO datetime when with_time), else None."""
    if isinstance(value, _dt.datetime):
        return value.date()
    if isinstance(value, _dt.date):
        return value
    if not isinstance(value, str):
        return None
    text = value.strip()
    try:
        if with_time:
            return _dt.datetime.strptime(text, "%Y-%m-%dT%H:%M:%SZ").date()
        return _dt.date.fromisoformat(text)
    except ValueError:
        return None


def load_schema(register_root: Path) -> dict:
    schema = _load_yaml(register_root / "schema.yaml")
    if not isinstance(schema, dict):
        raise IntegrityReadError("schema.yaml is not a mapping")
    required = schema.get("required_fields")
    states = ((schema.get("field_rules") or {}).get("state") or {}).get("allowed_values")
    id_pattern = ((schema.get("field_rules") or {}).get("id") or {}).get("pattern")
    if not required or not states or not id_pattern:
        raise IntegrityReadError("schema.yaml lacks required_fields, state values or id pattern")
    return {"required": list(required), "states": list(states),
            "id_pattern": re.compile(id_pattern)}


def load_entries(register_root: Path):
    entries = []
    for path in sorted(register_root.rglob("*.yaml")):
        if path.name == "schema.yaml":
            continue
        data = _load_yaml(path)
        rel = path.relative_to(register_root.parent.parent).as_posix() \
            if register_root.parent.parent in path.parents else path.as_posix()
        if not isinstance(data, list):
            raise IntegrityReadError(f"{rel} is not a YAML sequence")
        for item in data:
            if isinstance(item, dict):
                entries.append((rel, item))
    return entries


def _inside(root: Path, candidate: Path) -> bool:
    try:
        candidate.resolve().relative_to(root.resolve())
        return True
    except ValueError:
        return False


def check_entries(entries, schema, as_of: _dt.date, repo_root: Path):
    errors, attention = [], []
    seen = {}
    for rel, entry in entries:
        label = str(entry.get("id") or "(entry without id)")

        def err(code, message):
            errors.append({"code": code, "id": label, "path": rel, "message": message})

        for field in schema["required"]:
            if entry.get(field) in (None, "", []):
                err("INT-001", f"missing or empty required field: {field}")

        entry_id = entry.get("id")
        if entry_id:
            if not schema["id_pattern"].match(str(entry_id)):
                err("INT-002", f"id does not match the schema pattern: {entry_id}")
            if entry_id in seen:
                err("INT-003", f"duplicate id (also in {seen[entry_id]})")
            seen.setdefault(entry_id, rel)

        state = entry.get("state")
        if state not in schema["states"]:
            err("INT-004", f"state not allowed by the schema: {state}")

        accessed = _date(entry.get("date_accessed_utc"), with_time=True)
        recheck = _date(entry.get("expires_or_recheck_due"))
        if accessed is None:
            err("INT-005", f"date_accessed_utc is not YYYY-MM-DDTHH:MM:SSZ: {entry.get('date_accessed_utc')}")
        if recheck is None:
            err("INT-006", f"expires_or_recheck_due is not YYYY-MM-DD: {entry.get('expires_or_recheck_due')}")
        if accessed and recheck and recheck < accessed:
            err("INT-007", f"recheck due {recheck} is earlier than access date {accessed}")

        if recheck and recheck < as_of:
            if state in VERIFIED_STATES:
                err("INT-008", f"{state} entry is past its recheck date {recheck}")
            elif state not in ("superseded",):
                attention.append({"code": "ATT-001", "id": label, "path": rel,
                                  "message": f"{state} entry is past its recheck date {recheck}"})

        if state == "verified-current":
            archive = str(entry.get("archive_snapshot") or "").strip()
            if not archive or ARCHIVE_PLACEHOLDER.match(archive):
                err("INT-009", "verified-current entry has no captured archive snapshot")
            elif not URL_SCHEME.match(archive):
                target = repo_root / archive
                if not _inside(repo_root, target):
                    err("INT-010", f"archive snapshot path leaves the repository: {archive}")
                elif not target.exists():
                    err("INT-010", f"archive snapshot does not exist: {archive}")
            verifier = str(entry.get("verifier") or "")
            if REVIEWER_PLACEHOLDER.search(verifier) or not REVIEWER_WORD.search(verifier):
                attention.append({"code": "ATT-002", "id": label, "path": rel,
                                  "message": "verified-current entry whose verifier text does not name a reviewer; "
                                             "the schema requires a named reviewer"})
    return errors, attention


def _active_documents(repo_root: Path):
    for name in ACTIVE_DOCUMENT_FILES:
        path = repo_root / name
        if path.is_file():
            yield path
    for root in ACTIVE_DOCUMENT_ROOTS:
        base = repo_root / root
        if base.is_dir():
            yield from sorted(base.rglob("*.md"))


def check_cited_keys(entries, repo_root: Path):
    ids = {str(e.get("id")) for _, e in entries if e.get("id")}
    prefixes = sorted({i.split("-", 1)[0] for i in ids})
    if not prefixes:
        return []
    pattern = re.compile(r"`((?:%s)-[A-Z0-9][A-Z0-9-]*[A-Z0-9])`" % "|".join(map(re.escape, prefixes)))
    errors = []
    for path in _active_documents(repo_root):
        try:
            text = path.read_text(encoding="utf-8-sig")
        except (OSError, UnicodeError) as exc:
            raise IntegrityReadError(f"cannot read {path}: {exc}") from exc
        rel = path.relative_to(repo_root).as_posix()
        for number, line in enumerate(text.splitlines(), start=1):
            for match in pattern.finditer(line):
                key = match.group(1)
                if key not in ids:
                    errors.append({"code": "INT-011", "id": key, "path": f"{rel}:{number}",
                                   "message": "source key cited in an active document does not resolve to a register entry"})
    return errors


def check(register_root: Path = DEFAULT_REGISTER_ROOT, repo_root: Path = REPO_ROOT,
          as_of: _dt.date | None = None) -> dict:
    as_of = as_of or _dt.datetime.now(_dt.timezone.utc).date()
    register_root, repo_root = Path(register_root), Path(repo_root)
    schema = load_schema(register_root)
    entries = load_entries(register_root)
    errors, attention = check_entries(entries, schema, as_of, repo_root)
    errors += check_cited_keys(entries, repo_root)
    return {"as_of": as_of.isoformat(), "entries": len(entries), "errors": errors,
            "attention": attention}


def _date_arg(text: str) -> _dt.date:
    value = _date(text)
    if value is None:
        raise argparse.ArgumentTypeError(f"not an ISO date (YYYY-MM-DD): {text}")
    return value


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    parser.add_argument("--as-of", type=_date_arg, default=None,
                        help="date used for recheck tests (default: today, UTC)")
    parser.add_argument("--register-root", type=Path, default=DEFAULT_REGISTER_ROOT,
                        help=argparse.SUPPRESS)
    parser.add_argument("--repo-root", type=Path, default=REPO_ROOT, help=argparse.SUPPRESS)
    parser.add_argument("--json", action="store_true", help="print JSON")
    args = parser.parse_args(argv)
    try:
        report = check(args.register_root, args.repo_root, args.as_of)
    except IntegrityReadError as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        return 2
    if args.json:
        print(json.dumps(report, indent=2, ensure_ascii=False))
    else:
        print(f"source register integrity as of {report['as_of']}: "
              f"{report['entries']} entries, {len(report['errors'])} error(s), "
              f"{len(report['attention'])} attention item(s)")
        for item in report["errors"]:
            print(f"  ERROR {item['code']} {item['id']} ({item['path']}): {item['message']}")
        for item in report["attention"]:
            print(f"  attention {item['code']} {item['id']}: {item['message']}")
    return 1 if report["errors"] else 0


if __name__ == "__main__":
    sys.exit(main())
