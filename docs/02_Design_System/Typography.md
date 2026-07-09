# Typography

**Authority:** [WS7 — Typography Language](LLDL/WS7_Typography_Language.md)  
**Tokens:** [Design_Tokens](Design_Tokens.md) (`LLTextStyle.*`)  
**Implementation:** `lib/design_system/tokens/ll_text_style.dart`

WS7 owns typographic **meaning**. This document maps roles to tokens and implementation rules.

---

## Font Families

| Tier | Font | Role |
|------|------|------|
| **Ceremonial** | Cinzel | Display, screen titles, section headers, seals |
| **Functional** | Exo 2 | Body, UI labels, buttons, captions, HUD stats |

Bundled via `google_fonts` in `LLTextStyle` — loaded through `app_theme.dart`.

---

## Dual System (WS7)

| Tier | When | Rules |
|------|------|-------|
| **Functional** | Gameplay HUD, settings, controls, lists, shop rows | Exo 2; maximum legibility; no inscription-only labels |
| **Ceremonial** | Home titles, victory, world names, artifact reveals | Cinzel; gold emphasis; paired with functional subtitle when ambiguous |

Gameplay live HUD labels use **functional type only**.

---

## Text Style Roles

| WS7 role | Token | Font | Size | Weight | Use |
|----------|-------|------|------|--------|-----|
| Ceremonial display | `display` | Cinzel | 40 | 700 | Hero moments, rare full-screen titles |
| Screen title | `h1` / `title` | Cinzel | 32 | 700 | Screen titles, world names |
| Section header | `h2` / `subtitle` | Cinzel | 20 | 600 | Section headers, panel titles |
| Body copy | `body` / `bodyPrimary` | Exo 2 | 16 | 400 | Descriptions, lore, settings copy |
| Control label (primary CTA) | `button` / `buttonPrimary` | Exo 2 | 17 | 700 | `LLButton` primary |
| Control label (secondary) | `buttonSecondary` | Exo 2 | 14 | 600 | `LLButton` secondary |
| Caption / hint | `caption` | Exo 2 | 12 | 400 | Hints, timestamps, tab labels |
| Currency / stat value | `currencyValue` | Exo 2 | 15 | 700 | `LLCurrencyChip`, HUD numbers |

---

## Color Pairing

| Context | Token |
|---------|-------|
| Ceremonial titles on dark | `LLColor.ancientGold` / `ancientGoldLight` (in `h1`/`h2`) |
| Body on dark | `LLColor.textPrimary` |
| Supporting copy | `LLColor.textSecondary` |
| Button labels on weathered primary fill | `LLColor.textPrimary` (set in `LLButton`) |

---

## Hierarchy Rules

- Maximum **two typographic personalities** on one functional surface
- One primary heading level per screen section
- Numeric stats use `currencyValue` or `caption` — not ceremonial Cinzel on HUD
- Localization: layouts tolerate **+30%** string length (WS9)

---

## Gameplay vs Meta-Game

| Context | Typography |
|---------|------------|
| Gameplay HUD | Functional only (`caption`, `button`) |
| Gameplay overlays | Functional; gold `h1` for pause/retry titles only |
| Meta-game screens | Ceremonial `h1`/`h2` + functional `body` |
| Victory / rewards | Ceremonial accent permitted on titles |

---

## Anti-Patterns

- System default font in features
- Cinzel on live gameplay HUD stat chips
- Inscription-only control labels (no readable text)
- More than two font personalities on one surface

---

## Related Documents

- [WS7 — Typography Language](LLDL/WS7_Typography_Language.md)
- [Design_Tokens](Design_Tokens.md)
- [Accessibility](Accessibility.md)
