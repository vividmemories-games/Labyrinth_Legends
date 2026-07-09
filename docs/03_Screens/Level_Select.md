# Level Select

**Route:** `/worlds/:worldId/levels`  
**Mockup:** Winding ruin path with cyan dotted connectors, gold level nodes

## Layout

```
LLScreenBackground (level_select.png, light veil)
├─ Header: back + WORLD N + world name (gold Cinzel)
├─ Scrollable winding path canvas
│   ├─ Curved dashed cyan connectors (S-curve anchors)
│   └─ Circular nodes: stars above, level number, lock if sealed
│       └─ Current level: larger node + cyan ring
└─ Footer: total stars / max stars + chest icon (reward placeholder)
```

## Path layout

- Anchors: `LevelPathLayout` — zig-zag X fractions over ruin path plate
- Level 1 at bottom of canvas; higher levels progress upward
- Auto-scroll to current (first incomplete unlocked) level on open

## Interaction

Tap unlocked node → `LevelPreviewSheet` → Play

## Components

`LLScreenBackground`, `LLTopBar` (back), `LLButton` (preview sheet)

See `docs/01_Game_Design/Level_Design.md`
