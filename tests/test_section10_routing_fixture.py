import json
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
FIXTURE = ROOT / "tests/router-map/fixtures/section10-after-close.json"
ROUTER_MAP = ROOT / "docs/router-map.md"
TARGET = "ifrs-accounting-policies-changes-errors-ias8"


class Section10RoutingFixtureTests(unittest.TestCase):
    def test_fixture_labels_and_targets_are_well_formed(self):
        data = json.loads(FIXTURE.read_text(encoding="utf-8"))
        cases = data["cases"]
        positives = [case for case in cases if case["label"] == "positive"]
        negatives = [case for case in cases if case["label"] == "negative"]

        self.assertEqual(len(positives), 3)
        self.assertEqual(len(negatives), 2)
        self.assertTrue(all(case["expected_skill"] == TARGET for case in positives))
        self.assertTrue(all(case["expected_skill"] != TARGET for case in negatives))
        self.assertEqual(len({case["id"] for case in cases}), len(cases))
        self.assertIn(TARGET, ROUTER_MAP.read_text(encoding="utf-8"))

    def test_fixture_does_not_claim_router_execution(self):
        data = json.loads(FIXTURE.read_text(encoding="utf-8"))
        self.assertIn("not a router execution", data["status"])


if __name__ == "__main__":
    unittest.main()
