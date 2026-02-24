# ResearchProjectTemplate

A practical Python skeleton for research code that prioritizes:

1. **Testing**: unit tests and configurable test tooling.
2. **Reproducibility**: deterministic seeding, stable JSON outputs, and reproducibility checks.
3. **Usability**: clear project layout, simple CLI, and one-command make targets.

## Project layout

```text
.
├── configs/
│   └── default.json
├── scripts/
│   └── check_reproducibility.py
├── src/research_project_template/
│   ├── cli.py
│   ├── config.py
│   └── pipeline.py
├── tests/
├── Makefile
└── pyproject.toml
```

## Quickstart

```bash
make install
make test-static
make test-deterministic
make tests
make tests-all
make run experiment1
make all
```

The run command writes an output file under `outputs/` using the experiment name.
Examples: `make run experiment1`, `make run experiment2`.
The `make all` command runs and reproducibility-checks every config file in `configs/*.json`.

## Manual commands

```bash
# Create environment
python3 -m venv .venv

# Install package + dev tools
./.venv/bin/python -m pip install --upgrade pip
./.venv/bin/python -m pip install -e ".[dev]"

# Run static tests (ruff + mypy)
make test-static

# Run deterministic reproducibility check (default config)
make test-deterministic

# Run normal tests (pytest + deterministic default check)
make tests

# Run all tests (static + normal + deterministic all configs)
make tests-all

# Run a deterministic experiment
PYTHONPATH=src ./.venv/bin/python -m research_project_template.cli --config configs/default.json
```

## Reproducibility conventions in this template

- Configuration lives in versioned JSON files under `configs/`.
- Randomness is controlled via a single config seed.
- Core outputs are JSON-serialized with sorted keys for stable diffs.
- The CLI stores environment metadata (`python`, `git commit`) alongside results.
- `scripts/check_reproducibility.py` validates that two runs produce identical core results.

## Next steps for your own projects

- Replace `pipeline.py` with your real data loading/modeling steps.
- Add integration tests for your end-to-end pipeline.
- Add CI (for example GitHub Actions) that runs `make tests-all` on every PR.
