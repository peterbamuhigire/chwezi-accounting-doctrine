"""Read-only scan for machine-specific absolute paths in active content.

Engine content must resolve other engines through the engine catalogue and
must not name a drive letter, a user's home directory or a mount point.
Dated history (``docs/`` apart from the listed templates, ``integration/``)
is out of scope: it records what was true when it was written.

A small allowlist covers lines the portfolio package injects into
``AGENTS.md``. It is a ceiling per file, not a licence: adding a path line to
an allowlisted file raises the count and fails the scan.

Exit codes: 0 no findings; 1 findings; 2 a scanned file could not be read.
The tool never writes and never reaches the network.

Usage:
    python tools/check_machine_paths.py [--json]
"""
from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[1]

# Active content: guidance, code and fixtures an agent or a build reads.
SCAN_DIRECTORIES = ("skills", "doctrine", "governance", "references", "templates",
                    "examples", "rules", "prompts", "hooks", "scripts", "tools",
                    "tests", ".claude-plugin", ".codex-plugin", ".agents")
SCAN_FILES = ("README.md", "AGENTS.md", "CLAUDE.md", "docs/validation-report-template.md")
TEXT_SUFFIXES = (".md", ".yaml", ".yml", ".json", ".ps1", ".py", ".sh", ".js", ".txt")
SKIP_PARTS = ("__pycache__", "node_modules", ".git")

# path -> (maximum matching lines, reason). Ceilings, not exemptions.
ALLOWLIST = {
    "AGENTS.md": (2, "portfolio-managed blocks (currentness gate, craft contract); "
                     "owned by the portfolio package, not by this engine"),
    "hooks/test-destructive-bash-gate.js": (11, "fake Windows paths used as test "
                     "inputs for the destructive-command gate; they name no real location"),
}

# A Windows drive path, a home directory or a mount point. Built from parts so
# this file does not match its own patterns.
PATTERNS = (
    ("windows-drive-path", re.compile(r"(?<![A-Za-z0-9])[A-Za-z]:\\+[A-Za-z0-9_$.~-]")),
    ("unix-home-path", re.compile(r"(?<![A-Za-z0-9_.-])/(?:home|Users)/[A-Za-z0-9._-]+/")),
    ("mount-path", re.compile(r"(?<![A-Za-z0-9_.-])/mnt/[a-z]/")),
)


class ScanReadError(Exception):
    """A scanned file could not be read."""


def _files(repo_root: Path):
    for name in SCAN_FILES:
        path = repo_root / name
        if path.is_file():
            yield path
    for directory in SCAN_DIRECTORIES:
        base = repo_root / directory
        if not base.is_dir():
            continue
        for path in sorted(base.rglob("*")):
            if path.is_file() and path.suffix.lower() in TEXT_SUFFIXES \
                    and not any(part in SKIP_PARTS for part in path.parts):
                yield path


def scan(repo_root: Path = REPO_ROOT, allowlist: dict = ALLOWLIST) -> dict:
    repo_root = Path(repo_root)
    hits_by_file = {}
    for path in _files(repo_root):
        try:
            lines = path.read_text(encoding="utf-8-sig").splitlines()
        except (OSError, UnicodeError) as exc:
            raise ScanReadError(f"cannot read {path}: {exc}") from exc
        rel = path.relative_to(repo_root).as_posix()
        for number, line in enumerate(lines, start=1):
            for name, pattern in PATTERNS:
                if pattern.search(line):
                    hits_by_file.setdefault(rel, []).append(
                        {"line": number, "pattern": name, "text": line.strip()[:120]})
                    break
    findings = []
    for rel, hits in sorted(hits_by_file.items()):
        ceiling = allowlist.get(rel, (0, ""))[0]
        if len(hits) > ceiling:
            findings.append({"path": rel, "count": len(hits), "allowed": ceiling, "hits": hits})
    return {"files_with_paths": len(hits_by_file), "findings": findings}


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    parser.add_argument("--json", action="store_true", help="print JSON")
    args = parser.parse_args(argv)
    try:
        report = scan()
    except ScanReadError as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        return 2
    if args.json:
        print(json.dumps(report, indent=2, ensure_ascii=False))
    else:
        print(f"machine-specific path scan: {len(report['findings'])} file(s) over their ceiling")
        for item in report["findings"]:
            print(f"  {item['path']}: {item['count']} line(s), {item['allowed']} allowed")
            for hit in item["hits"]:
                print(f"    line {hit['line']} [{hit['pattern']}]")
    return 1 if report["findings"] else 0


if __name__ == "__main__":
    sys.exit(main())
