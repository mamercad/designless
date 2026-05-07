# Designless — Quick Reference

## What You Get

**Makefile-deployed targets**: 12 tools (24 theme files). **Slack** is a separate manual theme (paste strings from `slack/`). Together, **14** theme targets in light and dark variants:

### Terminal Emulators (5 targets)

- **Ghostty** — complete
- **iTerm2** — complete
- **Kitty** — complete
- **WezTerm** — complete
- **Alacritty** — complete

### Terminal Multiplexers & Tools (5 targets)

- **tmux** — complete
- **delta** (git diff) — complete
- **eza** (ls replacement) — complete
- **lazygit** (git UI) — complete
- **fzf** (fuzzy finder) — complete

### Editors (3 targets)

- **VS Code** — complete and packaged as `.vsix`
- **Neovim** — complete
- **Vim** — complete

### Apps (1 target)

- **Slack** — sidebar custom theme strings; see [slack/README.md](slack/README.md) (not copied by `make install`)

---

## Repository Layout

```text
designless/
├── colors/                 # Shared palette (source of truth)
│   ├── designless-light.json
│   └── designless-dark.json
├── vscode/                 # VS Code extension
├── terminal/               # Terminal emulators
│   ├── ghostty/
│   ├── iterm2/
│   ├── kitty/
│   ├── wezterm/
│   └── alacritty/
├── tmux/                   # Terminal multiplexer
├── delta/                  # Git diff viewer
├── eza/                    # ls replacement
├── fzf/                    # Fuzzy finder
├── lazygit/                # Git UI
├── neovim/                 # Neovim colorscheme
├── vim/                    # Vim colorscheme
├── slack/                  # Slack sidebar themes (manual paste)
└── docs/
    ├── ARCHITECTURE.md     # Multi-target design guide
    └── TARGETS.md          # Complete inventory and status
```

---

## Installation

See [README.md](README.md) for full installation instructions. `make install` does not modify Slack; use [slack/README.md](slack/README.md) for sidebar themes.

```bash
cd /path/to/designless
make backup      # Snapshot existing config
make install     # Deploy all 24 Designless theme files
```

To install only one variant:

```bash
make install-light
make install-dark
```

To apply shell environment exports for the active variant:

```bash
eval "$(make env-light)"
# or
eval "$(make env-dark)"
```

---

## Per-Tool Activation

`make install` copies theme files but does not activate them. See the [README.md](README.md) Post-Installation Setup table for per-tool activation steps.

---

*Last updated: 2026-05-07*
