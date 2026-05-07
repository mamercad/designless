# lazygit Theme

Git UI theme for Designless.

## Installation

`make install` deploys the theme files automatically. To activate, merge the theme into
`~/.config/lazygit/config.yml`. Example (dark variant):

```yaml
gui:
  theme:
    activeBorderColor:
      - "#FF4719"
      - bold
    inactiveBorderColor:
      - "#5A5248"
    optionsTextColor:
      - "#6FB3F5"
    selectedLineBgColor:
      - "#1D1A17"
    selectedRangeBgColor:
      - "#1D1A17"
    cherryPickedCommitBgColor:
      - "#5A5248"
    cherryPickedCommitFgColor:
      - "#FF4719"
    unstagedChangesColor:
      - "#FF6B5B"
    defaultFgColor:
      - "#E5DDD0"
```

See `designless-dark.yml` and `designless-light.yml` for the complete definitions.

## Files

- `designless-light.yml` — Light variant
- `designless-dark.yml` — Dark variant

## Colors

Derived from [`../colors/designless-light.json`](../colors/designless-light.json) and
[`../colors/designless-dark.json`](../colors/designless-dark.json).

---

*Last updated: 2026-05-07*
