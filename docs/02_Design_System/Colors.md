# Colors

**Authority:** [WS2 — Color Language](LLDL/WS2_Color_Language.md)  
**Canonical values:** [Design_Tokens](Design_Tokens.md) (`LLColor.*`)  
**Implementation:** `lib/design_system/tokens/ll_color.dart`

WS2 owns color **meaning**. This document maps semantic roles to token names. Hex values live only in `Design_Tokens.md`.

---

## Semantic Roles

| WS2 role | Token | Usage |
|----------|-------|-------|
| Primary action / commitment | `ancientGold` | CTAs, borders, titles — **not** cyan |
| Path / rune energy | `energyCyan` | Drawn paths, active runes, secondary magical actions |
| Portal core | `portalBlue` | Exits, loading pulse |
| Collectible gem | `crystalPurple` | Gems, crystals |
| Screen void | `templeBlack` | Full-screen background |
| Stone surfaces | `stoneDark`, `stoneMid`, `stoneEdge` | Panels, cards, dividers |
| Body text | `textPrimary` | Primary readable copy |
| Supporting text | `textSecondary` | Captions, hints |
| Danger / trap | `emberRed` (`dangerEmber`) | Hazards, errors, destructive emphasis |
| Success | `successGreen` (`successJade`) | Confirmation |
| Atmospheric veil | `fogVeil` | Fog overlay |

---

## Rules

- Gold = primary action authority (WS2 locked decision)
- Cyan = energy and paths only — never primary CTA buttons
- Features consume semantic tokens — no hardcoded hex
- Biome variation modulates atmosphere — not semantic role inversion

---

## Palette File

Export swatches to `docs/assets/palettes/lldl_palette.ase` (future).

## Reference

Mockup: `docs/assets/mockups/ui_board_master.png`
