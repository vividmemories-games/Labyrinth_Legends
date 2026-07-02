# Technical Documentation

| Field | Value |
|-------|-------|
| **Project** | Labyrinth Legends |
| **Folder** | `docs/04_Technical/` |
| **Authority** | Engineering structure, persistence, state, implementation sequencing |
| **Status** | Active — partial coverage; see readiness in implementation plan |

## Purpose

Technical documentation defines **how approved design is built and shipped** in Flutter. It extends — but never redefines — [Gameplay](../01_Game_Design/Gameplay/Gameplay.md), [LLDL](../02_Design_System/LLDL/LLDL.md), and [Asset Bible](../06_Asset_Bible/Asset_Bible.md).

## Start Here

| I need to… | Read |
|------------|------|
| Plan the first playable build | **[Technical Implementation Plan](Technical_Implementation_Plan.md)** |
| Define level JSON schema | **[Level Format](Level_Format.md)** |
| Understand layer architecture | [Architecture](Architecture.md) |
| Find target `lib/` layout | [Folder Structure](Folder_Structure.md) |
| Follow engineering standards | **[Coding Standards](Coding_Standards.md)** |
| Understand engine architecture | **[Engine Architecture](Engine_Architecture.md)** |
| Wire Riverpod providers | [State Management](State_Management.md) |
| Persist player progress locally | [Save System](Save_System.md) |
| Onboard as Cursor agent | [AGENTS.md](../../AGENTS.md) · [Cursor Workflow](../05_AI/Cursor/Workflow.md) |

## Document Index

### Implementation roadmap

| Document | Status | Description |
|----------|--------|-------------|
| **[Technical_Implementation_Plan.md](Technical_Implementation_Plan.md)** | Approved | **Bridge document** — vertical slice scope, phases, prerequisites, first coding milestone |

### Authoritative (partial — usable now)

| Document | Status | Description |
|----------|--------|-------------|
| [Architecture.md](Architecture.md) | Partial | Layer principles, key flows, testing policy |
| [Folder_Structure.md](Folder_Structure.md) | Partial | Target Flutter folder layout |
| [State_Management.md](State_Management.md) | Partial | Riverpod patterns and rules |
| [Save_System.md](Save_System.md) | Partial | Local SharedPreferences MVP |
| [Level_Format.md](Level_Format.md) | Approved | Hand-authored level JSON schema (M0 / Phase 1) |
| [Coding_Standards.md](Coding_Standards.md) | Approved | Engineering rulebook (M0.2) |
| [Engine_Architecture.md](Engine_Architecture.md) | Approved & Locked | Pure Dart engine architecture contract (M1) |

### Planned (create before dependent coding)

| Document | Priority | Description |
|----------|----------|-------------|
| `Engine_Session.md` | P1 (recommended) | Proven implementation reference — after first stable M1 engine |
| `Navigation.md` | P2 | go_router route table |

### Stubs (not authoritative yet)

Do **not** depend on these for implementation guidance until expanded:

| Document | Notes |
|----------|-------|
| [Firebase.md](Firebase.md) | Post-MVP cloud services |
| [Analytics.md](Analytics.md) | Post-MVP telemetry |
| [Maze_Generator.md](Maze_Generator.md) | Not in vertical slice — hand-authored levels only |
| [Procedural_Generation.md](Procedural_Generation.md) | Not in vertical slice |

## Authority Hierarchy

```text
Vision → Game Loop → Gameplay → LLDL → Asset Bible → Screen Specs → Technical Docs → Code
```

When technical docs conflict with gameplay or design authority, **preserve the higher document** and report the conflict.

## Related

- [LLDS Home](../README.md)
- [Roadmap](../00_Project/Roadmap.md)
- [Prototype Status](../00_Project/Prototype_Status.md)
- [Review Packages](../99_Reviews/README.md)
