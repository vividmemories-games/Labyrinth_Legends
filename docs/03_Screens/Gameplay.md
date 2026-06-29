# Gameplay Screen

**Route:** `/play/:levelId`  
**Mockup ref:** Center gameplay panel in `docs/assets/mockups/ui_board_master.png`

## Purpose

Core Draw Your Fate experience — maze, path drawing, execution, HUD.

## Layout

```
Scaffold (temple black)
├─ AppBar: back, level name, pause (LLIconButton)
├─ HUD row: moves | gems | key slot (LLCurrencyChip / stat chips)
├─ LLPanel (maze frame, gold border)
│   └─ MazeBoard (LLMazeTile painter, faux-isometric)
├─ Status message (danger ember if invalid)
└─ Control bar:
    ├─ LLButton ghost — Undo
    ├─ LLButton ghost — Erase
    ├─ LLButton secondary — Hint
    └─ LLButton primary — Go
```

## Maze Visual

- Walls: stone mid
- Floor: stone dark
- Path: `LLColor.energyCyan` glow stroke
- Portal exit: `LLColor.portalBlue` + `LLAnimation.portalPulse`
- Gems: `LLColor.crystalPurple`
- Character: cyan energy orb
- Fog: `LLColor.fogVeil`

## Phases

| Phase | UI |
|-------|-----|
| Drawing | Controls enabled, path extends on tap |
| Executing | Controls disabled, character animates |
| Paused | Overlay — see `Pause.md` |
| Won | Navigate to `Victory.md` |
| Lost | Retry overlay |

## Input

Hit testing must match painter transform (documented in `Architecture.md`).

## Components

`LLPanel`, `LLButton`, `LLMazeTile` / `MazeBoard`, `LLIconButton`

## Engine

All rules in `game_engine/` — screen only renders `GameplayUiState`.
