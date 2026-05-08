#!/usr/bin/env python3
"""Generate solid Designless wallpapers with a large centered logo.

For each PNG under wallpapers/solid/light/ and wallpapers/solid/dark/, samples the
solid fill color and writes wallpapers/solid-logo/{light,dark}/<same basename>
with assets/logo-light-xl.svg or logo-dark-xl.svg rasterized and centered.

Logo choice follows **background luminance** (WCAG-style relative luminance): dark fills
use the “dark theme” wordmark (cream text + orange cursor); light fills use the “light
theme” wordmark (near-black text + orange cursor), so the logo stays readable on every
solid swatch—not only by parent folder name.

Requires: Pillow, rsvg-convert (librsvg).

Usage:
  ./wallpapers/scripts/generate_solid_logo_wallpapers.py
  ./wallpapers/scripts/generate_solid_logo_wallpapers.py --dry-run
"""

from __future__ import annotations

import argparse
import subprocess
import sys
import tempfile
from pathlib import Path

from PIL import Image

REPO = Path(__file__).resolve().parents[2]
SOLID = REPO / "wallpapers" / "solid"
OUT = REPO / "wallpapers" / "solid-logo"
LOGO_LIGHT = REPO / "assets" / "logo-light-xl.svg"
LOGO_DARK = REPO / "assets" / "logo-dark-xl.svg"

# Logo width as a fraction of min(screen width, height). Feels “large” without clipping.
LOGO_SCALE = 0.62
# Relative luminance threshold (sRGB). Above → logo-light-xl (dark ink); below → logo-dark-xl.
LUM_THRESHOLD = 0.45


def relative_luminance(rgb: tuple[int, int, int]) -> float:
    """WCAG relative luminance for sRGB 8-bit channels."""
    def chan(c: int) -> float:
        x = c / 255.0
        return x / 12.92 if x <= 0.03928 else ((x + 0.055) / 1.055) ** 2.4

    r, g, b = chan(rgb[0]), chan(rgb[1]), chan(rgb[2])
    return 0.2126 * r + 0.7152 * g + 0.0722 * b


def logo_svg_for_background(rgb: tuple[int, int, int]) -> Path:
    return LOGO_LIGHT if relative_luminance(rgb) > LUM_THRESHOLD else LOGO_DARK


def rsvg_to_png(svg: Path, width_px: int, out_png: Path) -> None:
    subprocess.run(
        ["rsvg-convert", "-w", str(width_px), str(svg), "-o", str(out_png)],
        check=True,
        capture_output=True,
    )


def compose_wallpaper(
    src_png: Path,
    dest_png: Path,
    *,
    dry_run: bool,
) -> None:
    src = Image.open(src_png).convert("RGB")
    w, h = src.size
    bg = src.getpixel((0, 0))
    logo_svg = logo_svg_for_background(bg)

    logo_w = max(320, int(min(w, h) * LOGO_SCALE))

    if dry_run:
        pick = "light-xl" if logo_svg == LOGO_LIGHT else "dark-xl"
        print(f"would write {dest_png} ({w}x{h}, bg={bg}, logo={pick}, logo_w≈{logo_w})")
        return

    dest_png.parent.mkdir(parents=True, exist_ok=True)

    with tempfile.NamedTemporaryFile(suffix=".png", delete=False) as tmp:
        tmp_logo = Path(tmp.name)

    try:
        rsvg_to_png(logo_svg, logo_w, tmp_logo)
        logo = Image.open(tmp_logo).convert("RGBA")

        canvas = Image.new("RGBA", (w, h), (*bg, 255))
        lw, lh = logo.size
        x = (w - lw) // 2
        y = (h - lh) // 2
        canvas.paste(logo, (x, y), logo)
        canvas.convert("RGB").save(dest_png, optimize=True)
    finally:
        tmp_logo.unlink(missing_ok=True)


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    if not LOGO_LIGHT.is_file() or not LOGO_DARK.is_file():
        print("Missing assets/logo-*-xl.svg", file=sys.stderr)
        return 1

    which = subprocess.run(["which", "rsvg-convert"], capture_output=True)
    if which.returncode != 0:
        print("rsvg-convert not found (install librsvg)", file=sys.stderr)
        return 1

    for variant in ("light", "dark"):
        src_dir = SOLID / variant
        if not src_dir.is_dir():
            print(f"Missing {src_dir}", file=sys.stderr)
            return 1

        for src in sorted(src_dir.glob("*.png")):
            dest = OUT / variant / src.name
            compose_wallpaper(src, dest, dry_run=args.dry_run)

    if not args.dry_run:
        n = sum(1 for _ in OUT.rglob("*.png"))
        print(f"Wrote {n} wallpapers under {OUT.relative_to(REPO)}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
