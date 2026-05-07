# eza Theme

ls replacement theme for Designless.

## Installation

`make install` deploys the theme files automatically. To activate, set `EZA_CONFIG_DIR` in your shell rc:

```bash
# Light variant
export EZA_CONFIG_DIR=~/.config/eza/light

# Dark variant
export EZA_CONFIG_DIR=~/.config/eza/dark
```

Or use the Designless env exports:

```bash
eval "$(make env-light)"
# EZA_CONFIG_DIR is included automatically
```

## Files

- `light/theme.yml` — Light variant
- `dark/theme.yml` — Dark variant

## Colors

Derived from [`../colors/designless-light.json`](../colors/designless-light.json) and
[`../colors/designless-dark.json`](../colors/designless-dark.json).

---

*Last updated: 2026-05-07*
