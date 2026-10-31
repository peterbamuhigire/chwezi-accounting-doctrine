"""Executes the labelled routing fixtures through tools/route_proxy.py.

This is a Tier-2 lexical regression check, not live model routing: it proves a
labelled query still ranks its expected skill first by a margin, so a
description edit that breaks a route fails here. Live routing and precision@1
remain NOT_ASSESSED.
"""
import importlib.util
import json
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location("route_proxy", ROOT / "tools" / "route_proxy.py")
proxy = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(proxy)

FIXTURE_DIR = ROOT / "tests" / "router-map" / "fixtures"
TARGET = "ifrs-accounting-policies-changes-errors-ias8"
# The description before kaizen A5 (2026-10-31). With it, the first Section 10
# positive led its neighbour by less than 0.01 and lost under one proxy.
DESCRIPTION_BEFORE_A5 = (
    "Use when adopting or changing accounting policies, accounting for changes in "
    "estimates, and correcting prior-period errors under IAS 8 / IFRS for SMEs "
    "Section 10, including material errors discovered after close.")


def fixture_cases():
    cases = []
    for path in sorted(FIXTURE_DIR.glob("*.json")):
        data = json.loads(path.read_text(encoding="utf-8"))
        if isinstance(data, dict) and "cases" in data:
            cases.extend(data["cases"])
    return cases


class LiveFixtureExecutionTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.skills = proxy.load_skills()
        cls.index = proxy.Index(cls.skills)

    def test_every_skill_is_indexed(self):
        on_disk = len(list((ROOT / "skills").glob("*/*/SKILL.md")))
        self.assertEqual(len(self.skills), on_disk)
        self.assertGreaterEqual(on_disk, 108)

    def test_every_labelled_case_ranks_its_expected_skill_first_by_the_margin(self):
        cases = fixture_cases()
        self.assertGreaterEqual(len(cases), 7)
        for case in cases:
            self.assertIn(case["expected_skill"], self.skills, case["id"])
        failed = [r for r in proxy.evaluate(cases, self.index) if not r["ok"]]
        self.assertEqual(failed, [], failed)

    def test_status_does_not_claim_live_routing(self):
        for path in FIXTURE_DIR.glob("*.json"):
            data = json.loads(path.read_text(encoding="utf-8"))
            if isinstance(data, dict) and "cases" in data:
                self.assertIn("not live model routing", data["status"], path.name)


class NegativeControlTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.skills = proxy.load_skills()
        cls.cases = fixture_cases()

    def test_a_mislabelled_case_is_reported(self):
        index = proxy.Index(self.skills)
        wrong = [{"id": "mislabelled", "label": "positive", "expected_skill": "ifrs-leases",
                  "query": "A material prior-period posting error was found after close."}]
        result = proxy.evaluate(wrong, index)[0]
        self.assertFalse(result["ok"])
        self.assertLess(result["margin"], 0)

    def test_the_description_before_a5_is_caught_as_a_fragile_route(self):
        skills = dict(self.skills)
        skills[TARGET] = DESCRIPTION_BEFORE_A5
        results = {r["id"]: r for r in proxy.evaluate(self.cases, proxy.Index(skills))}
        thin = results["positive-material-error-after-close"]
        self.assertFalse(thin["ok"], thin)
        self.assertLess(thin["margin"], proxy.MIN_MARGIN)

    def test_a_description_that_drops_the_target_vocabulary_breaks_the_route(self):
        skills = dict(self.skills)
        skills[TARGET] = "Use when planning a team offsite."
        results = proxy.evaluate(self.cases, proxy.Index(skills))
        target_positives = [r for r in results if r["label"] == "positive" and r["expected"] == TARGET]
        self.assertEqual(len(target_positives), 3)
        self.assertTrue(all(not r["ok"] for r in target_positives), target_positives)
        others = [r for r in results if r["expected"] != TARGET]
        self.assertTrue(all(r["ok"] for r in others), [r for r in others if not r["ok"]])


if __name__ == "__main__":
    unittest.main()
