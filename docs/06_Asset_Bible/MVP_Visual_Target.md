# MVP Visual Target

| Field | Value |
|-------|-------|
| **Project** | Labyrinth Legends |
| **Status** | Approved — MVP authority |
| **Date** | 2026-07-06 |
| **Owner** | Apoorv |
| **Canonical Reference** | [ui_board_master.png](../assets/mockups/ui_board_master.png) |
| **Supersedes for MVP** | World 01 Phase 1/2/3 environment studies, M2.8 camera/layering work |

---

## Purpose

This document is the **MVP visual north star** for Labyrinth Legends. It defines what the shipping product looks like and how art is delivered in Flutter.

The master mockup (`docs/assets/mockups/ui_board_master.png`) is the single authoritative visual reference for MVP — not the World 01 cinematic environment boards.

---

## Product Scope (10 Screens)

| # | Screen | MVP priority |
|---|--------|--------------|
| 1 | Splash / Home | P0 |
| 2 | Level Select | P0 |
| 3 | Gameplay | P0 — in progress |
| 4 | Level Complete | P1 |
| 5 | Daily Challenge | P2 — layout shell |
| 6 | Shop / Skins | P2 — layout shell |
| 7 | World / Chapters | P1 |
| 8 | Settings | P1 |
| 9 | Level Preview | P1 |
| 10 | Pause | P1 |

Screen layouts: `docs/03_Screens/*`

---

## Visual Strategy

### MVP (ship this)

- **Static 2D PNG sprites** for tiles, objects, icons, buttons
- **`Image.asset`** for screen backgrounds (one illustration per screen/world)
- **`CustomPainter`** only for the cyan path overlay
- **Flutter widgets** (`Column`, `Row`, `Stack`, `ListView`) for all UI chrome
- **LLDL tokens** for colors, spacing, typography — palette matches mockup

### Post-MVP (deferred)

- 2.5D environment compositors
- Layered parallax backplates
- Procedural environment painters
- Board carved into architectural vistas
- M2.8 camera / lighting / responsive layering

Deferred reference material: [World_01_Forgotten_Citadel/archive/](World_01_Forgotten_Citadel/archive/post_mvp_environment/)

---

## Gameplay Presentation

Per the master mockup gameplay panel (updated 2026-07-09):

| Element | MVP delivery |
|---------|--------------|
| Floor / walls | Code-drawn `MazePainter` + variant floor PNGs (`tile_floor_1`–`4`); raised stone edges — **not** per-cell autotile PNG stack |
| Explorer | Cyan glowing sprite (`LLGameplayAsset`) |
| Path | Cyan `CustomPainter` line |
| Gems | Purple faceted sprite |
| Keys | Gold sprite |
| Exit portal | Cyan glowing portal sprite |
| HUD | Level title, Undo / Erase / Hint, Moves / Gems / Key counters |
| Board frame | Shrink-wrapped board; subtle perspective tilt — gold frame removed |

Collectibles/HUD remain AB2 PNG sprites. Maze structure is not authored as edge overlay PNGs.

Engine and gameplay loop (M2.1–M2.6) are unchanged.

---

## MVP Sprite Checklist

Production assets to author against AB2 naming:

| Asset | AB2 kind | Notes |
|-------|----------|-------|
| `tile_floor.png` | Environment | Walkable stone floor |
| `tile_wall.png` | Environment | Impassable wall |
| `explorer.png` | Explorer | Cyan glow, humanoid |
| `gem.png` | Collectible | Purple faceted |
| `key.png` | Collectible | Gold ancient key |
| `lock_closed.png` | Puzzle | Bronze gate |
| `exit_portal.png` | Environment | Cyan energy portal |
| `trap_spikes.png` | Hazard | Floor spikes (when traps ship) |
| HUD icons | UI | Gem, key, star, undo, erase, hint |
| Button skins | UI | Gold primary, teal secondary |

Paths: `assets/images/gameplay/` per [AB2_Game_Assets.md](AB2_Game_Assets.md)

---

## Authority

```text
Vision.md
    ↓
MVP_Visual_Target.md (this document — MVP visual execution)
    ↓
docs/03_Screens/*
    ↓
LLDL tokens (palette only for MVP)
    ↓
AB2 sprite production
```

LLDL workshops (WS1, WS3) remain valid for **tone and palette**. Full monumental environment grammar is post-MVP.

---

## Related

- [Decisions.md](../00_Project/Decisions.md) — 2026-07-06 MVP visual pivot
- [Roadmap.md](../00_Project/Roadmap.md) — Phase 3 vertical slice
- Review package: [0071_mvp_visual_pivot_back_to_basics.md](../99_Reviews/Releases/0071_mvp_visual_pivot_back_to_basics.md)
