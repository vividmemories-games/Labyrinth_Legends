# Gameplay Screen

**Route:** `/play/:levelId`  
**Authority:** [WS4 — UI Language](../02_Design_System/LLDL/WS4_UI_Language.md) (progressive HUD)  
**Mockup ref:** Center gameplay panel in `docs/assets/mockups/ui_board_master.png`

## Purpose

Core Draw Your Fate experience — maze, path drawing, execution, **progressive** HUD.

The gameplay HUD is **not a persistent dashboard**. It surfaces only what the current loop phase requires ([WS4 §4](../02_Design_System/LLDL/WS4_UI_Language.md#4-gameplay-hud-philosophy)).

---

## Layout (Shell)

```
Scaffold (LLColor.templeBlack)
├─ LLTopBar or minimal chrome: back, level name, pause (LLIconButton)
├─ [Phase-aware HUD band — see below]
├─ LLPanel (maze frame, gold border)
│   └─ MazeBoard (painter — LLMazeTile planned)
├─ [Phase-aware status line]
└─ [Phase-aware control bar — drawing only]
```

---

## Progressive HUD by Phase

Maps `GameplayUiPhase` to WS4 loop temperament.

| Phase | WS4 temperament | Visible UI |
|-------|-----------------|------------|
| **Study / Drawing** (`drawing`) | Near-minimal — objectives as needed | Optional stat chips (gems/key only if level requires); path tools; validation message |
| **Execute** (`executing`) | Consequence communication — not cluttered | **Hide** HUD row and control bar; maze + character animation only |
| **Paused** (`paused`) | Brief overlay | Pause overlay only — see `Pause.md` |
| **Won** (`won`) | Outcome then release | Navigate to `Victory.md` |
| **Lost** (`lost`) | Retry overlay | Overlay message + retry action |

### HUD Band Rules (Drawing Phase Only)

Show stat chips **only when fairness requires**:

| Chip | When visible |
|------|--------------|
| Moves / path length | Optional — prefer maze legibility over constant counter |
| Gems collected | When level has gems (`collectAllGems` or gems on grid) |
| Key slot | When level requires a key |

Use `LLCurrencyChip` / functional stat chips — **functional tier only** (no ceremonial seals).

**Must not:**
- Show full stat dashboard during execution
- Pulse or flash unrelated to current phase
- Obscure labyrinth corners critical to planning
- Use ceremonial typography on live HUD labels

---

## Control Bar (Drawing Phase Only)

Visible only when `uiPhase == drawing`:

| Control | Component | Variant |
|---------|-----------|---------|
| Undo | `LLButton` | `ghost` |
| Erase | `LLButton` | `ghost` |
| Hint | `LLButton` | `secondary` |
| Go | `LLButton` | `primary` (gold) |

Hidden during `executing`, `paused`, `won`, `lost`.

---

## Maze Visual

| Element | Token / note |
|---------|--------------|
| Walls | `LLColor.stoneMid` |
| Floor | `LLColor.stoneDark` |
| Path stroke | `LLColor.energyCyan` glow |
| Portal exit | `LLColor.portalBlue` + `LLAnimation.portalPulse` |
| Gems | `LLColor.crystalPurple` |
| Character | cyan energy orb |
| Fog | `LLColor.fogVeil` |
| Hazards | `LLColor.emberRed` + shape/icon — not color alone |

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

`LLPanel`, `LLButton`, `LLIconButton`, `LLCurrencyChip` (when needed), `MazeBoard` painter, `LLTopBar` (preferred over raw `AppBar`)

**Planned:** `LLMazeTile`, gameplay HUD chip family

---

## Engine

All rules in `game_engine/` — screen only renders `GameplayUiState`.

---

## WS4 Compliance Checklist

- [ ] HUD progressive — not persistent full dashboard
- [ ] Controls hidden during execution
- [ ] One gold primary CTA (`Go`) per control surface
- [ ] Functional tier only on gameplay chrome
- [ ] No prototype `ruins_*` / `app_colors` bypass
