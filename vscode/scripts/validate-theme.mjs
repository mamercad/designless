import { readFileSync, existsSync } from "node:fs";
import path from "node:path";

const root = process.cwd();
const packagePath = path.join(root, "package.json");
const manifest = JSON.parse(readFileSync(packagePath, "utf8"));

if (!Array.isArray(manifest.contributes?.themes) || manifest.contributes.themes.length === 0) {
  throw new Error("package.json must contribute at least one theme");
}

const seenLabels = new Set();

for (const theme of manifest.contributes.themes) {
  if (!theme.label || !theme.path || !theme.uiTheme) {
    throw new Error("each contributed theme must define label, path, and uiTheme");
  }

  if (seenLabels.has(theme.label)) {
    throw new Error(`duplicate theme label: ${theme.label}`);
  }

  seenLabels.add(theme.label);

  const themePath = path.join(root, theme.path);
  if (!existsSync(themePath)) {
    throw new Error(`missing contributed theme file: ${theme.path}`);
  }

  const themeJson = JSON.parse(readFileSync(themePath, "utf8"));
  if (themeJson.name !== theme.label) {
    throw new Error(`theme name mismatch for ${theme.path}: expected \"${theme.label}\", got \"${themeJson.name}\"`);
  }

  if (theme.uiTheme === "vs" && themeJson.type !== "light") {
    throw new Error(`${theme.label} should declare type \"light\"`);
  }

  if (theme.uiTheme === "vs-dark" && themeJson.type !== "dark") {
    throw new Error(`${theme.label} should declare type \"dark\"`);
  }

  if (themeJson.colors?.focusBorder !== "#FF4719") {
    throw new Error(`${theme.label} must preserve the Designless accent as focusBorder`);
  }

  const terminalKeys = [
    "terminal.ansiBlack",
    "terminal.ansiRed",
    "terminal.ansiGreen",
    "terminal.ansiYellow",
    "terminal.ansiBlue",
    "terminal.ansiMagenta",
    "terminal.ansiCyan",
    "terminal.ansiWhite"
  ];

  for (const key of terminalKeys) {
    if (!themeJson.colors?.[key]) {
      throw new Error(`${theme.label} is missing required terminal color ${key}`);
    }
  }
}

console.log(`validated ${manifest.contributes.themes.length} contributed themes`);