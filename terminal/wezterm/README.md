# WezTerm Theme

WezTerm terminal emulator theme for Designless.

## Installation

`make install` deploys the theme files automatically. To activate, reference the scheme in
`~/.config/wezterm/wezterm.lua`:

```lua
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'designless-dark'
-- or: config.color_scheme = 'designless-light'

return config
```

## Files

- `designless-light.toml` — Light variant
- `designless-dark.toml` — Dark variant

## Colors

Derived from [`../../colors/designless-light.json`](../../colors/designless-light.json) and
[`../../colors/designless-dark.json`](../../colors/designless-dark.json).

---

*Last updated: 2026-05-07*
