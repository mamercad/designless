# Designless Targets Manifest

Complete inventory of all Designless theme implementations and their status.

## Summary

| Category | Count | Status |
|----------|-------|--------|
| VS Code & Editors | 3 | 3 complete |
| Terminal Emulators | 5 | 5 complete |
| TUI Tools | 5 | 5 complete |
| Apps | 1 | 1 complete |
| Hermes Agent CLI | 1 | 1 complete |
| **Total** | **15** | **15 complete** |

The Makefile installs terminal, TUI, and editor artifacts only (**24 files**, **12 tools**). **Slack** is documented and versioned under `slack/` but applied manually in the Slack desktop app (paste theme string).

---

## Targets by Category

### VS Code & Editors

| Target | Files | Notes |
|--------|-------|-------|
| **VS Code** | `designless-light-color-theme.json`, `designless-dark-color-theme.json` | Packaged as `.vsix` |
| **Neovim** | `colors/designless-light.lua`, `colors/designless-dark.lua` | Standalone Lua colorschemes |
| **Vim** | `colors/designless-light.vim`, `colors/designless-dark.vim` | Vimscript colorscheme |

### Apps

| Target | Files | Notes |
|--------|-------|-------|
| **Slack** | `designless-dark`, `designless-light` | Sidebar **Custom theme** (10 hex values per variant); see [slack/README.md](../slack/README.md); not deployed by `make install` |

### Hermes Agent CLI

| Target | Files | Notes |
|--------|-------|-------|
| **Hermes Agent** | `hermes/designless-light.yaml`, `hermes/designless-dark.yaml` | CLI skin YAML; copy to `~/.hermes/skins/`; activate via `/skin designless-dark` or `hermes config set display.skin designless-dark` |

### Terminal Emulators

| Target | Files | Notes |
|--------|-------|-------|
| **Ghostty** | `designless-light`, `designless-dark` | GPU-accelerated; `~/.config/ghostty/themes/` |
| **iTerm2** | `*.itermcolors`, `*.json` (Dynamic Profiles) | Color presets and dynamic profiles for macOS |
| **Kitty** | `designless-light.conf`, `designless-dark.conf` | GPU-based terminal |
| **WezTerm** | `designless-light.toml`, `designless-dark.toml` | Modern cross-platform terminal |
| **Alacritty** | `designless-light.yml`, `designless-dark.yml` | GPU-accelerated; YAML config |

### TUI Tools

| Target | Files | Notes |
|--------|-------|-------|
| **tmux** | `designless-light.conf`, `designless-dark.conf` | Terminal multiplexer |
| **delta** | `designless-light.gitconfig`, `designless-dark.gitconfig` | Git diff viewer; gitconfig format |
| **eza** | `light/theme.yml`, `dark/theme.yml` | ls replacement; YAML config |
| **lazygit** | `designless-light.yml`, `designless-dark.yml` | Git UI; YAML config |
| **fzf** | `designless-light`, `designless-dark` | Fuzzy finder; env var color opts |

---

## Development Workflow

### For Each Target

1. Source colors from `colors/designless-light.json` and `colors/designless-dark.json`
2. Create target-specific config files in `<target>/` directory
3. Add installation instructions to `<target>/README.md`
4. Validate that colors render correctly in the actual tool
5. Document how to switch between light and dark

### Architecture

All targets reference shared color definitions in `colors/`:

- `designless-light.json` — palette, semanticTokens, terminal ANSI colors for light mode
- `designless-dark.json` — palette, semanticTokens, terminal ANSI colors for dark mode

When the shared palette changes, all targets must be updated to stay in sync (including comma-separated strings in `slack/`).

See [ARCHITECTURE.md](ARCHITECTURE.md) for the full design guide.

---

*Last updated: 2026-05-07*
