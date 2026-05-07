# fzf Theme

Fuzzy finder theme for Designless.

## Installation

`make install` deploys the theme files automatically. To activate, source the file from your shell rc:

```bash
# In ~/.zshrc or ~/.bashrc
source ~/.config/fzf/designless-dark
# or: source ~/.config/fzf/designless-light
```

Or use the Designless env exports, which set `FZF_DEFAULT_OPTS_FILE`:

```bash
eval "$(make env-dark)"
```

## Files

- `designless-light` — Light variant color options
- `designless-dark` — Dark variant color options

## Colors

Derived from [`../colors/designless-light.json`](../colors/designless-light.json) and
[`../colors/designless-dark.json`](../colors/designless-dark.json).

---

*Last updated: 2026-05-07*
