# Design Tokens

All UI values must reference these tokens. **If a token is missing, add it here before using it in code.**

Implementation: `lib/design_system/tokens/`

## LLColor

| Token | Hex | Role |
|-------|-----|------|
| `ancientGold` | `#D4A63A` | Primary CTAs, borders, titles |
| `ancientGoldLight` | `#E8C56A` | Button gradient top |
| `ancientGoldDark` | `#9A7424` | Button gradient bottom |
| `portalBlue` | `#00AEEF` | Portal core |
| `energyCyan` | `#00D9FF` | Path glow, runes, energy |
| `crystalPurple` | `#8A5CFF` | Gems, crystals |
| `templeBlack` | `#080B12` | Screen background |
| `stoneDark` | `#12161F` | Panel background |
| `stoneMid` | `#1A1F2B` | Elevated panel |
| `stoneEdge` | `#2B313C` | Borders, dividers |
| `tealDeep` / `tealShadow` | — | Secondary button gradient |
| `textPrimary` | `#E8ECF4` | Body text |
| `textSecondary` | `#9AA3B2` | Captions |
| `emberRed` | `#E85D5D` | Traps, errors, danger |
| `successGreen` | `#4CD964` | Success states |
| `fogVeil` | `#CC080B12` | Fog overlay |

## LLTextStyle

| Token | Font | Size | Weight |
|-------|------|------|--------|
| `display` | Cinzel | 40 | 700 |
| `h1` | Cinzel | 32 | 700 |
| `h2` | Cinzel | 20 | 600 |
| `body` | Exo 2 | 16 | 400 |
| `bodyPrimary` | Exo 2 | 16 | 400 |
| `button` | Exo 2 | 15 | 600 |
| `caption` | Exo 2 | 12 | 400 |
| `currencyValue` | Exo 2 | 15 | 700 |

Aliases: `title` → `h1`, `subtitle` → `h2`

## LLSpacing

`xs` 4 · `sm` 8 · `md` 16 · `lg` 24 · `xl` 32 · `xxl` 48 · `screenPadding` 24

## LLRadius

`sm` 6 · `md`/`button` 10 · `card` 12 · `panel` 16 · `dialog` 20 · `pill` 24

## LLShadow

`soft` · `panel` · `portalGlow` · `goldGlow` · `cyanGlow` · `dangerGlow` · `titleGold`

## LLAnimation

| Token | Duration |
|-------|----------|
| `fast` | 150ms |
| `normal` | 300ms |
| `slow` | 500ms |
| `portalPulse` / `glowLoop` | 2000ms |
| `fadeIn` | 350ms |
| `rewardPop` | 600ms |
| `pathGlow` | 280ms |

## LLGradient

`goldButton` · `secondaryButton` · `stonePanel` · `portalAura` · `screenVeil`

## LLSurface

Shared `panel()`, `card()`, `pill()` decorations.

## LLSize

`iconSm` · `iconMd` · `iconLg` · `touchTarget` 44 · `fab` 56 · `progressHeight` 8 · `borderWidth` 1.5

## Usage Rules

1. Feature code imports tokens only
2. Extend this file when adding tokens
3. Showcase at `/dev/design-system` must reflect new tokens
