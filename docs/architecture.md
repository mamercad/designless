# Designless Multi-Target Architecture

Designless is a design system for building cohesive themes across multiple platforms and applications. This document describes the repository structure and how to add new targets.

## Structure

```
designless/
├── colors/                    # Shared color definitions (source of truth)
│   ├── designless-light.json
│   └── designless-dark.json
├── vscode/                    # VS Code extension
│   ├── package.json
│   ├── themes/
│   ├── scripts/
│   ├── .vscode/
│   └── README.md
├── terminal/                  # Terminal emulators
│   ├── ghostty/              # Ghostty theme
│   ├── iterm2/               # iTerm2 theme
│   ├── kitty/                # Kitty terminal theme
│   ├── wezterm/              # WezTerm theme
│   ├── alacritty/            # Alacritty theme
│   └── README.md
├── tmux/                      # tmux configuration
│   ├── colors/
│   └── README.md
├── delta/                     # delta (git diff) themes
│   └── README.md
├── eza/                       # eza (ls replacement) themes
│   ├── light/
│   ├── dark/
│   └── README.md
├── lazygit/                   # lazygit color themes
│   └── README.md
├── fzf/                       # fzf color themes
│   └── README.md
├── neovim/                    # Neovim color scheme
│   ├── colors/
│   └── README.md
├── vim/                       # Vim color scheme
│   ├── colors/
│   └── README.md
├── Makefile                   # Installation automation
├── docs/
│   ├── architecture.md        # This file
│   └── TARGETS.md             # Complete inventory
├── README.md                  # Top-level guide
└── LICENSE.txt
```

## Adding a New Target (Future)

All 13 primary targets are complete. This section documents the process for adding new targets in the future.

### 1. Create Target Directory

```bash
mkdir -p <target>
cd <target>
```

### 2. Reference Shared Colors

The `colors/designless-light.json` and `colors/designless-dark.json` files define:
- **palette**: Core color values (foreground, background, muted, accent, etc.)
- **semanticTokens**: Syntax highlighting colors (comment, string, keyword, type, function, etc.)
- **terminal**: ANSI 16-color set for terminal applications

Example reference in `colors/designless-light.json`:
```json
{
  "palette": {
    "foreground": "#111111",
    "background": "#FFFFFF",
    "muted": "#6B6560",
    "accent": "#FF4719"
  }
}
```

### 3. Transform to Target Format

Write a script or configuration file that consumes the shared color JSON and generates the target-specific format. For example:

**For Ghostty:**
```yaml
# ghostty/designless-light.toml
palette = {
  background = "#FFFFFF"
  foreground = "#111111"
  cursor-color = "#FF4719"
  # ... map remaining colors
}
```

**For Neovim:**
```lua
-- neovim/colors/designless-light.lua
vim.g.colors_name = "designless-light"
local palette = require("designless.palette")
vim.api.nvim_set_hl(0, "Normal", { fg = palette.foreground, bg = palette.background })
-- ...
```

### 4. Create Target README

Each target should have a `README.md` explaining:
- Installation instructions
- Development workflow
- How to test locally
- Reference to the shared color definitions

## Color Palette Reference

### Light Theme (`colors/designless-light.json`)
- **Foreground**: `#111111` (warm near-black)
- **Background**: `#FFFFFF` (pure white)
- **Muted**: `#6B6560` (warm gray for secondary text)
- **Accent**: `#FF4719` (molten orange, reserved for focus/active)
- **Error**: `#C0000A` (red for errors/warnings)

### Dark Theme (`colors/designless-dark.json`)
- **Foreground**: `#E5DDD0` (warm off-white)
- **Background**: `#090807` (near-black with warmth)
- **Muted**: `#5A5248` (warm gray for secondary text)
- **Accent**: `#FF4719` (same molten orange)
- **Error**: `#FF6B5B` (lighter red for dark mode)

## Design Principles

1. **Warm Monochrome First**: Base palette uses only warm grays and blacks.
2. **Accent Scarcity**: Orange (#FF4719) is reserved for active, focused, or critical states only.
3. **Structure Over Decoration**: Syntax colors clarify code structure; they don't add ornament.
4. **Consistency**: All targets render the same visual hierarchy using the shared palette.

## Maintenance

When updating the shared color palettes in `colors/designless-light.json` or `colors/designless-dark.json`:

1. Update the color value in the shared JSON file.
2. Regenerate or update all target files (vscode, terminal, neovim, etc.) to use the new value.
3. Test visually across all targets.
4. Commit all changes together to keep the system in sync.

## Validation

Each target may have its own validation script (e.g., `vscode/scripts/validate-theme.mjs`). These should check:
- JSON/YAML/TOML syntax
- Required color keys are present
- Color values are valid hex or named references
- Target-specific constraints (e.g., VS Code theme schema validation)

---

*Last updated: May 5, 2026*
