# Contributing to Designless

Thank you for your interest in contributing to Designless! This guide covers development workflow, commit conventions, and code quality standards.

## Commit Messages

This project follows [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/). Commit messages should follow this structure:

```text
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

### Types

- **feat**: A new feature or theme target
- **fix**: Bug fixes or corrections
- **docs**: Documentation updates (README, architecture, guides)
- **style**: Code style, formatting, linting configuration
- **refactor**: Code refactoring without feature changes
- **test**: Adding or updating tests (CI workflows, validation)
- **chore**: Build system, dependencies, tooling
- **ci**: GitHub Actions or CI configuration

### Examples

```text
feat: add kitty terminal theme

docs: update installation instructions for XDG_CONFIG_HOME

fix: correct iTerm2 path handling in Makefile

style: configure editorconfig and linting rules

ci: add GitHub Actions workflows for lint and validation
```

### Scope (Optional)

Scope can indicate which tool or component is affected:

```text
feat(vscode): add color token definitions

fix(makefile): handle paths with spaces in iterm2 install

docs(architecture): update target structure diagram
```

## Development Workflow

### Before You Start

1. Fork the repository
2. Clone your fork: `git clone <your-fork-url>`
3. Create a feature branch: `git checkout -b feat/your-feature`

### Local Setup

```bash
# Install linting tools
brew install yamllint
npm install -g markdownlint-cli2

# Run linting locally
make lint
```

### Making Changes

1. **Update theme files** in the appropriate `<tool>/` directory
2. **Reference shared colors** from `colors/designless-light.json` or `colors/designless-dark.json`
3. **Test your changes** locally before committing
4. **Update documentation** if needed (README.md, tool-specific README, etc.)

### Testing

```bash
# Test Makefile targets
make -n install
make -n install-light
make env-light

# Validate configuration files
make lint
make lint-json
make lint-yaml
make lint-md
```

### Commit and Push

1. Stage your changes: `git add .`
2. Commit with conventional message: `git commit -m "feat(tool): description"`
3. Push to your fork: `git push origin feat/your-feature`
4. Open a pull request on the main repository

## Code Quality Standards

### Linting

All pull requests must pass CI linting checks:

- **JSON**: Valid syntax (checked with `jq`)
- **YAML**: Valid syntax and style (checked with `yamllint`)
- **Markdown**: Consistent formatting (checked with `markdownlint`)

Run these locally before pushing:

```bash
make lint           # Run all linting checks
```

### Documentation

- Update relevant tool README if adding a new theme
- Update [docs/TARGETS.md](docs/TARGETS.md) if changing target status
- Update [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) if changing project structure
- Update [CHANGELOG.md](CHANGELOG.md) with your changes (in the "Unreleased" section)

### Color Consistency

All themes must use colors from `colors/designless-light.json` or `colors/designless-dark.json`. Do not introduce new colors outside the shared palette without updating both JSON files and documenting the change. When palette values change, update **slack/** theme strings and [slack/README.md](slack/README.md) if any mapped slot uses those keys.

## Pull Request Process

1. Ensure all CI checks pass (lint, validate, test)
2. Update documentation and CHANGELOG.md
3. Provide a clear description of your changes
4. Link related issues if applicable
5. Request review from maintainers

## Reporting Issues

When reporting issues or proposing changes:

- Check existing issues and pull requests first
- Provide clear, specific examples
- Include your environment (OS, tool versions) if relevant
- Use descriptive titles and descriptions

## License

By contributing, you agree that your contributions will be licensed under the same MIT license as the project.

---

Questions? Open an issue or reach out to the maintainers.
