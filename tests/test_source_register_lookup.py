"""Tests for tools/source_register_lookup.py (read-only effective-date lookup)."""
import contextlib
import datetime as dt
import io
import hashlib
import importlib.util
import tempfile
import textwrap
import unittest
from pathlib import Path

ROOT = Path(__file__).parents[1]
REGISTER_ROOT = ROOT / "doctrine" / "source-register"
spec = importlib.util.spec_from_file_location("source_register_lookup",
                                              ROOT / "tools" / "source_register_lookup.py")
assert spec and spec.loader
lookup_mod = importlib.util.module_from_spec(spec)
spec.loader.exec_module(lookup_mod)

AS_OF = dt.date(2026, 9, 29)


def _hashes(root: Path) -> dict:
    return {p.relative_to(root).as_posix(): hashlib.sha256(p.read_bytes()).hexdigest()
            for p in sorted(root.rglob("*")) if p.is_file()}


def _run(jurisdiction, register, on_date, root=REGISTER_ROOT, as_of=AS_OF):
    return lookup_mod.lookup(jurisdiction, register, dt.date.fromisoformat(on_date),
                             as_of, root)


class LiveRegisterTests(unittest.TestCase):
    """Acceptance cases against the committed register (M10-13-T03)."""

    def test_draft_current_schedule_is_refused(self):
        report = _run("UG", "paye", "2026-08-15")
        self.assertEqual(report["exit_code"], 3)
        self.assertEqual(report["match"], "covering")
        self.assertEqual([r["id"] for r in report["results"]], ["UG-PAYE-RATES"])
        result = report["results"][0]
        self.assertFalse(result["final_use_allowed"])
        self.assertIn("draft: not for final output", result["warnings"])

    def test_superseded_undated_schedule_is_candidate_and_refused(self):
        report = _run("UG", "paye", "2026-05-15")
        self.assertEqual(report["exit_code"], 3)
        self.assertEqual(report["match"], "candidates")
        self.assertEqual([r["id"] for r in report["results"]],
                         ["UG-PAYE-RATES-THROUGH-2026-06-30"])
        warnings = report["results"][0]["warnings"]
        self.assertIn("superseded", warnings)
        self.assertIn("effective date NOT_ASSESSED", warnings)
        self.assertFalse(report["results"][0]["final_use_allowed"])

    def test_unknown_register_returns_2(self):
        self.assertEqual(_run("UG", "no-such-register", "2026-08-15")["exit_code"], 2)
        with contextlib.redirect_stdout(io.StringIO()):
            code = lookup_mod.main(["--jurisdiction", "UG", "--register", "no-such-register",
                                    "--date", "2026-08-15", "--json"])
        self.assertEqual(code, 2)

    def test_unknown_jurisdiction_returns_2(self):
        self.assertEqual(_run("ZZ", "paye", "2026-08-15")["exit_code"], 2)

    def test_cli_exit_code_matches(self):
        with contextlib.redirect_stdout(io.StringIO()):
            code = lookup_mod.main(["--jurisdiction", "UG", "--register", "paye",
                                    "--date", "2026-08-15", "--as-of", "2026-09-29", "--json"])
        self.assertEqual(code, 3)

    def test_lookup_never_writes(self):
        before = _hashes(REGISTER_ROOT)
        for register in ("paye", "lst", "wht", "nssf", "vat", "missing"):
            for day in ("2026-05-15", "2026-08-15", "2027-03-01"):
                _run("UG", register, day)
        _run("IF", "ifrs-advanced-2026", "2027-02-01")
        self.assertEqual(before, _hashes(REGISTER_ROOT))


SCHEMA = (REGISTER_ROOT / "schema.yaml").read_text(encoding="utf-8")


def _entry(entry_id, state, effective_from, due, snapshot="https://archive.example/x"):
    return textwrap.dedent(f"""\
        - id: {entry_id}
          topic: test
          jurisdiction: TT
          value_or_rule: "rule {entry_id}"
          source_url_or_doc: "https://example.test/{entry_id}"
          source_tier: 1
          date_accessed_utc: "2026-09-01T00:00:00Z"
          verifier: "Test Reviewer"
          output_affected: [test-output]
          effective_from: "{effective_from}"
          expires_or_recheck_due: "{due}"
          state: {state}
          archive_snapshot: "{snapshot}"
          notes: test
        """)


class FixtureRegisterTests(unittest.TestCase):
    """State-machine semantics on a temporary register (live register untouched)."""

    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.root = Path(self.tmp.name)
        (self.root / "schema.yaml").write_text(SCHEMA, encoding="utf-8")
        folder = self.root / "testland"
        folder.mkdir()
        (folder / "tax.yaml").write_text(
            _entry("TT-TAX-2025", "superseded", "2025-01-01", "2026-12-31")
            + _entry("TT-TAX-2026", "verified-current", "2026-01-01", "2026-12-31"),
            encoding="utf-8")
        (folder / "levy.yaml").write_text(
            _entry("TT-LEVY", "verified-with-caveat", "2026-01-01", "2026-12-31"),
            encoding="utf-8")
        (folder / "old.yaml").write_text(
            _entry("TT-OLD", "stale", "2024-01-01", "2025-01-01", "NOT_CAPTURED; test"),
            encoding="utf-8")

    def tearDown(self):
        self.tmp.cleanup()

    def test_verified_current_within_recheck_is_usable(self):
        report = _run("TT", "tax", "2026-03-01", self.root)
        self.assertEqual(report["exit_code"], 0)
        self.assertEqual(report["results"][0]["id"], "TT-TAX-2026")
        self.assertTrue(report["results"][0]["final_use_allowed"])
        self.assertEqual(report["results"][0]["warnings"], [])

    def test_half_open_interval_selects_earlier_entry(self):
        report = _run("TT", "tax", "2025-12-31", self.root)
        self.assertEqual(report["results"][0]["id"], "TT-TAX-2025")
        self.assertEqual(report["exit_code"], 3)
        self.assertIn("superseded", report["results"][0]["warnings"])

    def test_date_before_any_entry_returns_2(self):
        self.assertEqual(_run("TT", "tax", "2024-06-30", self.root)["exit_code"], 2)

    def test_recheck_overdue_refuses_final_use(self):
        report = _run("TT", "tax", "2026-03-01", self.root, as_of=dt.date(2027, 1, 5))
        self.assertEqual(report["exit_code"], 3)
        self.assertIn("recheck overdue", report["results"][0]["warnings"])

    def test_caveat_state_is_not_automatic_final_use(self):
        report = _run("TT", "levy", "2026-06-01", self.root)
        self.assertEqual(report["exit_code"], 3)
        self.assertFalse(report["results"][0]["final_use_allowed"])
        self.assertTrue(any(w.startswith("verified-with-caveat:")
                            for w in report["results"][0]["warnings"]))

    def test_stale_and_archive_warnings(self):
        warnings = _run("TT", "old", "2024-06-01", self.root)["results"][0]["warnings"]
        self.assertIn("stale", warnings)
        self.assertIn("archive snapshot not captured", warnings)

    def test_schema_change_propagates(self):
        (self.root / "schema.yaml").write_text(
            SCHEMA.replace("    meaning: \"Source identified but not reviewed.\"\n"
                           "    can_support_final_output: false",
                           "    meaning: \"Source identified but not reviewed.\"\n"
                           "    can_support_final_output: true"),
            encoding="utf-8")
        (self.root / "testland" / "tax.yaml").write_text(
            _entry("TT-TAX-DRAFT", "draft", "2026-01-01", "2026-12-31"), encoding="utf-8")
        report = _run("TT", "tax", "2026-03-01", self.root)
        self.assertTrue(report["results"][0]["final_use_allowed"])


if __name__ == "__main__":
    unittest.main()
