# lazygit Theme

Git UI theme for Designless.

## Installation

Add to `~/.config/lazygit/config.yml`:

```yaml
gui:
  theme:
    activeBorderColor:
      - "#FF4719"
      - bold
    # ... (see designless-light.yml / designless-dark.yml for full theme definition)
```

Or include a separate theme file:

```yaml
gui:
  theme: "#(cat ~/.config/lazygit/themes/designless-light.yml)"
```

## Colors

Generated from [`../colors/designless-light.json`](../colors/designless-light.json) and [`../colors/designless-dark.json`](../colors/designless-dark.json).

## Status

✅ Complete.

---

*Last updated: 2026-05-05*
