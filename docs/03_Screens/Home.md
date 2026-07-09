# Home Screen

**Route:** `/`  
**Mockup ref:** Splash/Home panel in `docs/assets/mockups/ui_board_master.png`

## Purpose

Main hub — portal atmosphere, title over gate lintel, primary navigation.

## Layout

```
LLScreenBackground (portal ruins, heroScale 1.04, light veil)
├─ SafeArea
│   └─ Stack
│       ├─ Column: logo (top) → Spacer → buttons + dock
│       └─ Dev menu (dev flavor, top-right)
```

## Visual

- Hero: `assets/images/backgrounds/home_screen.png` via `LLAssetPaths.homeScreenBackground` (AB reference plate)
- Title: `logo_labyrinth_legends.png` — near full-width (`LLSpacing.sm` inset), pinned to top of SafeArea (sky band above arch)
- Currency chips: **removed from Home MVP shell** (future: shop/profile surfaces)
- `heroScale: 1.04`, `heroAlignment: (0, 0.02)`, `veilStrength: 0.38`
- Buttons: global weathered `LLButton` — primary gradient plate; secondary stone texture
- Dev flavor: `PopupMenuButton` (`</>` icon) → Design System, Engine Sandbox

## Navigation

| Action | Route |
|--------|-------|
| Play | `/worlds` |
| Daily | `/daily` |
| Shop | `/shop` |
| Settings (dock) | `/settings` |

## States

| State | Behavior |
|-------|----------|
| Loading progress | Hide currency or shimmer chips |
| First launch | Same layout — tutorial prompt future |

## Components Used

`LLScreenBackground`, `LLButton`, `LLIconButton`
