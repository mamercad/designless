# Designless Theme for VS Code

VS Code extension implementing the Designless theme in both light and dark variants.

## Development

From this directory:

- `npm run validate` checks JSON syntax, theme contribution paths, and name alignment
- `npm run package` builds a `.vsix` using `@vscode/vsce`
- Press `F5` in VS Code to launch an Extension Development Host using the launch config in `.vscode/launch.json`
- In the Extension Development Host, switch to `Designless Light` or `Designless Dark` from the theme picker

## Installation

### From VS Code UI
1. Open Extensions (Cmd+Shift+X)
2. Click `...` → **Install from VSIX...**
3. Select the `.vsix` file
4. Reload VS Code
5. Command Palette → "Color Theme" → **Designless Light** or **Designless Dark**

### From Command Line
```sh
code --install-extension designless-vscode-theme-X.X.X.vsix
```

## Principles

Derived from [../../colors/designless-light.json](../../colors/designless-light.json) and [../../colors/designless-dark.json](../../colors/designless-dark.json):

- Warm monochrome first
- Accent orange is reserved for active or focused state
- Syntax color should clarify structure, not decorate the editor
- Terminal ANSI colors match the wider Designless workstation palette

## Files

- `designless-light-color-theme.json` — Light variant (uiTheme: "vs")
- `designless-dark-color-theme.json` — Dark variant (uiTheme: "vs-dark")
- `package.json` — VS Code extension manifest
- `.vscode/launch.json` — Extension Development Host launch config

## License

MIT. See [`../LICENSE.txt`](../LICENSE.txt).
