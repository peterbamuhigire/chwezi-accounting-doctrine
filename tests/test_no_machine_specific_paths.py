"""Tests for tools/check_machine_paths.py.

The live scan must pass. The other tests build a throwaway tree and prove that
a drive path, a home path or an over-ceiling allowlisted file is reported, and
that dated history is ignored. Fixture strings are built at run time so this
file does not itself contain a machine-specific path.
"""
import contextlib
import importlib.util
import io
import shutil
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location(
    "check_machine_paths", ROOT / "tools" / "check_machine_paths.py")
paths = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(paths)

DRIVE = "C" + ":" + "\\" + "wamp64" + "\\" + "www" + "\\" + "some-engine"
HOME = "/" + "home" + "/" + "someone" + "/" + "checkout"
MOUNT = "/" + "mnt" + "/" + "c" + "/" + "projects"


class TempTree:
    def __init__(self):
        self.dir = Path(tempfile.mkdtemp(prefix="machine-paths-"))

    def write(self, relative, text):
        path = self.dir / relative
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text, encoding="utf-8")

    def scan(self, allowlist=None):
        return paths.scan(self.dir, paths.ALLOWLIST if allowlist is None else allowlist)

    def cleanup(self):
        shutil.rmtree(self.dir, ignore_errors=True)


class LiveScanTests(unittest.TestCase):
    def test_active_content_has_no_machine_specific_paths_over_the_ceiling(self):
        report = paths.scan()
        self.assertEqual(report["findings"], [], report["findings"])

    def test_cli_exit_code_is_zero_on_the_live_tree(self):
        with contextlib.redirect_stdout(io.StringIO()):
            self.assertEqual(paths.main([]), 0)

    def test_allowlist_names_only_portfolio_managed_files_with_a_reason(self):
        for rel, (ceiling, reason) in paths.ALLOWLIST.items():
            self.assertGreater(ceiling, 0)
            self.assertTrue(reason.strip(), rel)
            self.assertTrue((ROOT / rel).is_file(), rel)


class NegativeControlTests(unittest.TestCase):
    def setUp(self):
        self.tree = TempTree()
        self.addCleanup(self.tree.cleanup)

    def test_clean_tree_passes(self):
        self.tree.write("skills/a/SKILL.md", "Resolve engines through the catalogue.\n")
        self.assertEqual(self.tree.scan()["findings"], [])

    def test_windows_drive_path_in_a_skill_is_reported(self):
        self.tree.write("skills/a/SKILL.md", f"See `{DRIVE}` for the research engine.\n")
        findings = self.tree.scan()["findings"]
        self.assertEqual([f["path"] for f in findings], ["skills/a/SKILL.md"])
        self.assertEqual(findings[0]["hits"][0]["pattern"], "windows-drive-path")

    def test_home_directory_and_mount_paths_are_reported(self):
        self.tree.write("references/a.md", f"Clone to {HOME}\n")
        self.tree.write("governance/b.md", f"Mounted at {MOUNT}\n")
        patterns = {f["path"]: f["hits"][0]["pattern"] for f in self.tree.scan()["findings"]}
        self.assertEqual(patterns, {"references/a.md": "unix-home-path",
                                    "governance/b.md": "mount-path"})

    def test_relative_windows_script_paths_are_not_machine_paths(self):
        self.tree.write("README.md", "Run tools\\validate-doctrine.ps1 and ./install.sh.\n")
        self.assertEqual(self.tree.scan()["findings"], [])

    def test_dated_history_is_out_of_scope(self):
        self.tree.write("docs/engine-upgrade/report.md", f"Built at {DRIVE}\n")
        self.tree.write("integration/plan.md", f"Mirror {DRIVE}\n")
        self.assertEqual(self.tree.scan()["findings"], [])

    def test_allowlisted_file_is_held_to_its_ceiling(self):
        allowlist = {"AGENTS.md": (2, "portfolio-managed blocks")}
        self.tree.write("AGENTS.md", f"one {DRIVE}\ntwo {DRIVE}\n")
        self.assertEqual(self.tree.scan(allowlist)["findings"], [])
        self.tree.write("AGENTS.md", f"one {DRIVE}\ntwo {DRIVE}\nthree {DRIVE}\n")
        findings = self.tree.scan(allowlist)["findings"]
        self.assertEqual([(f["path"], f["count"], f["allowed"]) for f in findings],
                         [("AGENTS.md", 3, 2)])

    def test_non_text_and_cache_files_are_skipped(self):
        self.tree.write("skills/a/data.bin", f"{DRIVE}\n")
        self.tree.write("skills/a/__pycache__/x.py", f"{DRIVE}\n")
        self.assertEqual(self.tree.scan()["findings"], [])


if __name__ == "__main__":
    unittest.main()
