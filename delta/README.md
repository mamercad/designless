# delta Theme

Git diff viewer theme for Designless.

## Installation

`make install` deploys the theme files automatically. To activate, add to `~/.gitconfig`:

```ini
[include]
    path = ~/.config/delta/themes/designless-dark.gitconfig

[delta]
    features = designless-dark
```

For the light variant:

```ini
[include]
    path = ~/.config/delta/themes/designless-light.gitconfig

[delta]
    features = designless-light
```

## Files

- `designless-light.gitconfig` — Light variant
- `designless-dark.gitconfig` — Dark variant

## Colors

Derived from [`../colors/designless-light.json`](../colors/designless-light.json) and
[`../colors/designless-dark.json`](../colors/designless-dark.json).

---

*Last updated: 2026-05-07*
