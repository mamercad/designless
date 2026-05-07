# Designless — Quick Reference

## What You "Skin"

All 13 themeable tools in your workstation, now with Designless directory stubs:

### Terminal Emulators (5 targets)
- **Ghostty** — ✅ Complete
- **iTerm2** — ✅ Complete
- **Kitty** — ✅ Complete
- **WezTerm** — ✅ Complete
- **Alacritty** — ✅ Complete

### Terminal Multiplexers & Tools (5 targets)
- **tmux** — ✅ Complete
- **delta** (git diff) — ✅ Complete
- **eza** (ls replacement) — ✅ Complete
- **lazygit** (git UI) — ✅ Complete
- **fzf** (fuzzy finder) — ✅ Complete

### Editors (3 targets)
- **VS Code** — ✅ Complete & packaged
- **Neovim** — ✅ Complete
- **Vim** — ✅ Complete

---

## Repository Layout

```
designless/
├── colors/                 # Shared palette (source of truth)
│   ├── designless-light.json
│   └── designless-dark.json
├── vscode/                 # ✅ VS Code extension
├── terminal/               # Terminal emulators
│   ├── ghostty/            # ✅
│   ├── iterm2/             # ✅
│   ├── kitty/              # ✅
│   ├── wezterm/            # ✅
│   └── alacritty/          # ✅
├── tmux/                   # ✅ Terminal multiplexer
├── delta/                  # ✅ Git diff
├── eza/                    # ✅ ls replacement
├── fzf/                    # ✅ Fuzzy finder
├── lazygit/                # ✅ Git UI
├── neovim/                 # ✅ Neovim
├── vim/                    # ✅ Vim
└── docs/
    ├── architecture.md     # Multi-target design guide
    └── TARGETS.md          # Complete inventory & status
```

---

## How to Use

### Installation

All 13 themes are complete. See [README.md](README.md) for full installation and configuration instructions using `make`.

### Deployment

```bash
cd /path/to/designless
make backup      # Snapshot existing config
make install     # Deploy all 24 Designless theme files
```

See `make env-light` or `make env-dark` to print shell environment exports for each variant.

### Per-Tool Configuration

After installation, configure each tool to use the Designless theme. See [README.md](README.md) **Post-Installation Setup** table for per-tool activation steps.

---

## Next Steps

1. **Implement tmux** — Terminal multiplexer theme
2. **Implement delta** — Git diff colors
3. **Implement eza** — ls replacement theme
4. **Implement lazygit/fzf** — Shell workflow polish
5. **Implement Neovim** — Editor colorscheme

See [docs/TARGETS.md](docs/TARGETS.md) for full development priorities and automation roadmap.

---

*Last updated: 2026-05-05*
