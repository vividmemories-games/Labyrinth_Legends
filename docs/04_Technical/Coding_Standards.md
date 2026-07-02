# Coding Standards


| Field                 | Value                                                                                                                                                                                                                                                                                    |
| --------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Project**           | Labyrinth Legends                                                                                                                                                                                                                                                                        |
| **Document Name**     | Coding Standards                                                                                                                                                                                                                                                                         |
| **Document ID**       | LLDS-DOC-04-CS-001                                                                                                                                                                                                                                                                       |
| **Path**              | `docs/04_Technical/Coding_Standards.md`                                                                                                                                                                                                                                                  |
| **Version**           | 1.0.0                                                                                                                                                                                                                                                                                    |
| **Status**            | Approved                                                                                                                                                                                                                                                                                 |
| **Owner**             | Apoorv                                                                                                                                                                                                                                                                                   |
| **Prepared By**       | Cursor (compiler)                                                                                                                                                                                                                                                                        |
| **Last Updated**      | 2026-07-02                                                                                                                                                                                                                                                                               |
| **Phase**             | M0 — Technical Prerequisites (Phase 2 Engineering)                                                                                                                                                                                                                                       |
| **Dependencies**      | [Technical Implementation Plan](Technical_Implementation_Plan.md) · [Architecture](Architecture.md) · [Folder Structure](Folder_Structure.md) · [Level Format](Level_Format.md) · [State Management](State_Management.md) · [Save System](Save_System.md) · [AGENTS.md](../../AGENTS.md) |
| **Related Documents** | [Prototype Status](../00_Project/Prototype_Status.md) · [Cursor Workflow](../05_AI/Cursor/Workflow.md) · [Codex Review Checklist](../05_AI/Codex/Review_Checklist.md)                                                                                                                    |


## Navigation


| ← Previous                      | Next →                          | Index                                                     |
| ------------------------------- | ------------------------------- | --------------------------------------------------------- |
| [Level Format](Level_Format.md) | [Architecture](Architecture.md) | [Technical README](README.md) · [LLDS Home](../README.md) |


---

## Version History


| Version | Date       | Author | Summary                                                  |
| ------- | ---------- | ------ | -------------------------------------------------------- |
| 1.0.0   | 2026-07-02 | Cursor | Initial engineering standards for Phase 2 implementation |


---

## Table of Contents

1. [Purpose](#1-purpose)
2. [Engineering Philosophy](#2-engineering-philosophy)
3. [Architecture Principles](#3-architecture-principles)
4. [Project Structure](#4-project-structure)
5. [Flutter Layer Standards](#5-flutter-layer-standards)
6. [Pure Dart Engine Standards](#6-pure-dart-engine-standards)
7. [State Management Guidelines](#7-state-management-guidelines)
8. [Data Models & JSON Standards](#8-data-models--json-standards)
9. [Dependency Injection Guidelines](#9-dependency-injection-guidelines)
10. [Error Handling](#10-error-handling)
11. [Logging Standards](#11-logging-standards)
12. [Testing Standards](#12-testing-standards)
13. [Performance Guidelines](#13-performance-guidelines)
14. [Naming Conventions](#14-naming-conventions)
15. [Code Organization](#15-code-organization)
16. [Cursor Implementation Rules](#16-cursor-implementation-rules)
17. [Code Review Expectations](#17-code-review-expectations)
18. [Anti-Patterns](#18-anti-patterns)
19. [Definition of Done](#19-definition-of-done)
20. [References](#20-references)

---

## 1. Purpose

This document is the **authoritative engineering rulebook** for Labyrinth Legends implementation.

It answers:

> **How should code be structured, written, tested, and reviewed so it stays maintainable by a solo developer with AI assistance?**

### What this document does

- Defines layer boundaries, naming, testing, and review expectations
- Translates approved LLDS architecture into **actionable coding rules**
- Gives Cursor, Codex, and Human reviewers a shared engineering contract

### What this document does not do

- Redefine [Gameplay](../01_Game_Design/Gameplay/Gameplay.md), GP1–GP7, or puzzle mechanics
- Redefine [LLDL](../02_Design_System/LLDL/LLDL.md) or screen specifications
- Replace [Architecture.md](Architecture.md) or [Folder_Structure.md](Folder_Structure.md) — it **operationalizes** them
- Specify product features or milestone scope — see [Technical Implementation Plan](Technical_Implementation_Plan.md)

### When to read this


| Situation                                   | Action                                               |
| ------------------------------------------- | ---------------------------------------------------- |
| Starting any multi-file implementation task | Read §3–§7 and §16                                   |
| Adding engine behaviour                     | Read §6 and §12                                      |
| Adding UI or navigation                     | Read §5 and [LLDL](../02_Design_System/LLDL/LLDL.md) |
| Opening a PR or review package              | Read §17 and §19                                     |


---

## 2. Engineering Philosophy

These principles govern every implementation decision. When two approaches are valid, choose the one that best satisfies this table.


| Principle                      | Rule                                              | Why                                               |
| ------------------------------ | ------------------------------------------------- | ------------------------------------------------- |
| **Documentation first**        | LLDS defines behaviour; code implements it        | Prevents silent design drift and AI hallucination |
| **Simplicity over complexity** | Simplest correct solution wins                    | Solo dev velocity; less to break                  |
| **Pure Dart engine**           | Game rules live in `game_engine/` without Flutter | Testability and GP7 determinism                   |
| **Behaviour in code**          | JSON stores data; Dart stores behaviour           | See [Level_Format.md](Level_Format.md)            |
| **One source of truth**        | Link to docs; do not duplicate authority prose    | Avoid conflicting specs                           |
| **Solo developer first**       | Readable > clever; small PRs > big rewrites       | Sustainable pace with AI assistance               |


### Simplicity test

Before adding an abstraction, ask:

1. Does this solve a **current** milestone requirement?
2. Can it be expressed in **under 100 lines** without a new framework?
3. Will a new contributor (or future you) understand it in **one reading**?

If any answer is no, simplify or defer.

---

## 3. Architecture Principles

Authoritative layering from [Architecture.md](Architecture.md). **Higher layers depend on lower layers — never the reverse.**

```text
features/        → UI: render state, forward input only
design_system/   → LLDL tokens and components; no game rules
data/            → repositories, models, Riverpod providers
game_engine/     → pure Dart rules, session, path, resolution
core/            → service interfaces, env, shared utils
```

### Layer rules


| Layer            | May import                                         | Must not                                     |
| ---------------- | -------------------------------------------------- | -------------------------------------------- |
| `game_engine/`   | Dart SDK + small pure packages only                | `package:flutter/*`, widgets, Riverpod       |
| `data/`          | `game_engine/`, `core/`                            | Widgets, `BuildContext`                      |
| `features/`      | `design_system/`, `data/`, read-only engine models | Path validation, GP7 resolution, save writes |
| `design_system/` | Flutter, tokens                                    | `game_engine/`, gameplay rules               |
| `core/`          | Dart / Flutter as needed                           | Feature-specific logic                       |


### Data flow (unidirectional)

```text
User input → feature widget → provider → engine / repository → immutable state → UI rebuild
```

**Why:** Unidirectional flow makes sessions reproducible, testable, and easy for AI agents to reason about.

### Authority boundary


| Domain            | Authority                                                            | Code role                                |
| ----------------- | -------------------------------------------------------------------- | ---------------------------------------- |
| Mechanical rules  | GP1, GP2, GP7, [Gameplay.md](../01_Game_Design/Gameplay/Gameplay.md) | Implement — never redefine               |
| Level content     | [Level_Format.md](Level_Format.md)                                   | Parse and validate — never invent fields |
| Visual expression | [LLDL](../02_Design_System/LLDL/LLDL.md)                             | Tokens/components only                   |
| Persistence shape | [Save_System.md](Save_System.md)                                     | Repository writes only                   |


---

## 4. Project Structure

Target layout: [Folder_Structure.md](Folder_Structure.md). This section states **coding expectations** per folder.

```text
lib/
  main.dart                 # ProviderScope + app bootstrap
  app/                      # MaterialApp, router, theme entry
  design_system/            # LLDL — tokens, components, theme, showcase
  core/                     # env, service interfaces, mocks, utils
  game_engine/              # pure Dart — models, path, session, objectives, rewards
  data/                     # models, repositories, local store, providers.dart
  features/                 # one folder per screen/flow — presentation only

assets/levels/{worldId}/    # hand-authored JSON per Level_Format.md

test/
  game_engine/              # required — engine unit tests
  data/                     # repository round-trips
  design_system/            # widget/golden as needed
  integration/              # smoke flows — optional until slice integration
```

### Feature folder convention

```text
lib/features/<feature_name>/
  presentation/
    <feature>_screen.dart
    <feature>_provider.dart   # only if feature-scoped; prefer data/providers.dart
    widgets/                  # private to feature — not shared components
```

**Why:** Keeps features grep-friendly and prevents a flat `widgets/` dumping ground.

### Prototype retirement

Do **not** extend deprecated prototype paths listed in [Prototype_Status.md](../00_Project/Prototype_Status.md):

- `lib/core/widgets/ruins_`*
- `lib/core/constants/app_colors.dart`
- `lib/app/theme.dart`
- `lib/game_engine/generation/` (procedural — out of vertical slice scope)

Rebuild through `design_system/` and a GP7-aligned `game_engine/`.

---

## 5. Flutter Layer Standards

### UI responsibilities

Feature widgets **render** state and **forward** input. They do not:

- Validate paths
- Resolve GP7 steps
- Write to SharedPreferences
- Encode star or objective rules

### LLDL compliance (mandatory)


| Rule                    | Detail                                                               |
| ----------------------- | -------------------------------------------------------------------- |
| Use design tokens       | `LLColor`, `LLSpacing`, `LLRadius`, `LLTextStyle` — no magic numbers |
| Use shared components   | `LLButton`, `LLPanel`, etc. from `design_system/components/`         |
| Primary actions         | Gold (`LLColor.ancientGold`)                                         |
| Cyan                    | Paths and energy only — not generic primary buttons                  |
| No raw Material styling | Wrap or replace with LLDL components                                 |
| Screen specs            | Follow `docs/03_Screens/`* for layout intent                         |


**Why:** Visual consistency is a product requirement, not a polish pass.

### Widget guidelines


| Guideline                      | Application                                                |
| ------------------------------ | ---------------------------------------------------------- |
| Prefer `StatelessWidget`       | When state comes from Riverpod `ref.watch`                 |
| Keep `build()` shallow         | Extract private `_Section` widgets; avoid 200+ line builds |
| No business logic in `build()` | Compute in provider or engine; UI selects presentation     |
| `const` constructors           | Where possible — reduces rebuild cost                      |
| Keys                           | Use only when list identity requires it                    |


### Navigation

- **go_router** for all routes — route table will live in planned `Navigation.md` (P2; see [Technical Implementation Plan](Technical_Implementation_Plan.md) §14)
- Route params are **identifiers only** (`levelId`) — load data in provider/repository
- Deep links must not bypass unlock rules — `ProgressRepository` enforces access

### Assets

- Level JSON: `assets/levels/world_1/level_NNN.json`
- Images: `assets/images/` — bundle only production-needed assets
- Do not reference `docs/assets/` from Flutter — mockups are not runtime bundles

---

## 6. Pure Dart Engine Standards

The engine is the **highest-risk, highest-value** code in the project. Treat it accordingly.

### Flutter independence

```dart
// ✅ game_engine/path/path_validator.dart
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';

// ❌ Never in game_engine/
import 'package:flutter/material.dart';
```

**Why:** GP2/GP7 rules must run in `flutter test` without widget bindings.

### Engine module map


| Module        | Responsibility                                         | Authority                          |
| ------------- | ------------------------------------------------------ | ---------------------------------- |
| `models/`     | `LevelDefinition`, `MazeGrid`, `Cell`, `GameplayPhase` | [Level_Format.md](Level_Format.md) |
| `path/`       | `PathValidator`, `PathExecutor`                        | GP2                                |
| `session/`    | `GameplaySession`, `StepResolver`                      | GP1, GP7                           |
| `objectives/` | `ObjectiveEvaluator`                                   | GP5                                |
| `rewards/`    | `RewardCalculator`                                     | GP5, Level_Design                  |


### Session design


| Rule                      | Detail                                                              |
| ------------------------- | ------------------------------------------------------------------- |
| Immutable snapshots       | UI receives read-only session state; mutations via explicit methods |
| Determinism               | Same level + same path + same initial state → same outcome          |
| Phase machine             | `drawing` → `executing` → `won` / `lost` — no hidden phases         |
| No global mutable session | One session per level attempt; provider owns lifecycle              |


### Path and validation

- Validation logic lives **only** in `PathValidator`
- Invalid paths **cannot** be confirmed (GP2)
- Path is an ordered list of grid positions per [Level_Format.md §8](Level_Format.md#8-coordinate-system)

### Step resolution

- `StepResolver` implements GP7 per-step order for supported elements
- Do not add per-level exceptions in JSON or engine — escalate to GP doc change
- Defer unsupported GP3 elements until schema and specs say otherwise

### Engine class design


| Guideline                                                  | Why                                |
| ---------------------------------------------------------- | ---------------------------------- |
| Small focused classes                                      | Easier to test and review          |
| Pure functions where possible                              | Predictable unit tests             |
| Explicit types                                             | AI-generated code stays readable   |
| No `dynamic` in public APIs                                | Catches errors at compile time     |
| Document non-obvious invariants in code comments sparingly | Only when not obvious from GP spec |


---

## 7. State Management Guidelines

Stack: **Riverpod** (`flutter_riverpod`). Details: [State_Management.md](State_Management.md).

### Provider placement


| Scope                     | Location                                                       |
| ------------------------- | -------------------------------------------------------------- |
| App-wide                  | `lib/data/providers.dart`                                      |
| Feature-specific UI state | Feature folder — only if truly local                           |
| Services                  | `lib/core/services/service_providers.dart` or `providers.dart` |


### Provider type selection


| Concern                 | Provider type                              | Example                            |
| ----------------------- | ------------------------------------------ | ---------------------------------- |
| Player progress         | `AsyncNotifier` + repository               | `playerProgressProvider`           |
| Level by id             | `FutureProvider.family`                    | `levelProvider(levelId)`           |
| Active gameplay session | `StateNotifierProvider.autoDispose.family` | `gameplaySessionProvider(levelId)` |
| Service interfaces      | `Provider`                                 | `progressRepositoryProvider`       |


### Rules


| Rule                                                   | Why                                         |
| ------------------------------------------------------ | ------------------------------------------- |
| Providers **orchestrate** — they do not validate paths | Keeps GP2 in engine                         |
| Invalidate progress after completion                   | Level select reflects new stars/unlocks     |
| `autoDispose` gameplay providers                       | Release session when leaving screen         |
| Prefer immutable state classes                         | `copyWith` or sealed classes for UI diffing |
| No `setState` for gameplay state                       | Riverpod is the single UI state bus         |


### Prototype note

Legacy `GameplayController` mutates session in place — **do not extend**. Refactor to immutable engine snapshots.

---

## 8. Data Models & JSON Standards

### Level JSON

- **Authority:** [Level_Format.md](Level_Format.md)
- Parse in `LevelDefinition.fromJson` after `LevelFormatValidator.validate`
- Reject unknown required keys at load per schema version
- **Do not** embed behaviour flags that duplicate GP7 rules

### Data layer models


| Model                                 | Layer                            | Notes                                |
| ------------------------------------- | -------------------------------- | ------------------------------------ |
| `LevelDefinition`, `MazeGrid`, `Cell` | `game_engine/models/`            | Immutable; engine domain             |
| `PlayerProgress`, `LevelProgress`     | `data/models/`                   | Persistence domain                   |
| DTO vs domain                         | Single model per concern for MVP | Avoid duplicate mapping until needed |


### JSON parsing rules


| Rule                                                                            | Detail                                               |
| ------------------------------------------------------------------------------- | ---------------------------------------------------- |
| Validate before parse                                                           | Structural errors throw typed `LevelFormatException` |
| Use `json_serializable` only if it reduces boilerplate without obscuring schema | Optional — manual parse acceptable for M1            |
| No silent defaults for required gameplay fields                                 | Fail load if `start`/`exit` missing                  |
| Version field                                                                   | Respect `schemaVersion` from Level_Format            |


### Persistence JSON

- Keys and shapes per [Save_System.md](Save_System.md)
- **Repositories only** write progress — never widgets or engine
- Star totals increment only on new personal best

---

## 9. Dependency Injection Guidelines

Labyrinth Legends uses **Riverpod as the DI container** — not a separate service locator framework.

### Service interfaces

```text
lib/core/services/
  analytics_service.dart          # abstract interface
  mock_analytics_service.dart     # vertical slice implementation
```


| Rule                             | Detail                                                      |
| -------------------------------- | ----------------------------------------------------------- |
| Interface first                  | Define abstract class or typedef in `core/services/`        |
| Mock for slice                   | `Mock*` implementations — no real Firebase/ads/IAP in slice |
| Single binding                   | One `Provider` per interface in `providers.dart`            |
| No `GetIt`, no manual singletons | Riverpod owns lifecycle                                     |


### Repository injection

```dart
// Pattern: repository provider → consumed by notifiers
final progressRepositoryProvider = Provider<ProgressRepository>((ref) {
  return ProgressRepository(ref.watch(localProgressStoreProvider));
});
```

**Why:** Test overrides use `ProviderScope(overrides: [...])` without refactoring production code.

### Testing overrides

- Override repositories and services in tests — never hit real SharedPreferences in engine tests
- Engine tests require **no** `ProviderScope` unless testing a thin adapter

---

## 10. Error Handling

Prefer **explicit, typed failures** over silent recovery.

### Error categories


| Category                | Handling                                   | Layer                   |
| ----------------------- | ------------------------------------------ | ----------------------- |
| Level load / schema     | `LevelFormatException` — fail load; log id | `data/` / engine parser |
| Path validation         | `PathValidationResult` with reason enum    | `game_engine/`          |
| Save I/O                | Catch, log, surface degraded state in UI   | `data/local/`           |
| Unexpected engine state | `StateError` in debug; assert in tests     | `game_engine/`          |


### Rules


| Rule                                   | Why                                           |
| -------------------------------------- | --------------------------------------------- |
| Never swallow validation failures      | Player must see why Confirm is disabled (GP6) |
| No try/catch in widgets for game rules | Handle in provider; UI shows message          |
| Fail fast in development               | Assertions catch drift early                  |
| User-facing copy from specs            | Not raw exception strings                     |


### What not to do

- Generic `catch (e)` without rethrow or mapping in repositories
- Fallback gameplay rules on parse error
- Defaulting to a win state on objective evaluation failure

---

## 11. Logging Standards

Keep logging **minimal and purposeful** until analytics is specified.

### Approach


| Environment      | Mechanism                                                                      |
| ---------------- | ------------------------------------------------------------------------------ |
| Debug / profile  | `dart:developer` `log()` or `debugPrint` wrapped in `assert`/kDebugMode checks |
| Tests            | No logging assertions unless debugging a failure                               |
| Production slice | Minimal — no PII; no path coordinates in release logs                          |


### When to log


| Event                   | Level                                                  |
| ----------------------- | ------------------------------------------------------ |
| Level load failure      | Warning — include `levelId`                            |
| Save failure            | Error                                                  |
| Unexpected parser state | Error in debug only                                    |
| Per-step execution      | **Do not** log in production — tests cover determinism |


### Future

Real analytics via `AnalyticsService` interface — post-MVP per [Analytics.md](Analytics.md) stub.

---

## 12. Testing Standards

Tests are **required** for engine behaviour — not optional polish.

### Test pyramid (project-specific)

```text
        ┌─────────────┐
        │ integration │  few — full loop smoke
        ├─────────────┤
        │  widget     │  design_system + critical screens
        ├─────────────┤
        │  unit       │  game_engine/ — primary focus
        └─────────────┘
```

### Required coverage areas


| Area                      | Requirement                                           |
| ------------------------- | ----------------------------------------------------- |
| `game_engine/path/`       | Valid/invalid paths, orthogonal adjacency, start/exit |
| `game_engine/session/`    | Confirm → execute → outcome for level fixtures        |
| `game_engine/objectives/` | Exit completion, gem collection when enabled          |
| `game_engine/rewards/`    | Star thresholds per Level_Design                      |
| `data/repositories/`      | Save/load round-trip, unlock chain                    |


### Test style


| Guideline                     | Detail                                                       |
| ----------------------------- | ------------------------------------------------------------ |
| Arrange-Act-Assert            | One behaviour per test                                       |
| Name tests as sentences       | `test('invalid path through wall cannot be confirmed', ...)` |
| Use level fixtures            | `level_001.json` content or minimal inline grids             |
| No widget tests for GP7 rules | Engine unit tests only                                       |
| Determinism                   | Same input twice → same output                               |


### Commands

```bash
flutter pub get
flutter analyze --no-fatal-infos
flutter test
flutter test test/game_engine/
```

Use **FVM** when `.fvmrc` is present:

```bash
fvm flutter test
```

### When tests are not required

- Documentation-only changes
- Pure renames with no behaviour change
- LLDL token value tweaks with no logic change

Everything touching `game_engine/` behaviour **requires** test updates.

---

## 13. Performance Guidelines

Premium feel targets **stable 60fps** on mid-tier devices — without premature optimization.

### Rules of thumb


| Area                | Guideline                                                             |
| ------------------- | --------------------------------------------------------------------- |
| Maze rendering      | `CustomPainter` or equivalent — avoid rebuilding entire tree per cell |
| Path drawing        | Localize repaints to board widget                                     |
| Execution animation | Step-based — not per-frame physics                                    |
| Providers           | `select` or granular state to reduce rebuilds                         |
| Level load          | Parse once; cache in `LevelRepository`                                |
| Assets              | Keep tutorial grids ≤ 15×15 per Level_Format                          |


### Defer until measured

- Isolates for engine (engine is fast; I/O is not the bottleneck)
- Code generation for models
- Custom memory pools
- Micro-optimizing widget `build()` before profiler evidence

---

## 14. Naming Conventions

Consistency reduces cognitive load for solo dev + AI sessions.

### Files


| Item       | Convention                                 | Example                    |
| ---------- | ------------------------------------------ | -------------------------- |
| Dart files | `snake_case.dart`                          | `path_validator.dart`      |
| Screens    | `<name>_screen.dart`                       | `gameplay_screen.dart`     |
| Providers  | `<name>_provider.dart` or `providers.dart` | `gameplay_provider.dart`   |
| Tests      | `<subject>_test.dart`                      | `path_validator_test.dart` |
| Level JSON | `level_NNN.json`                           | `level_001.json`           |


### Types and members


| Item                           | Convention                                   | Example                          |
| ------------------------------ | -------------------------------------------- | -------------------------------- |
| Classes, enums, typedefs       | `PascalCase`                                 | `PathValidator`, `CellType`      |
| Methods, variables, parameters | `camelCase`                                  | `validatePath`, `gridWidth`      |
| Constants                      | `camelCase` or `lowerCamel` in const objects | `LLSpacing.md` pattern in tokens |
| Private members                | `_leadingUnderscore`                         | `_cells`                         |
| Providers                      | `camelCase` + `Provider` suffix              | `levelRepositoryProvider`        |


### Domain terms (use consistently)


| Term      | Meaning                                         |
| --------- | ----------------------------------------------- |
| `levelId` | String id e.g. `level_001`                      |
| `worldId` | String id e.g. `world_1`                        |
| `path`    | Ordered list of grid positions — player plan    |
| `session` | One attempt at a level                          |
| `phase`   | `GameplayPhase` — drawing, executing, won, lost |


Align vocabulary with [Gameplay.md](../01_Game_Design/Gameplay/Gameplay.md) — do not invent synonyms in code.

---

## 15. Code Organization

### File size


| Guideline             | Target                                                    |
| --------------------- | --------------------------------------------------------- |
| Single responsibility | One primary type per file for engine classes              |
| Max practical length  | ~300 lines — split if larger                              |
| Barrel files          | `components.dart`, `tokens.dart` — exports only, no logic |


### Imports

Order (with blank lines between groups):

1. `dart:` SDK
2. `package:` third-party
3. `package:labyrinth_legends/` project — **prefer relative imports within same layer**; use package imports for cross-layer

```dart
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';
```

### Public API surface

- Export only what other layers need
- Keep feature widgets private with `_` prefix classes in same file
- Engine public API: validators, session, models — hide helpers as private

### Comments


| Write comments when                          | Skip comments when                       |
| -------------------------------------------- | ---------------------------------------- |
| Non-obvious invariant tied to GP spec        | Restating obvious code                   |
| Temporary workaround with ticket/review link | Narrating every line                     |
| `@visibleForTesting` justification           | Describing what a well-named method does |


---

## 16. Cursor Implementation Rules

Mandatory for all Cursor tasks. Extends [Cursor Workflow](../05_AI/Cursor/Workflow.md) and [AGENTS.md](../../AGENTS.md).

### Before coding

1. Read task-relevant LLDS docs — start from [docs/README.md](../README.md)
2. Read this document for engineering constraints
3. Read [Technical Implementation Plan](Technical_Implementation_Plan.md) for scope boundaries
4. Confirm prerequisite docs exist (e.g. Level_Format before engine)

### During implementation


| Rule                                            | Source              |
| ----------------------------------------------- | ------------------- |
| Game logic in `game_engine/` only               | Architecture        |
| UI uses LLDL tokens — no hardcoded style        | LLDL                |
| Hand-authored JSON levels only                  | Implementation Plan |
| Local save only — no Firebase in slice          | Save_System         |
| Do not extend prototype `ruins_*`, `app_colors` | Prototype_Status    |
| Small focused diffs — one system per task       | Solo dev velocity   |
| Match existing naming in surrounding files      | Consistency         |


### After implementation


| Deliverable          | Required when                                            |
| -------------------- | -------------------------------------------------------- |
| Unit tests           | Any `game_engine/` behaviour change                      |
| LLDS doc update      | Behaviour or architecture changed                        |
| Review package       | Every major task — [99_Reviews](../99_Reviews/README.md) |
| `Decisions.md` entry | Material product or architecture choice                  |


### Scope discipline

- Classify features: MVP / Post-MVP / Rejected per [Roadmap](../00_Project/Roadmap.md)
- If not in vertical slice, do not implement — document in review package instead
- Report doc conflicts upward — do not silently reinterpret GP specs

---

## 17. Code Review Expectations

Reviews use [Codex Review Checklist](../05_AI/Codex/Review_Checklist.md) and milestone review packages.

### Reviewer focus by layer


| Layer            | Check                                                 |
| ---------------- | ----------------------------------------------------- |
| `game_engine/`   | GP alignment, determinism, tests, no Flutter imports  |
| `features/`      | No game rules in widgets, LLDL compliance             |
| `data/`          | Repository-only writes, correct persistence keys      |
| `design_system/` | Token usage, reusable components, no gameplay imports |


### Blocking issues


| Issue                                     | Verdict |
| ----------------------------------------- | ------- |
| Gameplay rules in widgets                 | Block   |
| Hardcoded colors/spacing in features      | Block   |
| Missing engine tests for behaviour change | Block   |
| New mechanic not in GP/Level_Format       | Block   |
| Firebase/analytics in slice               | Block   |
| Extends deprecated prototype UI           | Block   |


### Non-blocking suggestions

- Naming improvements
- Minor refactor within same PR scope
- Additional test cases for edge paths

### Review package linkage

Every major PR should reference or include a review package in `docs/99_Reviews/`. Codex reads the package **first**.

---

## 18. Anti-Patterns

Explicitly forbidden unless Human approves an exception recorded in [Decisions.md](../00_Project/Decisions.md).


| Anti-pattern                                           | Why forbidden                     | Alternative                     |
| ------------------------------------------------------ | --------------------------------- | ------------------------------- |
| God widget with validation + save + render             | Untestable; violates architecture | Split provider + engine + UI    |
| Static mutable game state                              | Breaks determinism and tests      | Session owned by provider       |
| `context.read` for gameplay side effects in `build()`  | Unpredictable rebuild behaviour   | `ref.listen` or button handlers |
| Duplicating GP rules in JSON and Dart differently      | Drift and bugs                    | JSON = data; Dart = behaviour   |
| Service locator singletons                             | Hidden dependencies               | Riverpod providers              |
| Feature flags without Remote Config spec               | Scope creep                       | Defer; mock interface only      |
| Procedural level generation in slice                   | Out of scope                      | Hand-authored JSON              |
| Copy-paste from prototype engine without GP7 alignment | Wrong feel                        | Rebuild against specs           |
| Generic enterprise layers (UseCase, RepositoryImpl×N)  | Over-engineering                  | Direct repository + engine      |
| `@immutable` class with mutable fields                 | Lies to readers                   | True immutable snapshots        |
| Catching all exceptions in UI                          | Hides failures                    | Typed errors in provider        |


---

## 19. Definition of Done

A coding task is complete only when **all applicable** items are satisfied.

### Code quality

- [ ] Builds — `flutter analyze` passes
- [ ] Tests pass — `flutter test` (engine tests for engine changes)
- [ ] No Flutter imports in `game_engine/`
- [ ] LLDL compliance for UI changes
- [ ] No deprecated prototype paths extended

### Architecture

- [ ] Game logic lives in `game_engine/`
- [ ] Repositories sole write path for persistence
- [ ] Aligns with [Gameplay](../01_Game_Design/Gameplay/Gameplay.md) and relevant GP docs
- [ ] Level content aligns with [Level_Format.md](Level_Format.md) if touched

### Documentation

- [ ] LLDS updated if behaviour or architecture changed
- [ ] Review package created for major tasks
- [ ] Material decisions in `Decisions.md`
- [ ] Open questions recorded in review package — not silently decided

### Review

- [ ] Ready for Codex review per checklist
- [ ] Scope matches Technical Implementation Plan milestone — no creep

---

## 20. References

### Technical

- [Technical Implementation Plan](Technical_Implementation_Plan.md)
- [Architecture](Architecture.md)
- [Folder Structure](Folder_Structure.md)
- [Level Format](Level_Format.md)
- [State Management](State_Management.md)
- [Save System](Save_System.md)

### Governance

- [AGENTS.md](../../AGENTS.md)
- [Prototype Status](../00_Project/Prototype_Status.md)
- [Cursor Workflow](../05_AI/Cursor/Workflow.md)
- [Codex Review Checklist](../05_AI/Codex/Review_Checklist.md)
- [Review Packages](../99_Reviews/README.md)

### Design authority

- [Gameplay](../01_Game_Design/Gameplay/Gameplay.md)
- [LLDL](../02_Design_System/LLDL/LLDL.md)
- [Design Tokens](../02_Design_System/Design_Tokens.md)
- [Components](../02_Design_System/Components.md)

---

## Navigation


| ← Previous                      | Next →                          | Index                                                     |
| ------------------------------- | ------------------------------- | --------------------------------------------------------- |
| [Level Format](Level_Format.md) | [Architecture](Architecture.md) | [Technical README](README.md) · [LLDS Home](../README.md) |


