# Designless Web Dashboard Theme

Warm-monochrome web dashboard tokens for Designless with a single molten accent (`#FF4719`) and explicit light/dark variants.

## Files

- `designless-light.css`
- `designless-dark.css`

Each file exports CSS custom properties and optional baseline primitives scoped to:

- `[data-theme="designless-light"]`
- `[data-theme="designless-dark"]`

Both variants source values from the shared palette definitions:

- `../colors/designless-light.json`
- `../colors/designless-dark.json`

## Usage

Import one or both theme files in your web app:

```html
<link rel="stylesheet" href="/themes/designless-light.css" />
<link rel="stylesheet" href="/themes/designless-dark.css" />
```

Apply the theme scope on your root node (or any dashboard container):

```html
<html data-theme="designless-dark">
  <body>
    <!-- dashboard -->
  </body>
</html>
```

Or switch at runtime:

```js
document.documentElement.setAttribute("data-theme", "designless-light");
```

## Framework assumptions

No framework coupling. The theme is plain CSS and works with React, Vue, Svelte, static HTML, or server-rendered templates.

Assumptions:

- Your UI uses CSS variables for component styling, or maps existing tokens to these variables.
- You prefer structure-first styling (surfaces, borders, readable contrast) over decorative gradients/effects.

## Token groups

The CSS exposes three groups:

1. Shared palette tokens (`--dl-*`) mapped directly from `colors/designless-*.json`
2. Semantic syntax tokens (`--dl-comment`, `--dl-string`, etc.)
3. Dashboard structure tokens (`--bg-*`, `--fg-*`, `--border-*`, `--status-*`, etc.)

Accent (`--accent`) should be reserved for active/focused/selected states to preserve Designless hierarchy.
