# Slack Theme

Slack sidebar themes for Designless, built only from the shared palette in
[`colors/designless-dark.json`](../colors/designless-dark.json) and
[`colors/designless-light.json`](../colors/designless-light.json) (including
terminal ANSI greens used for presence).

## Installation

Slack labels each color swatch in the picker. Official flow ([Change your Slack theme](https://slack.com/help/articles/205166337-Change-your-Slack-theme)):

1. From the desktop app, click your **profile picture** → **Preferences**.
2. Click **Appearance**, then **Custom theme**.
3. Paste the comma-separated string into the custom-theme colors field and save, **or** paste it into any conversation and use **Apply Slack theme** on Slack’s generated preview (same workflow as **Share** on an edited theme).

Preset workspace themes live under **Preferences → Themes**; custom colors are under **Appearance → Custom theme** per Slack’s docs.

If you previously used the older four-color sidebar theme, use **Custom theme** → **Import theme** → **Paste your legacy theme colors** (same article).

## Theme strings (current Slack format)

Paste one comma-separated line (ten hex colors), matching Slack’s **Share** output:

### Dark (`designless-dark`)

```text
#090807,#1D1A17,#FF4719,#FFFFFF,#3D3530,#E5DDD0,#5AB87A,#FF6B5B,#1D1A17,#FFFFFF
```

### Light (`designless-light`)

```text
#E8E4DF,#FFFFFF,#FF4719,#FFFFFF,#DDD7D1,#111111,#1E6B3C,#C0000A,#E8E4DF,#FFFFFF
```

## Color mapping

Slack assigns one hex per slot in order (position **1** is first after pasting). Labels below match how third-party theme guides and Slack’s picker describe the slots; **confirm against the labels in Preferences → Appearance → Custom theme**, since Slack may adjust naming in the app.

| Slot | Role (typical) | Dark (`designless-dark`) | Light (`designless-light`) |
|------|----------------|---------------------------|----------------------------|
| 1 | Sidebar / column background | `palette.background` `#090807` | `palette.muted-lightest` `#E8E4DF` |
| 2 | Secondary sidebar / nav tone | `palette.muted-lightest` `#1D1A17` | `palette.background` `#FFFFFF` |
| 3 | Active / selection background | `palette.accent` `#FF4719` | `palette.accent` `#FF4719` |
| 4 | Text on active item | `#FFFFFF` (terminal bright white) | `#FFFFFF` |
| 5 | Hover / inactive row background | `palette.muted-lighter` `#3D3530` | `palette.muted-lighter` `#DDD7D1` |
| 6 | Primary sidebar text | `palette.foreground` `#E5DDD0` | `palette.foreground` `#111111` |
| 7 | Presence (online) | `terminal.ansi.green` `#5AB87A` | `terminal.ansi.green` `#1E6B3C` |
| 8 | Mention / badge | `palette.error` `#FF6B5B` | `palette.error` `#C0000A` |
| 9 | Sidebar chrome (repeat / contrast) | `palette.muted-lightest` `#1D1A17` | `palette.muted-lightest` `#E8E4DF` |
| 10 | Secondary highlight text | `#FFFFFF` | `#FFFFFF` |

---

*Last updated: 2026-05-07*
