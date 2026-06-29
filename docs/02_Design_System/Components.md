# Components

Reusable UI catalog. Implementation: `lib/design_system/components/`

**Showcase:** `/dev/design-system` (dev builds only) — add every new component here immediately.

**Rule:** Screens in `lib/features/` compose these — no duplicate styling.

---

## Containers

### LLPanel

**Purpose:** Primary stone slab container with engraved gold border.

**Variants:** `compact` — reduced padding for chips and dense layouts.

**API:** `child`, `padding?`, `compact`

**States:** Static container.

**Guidelines:** Use for grouped content, HUD frames, showcase sections.

**Used by:** Home (via currency), Showcase, future Gameplay HUD frame.

**Extensions:** Optional `onTap` wrapper in future if needed — prefer LLCard for tappable.

**Tokens:** `LLSurface.panel`, `LLSpacing`, `LLRadius.panel`

---

### LLCard

**Purpose:** Lighter elevated card with soft shadow; supports tap.

**API:** `child`, `padding?`, `onTap?`

**Guidelines:** World list items, shop rows, reward lists.

**Used by:** Showcase, future Worlds/Shop screens.

**Tokens:** `LLSurface.card`, `LLShadow.soft`

---

### LLSection

**Purpose:** Section header (h2) + optional subtitle + child content.

**API:** `title`, `subtitle?`, `child`, `trailing?`

**Used by:** Showcase, future settings grouped lists.

---

### LLScreenBackground

**Purpose:** Full-screen temple backdrop with optional hero image and veil gradient.

**API:** `child`, `heroImageAsset?`, `heroAlignment`

**Used by:** Home, Showcase preview.

---

## Buttons

### LLButton

**Purpose:** Primary interaction button.

**Variants:** `primary` (gold), `secondary` (cyan energy), `ghost`, `danger`

**API:** `label`, `onPressed?`, `icon?`, `variant`, `expanded`, `enabled`

**Guidelines:** Primary actions = gold only. Cyan = secondary/magical actions.

**Used by:** Home, Showcase, LLDialog.

**Tokens:** `LLGradient.goldButton`, `LLShadow.goldGlow`, `LLTextStyle.button`

---

### LLIconButton

**Purpose:** Toolbar / app bar icon control.

**Variants:** `gold`, `ghost`, `danger`

**API:** `icon`, `onPressed?`, `variant`, `tooltip?`

**Used by:** LLTopBar, Showcase.

**Tokens:** `LLSize.touchTarget`, `LLRadius.md`

---

### LLFloatingButton

**Purpose:** Circular gold FAB for prominent single action.

**API:** `icon`, `onPressed?`, `label?` (reserved)

**Used by:** Showcase; future quick-play overlay.

---

## Navigation

### LLTopBar

**Purpose:** Temple-styled app bar with gold title.

**API:** `title`, `leading?`, `actions`

**Static helper:** `LLTopBar.backButton(context)`

**Used by:** Showcase; future inner screens.

---

### LLBottomBar

**Purpose:** Bottom tab navigation on stone slab.

**API:** `items: List<LLBottomBarItem>` — `icon`, `label`, `onTap?`, `selected`

**Used by:** Showcase; future main shell.

---

## Currency

### LLCurrencyChip

**Purpose:** Display coins, gems, or stars.

**Types:** `LLCurrencyType.coins | gems | stars`

**API:** `type`, `amount`, `onTap?`, `compact`

**Guidelines:** Top-right HUD on Home; gameplay HUD later.

**Used by:** Home, Showcase.

**Future:** Animated count transitions.

---

## Progress

### LLProgressBar

**Purpose:** Gold fill on stone track for world/level progress.

**API:** `value` (0–1), `label?`, `showPercent`

**Used by:** Showcase; future World Select.

---

## Badges

### LLBadge

**Purpose:** Small status labels on nodes and items.

**Variants:** `locked`, `completed`, `newItem`, `perfect`

**API:** `label`, `variant`, `icon?`

**Used by:** Showcase; future Level Select nodes.

---

## Rewards

### LLRewardCard

**Purpose:** Generic reward row — icon, title, subtitle, amount. **No game logic.**

**API:** `title`, `subtitle?`, `amount?`, `icon`, `accentColor?`

**Used by:** Showcase; future Victory screen.

---

## Dialogs

### LLDialog

**Purpose:** Temple modal with gold title and LLButton actions.

**API:** `title`, `content`, `primaryLabel`, `secondaryLabel?`, `onPrimary?`, `onSecondary?`, `danger`

**Static:** `LLDialog.show(context, ...)`

**Used by:** Showcase.

---

## Feedback

### LLToast

**Purpose:** Floating snackbar feedback.

**Variants:** `info`, `success`, `warning`, `danger`

**Static:** `LLToast.show(context, message:, variant:)`

**Used by:** Showcase.

---

### LLLoadingIndicator

**Purpose:** Pulsing portal loader.

**API:** `size`, `message?`

**Animation:** `LLAnimation.portalPulse`

**Used by:** Showcase; future async screen loads.

---

## Not Yet Implemented (documented for future)

| Component | Planned use |
|-----------|-------------|
| LLStarRating | Victory, Level Select |
| LLPortal | Maze exit, loading branding |
| LLMazeTile | Gameplay board only |
| LLRewardPopup | Victory layout composition |

---

## Adding Components

1. Document in this file
2. Implement in `lib/design_system/components/`
3. Add to `components.dart` export
4. Add section to `DesignSystemShowcaseScreen`
5. Reference from `docs/03_Screens/*.md`

See `docs/assets/mockups/ui_board_master.png` for visual reference.
