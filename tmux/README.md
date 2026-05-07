# tmux Theme

Terminal multiplexer configuration for Designless.

## Installation

`make install` deploys the theme files automatically. To activate, source the conf from
`~/.config/tmux/tmux.conf`:

```bash
source ~/.config/tmux/designless-dark.conf
# or: source ~/.config/tmux/designless-light.conf
```

## Light/Dark Switching

To automatically follow macOS system appearance:

```bash
# In ~/.config/tmux/tmux.conf
if-shell 'test "$(defaults read -g AppleInterfaceStyle 2>/dev/null || echo Light)" = "Light"' \
  'source ~/.config/tmux/designless-light.conf' \
  'source ~/.config/tmux/designless-dark.conf'
```

## Files

- `designless-light.conf` — Light variant
- `designless-dark.conf` — Dark variant

## Colors

Derived from [`../colors/designless-light.json`](../colors/designless-light.json) and
[`../colors/designless-dark.json`](../colors/designless-dark.json).

---

*Last updated: 2026-05-07*
