"""Read-only effective-date lookup over the statutory source register.

Answers one question at the moment of use: which register entry applies to
this jurisdiction, register and date, and may it support final statutory
output? The answer comes from ``doctrine/source-register/schema.yaml``
(``state_machine.<state>.can_support_final_output``); no state list is
hard-coded here, so a schema change takes effect without editing this tool.

Selection:
- the register file is ``doctrine/source-register/<folder>/<register>.yaml``,
  where ``<folder>`` is the folder whose entries carry the requested
  ``jurisdiction`` code (discovered from the files, not a fixed map);
- an entry with an ISO ``effective_from`` covers the half-open interval up to
  the next dated ``effective_from`` in the same register; that entry is
  returned;
- if no dated entry covers the date, entries whose ``effective_from`` is not an
  ISO date are returned as candidates with the warning
  "effective date NOT_ASSESSED".

Exit codes: 0 an entry usable for final output; 3 an entry was found but final
use is refused (callers must treat 3 as a hard stop for statutory output);
2 no entry, unknown jurisdiction or unknown register; 1 register or schema
could not be read.

The tool never writes, never reaches the network and reads files as UTF-8.

Keyed retrieval with refusal adapted in principle from UI UX Pro Max's
abstaining retrieval (MIT, https://github.com/nextlevelbuilder/ui-ux-pro-max-skill,
commit 09170eec67eefd46a7ae85de61b40c194020f997). No code or data reused.

Usage:
    python tools/source_register_lookup.py --jurisdiction UG --register paye \
        --date 2026-08-15 [--as-of 2026-09-29] [--json]
"""
from __future__ import annotations

import argparse
import datetime as _dt
import json
import sys
from pathlib import Path

import yaml

REPO_ROOT = Path(__file__).resolve().parents[1]
DEFAULT_REGISTER_ROOT = REPO_ROOT / "doctrine" / "source-register"

EXIT_FINAL_OK = 0
EXIT_READ_ERROR = 1
EXIT_NO_ENTRY = 2
EXIT_REFUSED = 3


class LookupError_(Exception):
    """Register or schema could not be read."""


def _iso(value):
    """Return a date for an ISO YYYY-MM-DD string (or date), else None."""
    if isinstance(value, _dt.date):
        return value
    if not isinstance(value, str):
        return None
    try:
        return _dt.date.fromisoformat(value.strip())
    except ValueError:
        return None


def _load_yaml(path: Path):
    try:
        with path.open("r", encoding="utf-8-sig") as handle:
            return yaml.safe_load(handle)
    except (OSError, UnicodeError, yaml.YAMLError) as exc:
        raise LookupError_(f"cannot read {path}: {exc}") from exc


def load_state_machine(register_root: Path) -> dict:
    schema = _load_yaml(register_root / "schema.yaml")
    machine = (schema or {}).get("state_machine") if isinstance(schema, dict) else None
    if not isinstance(machine, dict) or not machine:
        raise LookupError_("schema.yaml has no state_machine")
    return machine


def find_register(register_root: Path, jurisdiction: str, register: str):
    """(path, entries) for the register whose folder holds the jurisdiction.

    Returns (None, reason) when the jurisdiction or register is unknown.
    """
    code = jurisdiction.strip().upper()
    known_codes = set()
    for folder in sorted(p for p in register_root.iterdir() if p.is_dir()):
        codes = set()
        for yml in sorted(folder.glob("*.yaml")):
            data = _load_yaml(yml)
            if isinstance(data, list):
                codes.update(str(e.get("jurisdiction", "")).upper()
                             for e in data if isinstance(e, dict))
        known_codes |= codes
        if code in codes or folder.name.lower() == jurisdiction.strip().lower():
            path = folder / f"{register}.yaml"
            if not path.is_file():
                return None, f"no register '{register}' for jurisdiction {code} in {folder.name}/"
            data = _load_yaml(path)
            if not isinstance(data, list):
                raise LookupError_(f"{path} is not a YAML sequence")
            entries = [e for e in data if isinstance(e, dict)
                       and str(e.get("jurisdiction", "")).upper() == code]
            return path, entries
    return None, f"unknown jurisdiction {code}; known: {', '.join(sorted(c for c in known_codes if c))}"


def select_entries(entries, on_date: _dt.date):
    """(match_kind, [entries]) per the half-open effective-date rule."""
    dated = sorted((e for e in entries if _iso(e.get("effective_from"))),
                   key=lambda e: _iso(e.get("effective_from")))
    covering = None
    for index, entry in enumerate(dated):
        start = _iso(entry.get("effective_from"))
        end = _iso(dated[index + 1].get("effective_from")) if index + 1 < len(dated) else None
        if start <= on_date and (end is None or on_date < end):
            covering = entry
    if covering is not None:
        return "covering", [covering]
    undated = [e for e in entries if not _iso(e.get("effective_from"))]
    if undated:
        return "candidates", undated
    return "none", []


def assess(entry: dict, machine: dict, as_of: _dt.date, undated: bool) -> dict:
    state = str(entry.get("state", "")).strip()
    rule = machine.get(state, {}) if isinstance(machine.get(state), dict) else None
    warnings = []
    if rule is None:
        allowed = False
        warnings.append(f"state '{state}' not in schema state_machine")
    else:
        permission = rule.get("can_support_final_output")
        allowed = permission is True
        if allowed:
            pass
        elif state in ("superseded", "stale"):
            warnings.append(state)
        elif permission is False:
            warnings.append(f"{state}: not for final output")
        else:
            warnings.append(f"{state}: {permission}")
    if undated:
        allowed = False
        warnings.append("effective date NOT_ASSESSED")
    due = _iso(entry.get("expires_or_recheck_due"))
    if due is None:
        allowed = False
        warnings.append("recheck date NOT_ASSESSED")
    elif as_of > due:
        allowed = False
        warnings.append("recheck overdue")
    if str(entry.get("archive_snapshot", "")).startswith("NOT_CAPTURED"):
        warnings.append("archive snapshot not captured")
    return {
        "id": entry.get("id"),
        "state": state,
        "final_use_allowed": allowed,
        "effective_from": entry.get("effective_from"),
        "expires_or_recheck_due": entry.get("expires_or_recheck_due"),
        "value_or_rule": entry.get("value_or_rule"),
        "source_url_or_doc": entry.get("source_url_or_doc"),
        "warnings": warnings,
    }


def lookup(jurisdiction: str, register: str, on_date: _dt.date,
           as_of: _dt.date | None = None, register_root: Path = DEFAULT_REGISTER_ROOT) -> dict:
    as_of = as_of or _dt.datetime.now(_dt.timezone.utc).date()
    register_root = Path(register_root)
    machine = load_state_machine(register_root)
    query = {"jurisdiction": jurisdiction.upper(), "register": register,
             "date": on_date.isoformat(), "as_of": as_of.isoformat()}
    path, found = find_register(register_root, jurisdiction, register)
    if path is None:
        return {"query": query, "match": "none", "results": [], "reason": found,
                "exit_code": EXIT_NO_ENTRY}
    kind, chosen = select_entries(found, on_date)
    results = [assess(e, machine, as_of, kind == "candidates") for e in chosen]
    if not results:
        code, reason = EXIT_NO_ENTRY, "no entry covers this date"
    elif kind == "covering" and results[0]["final_use_allowed"]:
        code, reason = EXIT_FINAL_OK, "entry may support final output"
    else:
        code, reason = EXIT_REFUSED, "entry found; final use refused"
    try:
        rel = path.relative_to(REPO_ROOT).as_posix()
    except ValueError:
        rel = path.as_posix()
    return {"query": query, "register_file": rel, "match": kind, "results": results,
            "reason": reason, "exit_code": code}


def _date_arg(text: str) -> _dt.date:
    value = _iso(text)
    if value is None:
        raise argparse.ArgumentTypeError(f"not an ISO date (YYYY-MM-DD): {text}")
    return value


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    parser.add_argument("--jurisdiction", required=True, help="ISO code, e.g. UG")
    parser.add_argument("--register", required=True, help="register file stem, e.g. paye")
    parser.add_argument("--date", required=True, type=_date_arg, help="date the rule must apply to")
    parser.add_argument("--as-of", type=_date_arg, default=None,
                        help="date of use for the recheck test (default: today, UTC)")
    parser.add_argument("--register-root", type=Path, default=DEFAULT_REGISTER_ROOT,
                        help=argparse.SUPPRESS)
    parser.add_argument("--json", action="store_true", help="print JSON")
    args = parser.parse_args(argv)
    try:
        report = lookup(args.jurisdiction, args.register, args.date, args.as_of, args.register_root)
    except LookupError_ as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        return EXIT_READ_ERROR
    if args.json:
        print(json.dumps(report, indent=2, ensure_ascii=False))
    else:
        q = report["query"]
        print(f"{q['jurisdiction']} {q['register']} on {q['date']} (as of {q['as_of']}): "
              f"{report['reason']} [exit {report['exit_code']}]")
        for item in report["results"]:
            print(f"  {item['id']}  state={item['state']}  final_use_allowed="
                  f"{str(item['final_use_allowed']).lower()}  effective_from={item['effective_from']}")
            for warning in item["warnings"]:
                print(f"    warning: {warning}")
    return report["exit_code"]


if __name__ == "__main__":
    sys.exit(main())
