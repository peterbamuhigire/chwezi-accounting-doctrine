"""Parse active skill frontmatter; field-name matches do not establish valid YAML."""
import argparse
import json
from pathlib import Path
import yaml


def validate(root):
    findings = []
    files = sorted(p for p in (root / 'skills').rglob('SKILL.md') if p.is_file())
    if not files:
        findings.append({'severity': 'high', 'code': 'YAML-EMPTY', 'path': 'skills',
                         'message': 'No active skill files were found'})
    for path in files:
        try:
            lines = path.read_text(encoding='utf-8-sig').splitlines()
            if not lines or lines[0] != '---':
                raise ValueError('Missing opening frontmatter delimiter')
            end = lines.index('---', 1)
            data = yaml.safe_load('\n'.join(lines[1:end]))
            if not isinstance(data, dict):
                raise ValueError('Frontmatter must be a mapping')
            if data.get('name') != path.parent.name:
                raise ValueError('Name must match the skill directory')
            if not isinstance(data.get('description'), str) or not data['description'].strip():
                raise ValueError('Description must be a non-empty string')
        except (OSError, UnicodeError, ValueError, yaml.YAMLError) as exc:
            findings.append({'severity': 'high', 'code': 'YAML-001',
                             'path': path.relative_to(root).as_posix(), 'message': str(exc)})
    return {'check': 'frontmatter-yaml', 'state': 'fail' if findings else 'pass',
            'skills': len(files), 'findings': findings}


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--root', type=Path, default=Path(__file__).resolve().parents[1])
    args = parser.parse_args()
    report = validate(args.root.resolve())
    print(json.dumps(report, ensure_ascii=True))
    raise SystemExit(1 if report['findings'] else 0)
