# Designless Targets Manifest

Complete inventory of all Designless theme implementations, current status, and development priorities.

## Summary

| Category | Count | Statuses |
|----------|-------|----------|
| VS Code & Editors | 3 | 3 complete |
| Terminal Emulators | 5 | 5 complete |
| TUI Tools | 5 | 5 complete |
| **Total** | **13** | 13 complete |

---

## Targets by Category

### VS Code & Editors

| Target | Files | Status | Priority | Notes |
|--------|-------|--------|----------|-------|
| **VS Code** | `designless-light-color-theme.json`, `designless-dark-color-theme.json` | ✅ Complete | — | Packaged as `.vsix`; ready for install/test |
| **Neovim** | `colors/designless-light.lua`, `colors/designless-dark.lua` | ✅ Complete | High | Standalone Lua colorschemes for LazyVim |
| **Vim** | `colors/designless-light.vim`, `colors/designless-dark.vim` | ✅ Complete | Medium | Vimscript color scheme |

### Terminal Emulators

| Target | Files | Status | Priority | Notes |
|--------|-------|--------|----------|-------|
| **Ghostty** | `designless-light`, `designless-dark` | ✅ Complete | High | GPU-accelerated; config format `~/.config/ghostty/themes/` |
| **iTerm2** | `designless-light.itermcolors`, `designless-dark.itermcolors`, Dynamic Profiles | ✅ Complete | High | Color presets + dynamic profiles for macOS |
| **Kitty** | `designless-light.conf`, `designless-dark.conf` | ✅ Complete | Medium | GPU-based terminal; conf format |
| **WezTerm** | `designless-light.toml`, `designless-dark.toml` | ✅ Complete | Medium | Modern cross-platform terminal |
| **Alacritty** | `designless-light.yml`, `designless-dark.yml` | ✅ Complete | Low | GPU-accelerated; YAML config |

### TUI Tools

| Target | Files | Status | Priority | Notes |
|--------|-------|--------|----------|-------|
| **tmux** | `designless-light.conf`, `designless-dark.conf` | ✅ Complete | High | Terminal multiplexer |
| **delta** | `designless-light.gitconfig`, `designless-dark.gitconfig` | ✅ Complete | High | Git diff viewer; gitconfig format |
| **eza** | `designless-light/theme.yml`, `designless-dark/theme.yml` | ✅ Complete | High | ls replacement; YAML config |
| **lazygit** | `designless-light.yml`, `designless-dark.yml` | ✅ Complete | High | Git UI; YAML config |
| **fzf** | `designless-light`, `designless-dark` | ✅ Complete | Medium | Fuzzy finder; env var color opts |

---

## Development Workflow

### For Each Target

1. **Source colors** from `colors/designless-light.json` and `colors/designless-dark.json`
2. **Create target-specific config files** in `<target>/` directory
3. **Add installation instructions** to `<target>/README.md`
4. **Validate** that colors render correctly in the actual tool
5. **Document switching** between light/dark (if applicable)

### Automation Opportunities

- **Color transformation script** to generate all target formats from `colors/*.json` (not yet implemented)
- **CI/CD validation** to check all config files syntax before merge
- **Installation script** to symlink/copy theme files to correct system locations

### Testing Strategy

1. Install theme to personal workstation
2. Test light → dark switching (macOS appearance)
3. Verify ANSI colors in terminal output
4. Check syntax highlighting / special UI elements
5. Screenshot for documentation / visual regression testing

---

## Installation Priority (Recommended Order)

### Phase 1 (High Priority — Personal Workflow)
1. VS Code — already complete ✅
2. Ghostty or iTerm2 — choose primary terminal
3. tmux — terminal multiplexing
4. delta — git integration
5. eza — file listing
6. Neovim — primary editor

### Phase 2 (Medium Priority — Extended Tools)
7. lazygit — git UI
8. fzf — fuzzy finding
9. Vim — secondary editor

### Phase 3 (Low Priority — Alternative/Future)
10. Kitty, WezTerm, Alacritty — alternative terminals
11. Advanced tooling (TBD)

---

## Architecture Notes

All targets reference shared color definitions in `colors/`:
- `designless-light.json` — palette, semanticTokens, terminal ANSI colors for light mode
- `designless-dark.json` — palette, semanticTokens, terminal ANSI colors for dark mode

When the shared palette changes, **all targets must be regenerated** to stay in sync.

Recommended approach:
- Single source-of-truth color JSON files
- Build/transform script to generate target-specific configs
- Version lock: when palette updates, version bump entire repo

---

*Last updated: 2026-05-05*
