import re
import unittest
from pathlib import Path

ROOT = Path(__file__).parents[1]
EXAMPLE = ROOT / "skills/03-ifrs-specialised-standards/ifrs-accounting-policies-changes-errors-ias8/examples/worked-example.md"


class Section10AfterCloseExampleTests(unittest.TestCase):
    def test_correction_journals_balance_and_reporting_layer_is_named(self):
        text = EXAMPLE.read_text(encoding="utf-8")
        self.assertIn("## Material error discovered after close", text)
        self.assertIn("the original journal is not updated or deleted", text.lower())
        self.assertIn("IFRS for SMEs, Section 10", text)
        self.assertIn("paragraphs 10.19–10.23", text)
        self.assertIn("materiality assessment", text)
        self.assertIn("financial-statement treatment is distinct", text)
        self.assertIn("three open-period journals together net", text)
        self.assertIn("any open-period journal", text)

        rows = [
            line for line in text.splitlines()
            if line.startswith("|")
            and any(label in line for label in (
                "Original posting",
                "Reversal",
                "Corrected posting",
                "Current-period profit normalisation",
            ))
        ]
        self.assertEqual(len(rows), 4)
        for row in rows:
            amounts = [int(value.replace(",", "")) for value in re.findall(r"\b[0-9]{1,3}(?:,[0-9]{3})+\b", row)]
            self.assertEqual(amounts, [100000, 100000], row)


if __name__ == "__main__":
    unittest.main()
