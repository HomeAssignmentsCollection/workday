# Git Hooks

This directory contains example Git hook scripts for this repository.

## What are Git Hooks?
Git hooks are scripts that run automatically at certain points in the Git workflow, such as before a commit or push. They can be used to enforce code quality, run tests, format code, or automate documentation updates.

## Usage

- The files in this directory are templates. To activate a hook, copy the desired script to `.git/hooks/` and make it executable.
- Example:
  ```bash
  cp git_hooks/pre-commit .git/hooks/
  chmod +x .git/hooks/pre-commit
  ```
- Hooks will then run automatically at the corresponding Git event (e.g., `pre-commit` runs before every commit).

## Recommended Workflow

- Use pre-commit hooks to run linting, formatting, and tests before every commit.
- Example tools: `flake8`, `black`, `pytest`, `isort`.
- You can also use hooks to auto-generate or update documentation.

## Example: Manual Hook Run
You can run all hooks manually without committing:
```bash
bash git_hooks/pre-commit
```

## Integration with pre-commit Framework
For more advanced management, consider using the [pre-commit](https://pre-commit.com/) framework. It allows you to define hooks in a `.pre-commit-config.yaml` file and manage them with a single command:

```bash
pre-commit install
pre-commit run -a
```

## Static Code Analysis Tools

### Python
- flake8: `flake8 .`
- pylint: `pylint your_module.py`
- mypy: `mypy .`
- bandit: `bandit -r .`
- black: `black --check .`
- isort: `isort --check-only .`

### Bash
- shellcheck: `shellcheck scripts/*.sh`
- shfmt: `shfmt -d scripts/`

### YAML
- yamllint: `yamllint .`

### Terraform/HCL
- tflint: `tflint`
- terraform fmt: `terraform fmt -check`
- terraform validate: `terraform validate`

## Useful Links
- [Git Hooks Documentation](https://git-scm.com/docs/githooks)
- [pre-commit Framework](https://pre-commit.com/)
- [ShellCheck](https://www.shellcheck.net/)
- [yamllint](https://yamllint.readthedocs.io/)
- [tflint](https://github.com/terraform-linters/tflint)
- [Bandit](https://bandit.readthedocs.io/)
- [Black](https://black.readthedocs.io/)
- [isort](https://pycqa.github.io/isort/)
