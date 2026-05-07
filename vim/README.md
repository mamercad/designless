# Designless Theme for Vim

Vim colorscheme implementing the Designless theme in both light and dark variants.

## Installation

### Using a Plugin Manager

**vim-plug:**
```vim
Plug 'mamercad/designless'
```

**pathogen:**
```sh
cd ~/.vim/bundle && git clone https://github.com/mamercad/designless.git
```

## Usage

After installation, set your colorscheme in `~/.vimrc`:

```vim
colorscheme designless-light
" or
colorscheme designless-dark
```

## Development

The colorscheme is generated from [`../colors/designless-light.json`](../colors/designless-light.json) and [`../colors/designless-dark.json`](../colors/designless-dark.json).

See the parent [docs/architecture.md](../docs/architecture.md) for guidance on extending or modifying the palette.

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

## Status

✅ Complete.

---

*Last updated: 2026-05-05*
