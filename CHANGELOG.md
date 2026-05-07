# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- **Slack** sidebar themes (`slack/designless-dark`, `slack/designless-light`, `slack/README.md`); documented as a Designless target alongside Makefile-installed themes
- `.gitignore` rule for `.DS_Store` (macOS folder metadata)
- Makefile for automated theme installation, backup, and restoration
- XDG_CONFIG_HOME support with fallback to `~/.config`
- `make env-light` and `make env-dark` targets for shell environment exports
- Linting configuration (.markdownlintrc.json, .yamllint)
- GitHub Actions CI workflows (lint, validate, test)
- EditorConfig for consistent editor settings
- CONTRIBUTING.md with Conventional Commits guidelines

### Changed

- Updated documentation to reflect all 13 themes as complete
- Reorganized ARCHITECTURE.md to show complete project structure

### Fixed

- iTerm2 path handling in Makefile (paths with spaces)
- Separator character in Makefile MAPS variable (from `|` to `%`)

## [0.0.1] - 2026-05-06

### Added

- Initial release: 13 complete Designless themes
- **VS Code**: Dark and light color themes (packaged as .vsix)
- **Terminal Emulators**: Ghostty, iTerm2, Kitty, WezTerm, Alacritty
- **TUI Tools**: tmux, delta, eza, lazygit, fzf
- **Editors**: Neovim (Lua), Vim (Vimscript)
- Shared color palette definitions (JSON)
- Installation guide (README.md)
- Architecture documentation (docs/ARCHITECTURE.md)
- Target inventory and status (docs/TARGETS.md)

[Unreleased]: https://github.com/mamercad/designless/compare/v0.0.1...HEAD
[0.0.1]: https://github.com/mamercad/designless/releases/tag/v0.0.1
