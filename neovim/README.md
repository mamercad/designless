# Designless Theme for Neovim

Neovim colorscheme implementing the Designless theme in both light and dark variants.

## Installation

### Using a Plugin Manager

**lazy.nvim:**

```lua
{
  "mamercad/designless",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme "designless-dark"
    -- or vim.cmd.colorscheme "designless-light"
  end,
}
```

**packer.nvim:**

```lua
use {
  'mamercad/designless',
  config = function()
    vim.cmd 'colorscheme designless-dark'
  end
}
```

### Manual

Copy the colorscheme files to your Neovim colors directory:

```bash
cp neovim/colors/designless-dark.lua ~/.config/nvim/colors/
cp neovim/colors/designless-light.lua ~/.config/nvim/colors/
```

## Usage

Set your colorscheme in `init.lua`:

```lua
vim.cmd.colorscheme "designless-dark"
-- or
vim.cmd.colorscheme "designless-light"
```

## Colors

| Element | Light | Dark |
|---------|-------|------|
| Foreground | `#111111` | `#E5DDD0` |
| Background | `#FFFFFF` | `#090807` |
| Accent | `#FF4719` | `#FF4719` |
| Comment | `#6B6560` | `#5A5248` |
| String | `#1E6B3C` | `#7FD8A8` |
| Number | `#7A4A00` | `#FFB84D` |
| Keyword | `#5A2D9A` | `#D8A8FF` |
| Type | `#1050A0` | `#6FB3F5` |
| Function | `#006E6E` | `#7FD8D8` |

## Development

The colorscheme is derived from [`../colors/designless-light.json`](../colors/designless-light.json) and
[`../colors/designless-dark.json`](../colors/designless-dark.json).

See [docs/ARCHITECTURE.md](../docs/ARCHITECTURE.md) for guidance on extending or modifying the palette.

---

*Last updated: 2026-05-07*
