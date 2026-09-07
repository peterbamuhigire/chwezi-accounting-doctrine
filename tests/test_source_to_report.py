import copy, json, importlib.util, unittest
from pathlib import Path

path = Path(__file__).parents[1] / "tools" / "validate_source_to_report.py"
spec = importlib.util.spec_from_file_location("source_to_report", path)
assert spec and spec.loader
module = importlib.util.module_from_spec(spec); spec.loader.exec_module(module)

class SourceReportTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.data = json.loads((Path(__file__).parent / "accounting-invariants" / "fixtures" / "p0-source-to-report.json").read_text(encoding="utf-8"))
    def test_balanced_source_to_report_passes(self): self.assertEqual(module.validate(self.data), [])
    def test_unbalanced_journal_fails(self):
        data = copy.deepcopy(self.data); data["journals"][0]["lines"][0]["debit"] = 99
        self.assertIn("journal JRN-001 is not balanced", module.validate(data))
    def test_missing_controller_blocks(self):
        data = copy.deepcopy(self.data); data["controller_review"]["role"] = ""
        self.assertIn("controller review needs role, decision and date", module.validate(data))
