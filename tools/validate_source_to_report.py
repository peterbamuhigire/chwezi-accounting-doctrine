#!/usr/bin/env python3
"""Validate a labelled synthetic source-to-report accounting fixture."""
from __future__ import annotations
import json
import sys
from pathlib import Path

def validate(data: object) -> list[str]:
    if not isinstance(data, dict) or data.get("fixture_label") != "FICTIONAL TEST DATA":
        return ["fixture_label must be FICTIONAL TEST DATA"]
    sources, journals = data.get("sources"), data.get("journals")
    if not isinstance(sources, list) or not isinstance(journals, list):
        return ["sources and journals must be lists"]
    source_ids = {s.get("id") for s in sources if isinstance(s, dict)}
    errors: list[str] = []
    journal_ids: set[str] = set()
    for journal in journals:
        if not isinstance(journal, dict) or not journal.get("id"):
            errors.append("journal needs id")
            continue
        jid = journal["id"]
        if jid in journal_ids:
            errors.append(f"duplicate journal {jid}")
        journal_ids.add(jid)
        if journal.get("source_id") not in source_ids:
            errors.append(f"journal {jid} has unknown source")
        lines = journal.get("lines", [])
        if not isinstance(lines, list) or sum(x.get("debit", 0) for x in lines) != sum(x.get("credit", 0) for x in lines):
            errors.append(f"journal {jid} is not balanced")
        correction = journal.get("correction_of")
        if correction and correction not in journal_ids and correction not in {j.get("id") for j in journals}:
            errors.append(f"journal {jid} correction target is missing")
    controller = data.get("controller_review")
    if not isinstance(controller, dict) or not all(isinstance(controller.get(k), str) and controller[k].strip() for k in ("role", "decision", "date")):
        errors.append("controller review needs role, decision and date")
    if data.get("report_total") != sum(sum(x.get("debit", 0) for x in j.get("lines", [])) for j in journals):
        errors.append("report total does not reconcile to journal debits")
    return errors

if __name__ == "__main__":
    try:
        payload = json.loads(Path(sys.argv[1]).read_text(encoding="utf-8"))
        failures = validate(payload)
    except (IndexError, OSError, UnicodeError, json.JSONDecodeError) as exc:
        print(f"FAIL: {exc}"); raise SystemExit(1)
    print("PASS" if not failures else "FAIL")
    for failure in failures: print(f"[ERROR] {failure}")
    raise SystemExit(0 if not failures else 1)
