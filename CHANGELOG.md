# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.1.0] - 2026-05-07

### Added

- **Solid + logo wallpapers**: `wallpapers/solid-logo/{light,dark}/` (256 PNGs) — same fills as `wallpapers/solid/` with centered wordmark; generator `wallpapers/scripts/generate_solid_logo_wallpapers.py` and `make wallpapers-solid-logo`

### Changed

- **Logotype**: Inter (minimal sans) for `assets/logo-*.svg` and nav/footer logos on the marketing page; `.cloud` label inside the orange cursor, baseline-aligned with `designless`
- **Marketing site** (`assets/index.html`): loads Inter for logos; eyebrow version **v1.1.0**

## [1.0.0] - 2026-05-07

First stable release of the Designless theme system across editors, terminals, TUIs, and Slack.

### Added

- **VS Code** extension (published `.vsix` on GitHub Releases for semver tags)
- **Terminal emulators**: Ghostty, iTerm2, Kitty, WezTerm, Alacritty
- **TUI tools**: tmux, delta, eza, lazygit, fzf
- **Editors**: Neovim (Lua), Vim (Vimscript)
- **Slack** sidebar custom themes (`slack/`)
- Shared palettes in `colors/designless-light.json` and `colors/designless-dark.json`
- `Makefile` install targets with backup/restore and `env-light` / `env-dark`
- `.gitignore` for `.DS_Store`
- Linting (Markdown, YAML, JSON), VS Code theme validation, Makefile CI

### Changed

- Documentation and target inventory updated for **14** theme surfaces (Makefile-deployed targets plus manual Slack)

### Fixed

- iTerm2 path handling in Makefile (paths with spaces)
- Makefile `MAPS` delimiter (`%` instead of `|`)

## [0.0.1] - 2026-05-06

Early snapshot before stable versioning.

### Added

- Initial Designless themes across VS Code, terminals, TUIs, and editors
- Shared color palette definitions (JSON)
- Installation guide (README.md), architecture docs (docs/ARCHITECTURE.md), target manifest (docs/TARGETS.md)

[Unreleased]: https://github.com/mamercad/designless/compare/v1.1.0...HEAD
[1.1.0]: https://github.com/mamercad/designless/releases/tag/v1.1.0
[1.0.0]: https://github.com/mamercad/designless/releases/tag/v1.0.0
[0.0.1]: https://github.com/mamercad/designless/releases/tag/v0.0.1
