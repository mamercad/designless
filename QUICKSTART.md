# Designless — Quick Reference

## What You Get

All 13 themeable tools in your terminal workstation, covered in both light and dark variants:

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
└── docs/
    ├── ARCHITECTURE.md     # Multi-target design guide
    └── TARGETS.md          # Complete inventory and status
```

---

## Installation

All 13 themes are complete. See [README.md](README.md) for full installation instructions.

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
