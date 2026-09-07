import importlib.util
from pathlib import Path
import tempfile
import unittest

SPEC = importlib.util.spec_from_file_location('frontmatter_gate', Path(__file__).resolve().parents[1] / 'tools/check_frontmatter_yaml.py')
GATE = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(GATE)


class FrontmatterTests(unittest.TestCase):
    def test_empty_catalogue_fails(self):
        with tempfile.TemporaryDirectory() as temp:
            self.assertEqual('fail', GATE.validate(Path(temp))['state'])

    def test_colon_requires_quoting_and_identity_must_match(self):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            skill = root / 'skills/group/demo/SKILL.md'
            skill.parent.mkdir(parents=True)
            for header, expected in (
                ('name: demo\ndescription: Use when testing: syntax', 'fail'),
                ('name: demo\ndescription: "Use when testing: syntax"', 'pass'),
                ('name: other\ndescription: Valid words', 'fail'),
                ('- not a mapping', 'fail'),
                ('name: demo\ndescription: []', 'fail'),
            ):
                with self.subTest(header=header):
                    skill.write_text('---\n' + header + '\n---\n# Demo\n', encoding='utf-8')
                    self.assertEqual(expected, GATE.validate(root)['state'])


if __name__ == '__main__':
    unittest.main()
