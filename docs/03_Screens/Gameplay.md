# Gameplay Screen

**Route:** `/play/:levelId`  
**Authority:** [WS4 — UI Language](../02_Design_System/LLDL/WS4_UI_Language.md) (progressive HUD)  
**MVP visual authority:** [MVP_Visual_Target.md](../06_Asset_Bible/MVP_Visual_Target.md)  
**Mockup ref:** Panel 3 in `docs/assets/mockups/ui_board_master.png` · `docs/06_Asset_Bible/get back to basics.png`

## Purpose

Core Draw Your Fate experience — maze, path drawing, execution, **progressive** HUD.

The gameplay HUD is **not a persistent dashboard**. It surfaces only what the current loop phase requires ([WS4 §4](../02_Design_System/LLDL/WS4_UI_Language.md#4-gameplay-hud-philosophy)).

---

## Layout (Shell) — MVP mockup

```
LLScreenBackground (optional gameplay_screen.png when bundled)
├─ GameplayTopBar: back · LEVEL N + stars · settings (pause)
├─ GameplayBoardContainer (gold-bordered maze frame)
│   └─ BoardRenderer (MazePainter + cell overlays + path + explorer)
└─ GameplayControlBar (drawing phase only)
    ├─ UNDO · ERASE · HINT (round stone buttons)
    ├─ MOVES · GEMS · KEYS stat row (conditional)
    ├─ status cue
    └─ GO / Draw Path primary CTA
```

During **execution**, the control bar hides (maze + explorer only).

---

## Progressive HUD by Phase

Maps `GameplayUiPhase` to WS4 loop temperament.

| Phase | WS4 temperament | Visible UI |
|-------|-----------------|------------|
| **Study / Drawing** (`drawing`) | Near-minimal — objectives as needed | Stat chips when level requires; path tools; validation message |
| **Execute** (`executing`) | Consequence communication — not cluttered | **Hide** control bar; maze + character animation only |
| **Paused** (`paused`) | Brief overlay | Pause overlay only — see `Pause.md` |
| **Won** (`won`) | Outcome then release | Navigate to `Victory.md` |
| **Lost** (`lost`) | Retry overlay | Overlay message + retry action |

### HUD Band Rules (Drawing Phase Only)

Show stat chips **only when fairness requires**:

| Chip | When visible |
|------|--------------|
| Moves | Always during drawing (draft path length) |
| Gems collected | When level has gems (`collectAllGems` or gems on grid) |
| Key slot | When level requires a key |

Use `GameplayStatColumn` — **functional tier only** (no ceremonial seals).

**Must not:**
- Show full stat dashboard during execution
- Pulse or flash unrelated to current phase
- Obscure labyrinth corners critical to planning
- Use ceremonial typography on live HUD labels

---

## Control Bar (Drawing Phase Only)

Visible only when `uiPhase == drawing`:

| Control | Component | Notes |
|---------|-----------|-------|
| Undo | `GameplayRoundActionButton` | `controller.undoDraftPath` |
| Erase | `GameplayRoundActionButton` | `controller.clearDraftPath` |
| Hint | `GameplayRoundActionButton` | Badge from `hintsRemaining`; solver wiring post-MVP |
| Go | `LLButton` primary (gold) | Label `GO` when path valid |

Hidden during `executing`, `paused`, `won`, `lost`.

---

## Maze Visual

| Element | Token / note |
|---------|--------------|
| Floor slabs | `tile_floor_1`–`tile_floor_4` per cell (random per level attempt) + `tile_floor.png` fallback; 0–270° rotation |
| Raised walls | Same variant + rotation as the adjacent walkable floor cell |
| Board presentation | Subtle perspective tilt (~6°) on `BoardRenderer` stack |
| Theme | `MazeTheme.ancientRuins` for World 01 |
| Path model | Schema v2 — impassability is **blocked edges** on walkable cells + implicit perimeter |
| Interaction overlays | `CellOverlay` — path tint, selection, fog, invalid target (transparent; no tile PNGs) |
| Path stroke | `LLColor.energyCyan` glow (`PremiumPathOverlayPainter`) |
| Portal exit | `LLGameplayAsset` exit portal + painter fallback |
| Gems / keys / locks | Full-cell sprites (`LLGameplayAsset`) |
| Character | `explorer_idle.png` — full cell |
| Board frame | `GameplayBoardContainer` — dark translucent panel, no gold border |
| Screen backdrop | `gameplay_screen.png` via `LLScreenBackground` |

Maze structure is **not** authored as per-cell floor/wall PNGs. Re-theming a world swaps `MazeTheme` colors/textures only. Collectibles and HUD icons remain AB2/AB3 PNG sprites.

---

## Phases (Engine ↔ UI)

| Phase | UI behavior |
|-------|-------------|
| Drawing | Controls enabled; path extends on tap; HUD band per rules above |
| Executing | Controls hidden; HUD hidden; character animates |
| Paused | Overlay — see `Pause.md` |
| Won | Navigate to `Victory.md` |
| Lost | Retry overlay |

---

## Input

Hit testing must match painter transform (documented in `Architecture.md`).

Touch targets on maze cells must tolerate finger scale per [Accessibility](../02_Design_System/Accessibility.md).

---

## Components

`GameplayTopBar`, `GameplayHeaderIconButton`, `GameplayControlBar`, `GameplayRoundActionButton`, `GameplayStatColumn`, `GameplayBoardContainer`, `BoardRenderer`, `LLGameplayAsset`, `LLButton`, `LLScreenBackground`

---

## Engine

All rules in `game_engine/` — screen only renders `GameplayUiState`.

---

## WS4 Compliance Checklist

- [x] HUD progressive — not persistent full dashboard
- [x] Controls hidden during execution
- [x] One gold primary CTA (`GO`) per control surface
- [x] Functional tier only on gameplay chrome
- [x] No prototype `ruins_*` / `app_colors` bypass
