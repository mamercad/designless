# Hermes Agent CLI Skins

Designless skins for Hermes Agent CLI.

## Files

- `designless-light.yaml` — Light variant
- `designless-dark.yaml` — Dark variant

These skins are generated from the canonical Designless palettes:

- `../colors/designless-light.json`
- `../colors/designless-dark.json`

## Install

Copy the skin files into your Hermes profile skin directory:

```sh
mkdir -p ~/.hermes/skins
cp hermes/designless-light.yaml ~/.hermes/skins/
cp hermes/designless-dark.yaml ~/.hermes/skins/
```

## Activate

Use one of the following options:

1. Interactive in-session command:

```text
/skin designless-dark
```

or

```text
/skin designless-light
```

2. Set default in config:

```sh
hermes config set display.skin designless-dark
# or
hermes config set display.skin designless-light
```

Then start a new Hermes session.

## Verify skin is available

```sh
hermes chat -q "/skin designless-dark"
```

If the skin loads correctly, Hermes will apply the Designless colors and branding in the CLI.
