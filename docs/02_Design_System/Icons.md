# Icons

**Authority:** [WS8 — Iconography Language](LLDL/WS8_Iconography_Language.md)  
**Tokens:** `LLSize.iconSm` · `LLSize.iconMd` · `LLSize.iconLg`  
**Implementation:** Material icons for MVP — custom sigil set post-MVP

WS8 owns icon **meaning**. This document maps families and usage rules for implementation.

---

## Icon Tiers

| Tier | Purpose | Expression |
|------|---------|------------|
| **Functional** | HUD, navigation, validation, hazards, utility | Simple silhouette, minimal detail, label when meaning not universal |
| **Ceremonial** | Rewards, seals, relics, world emblems | Ornate ancient-inspired marks — still readable |

Ceremonial icons **never replace** functional clarity on critical paths.

---

## Functional Icon Families

| Family | Examples | Label required? |
|--------|----------|-----------------|
| Navigation | back, home, settings, tabs | Tooltip recommended |
| Gameplay HUD | moves, gems, key slot, phase | Yes — text chip or semantics label |
| Path controls | undo, erase, hint, go | Yes — `LLButton` label |
| Objectives | exit flag, gem, key | Yes in preview/onboarding |
| Validation | error, warning, success | Pair with message text |
| Store / utility | purchase, restore, lock | Yes on primary actions |

**Rules:**
- Consistent stroke/mass within functional family
- `LLSize.iconMd` default for toolbar controls
- `LLSize.iconSm` for dense HUD chips
- No cartoon emoji substitutes

---

## Ceremonial Icon Families

| Family | Examples | Usage |
|--------|----------|-------|
| Mastery | star seals, perfect marks | Victory, level select |
| Progression | world emblems, chapter crests | World select, completion |
| Relics | artifact crests | Inventory, rewards |
| Threshold | portal insignia | Exit, loading branding (`LLPortal` planned) |

Ceremonial icons may use gold accent and brief glow — still WS9-compliant.

---

## Domain Mapping (MVP)

| Screen / component | Icons | Tier |
|--------------------|-------|------|
| `LLIconButton` | Material `Icons.*` | Functional |
| `LLCurrencyChip` | coins, gems, stars | Functional |
| `LLBadge` | lock, star, new | Functional |
| Gameplay HUD chips | route, gem, key | Functional |
| Level select nodes | lock, star | Functional / ceremonial accent |
| Victory stars | star / star_border | Ceremonial |

---

## Color Roles for Icons

| Role | Token | Usage |
|------|-------|-------|
| Primary emphasis | `ancientGold` | Navigation accent, currency, mastery |
| Energy / active path | `energyCyan` | Secondary actions, path indicators |
| Portal | `portalBlue` | Exit, loader |
| Collectible | `crystalPurple` | Gems |
| Danger | `emberRed` | Hazards, destructive controls |
| Muted / disabled | `textSecondary` | Locked, inactive |

---

## Adding Icons

1. Classify functional vs ceremonial per WS8
2. Pair with label on critical paths
3. Use `LLSize` tokens — no arbitrary pixel sizes in features
4. Document new families here before shipping
5. Custom SVG assets → `assets/icons/` with catalog entry (future)

---

## Related Documents

- [WS8 — Iconography Language](LLDL/WS8_Iconography_Language.md)
- [Components](Components.md)
- [Design_Tokens](Design_Tokens.md)
