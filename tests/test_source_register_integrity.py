"""Tests for tools/source_register_integrity.py.

The live-register test must pass today. Every other test builds a small
throwaway repository in a temporary directory and proves that one specific
defect makes the checker fail, so a checker that silently passes everything
would be caught here.
"""
import contextlib
import datetime
import importlib.util
import io
import shutil
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location(
    "source_register_integrity", ROOT / "tools" / "source_register_integrity.py")
integrity = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(integrity)

AS_OF = datetime.date(2026, 10, 31)

GOOD_ENTRY = """\
- id: {id}
  topic: Test entry
  jurisdiction: UG
  value_or_rule: "Test only."
  source_url_or_doc: "test-only"
  source_tier: 6
  date_accessed_utc: "{accessed}"
  verifier: "{verifier}"
  output_affected:
    - test-only
  effective_from: "pending-review"
  expires_or_recheck_due: "{recheck}"
  state: {state}
  archive_snapshot: "{archive}"
  notes: "Test only."
"""


def entry(id="UG-TEST-ONE", accessed="2026-10-01T00:00:00Z", recheck="2027-01-01",
          state="draft", archive="capture-required-before-release",
          verifier="test-only reviewer pending"):
    return GOOD_ENTRY.format(id=id, accessed=accessed, recheck=recheck, state=state,
                             archive=archive, verifier=verifier)


class TempRepo:
    """A minimal repository: the live schema, register files and documents."""

    def __init__(self):
        self.dir = Path(tempfile.mkdtemp(prefix="register-integrity-"))
        self.register = self.dir / "doctrine" / "source-register"
        (self.register / "uganda").mkdir(parents=True)
        shutil.copy(ROOT / "doctrine/source-register/schema.yaml", self.register / "schema.yaml")

    def add_register(self, name, text):
        (self.register / "uganda" / name).write_text(text, encoding="utf-8")

    def add_doc(self, relative, text):
        path = self.dir / relative
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text, encoding="utf-8")

    def check(self):
        return integrity.check(self.register, self.dir, AS_OF)

    def codes(self):
        return sorted({item["code"] for item in self.check()["errors"]})

    def cleanup(self):
        shutil.rmtree(self.dir, ignore_errors=True)


class LiveRegisterTests(unittest.TestCase):
    def test_live_register_has_no_integrity_errors(self):
        report = integrity.check()
        self.assertEqual(report["errors"], [], report["errors"])
        self.assertGreaterEqual(report["entries"], 29)

    def test_cited_vat_threshold_key_resolves(self):
        text = (ROOT / "references/uganda-statutory.md").read_text(encoding="utf-8")
        self.assertIn("`UG-VAT-REG-THRESHOLD`", text)
        report = integrity.check()
        self.assertFalse([e for e in report["errors"] if e["code"] == "INT-011"])

    def test_cli_exit_codes(self):
        with contextlib.redirect_stdout(io.StringIO()):
            self.assertEqual(integrity.main(["--json"]), 0)
        missing = Path(tempfile.mkdtemp(prefix="register-integrity-missing-"))
        try:
            with contextlib.redirect_stderr(io.StringIO()):
                self.assertEqual(integrity.main(["--register-root", str(missing)]), 2)
        finally:
            shutil.rmtree(missing, ignore_errors=True)


class NegativeControlTests(unittest.TestCase):
    def setUp(self):
        self.repo = TempRepo()
        self.addCleanup(self.repo.cleanup)

    def test_clean_register_passes(self):
        self.repo.add_register("a.yaml", entry())
        self.assertEqual(self.repo.check()["errors"], [])

    def test_overdue_verified_entry_in_a_later_position_is_caught(self):
        # The class of defect the PowerShell gate missed: the first entry is a
        # draft, the second is a verified-current entry far past its recheck.
        archive = self.repo.dir / "evidence.md"
        archive.write_text("evidence", encoding="utf-8")
        self.repo.add_register(
            "mixed.yaml",
            entry(id="UG-TEST-FIRST") + entry(
                id="UG-TEST-SECOND", state="verified-current", recheck="2026-02-01",
                accessed="2026-01-01T00:00:00Z", archive="evidence.md",
                verifier="Named Reviewer, reviewer"))
        self.assertIn("INT-008", self.repo.codes())

    def test_recheck_before_access_is_caught(self):
        self.repo.add_register("a.yaml", entry(accessed="2026-10-29T00:00:00Z", recheck="2026-08-14"))
        self.assertIn("INT-007", self.repo.codes())

    def test_unknown_state_is_caught(self):
        self.repo.add_register("a.yaml", entry(state="verified-ish"))
        self.assertIn("INT-004", self.repo.codes())

    def test_duplicate_id_is_caught(self):
        self.repo.add_register("a.yaml", entry() + entry())
        self.assertIn("INT-003", self.repo.codes())

    def test_missing_required_field_is_caught(self):
        text = entry().replace('  verifier: "test-only reviewer pending"\n', "")
        self.repo.add_register("a.yaml", text)
        self.assertIn("INT-001", self.repo.codes())

    def test_malformed_dates_are_caught(self):
        self.repo.add_register("a.yaml", entry(accessed="31 October 2026", recheck="soon"))
        self.assertTrue({"INT-005", "INT-006"} <= set(self.repo.codes()))

    def test_verified_current_needs_a_real_archive_inside_the_repository(self):
        base = dict(state="verified-current", verifier="Named Reviewer, reviewer")
        for archive, code in (("capture-required-before-release", "INT-009"),
                              ("NOT_CAPTURED; page is mutable", "INT-009"),
                              ("docs/missing-evidence.md", "INT-010"),
                              ("../outside-the-repository.md", "INT-010")):
            with self.subTest(archive=archive):
                repo = TempRepo()
                try:
                    repo.add_register("a.yaml", entry(archive=archive, **base))
                    self.assertIn(code, repo.codes())
                finally:
                    repo.cleanup()

    def test_dangling_source_key_in_an_active_document_is_caught(self):
        self.repo.add_register("a.yaml", entry(id="UG-TEST-ONE"))
        self.repo.add_doc("references/note.md", "Use `UG-TEST-ONE` and `UG-TEST-MISSING`.\n")
        errors = [e for e in self.repo.check()["errors"] if e["code"] == "INT-011"]
        self.assertEqual([e["id"] for e in errors], ["UG-TEST-MISSING"])
        self.assertTrue(errors[0]["path"].startswith("references/note.md:1"))

    def test_keys_in_dated_history_are_out_of_scope(self):
        self.repo.add_register("a.yaml", entry())
        self.repo.add_doc("docs/history.md", "Old key `UG-TEST-RETIRED`.\n")
        self.assertEqual(self.repo.check()["errors"], [])


class AttentionTests(unittest.TestCase):
    def setUp(self):
        self.repo = TempRepo()
        self.addCleanup(self.repo.cleanup)

    def test_overdue_draft_is_reported_but_does_not_fail(self):
        self.repo.add_register("a.yaml", entry(recheck="2026-08-14", accessed="2026-05-14T00:00:00Z"))
        report = self.repo.check()
        self.assertEqual(report["errors"], [])
        self.assertEqual([a["code"] for a in report["attention"]], ["ATT-001"])

    def test_superseded_entries_are_not_reported_as_overdue(self):
        self.repo.add_register("a.yaml", entry(state="superseded", recheck="2026-08-14",
                                               accessed="2026-05-14T00:00:00Z"))
        self.assertEqual(self.repo.check()["attention"], [])

    def test_verified_current_without_a_named_reviewer_is_reported(self):
        archive = self.repo.dir / "evidence.md"
        archive.write_text("evidence", encoding="utf-8")
        self.repo.add_register("a.yaml", entry(
            state="verified-current", archive="evidence.md",
            verifier="Official page rechecked 2026-10-29; scope limited to rates"))
        report = self.repo.check()
        self.assertEqual(report["errors"], [])
        self.assertEqual([a["code"] for a in report["attention"]], ["ATT-002"])

    def test_verified_current_with_a_named_reviewer_is_not_reported(self):
        archive = self.repo.dir / "evidence.md"
        archive.write_text("evidence", encoding="utf-8")
        self.repo.add_register("a.yaml", entry(
            state="verified-current", archive="evidence.md",
            verifier="A. Reviewer, Uganda tax reviewer, approved 2026-10-30"))
        self.assertEqual(self.repo.check()["attention"], [])


if __name__ == "__main__":
    unittest.main()
