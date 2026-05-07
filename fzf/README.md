# fzf Theme

Fuzzy finder theme for Designless.

## Installation

Add to your shell rc file (`~/.zshrc`, `~/.bashrc`, etc.):

```sh
export FZF_DEFAULT_OPTS="--color=light:designless-light"
# or: export FZF_DEFAULT_OPTS="--color=dark:designless-dark"
```

Or inline the colors:

```sh
export FZF_DEFAULT_OPTS="
  --color=bg:#FFFFFF,fg:#111111
  --color=hl:#FF4719
  # ... (see designless-light / designless-dark for full color set)
"
```

## Colors

Generated from [`../colors/designless-light.json`](../colors/designless-light.json) and [`../colors/designless-dark.json`](../colors/designless-dark.json).

## Status

✅ Complete.

---

*Last updated: 2026-05-05*
