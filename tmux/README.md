# tmux Theme

Terminal multiplexer configuration for Designless.

## Installation

Copy the theme configuration to your `~/.config/tmux/tmux.conf` or source it from there.

## Light/Dark Switching

To automatically follow macOS appearance changes:

```sh
# In ~/.config/tmux/tmux.conf
if-shell 'test "$(defaults read -g AppleInterfaceStyle 2>/dev/null || echo Light)" = "Light"' \
  'source ~/.config/tmux/designless-light.conf' \
  'source ~/.config/tmux/designless-dark.conf'
```

## Colors

Generated from [`../colors/designless-light.json`](../colors/designless-light.json) and [`../colors/designless-dark.json`](../colors/designless-dark.json).

## Status

✅ Complete.

---

*Last updated: 2026-05-05*
