# Components

**Authority:** [WS11 — Components Language](LLDL/WS11_Components_Language.md)  
**Token authority:** [WS10 — Design Tokens Language](LLDL/WS10_Design_Tokens_Language.md) · [Design_Tokens](Design_Tokens.md)  
**Implementation:** `lib/design_system/components/`

**Showcase:** `/dev/design-system` (dev builds only) — add every new component here immediately.

**Rule:** Screens in `lib/features/` compose these — no duplicate styling, no `ruins_*` or `app_colors` bypass.

---

## Governance

| Rule | Source |
|------|--------|
| Components inherit upstream WS meaning — never redefine color roles locally | WS11 §4 |
| Consume component tokens, then semantic tokens — never raw literals | WS11 §5 |
| Gameplay components default **functional** tier; meta-game may use **ceremonial** accents | WS11 §6–§8 |
| States must be multichannel — not color alone | WS11 §19 |
| New families require catalog entry + component token set + showcase | WS11 §27 |

```text
WS0–WS9 (channel meaning)
    ↓
WS10 (token hierarchy)
    ↓
WS11 (component families)
    ↓
Components.md (this catalog)
    ↓
docs/03_Screens/* (composition & layout)
```

---

## Inheritance Map

| Component concern | Upstream authority |
|-------------------|-------------------|
| Materials & visual identity | [WS1](LLDL/WS1_Visual_Identity_Artistic_Direction.md) · [WS4](LLDL/WS4_UI_Language.md) |
| Color roles & state emphasis | [WS2](LLDL/WS2_Color_Language.md) |
| Environmental continuity | [WS3](LLDL/WS3_Environment_Language.md) |
| UI density & progressive HUD | [WS4](LLDL/WS4_UI_Language.md) |
| Motion & transitions | [WS5](LLDL/WS5_Motion_Language.md) |
| Audio feedback hooks | [WS6](LLDL/WS6_Audio_Language.md) |
| Text roles | [WS7](LLDL/WS7_Typography_Language.md) |
| Icons & sigils | [WS8](LLDL/WS8_Iconography_Language.md) |
| Accessibility defaults | [WS9](LLDL/WS9_Accessibility_Language.md) |
| Token consumption | [WS10](LLDL/WS10_Design_Tokens_Language.md) |

---

## Functional vs Ceremonial Tiers

| Tier | When | Expression |
|------|------|------------|
| **Functional** | Gameplay HUD, settings, confirmations, utility | Legibility first; minimal ornament; functional typography |
| **Ceremonial** | Rewards, unlocks, relic reveals, world completion | Inscription accents, seal framing, brief luminous emphasis — still WS9-compliant |

Ceremonial treatment **never replaces** functional clarity on critical paths.

---

## Standard Component States

All interactive components must support perceptible multichannel states per WS11 §19.

| State | Requirement |
|-------|-------------|
| **Default** | Resting temple material; no false urgency |
| **Focus** | Visible focus ring or elevation shift (WS9) |
| **Pressed** | Material depression via `InkWell` / inset |
| **Disabled** | Reduced contrast **and** non-color cue (opacity, no glow, muted border) |
| **Selected** | Shape, border, icon, or label — not hue alone |
| **Loading** | Non-blocking indicator; stable layout |
| **Error** | Label/icon support; `emberRed` semantics |
| **Success** | Brief warm confirmation |

**Gameplay rule:** fewer states — no decorative proliferation. **Motion:** calm transitions only — no bounce on core controls (WS5).

---

## Catalog by Domain

### Containers — Meta-game · Functional default

#### LLPanel

| Field | Value |
|-------|-------|
| **Domain** | Meta-game, shared layout |
| **Tier** | Functional |
| **Purpose** | Primary stone slab container with engraved gold border |
| **Variants** | `compact` — reduced padding for dense layouts |
| **API** | `child`, `padding?`, `compact` |
| **States** | Static container |
| **Tokens** | `LLSurface.panel`, `LLSpacing`, `LLRadius.panel` |
| **Used by** | Home, Showcase, future Gameplay HUD frame |
| **Guidelines** | Grouped content, HUD frames; prefer `LLCard` for tappable surfaces |

#### LLCard

| Field | Value |
|-------|-------|
| **Domain** | Meta-game |
| **Tier** | Functional |
| **Purpose** | Lighter elevated card with soft shadow; supports tap |
| **API** | `child`, `padding?`, `onTap?`, `semanticsLabel?` |
| **States** | Default, pressed (ink), disabled (no `onTap`) |
| **Accessibility** | Tappable: `Semantics(button: true)`; optional `semanticsLabel` |
| **Tokens** | `LLSurface.card`, `LLShadow.soft` |
| **Used by** | Showcase, Worlds, Shop rows |

#### LLSection

| Field | Value |
|-------|-------|
| **Domain** | Meta-game |
| **Tier** | Functional |
| **Purpose** | Section header (h2) + optional subtitle + child |
| **API** | `title`, `subtitle?`, `child`, `trailing?` |
| **States** | Static |
| **Tokens** | `LLTextStyle.h2`, `LLTextStyle.caption` |
| **Used by** | Showcase, settings lists |

#### LLScreenBackground

| Field | Value |
|-------|-------|
| **Domain** | Shared shell |
| **Tier** | Functional |
| **Purpose** | Full-screen temple backdrop with optional hero image and veil |
| **API** | `child`, `heroImageAsset?`, `heroAlignment`, `veilStrength` (default `1.0`), `heroScale` (default `1.0`) |
| **States** | Static |
| **Tokens** | `LLColor.templeBlack`, `LLGradient.screenVeil` |
| **Used by** | Home, Showcase |

---

### Buttons — Shared · Functional default

#### LLButton

| Field | Value |
|-------|-------|
| **Domain** | Shared (gameplay + meta-game) |
| **Tier** | Functional; ceremonial accent only on reward flows |
| **Purpose** | Mechanism of commitment — weathered engraved bronze / stone plates |
| **Variants** | `primary` (weathered bronze), `secondary` (cracked stone + cyan edge), `ghost`, `danger` |
| **API** | `label`, `onPressed?`, `icon?`, `variant`, `expanded`, `enabled` |
| **States** | Default, pressed, disabled (opacity + darken texture), focus (ink splash) |
| **Plate rendering** | `ClipRRect` → gradient underlay → optional weathered texture (`BoxFit.cover`, primary uses slight center scale to clip ornate corner frame) → label |
| **Tokens** | `LLGradient.goldButton`, `LLGradient.secondaryButton`, `LLShadow.weatheredPlate`, texture assets in `LLAssetPaths`, `LLTextStyle.buttonPrimary` / `buttonSecondary` |
| **Rules** | One primary gold CTA per surface; cyan = secondary/magical only |
| **Used by** | Home, Showcase, LLDialog, future Gameplay controls |
| **Accessibility** | `Semantics` label; min height via padding + `LLSize.touchTarget` |

#### LLIconButton

| Field | Value |
|-------|-------|
| **Domain** | Shared |
| **Tier** | Functional |
| **Purpose** | Toolbar / app bar icon control |
| **Variants** | `gold`, `ghost`, `danger` |
| **API** | `icon`, `onPressed?`, `variant`, `tooltip?` |
| **States** | Default, pressed, disabled |
| **Tokens** | `LLSize.touchTarget`, `LLRadius.md` |
| **Used by** | LLTopBar, Showcase |

#### LLFloatingButton

| Field | Value |
|-------|-------|
| **Domain** | Meta-game |
| **Tier** | Functional |
| **Purpose** | Circular gold FAB for single prominent action |
| **API** | `icon`, `onPressed?`, `label?` (reserved) |
| **States** | Default, pressed, disabled |
| **Tokens** | `LLSize.fab`, `LLGradient.goldButton`, `LLShadow.goldGlow` |
| **Used by** | Showcase; future quick-play |

---

### Navigation — Meta-game · Functional

#### LLTopBar

| Field | Value |
|-------|-------|
| **Domain** | Meta-game |
| **Tier** | Functional |
| **Purpose** | Temple-styled app bar with gold title |
| **API** | `title`, `leading?`, `actions` |
| **Helper** | `LLTopBar.backButton(context)` |
| **States** | Static chrome; action buttons use LLIconButton states |
| **Tokens** | `LLTextStyle.h2`, `LLColor.ancientGold` |
| **Used by** | Showcase, inner screens |

#### LLBottomBar

| Field | Value |
|-------|-------|
| **Domain** | Meta-game shell |
| **Tier** | Functional |
| **Purpose** | Bottom tab navigation on stone slab |
| **API** | `items: List<LLBottomBarItem>` — `icon`, `label`, `onTap?`, `selected` |
| **States** | Selected (multichannel — icon + label + weight); disabled (`onTap: null`, 0.55 opacity) |
| **Accessibility** | Per item: `Semantics(button, enabled, selected, label)` |
| **Tokens** | `LLGradient.stonePanel`, `LLTextStyle.caption` |
| **Used by** | Showcase, main shell |

---

### HUD — Gameplay · Functional only

#### LLCurrencyChip

| Field | Value |
|-------|-------|
| **Domain** | Gameplay HUD, meta-game header |
| **Tier** | **Functional only** — no ceremonial treatment |
| **Purpose** | Display coins, gems, or stars |
| **Types** | `LLCurrencyType.coins`, `gems`, `stars` |
| **API** | `type`, `amount`, `onTap?`, `compact` |
| **States** | Default; optional tap |
| **Tokens** | `LLSurface.pill`, `LLTextStyle.currencyValue` |
| **Rules** | Progressive HUD per WS4 — surface only when phase requires |
| **Used by** | Home, Showcase, future Gameplay HUD |

#### GameplayTopBar · GameplayHeaderIconButton · GameplayControlBar · GameplayRoundActionButton · GameplayStatColumn · LLGameplayAsset

| Field | Value |
|-------|-------|
| **Domain** | Gameplay screen chrome + in-maze sprites (MVP mockup panel 3) |
| **Tier** | Functional only |
| **Purpose** | Header (back, level + stars, settings/pause); rustic 52px header icon plates; bottom UNDO/ERASE/HINT row with PNG icons; MOVES/GEMS/KEYS stats; GO CTA; tile/object sprites with painter fallback |
| **Implementation** | `lib/design_system/components/gameplay/` · `ll_gameplay_assets.dart` |
| **Rules** | Control bar hidden during execution; stats conditional per level; hint badge from player progress; HUD PNG icons untinted; header back/settings transparent icon-only (~88% + 1.2× visual scale); round actions 64px plate with ~84% + 1.22× visual scale |
| **Used by** | `GameplayLayout`, `BoardRenderer`, `CellOverlay`, `docs/03_Screens/Gameplay.md` |

#### LLProgressBar

| Field | Value |
|-------|-------|
| **Domain** | Meta-game progression |
| **Tier** | Functional |
| **Purpose** | Gold fill on stone track |
| **API** | `value` (0–1), `label?`, `showPercent` |
| **States** | Static fill |
| **Tokens** | `LLColor.ancientGold`, `LLColor.stoneDark`, `LLSize.progressHeight` |
| **Used by** | Showcase, World Select |

---

### Badges & Status — Meta-game · Functional

#### LLBadge

| Field | Value |
|-------|-------|
| **Domain** | Meta-game, level select |
| **Tier** | Functional |
| **Purpose** | Small status labels on nodes and items |
| **Variants** | `locked`, `completed`, `newItem`, `perfect` |
| **API** | `label`, `variant`, `icon?` |
| **States** | Static semantic variants |
| **Tokens** | Variant-mapped `LLColor` roles |
| **Used by** | Showcase, Level Select |

---

### Rewards — Meta-game · Ceremonial allowance

#### LLRewardCard

| Field | Value |
|-------|-------|
| **Domain** | Meta-game, victory |
| **Tier** | Ceremonial accent permitted |
| **Purpose** | Reward row — icon, title, subtitle, amount. **No game logic.** |
| **API** | `title`, `subtitle?`, `amount?`, `icon`, `accentColor?` |
| **States** | Static presentation |
| **Tokens** | `LLSurface.card`, `LLTextStyle.h2`, `LLTextStyle.caption` |
| **Used by** | Showcase, Victory screen |

---

### Modals & Overlays — Shared

#### LLDialog

| Field | Value |
|-------|-------|
| **Domain** | Shared |
| **Tier** | Functional default; deliberate pacing for destructive flows |
| **Purpose** | Temple modal with gold title and LLButton actions |
| **API** | `title`, `content`, `primaryLabel`, `secondaryLabel?`, `onPrimary?`, `onSecondary?`, `danger` |
| **Helper** | `LLDialog.show(context, ...)` |
| **States** | Open/close via navigator; button states per LLButton |
| **Tokens** | `LLRadius.dialog`, `LLSurface.panel` |
| **Used by** | Showcase |

---

### Feedback — Shared

#### LLToast

| Field | Value |
|-------|-------|
| **Domain** | Shared |
| **Tier** | Functional |
| **Purpose** | Transient non-blocking feedback |
| **Variants** | `info`, `success`, `warning`, `danger` |
| **Helper** | `LLToast.show(context, message:, variant:)` |
| **Rules** | Multichannel per WS9; do not trap navigation |
| **Used by** | Showcase |

#### LLLoadingIndicator

| Field | Value |
|-------|-------|
| **Domain** | Shared |
| **Tier** | Functional |
| **Purpose** | Calm portal loader |
| **API** | `size`, `message?` |
| **States** | Loading loop |
| **Tokens** | `LLAnimation.portalPulse`, `LLColor.portalBlue` |
| **Rules** | Calm loop — not frantic spin (WS5) |
| **Used by** | Showcase, async loads |

---

## Planned — Not Yet Implemented

| Component | Domain | Tier | Planned use |
|-----------|--------|------|-------------|
| LLStarRating | Meta-game | Ceremonial | Victory, Level Select |
| LLPortal | Gameplay | Functional | Maze exit, loading branding |
| LLMazeTile | Gameplay | Functional | Gameplay board painter only |
| LLRewardPopup | Meta-game | Ceremonial | Victory layout composition |

---

## Adding Components

1. Verify WS11 domain placement (gameplay vs meta-game) and tier
2. Document in this file with states, tokens, and inheritance
3. Define or extend component tokens in [Design_Tokens](Design_Tokens.md)
4. Implement in `lib/design_system/components/`
5. Export from `components.dart`
6. Add to `DesignSystemShowcaseScreen`
7. Reference from `docs/03_Screens/*.md`

See `docs/assets/mockups/ui_board_master.png` for visual reference.

---

## Related Documents

- [WS11 — Components Language](LLDL/WS11_Components_Language.md)
- [Design_Tokens](Design_Tokens.md)
- [Accessibility](Accessibility.md) — WS9 measurable requirements (expand from stub)
- [LLDL](LLDL/LLDL.md)
