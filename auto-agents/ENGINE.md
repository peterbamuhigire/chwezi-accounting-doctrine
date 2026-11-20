# chwezi-accounting-doctrine: unattended runner

Installed from the Development engine's canonical `auto-agents` (see `manifest.json` for the version). Update it only with `propagate.py`/`upgrade.py` from that canonical copy; never hand-edit managed files.

Run `./run.ps1` or `run.cmd` from this directory, or `python auto-agents/driver.py check` (read-only).

## Verification profile

Per-slice checks:
- `powershell -NoProfile -ExecutionPolicy Bypass -File tools/validate-doctrine.ps1 -Strict`

Completion-candidate checks:
- `python -B -m unittest discover -s tests`
- `python -B -m unittest discover -s auto-agents/tests`

Defaults: Claude on Opus/medium (model class X); `skills` on demand; `subagents` economy (Explore on Haiku, class M). Fable is never selected unless a human asks. `publish` is false.
