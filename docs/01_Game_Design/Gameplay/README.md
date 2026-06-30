# Gameplay Specifications (GP Series)

Authoritative gameplay specifications under `docs/01_Game_Design/Gameplay/`.

These documents sit between [Game Loop](../Game_Loop.md) (loop architecture) and [Gameplay.md](../Gameplay.md) (integration layer — **v2.1.0 Approved / Locked**).

## Authority

```text
Vision.md
    ↓
Game_Loop.md
    ↓
Gameplay Core Specifications (GP1, GP2, GP7)
    ↓
GP3 Puzzle Element Series (GP3.1–GP3.5)
    ↓
Gameplay Feature Specifications (GP3 Integration, GP4–GP6)
    ↓
Gameplay.md
```

## Specification Index

### Core Specifications (GP1, GP2, GP7)

| ID | Document | Status | Scope |
|----|----------|--------|-------|
| **GP1** | [GP1_Player_Explorer.md](GP1_Player_Explorer.md) | Approved / Locked | Player ↔ Explorer relationship, agency, planning vs execution |
| **GP2** | [GP2_Movement_System.md](GP2_Movement_System.md) | Approved / Locked | Node-to-node movement, path creation, validation, execution |
| **GP7** | [GP7_Gameplay_Rules.md](GP7_Gameplay_Rules.md) | Approved / Locked | Rule precedence, execution order |

### Puzzle Design Series (GP3.1–GP3.5)

| ID | Document | Status | Scope |
|----|----------|--------|-------|
| **GP3.1** | [GP3/GP3.1_Puzzle_Taxonomy.md](GP3/GP3.1_Puzzle_Taxonomy.md) | Approved / Locked | Puzzle taxonomy, philosophy, classification |
| GP3.2 | [GP3/GP3.2_Static_Traversal_Collectible_Elements.md](GP3/GP3.2_Static_Traversal_Collectible_Elements.md) | Approved / Locked | Static, traversal & collectible elements |
| GP3.3 | [GP3/GP3.3_Interactive_Elements.md](GP3/GP3.3_Interactive_Elements.md) | Approved / Locked | Interactive elements |
| GP3.4 | [GP3/GP3.4_Environmental_Dynamic_Systems.md](GP3/GP3.4_Environmental_Dynamic_Systems.md) | Approved / Locked | Environmental & dynamic systems |
| GP3.5 | [GP3/GP3.5_Puzzle_Composition_Level_Design_Rules.md](GP3/GP3.5_Puzzle_Composition_Level_Design_Rules.md) | Approved / Locked | Puzzle composition & level design rules |

Index: [GP3/README.md](GP3/README.md)

### Feature / Integration Specifications

| ID | Document | Status | Scope |
|----|----------|--------|-------|
| GP3 Integration | [Puzzle_Elements.md](Puzzle_Elements.md) | Not started | Integrated puzzle catalogue (synthesizes GP3.1–GP3.5) |
| **GP4** | [GP4_Hazards_Failure.md](GP4_Hazards_Failure.md) | Approved / Locked | Hazards, failure modes, fairness, MVP scope |
| **GP5** | [GP5_Objectives_Completion.md](GP5_Objectives_Completion.md) | Approved / Locked | Objectives, completion, mastery, seals |
| **GP6** | [GP6_Gameplay_Feedback.md](GP6_Gameplay_Feedback.md) | Approved / Locked | Gameplay feedback, readability, hints |

## Categories

| Category | Documents |
|----------|-----------|
| **Core** | GP1 · GP2 · GP7 (`GP7_Gameplay_Rules.md`) |
| **Puzzle elements** | GP3.1–GP3.5 → `Puzzle_Elements.md` (integration) |
| **Features** | GP4–GP6 |

Core specifications define foundations. GP3 defines puzzle elements. Feature specs extend both — never redefine Core or GP3 element behaviour.

## Navigation

| ← Previous | Next → | Index |
|------------|--------|-------|
| [Game Loop](../Game_Loop.md) | [GP1 — Player & Explorer](GP1_Player_Explorer.md) | [LLDS Home](../../README.md) · [Gameplay Integration](../Gameplay.md) |
