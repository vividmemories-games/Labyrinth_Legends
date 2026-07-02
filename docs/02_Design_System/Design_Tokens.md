# Design Tokens

**Authority:** [WS10 — Design Tokens Language](LLDL/WS10_Design_Tokens_Language.md)  
**Implementation:** `lib/design_system/tokens/`

All UI values must reference these tokens. **If a token is missing, propose a semantic token per WS10, add it here, then use it in code.**

Feature screens and components consume **semantic or component tokens** — not raw literals, not ad-hoc hex values.

---

## Governance

| Rule | Source |
|------|--------|
| Token meaning inherits from WS0–WS9 workshops | [WS10 §6](LLDL/WS10_Design_Tokens_Language.md#6-token-inheritance) |
| Semantic over raw — name by role, not appearance alone | WS10 §4, §7 |
| Gold = primary action; cyan = energy/paths only | [WS2](LLDL/WS2_Color_Language.md) |
| Calm motion temperament; reduced-motion variants required | [WS5](LLDL/WS5_Motion_Language.md) · [WS9](LLDL/WS9_Accessibility_Language.md) |
| New tokens require WS10 tier classification + catalog entry | WS10 §19–§20 |

**Promotion path:** repeated ad-hoc value → propose semantic token → approve → catalog here → use everywhere.

---

## Token Hierarchy

Tokens organize in four tiers. Higher tiers are more stable; lower tiers reference higher tiers.

| Tier | Purpose | Feature consumption |
|------|---------|---------------------|
| **Foundational** | Material primitives — surface ramps, spacing scale, base radii | Internal to token system only |
| **Semantic** | Role-based meaning — action, energy, danger, body text, calm motion | **Default consumption layer** |
| **Component** | Composed sets for reusable UI families — button, panel, seal | Via `LLSurface`, `LLGradient`, component APIs |
| **Screen / context** | Rare screen-family overrides | Governance approval required |

```text
WS0–WS9 (meaning)
    ↓
Foundational primitives
    ↓
Semantic tokens (LLColor roles, LLTextStyle roles, LLAnimation roles)
    ↓
Component tokens (LLSurface, LLGradient, LLSurface compositions)
    ↓
Screen context (docs/03_Screens/* — layout density only)
```

---

## Inheritance Map

| Token class | Dart API | Upstream authority |
|-------------|----------|-------------------|
| Color | `LLColor` | [WS2 — Color Language](LLDL/WS2_Color_Language.md) |
| Typography | `LLTextStyle` | [WS7 — Typography Language](LLDL/WS7_Typography_Language.md) |
| Motion | `LLAnimation` | [WS5 — Motion Language](LLDL/WS5_Motion_Language.md) |
| Spacing / density | `LLSpacing` | [WS4 — UI Language](LLDL/WS4_UI_Language.md) · [WS0](LLDL/WS0_Design_Philosophy.md) |
| Shape / radius | `LLRadius` | [WS1](LLDL/WS1_Visual_Identity_Artistic_Direction.md) · WS4 |
| Depth / elevation | `LLShadow` | [WS3](LLDL/WS3_Environment_Language.md) · WS4 |
| Icon / touch sizing | `LLSize` | [WS8](LLDL/WS8_Iconography_Language.md) · [WS9](LLDL/WS9_Accessibility_Language.md) |
| Surfaces & gradients | `LLSurface`, `LLGradient` | WS1 · WS4 · WS10 component tier |

---

## Foundational Tokens

Internal primitives used to compose semantic and component tokens. **Do not reference directly from feature code.**

### Surface ramp (`LLColor`)

| Token | Hex | Role |
|-------|-----|------|
| `templeBlack` | `#080B12` | Deepest void — screen base |
| `stoneDark` | `#12161F` | Recessed stone |
| `stoneMid` | `#1A1F2B` | Elevated slab |
| `stoneEdge` | `#2B313C` | Borders, dividers |
| `tealDeep` | `#1E3A44` | Secondary gradient stop |
| `tealShadow` | `#122830` | Secondary gradient shadow |

### Spacing scale (`LLSpacing`)

`xs` 4 · `sm` 8 · `md` 16 · `lg` 24 · `xl` 32 · `xxl` 48

### Shape scale (`LLRadius`)

`sm` 6 · `md` / `button` 10 · `card` 12 · `panel` 16 · `dialog` 20 · `pill` 24

---

## Semantic Tokens

Role-based tokens features and components should consume by default.

### Color roles (`LLColor`)

| Semantic role | Token | Hex | WS2 meaning |
|---------------|-------|-----|-------------|
| Primary action | `ancientGold` | `#D4A63A` | Commitment, authority |
| Primary action (highlight) | `ancientGoldLight` | `#E8C56A` | Gradient top, border emphasis |
| Primary action (shadow) | `ancientGoldDark` | `#9A7424` | Gradient bottom |
| Path / rune energy | `energyCyan` | `#00D9FF` | Drawn path, active runes |
| Portal core | `portalBlue` | `#00AEEF` | Exits, loading pulse |
| Collectible gem | `crystalPurple` | `#8A5CFF` | Gems, crystals |
| Body text | `textPrimary` | `#E8ECF4` | Primary readable copy |
| Supporting text | `textSecondary` | `#9AA3B2` | Captions, hints |
| Danger / trap | `emberRed` | `#E85D5D` | Hazards, errors |
| Success | `successGreen` | `#4CD964` | Confirmation |
| Fog / veil overlay | `fogVeil` | `#CC080B12` | Atmospheric occlusion |

**Aliases:** `dangerEmber` → `emberRed` · `successJade` → `successGreen`

**Opacity helpers (internal):** `borderGoldAlpha`, `borderCyanAlpha`, `veilTopAlpha`, `veilMidAlpha`, `veilBottomAlpha`, `overlayVeilAlpha`

### Typography roles (`LLTextStyle`)

| Semantic role | Token | Font | Size | Weight |
|---------------|-------|------|------|--------|
| Ceremonial display | `display` | Cinzel | 40 | 700 |
| Screen title | `h1` | Cinzel | 32 | 700 |
| Section header | `h2` | Cinzel | 20 | 600 |
| Body copy | `body` / `bodyPrimary` | Exo 2 | 16 | 400 |
| Control label | `button` | Exo 2 | 15 | 600 |
| Caption / hint | `caption` | Exo 2 | 12 | 400 |
| Currency value | `currencyValue` | Exo 2 | 15 | 700 |

**Aliases:** `title` → `h1` · `subtitle` → `h2`

### Spacing roles (`LLSpacing`)

| Semantic role | Token | Value |
|---------------|-------|-------|
| Inline gap | `xs`, `sm` | 4, 8 |
| Stack / inset | `md` | 16 |
| Section gap | `lg`, `xl` | 24, 32 |
| Screen margin | `screenPadding` | 24 |
| Hero spacing | `xxl` | 48 |

### Motion roles (`LLAnimation`)

| Semantic role | Token | Duration | Temperament |
|---------------|-------|----------|-------------|
| Instant acknowledgment | `fast` | 150ms | Press feedback |
| Calm transition | `normal` | 300ms | Default UI transition |
| Deliberate reveal | `slow` | 500ms | Panel / phase change |
| Path activation | `pathGlow` | 280ms | Gameplay path pulse |
| Fade entrance | `fadeIn` | 350ms | Content appear |
| Ceremonial reward | `rewardPop` | 600ms | Reward moment (brief) |
| Portal / loader loop | `portalPulse`, `glowLoop` | 2000ms | Ambient pulse |

**Curves:** `standard`, `portalPulseCurve`, `fadeInCurve`, `rewardPopCurve`, `glowLoopCurve`, `pathGlowCurve` — calm easing per WS5; no bounce on core controls.

**Reduced motion:** honor platform `MediaQuery.disableAnimations`; use instant or `fast` durations for essential state changes per WS9.

### Depth roles (`LLShadow`)

| Semantic role | Token | Use |
|---------------|-------|-----|
| Soft elevation | `soft` | Cards, chips |
| Carved slab | `panel` | Stone panels |
| Primary emphasis | `goldGlow` | Gold CTAs |
| Energy emphasis | `cyanGlow` | Secondary magical actions |
| Portal emphasis | `portalGlow` | Loader, exit |
| Danger emphasis | `dangerGlow` | Destructive actions |
| Title emphasis | `titleGold` | Ceremonial headings |

### Icon & touch roles (`LLSize`)

| Semantic role | Token | Value |
|---------------|-------|-------|
| Small icon | `iconSm` | per WS8 |
| Standard icon | `iconMd` | per WS8 |
| Large icon | `iconLg` | per WS8 |
| Minimum touch target | `touchTarget` | 44 (WS9) |
| FAB diameter | `fab` | 56 |
| Progress track height | `progressHeight` | 8 |
| Border stroke | `borderWidth` | 1.5 |

---

## Component Tokens

Composed token sets for reusable UI families defined in [Components](Components.md). Component code assembles these — features use components or semantic tokens.

### Gradients (`LLGradient`)

| Component family | Token | Composes |
|------------------|-------|----------|
| Primary button | `goldButton` | `ancientGoldLight` → `ancientGoldDark` |
| Secondary button | `secondaryButton` | `tealDeep` → `tealShadow` |
| Stone panel | `stonePanel` | `stoneDark` → `stoneMid` |
| Portal aura | `portalAura` | `portalBlue` + `energyCyan` |
| Screen veil | `screenVeil` | `templeBlack` opacity ramp |

### Surfaces (`LLSurface`)

| Component family | Method | Composes |
|------------------|--------|----------|
| Stone panel | `panel()` | `LLGradient.stonePanel`, gold border, `LLShadow.panel` |
| Elevated card | `card()` | `LLGradient.stonePanel`, gold border, `LLShadow.soft` |
| Chip / pill | `pill()` | `stoneMid`, gold border, `LLShadow.soft` |

---

## Screen Tokens

Screen-specific overrides live in `docs/03_Screens/*` as layout and density notes — not as parallel token forks.

| Rule | Guidance |
|------|----------|
| Allowed | Layout density, composition, phase-specific visibility |
| Forbidden | New color roles, cyan-primary buttons, one-off hex in features |
| Approval | Material screen-token exceptions → [Decisions](../00_Project/Decisions.md) |

---

## Usage Rules

1. Feature code imports `package:labyrinth_legends/design_system/tokens/tokens.dart` only
2. Extend this file when adding tokens — classify tier and upstream WS authority first
3. Showcase at `/dev/design-system` must reflect new tokens immediately
4. Components compose component tokens; features compose components
5. Never hardcode colors, spacing, radii, durations, or font sizes in `lib/features/`

---

## Related Documents

- [WS10 — Design Tokens Language](LLDL/WS10_Design_Tokens_Language.md) — token philosophy and governance
- [WS11 — Components Language](LLDL/WS11_Components_Language.md) — component token consumption
- [Colors](Colors.md) — WS2 semantic color reference
- [Typography](Typography.md) — WS7 typographic roles
- [Animations](Animations.md) — WS5 motion reference (expand from stub)
- [LLDL](LLDL/LLDL.md) — design architecture integration
