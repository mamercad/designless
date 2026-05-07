# WezTerm Theme

WezTerm terminal emulator configuration for Designless.

## Installation

Copy theme files to WezTerm config directory and reference in `~/.config/wezterm/wezterm.lua`:

```lua
local config = wezterm.config_builder()
config.color_scheme = "Designless Light"
-- or: config.color_scheme = "Designless Dark"
return config
```

## Colors

Generated from [`../../colors/designless-light.json`](../../colors/designless-light.json) and [`../../colors/designless-dark.json`](../../colors/designless-dark.json).

## Status

✅ Complete.

---

*Last updated: 2026-05-05*
