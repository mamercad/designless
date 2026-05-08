## Learned User Preferences

## Learned Workspace Facts

- Slack sidebar theme strings live under `slack/` (see `slack/README.md`); apply them manually in the Slack desktop app. They are not installed by `make install`.
- Canonical palette definitions are `colors/designless-light.json` and `colors/designless-dark.json`; when the palette changes, sync all derived targets, including the comma-separated strings in `slack/`.
