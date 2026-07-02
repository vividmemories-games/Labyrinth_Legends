# Engine Architecture

| Field | Value |
|-------|-------|
| **Project** | Labyrinth Legends |
| **Document Name** | Engine Architecture |
| **Document ID** | LLDS-DOC-04-EA-001 |
| **Path** | `docs/04_Technical/Engine_Architecture.md` |
| **Version** | 1.0.1 |
| **Status** | Approved & Locked |
| **Owner** | Apoorv |
| **Prepared By** | Cursor (compiler) |
| **Last Updated** | 2026-07-03 |
| **Phase** | M1 Preparation — Engine Architecture Contract |
| **Dependencies** | [Technical Implementation Plan](Technical_Implementation_Plan.md) · [Level_Format.md](Level_Format.md) · [Coding_Standards.md](Coding_Standards.md) · [Architecture.md](Architecture.md) · [Gameplay](../01_Game_Design/Gameplay/Gameplay.md) · GP1 · GP2 · GP5 · GP7 · [AGENTS.md](../../AGENTS.md) |
| **Related Documents** | [M0.3 Architecture Readiness Review](../99_Reviews/M0_3_Architecture_Readiness_Review.md) · `Engine_Session.md` (future — post-M1 reference) |

## Navigation

| ← Previous | Next → | Index |
|------------|--------|-------|
| [Coding Standards](Coding_Standards.md) | [Architecture](Architecture.md) | [Technical README](README.md) · [LLDS Home](../README.md) |

---

## Version History

| Version | Date | Author | Summary |
|---------|------|--------|---------|
| 1.0.0 | 2026-07-03 | Cursor | Initial engine architecture contract — EA-001 through EA-008 approved and locked |
| 1.0.1 | 2026-07-03 | Cursor | Codex review: plain-text `Engine_Session.md` reference; M1 implementation guardrails |

---

## 1. Purpose

This document is the **authoritative architecture contract** for the Labyrinth Legends **Pure Dart gameplay engine** (`lib/game_engine/`).

It captures the eight engine architecture decisions approved during M1 preparation (Human + ChatGPT Technical Architect) and defines **what the engine is**, **how components relate**, and **what boundaries must not be crossed** — without prescribing Dart classes, method signatures, or implementation code.

Gameplay rules remain in GP1–GP7. Level content remains in [Level_Format.md](Level_Format.md). Engineering discipline remains in [Coding_Standards.md](Coding_Standards.md). This document governs **engine structure and ownership only**.

---

## 2. Scope

### In scope

- Pure Dart engine architecture for Draw Your Fate gameplay
- Component responsibilities and ownership
- Session lifecycle phases
- Execution pipeline and communication rules
- Locked architecture decisions (EA-001 through EA-008)
- Engine boundaries (what the engine must never depend on)
- Principles for future mechanic extension

### Out of scope for this document

See [§15 Out of Scope](#15-out-of-scope).

### Milestone alignment

This contract governs **M1.1 Engine Core** implementation and all subsequent engine work until a formal architecture revision is approved per [AGENTS.md](../../AGENTS.md) Architecture Freeze Rule.

---

## 3. Relationship to Other Documents

### What this document is

| Role | Description |
|------|-------------|
| **Architecture contract** | Locks engine structure for implementation |
| **Authoritative for engine implementation** | All `game_engine/` work must conform |
| **Implementation independent** | No Dart APIs, no method specs |
| **Flutter independent** | Engine runs in pure Dart tests without UI |

### What this document is not

| Not | Reason |
|-----|--------|
| API reference | Implementation detail — belongs in code + tests |
| Class reference | Names components; does not define signatures |
| Method specification | Deferred to proven implementation |
| Implementation guide | See [Coding_Standards.md](Coding_Standards.md) for coding rules |
| `Engine_Session.md` | Future engineering reference documenting proven M1 implementation after stabilisation |

### Authority layering

```text
GP1 · GP2 · GP5 · GP7          — gameplay rules (what happens)
Level_Format.md                — level content contract (what is on the grid)
Engine_Architecture.md         — engine structure contract (how components relate)  ← this document
Coding_Standards.md            — engineering discipline (how code is written)
Engine_Session.md (future)     — proven implementation reference (how it was built)
Implementation (lib/game_engine/) — behaviour lives in code
```

When this document conflicts with GP specs or Level_Format, **preserve the higher authority** and report the conflict in a review package.

### Technical Contract status

Per [AGENTS.md](../../AGENTS.md) §5, this document is a **Technical Contract** — it governs engine implementation. It is not a non-blocking engineering reference.

---

## 4. Core Engine Philosophy

| Principle | Meaning for the engine |
|-----------|------------------------|
| **Documentation First** | Architecture is decided here before code; do not invent structure during implementation |
| **Simplicity Over Complexity** | Few components, clear ownership, no enterprise patterns |
| **Pure Dart Engine** | `game_engine/` has no Flutter, Riverpod, or platform dependencies |
| **Behaviour Lives in Code** | GP specs define rules; engine code implements them deterministically |
| **GameplaySession is the only public engine API** | External layers interact with the engine through one façade |
| **One Source of Truth** | Runtime gameplay state lives in one place per attempt |
| **Solo Developer First** | Architecture must remain maintainable by one developer with AI assistance |
| **Deterministic Gameplay** | Same level + same path + same initial state → same outcome |
| **Architecture Before Implementation** | M0 complete; this contract precedes M1.1 coding |

---

## 5. High-Level Architecture

The engine is a **session-centric orchestration model**. One `GameplaySession` represents one level attempt. Specialist components perform single responsibilities and report facts back to the session. The session owns outcomes and lifecycle transitions.

```text
┌─────────────────────────────────────────────────────────┐
│                    External Layers                       │
│         (Flutter UI · Riverpod · data/ · core/)          │
│                          │                               │
│              interacts only via                          │
│                          ▼                               │
│              ┌───────────────────────┐                   │
│              │   GameplaySession     │  ← only public API │
│              │   (orchestrator)      │                   │
│              └───────────┬───────────┘                   │
│                          │                               │
│     ┌────────────────────┼────────────────────┐           │
│     ▼                    ▼                    ▼           │
│ PathValidator      PathExecutor      ObjectiveEvaluator   │
│                          │                               │
│                          ▼                               │
│                    StepResolver                           │
│                                                          │
│              (RewardCalculator — stars; session-led)     │
└─────────────────────────────────────────────────────────┘
```

**Level content** enters the engine as an immutable `LevelDefinition` (parsed per [Level_Format.md](Level_Format.md)). The engine does not load assets or JSON directly.

---

## 6. Engine Principles

| # | Principle |
|---|-----------|
| P1 | **Single public API** — only `GameplaySession` is visible outside `game_engine/` for gameplay orchestration |
| P2 | **Session owns runtime state** — one active level attempt per session instance |
| P3 | **Workers report facts** — specialist components return results; they do not own lifecycle or outcomes |
| P4 | **No peer communication** — components do not call each other except where explicitly allowed (PathExecutor → StepResolver) |
| P5 | **Flutter owns timing** — animation cadence and step pacing are UI concerns; engine steps are instantaneous and deterministic |
| P6 | **Engine owns logic** — path legality, GP7 resolution, objectives, and stars follow gameplay rules in pure Dart |
| P7 | **Determinism** — no randomness, no hidden state, no platform callbacks in engine logic |
| P8 | **Extend, don't redesign** — new mechanics extend `StepResolver` behaviour within this architecture |

---

## 7. Component Responsibilities

This section defines **ownership and responsibility only**. It does not define methods, APIs, or class signatures.

### GameplaySession

| | |
|---|---|
| **Purpose** | Single entry point for one level attempt; orchestrates all engine collaborators |
| **Responsibilities** | Own runtime gameplay state; accept player input for path drawing; confirm paths; drive execution; apply worker results; transition lifecycle phases (`drawing` → `executing` → `won` / `lost`); expose session outcome |
| **Does NOT own** | Path legality rules (delegates to PathValidator); per-tile GP7 resolution (delegates via PathExecutor/StepResolver); objective rule definitions (delegates to ObjectiveEvaluator); save data; player profile; settings; navigation; audio; analytics; monetization; asset loading |

### PathValidator

| | |
|---|---|
| **Purpose** | Evaluate whether a drawn path is legal per GP2 before execution |
| **Responsibilities** | Check path structure (start, exit, adjacency, walls, locks when supported); return validation result as facts |
| **Does NOT own** | Session state; lifecycle transitions; execution; objectives; outcomes; UI feedback |

### PathExecutor

| | |
|---|---|
| **Purpose** | Advance execution one tile at a time along the confirmed path |
| **Responsibilities** | Move to the next path node; invoke tile resolution for the destination; return step result to the session |
| **Does NOT own** | Path drawing; path validation; session lifecycle; objective outcomes; timing or animation |

### StepResolver

| | |
|---|---|
| **Purpose** | Apply GP7 per-step resolution for the destination tile |
| **Responsibilities** | Resolve traversal, collectibles, interactive elements, hazards, and per-step effects per GP7 §8 order; return factual step resolution result |
| **Does NOT own** | Session lifecycle; path validation; movement between tiles (PathExecutor); objective completion decisions; win/lose transitions |

### ObjectiveEvaluator

| | |
|---|---|
| **Purpose** | Evaluate whether level objectives are met per GP5 |
| **Responsibilities** | Assess objective progress and completion against level definition; return factual objective state |
| **Does NOT own** | Session lifecycle; path validation; per-step resolution; win/lose transitions; persistence; star calculation |

### Supporting collaborator (not a public API)

**RewardCalculator** — evaluates star outcome from path node count vs `starThresholds` per [Level_Format.md §14](Level_Format.md#14-reward-and-star-threshold-encoding). Orchestrated by `GameplaySession` after objectives are assessed. Not a public engine API.

---

## 8. Engine State Ownership

### GameplaySession owns (one active level attempt)

| State domain | Description |
|--------------|-------------|
| Runtime gameplay state | Current phase, attempt context |
| Player position | Explorer position during execution |
| Confirmed path | Ordered path committed for execution |
| Execution state | Progress along confirmed path |
| Collected items during attempt | Gems, keys, relics collected this run |
| Objective progress | Whether objectives are met so far |
| Current phase | `drawing`, `executing`, `won`, or `lost` |
| Session result | Outcome of the attempt (completion, stars, etc.) |

### GameplaySession does NOT own

| Domain | Owner |
|--------|-------|
| Save data | `data/` — ProgressRepository |
| Player profile | `data/` — outside engine |
| Progression / unlocks | `data/` — outside engine |
| Settings | `data/` / `core/` — outside engine |
| Navigation | `app/` — go_router |
| Audio | `core/` services — outside engine |
| Analytics | `core/` services — outside engine |
| Monetization | `core/` services — outside engine |
| Level JSON / assets | `data/` LevelRepository — engine receives `LevelDefinition` only |

**Rule:** Persistent data never lives inside `game_engine/`. The engine produces outcomes; external layers persist them.

---

## 9. Engine Execution Flow

Conceptual pipeline for one gameplay interaction cycle:

```text
Flutter UI
    ↓  (player input: draw, confirm, step request)
GameplaySession
    ↓  (on confirm: validate path)
PathValidator
    ↓  (validation facts returned to session)
GameplaySession
    ↓  (on execute: advance one tile)
PathExecutor
    ↓  (resolve destination tile)
StepResolver
    ↓  (step facts returned via PathExecutor to session)
GameplaySession
    ↓  (assess objectives when appropriate)
ObjectiveEvaluator
    ↓  (objective facts returned to session)
GameplaySession
    ↓  (session snapshot / outcome)
Flutter UI
```

### Stage responsibilities

| Stage | Responsibility |
|-------|----------------|
| **Flutter UI** | Render session state; capture input; own animation timing between engine steps |
| **GameplaySession** | Orchestrate; own state; decide when to validate, execute, evaluate; apply results; transition phases |
| **PathValidator** | Report whether the confirmed path is legal (GP2) |
| **PathExecutor** | Advance one tile along the confirmed path |
| **StepResolver** | Resolve GP7 effects for the destination tile |
| **ObjectiveEvaluator** | Report objective progress and completion (GP5) |

**Drawing phase:** UI forwards path input to `GameplaySession`. Session updates the draft path. No execution occurs.

**Confirm:** Session invokes `PathValidator`. Invalid paths cannot proceed to execution (GP2).

**Executing phase:** UI requests steps (on its own timing). Session invokes `PathExecutor` → `StepResolver` per EA-007. Session updates state and checks objectives. Session transitions to `won` or `lost` when rules dictate.

---

## 10. Engine Communication Rules

### Central orchestrator

`GameplaySession` is the **only** component that coordinates engine collaborators. All gameplay flow passes through the session.

### Allowed communication

| From | To | Purpose |
|------|-----|---------|
| GameplaySession | PathValidator | Validate confirmed path |
| GameplaySession | PathExecutor | Advance execution one tile |
| GameplaySession | ObjectiveEvaluator | Assess objective state |
| PathExecutor | StepResolver | Resolve destination tile per GP7 |

### Forbidden communication

| From | To | Reason |
|------|-----|--------|
| StepResolver | ObjectiveEvaluator | Workers do not chain; session orchestrates |
| ObjectiveEvaluator | PathExecutor | Workers do not drive execution |
| PathValidator | GameplaySession | Workers do not mutate session — session calls validator and applies facts |
| Any worker | Any worker (except PathExecutor → StepResolver) | No peer orchestration |

### Worker vs orchestrator rule

**Workers report facts. GameplaySession owns outcomes.**

Specialist components return results. Only `GameplaySession` applies those results to runtime state, transitions phases, and determines session outcome.

---

## 11. Locked Architecture Decisions

The following decisions are **locked** for M1 and beyond unless Human approves an architecture revision per [AGENTS.md](../../AGENTS.md) Architecture Freeze Rule.

### EA-001

**GameplaySession is the only public gameplay engine API.**

External layers (`features/`, `data/` providers) interact with gameplay logic only through `GameplaySession`. Internal components (`PathValidator`, `PathExecutor`, `StepResolver`, `ObjectiveEvaluator`, `RewardCalculator`) are engine-internal.

---

### EA-002

**GameplaySession lifecycle:**

```text
drawing
    ↓
executing
    ↓
won / lost
```

No hidden phases. `drawing` is the planning/commitment phase (GP7 "Planning Phase" in gameplay vocabulary). The engine enum is `drawing` per [Coding_Standards.md](Coding_Standards.md) §6.

---

### EA-003

**Execution pipeline:**

```text
GameplaySession
    ↓
PathExecutor
    ↓
StepResolver
```

Path validation and objective evaluation are session-orchestrated but outside this per-step execution chain.

---

### EA-004

**GameplaySession is the single source of truth.**

All runtime gameplay state for one level attempt lives in the session. No duplicate session state in workers, providers, or UI.

---

### EA-005

**GameplaySession orchestrates all engine collaborators.**

The session decides when to validate, execute, evaluate objectives, and calculate rewards. Workers do not initiate actions on other workers or on the session.

---

### EA-006

**Flutter owns timing. The engine owns gameplay logic.**

The UI controls when to request the next engine step (animation cadence, pauses). Each engine step is instantaneous and deterministic. The engine never schedules timers or depends on frame callbacks.

---

### EA-007

**One execution step equals:**

```text
Move one tile
    ↓
Resolve destination tile
    ↓
Update session
    ↓
Return
```

One UI-driven step request produces one tile advance, one GP7 resolution, one session update. The engine does not batch or skip tiles within a single step call.

---

### EA-008

**Workers report facts. GameplaySession owns lifecycle transitions and session outcomes.**

Validators, executors, resolvers, and evaluators return factual results. Only the session transitions `drawing` → `executing` → `won` / `lost` and determines the final attempt outcome.

---

## 12. Engine Boundaries

The engine (`lib/game_engine/`) must **never** depend on:

| Forbidden dependency | Reason |
|---------------------|--------|
| Flutter | Pure Dart testability |
| Widgets | UI is `features/` + `design_system/` |
| Riverpod | State orchestration is `data/` / `features/` |
| Firebase | Post-MVP; not in vertical slice |
| Assets / AssetBundle | Level loading is `data/`; engine receives `LevelDefinition` |
| Audio | Platform service — `core/` |
| Navigation | `app/` router |
| Analytics | `core/` service interface |
| Monetization | `core/` service interface |
| Persistence | `data/` repositories |

The engine must remain **Pure Dart** — runnable in `flutter test test/game_engine/` without widget bindings.

---

## 13. Future Evolution

New gameplay mechanics should **extend** the engine within this architecture — not redesign it.

| Future mechanic | Extension point |
|-----------------|-----------------|
| Teleporters | `StepResolver` — traversal resolution |
| Switches | `StepResolver` — interactive resolution |
| Moving platforms | `StepResolver` — environmental resolution |
| Enemies | `StepResolver` — hazard / interaction resolution |
| Portals | `StepResolver` — traversal resolution |
| Ice / conveyors | `StepResolver` — traversal modifiers per GP2/GP3 |
| Future puzzle elements | `StepResolver` per GP7 step order |

**Rule:** Map new mechanics to the GP7 pipeline first. Extend `StepResolver` behaviour. Do not add parallel execution paths or new public engine APIs without architecture revision approval.

### M1 implementation guardrails

During M1 code review, treat **EA-008** as the primary standard: workers report facts; `GameplaySession` owns lifecycle transitions and outcomes. Reject any change where a worker mutates session state directly or decides win/loss independently of the session.

| Component | Guardrail |
|-----------|-----------|
| `GameplaySession` | Orchestration and state ownership only — do not absorb GP2/GP7 rule logic that belongs in workers |
| `StepResolver` | Per-tile GP7 resolution only — primary extension point for new mechanics; avoid becoming a second orchestrator |

Schema changes for new level content follow [Level_Format.md](Level_Format.md) version increments.

---

## 14. Out of Scope

This document does **not** define:

- Dart class definitions
- Public or private APIs
- Method signatures
- Riverpod providers
- Flutter widgets
- Persistence or save format
- Navigation routes
- Save system behaviour
- Implementation algorithms
- Test code

Those belong in implementation, [Coding_Standards.md](Coding_Standards.md), `Engine_Session.md` (future engineering reference — not yet authored), or their respective technical contracts.

---

## 15. References

### Gameplay authority

- [GP1 — Player Explorer](../01_Game_Design/Gameplay/GP1_Player_Explorer.md)
- [GP2 — Movement System](../01_Game_Design/Gameplay/GP2_Movement_System.md)
- [GP5 — Objectives & Completion](../01_Game_Design/Gameplay/GP5_Objectives_Completion.md)
- [GP7 — Gameplay Rules](../01_Game_Design/Gameplay/GP7_Gameplay_Rules.md) — step resolution order §8

### Technical contracts

- [Level_Format.md](Level_Format.md) — level content, load pipeline, star metric
- [Coding_Standards.md](Coding_Standards.md) — engine module map, coding discipline
- [Technical_Implementation_Plan.md](Technical_Implementation_Plan.md) — M1 milestone
- [Architecture.md](Architecture.md) — five-layer stack
- [AGENTS.md](../../AGENTS.md) — governance, Architecture Freeze Rule

### Reviews

- [M0.3 Architecture Readiness Review](../99_Reviews/M0_3_Architecture_Readiness_Review.md)

### Future

- `Engine_Session.md` — proven implementation reference (post-M1 stabilisation)

---

## Navigation

| ← Previous | Next → | Index |
|------------|--------|-------|
| [Coding Standards](Coding_Standards.md) | [Architecture](Architecture.md) | [Technical README](README.md) · [LLDS Home](../README.md) |
