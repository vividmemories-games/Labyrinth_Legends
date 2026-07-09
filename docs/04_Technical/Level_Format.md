# Level Format

| Field | Value |
|-------|-------|
| **Project** | Labyrinth Legends |
| **Document Name** | Level Format |
| **Document ID** | LLDS-DOC-04-LF-001 |
| **Path** | `docs/04_Technical/Level_Format.md` |
| **Version** | 1.0.1 |
| **Status** | Approved |
| **Owner** | Apoorv |
| **Prepared By** | Cursor (compiler) |
| **Last Updated** | 2026-07-02 |
| **Phase** | M0 — Technical Prerequisites (Phase 1) |
| **Dependencies** | [Technical Implementation Plan](Technical_Implementation_Plan.md) · [Architecture](Architecture.md) · [Folder Structure](Folder_Structure.md) · [Gameplay](../01_Game_Design/Gameplay/Gameplay.md) · [GP2](../01_Game_Design/Gameplay/GP2_Movement_System.md) · [GP5](../01_Game_Design/Gameplay/GP5_Objectives_Completion.md) · [GP7](../01_Game_Design/Gameplay/GP7_Gameplay_Rules.md) · [Puzzle Elements](../01_Game_Design/Gameplay/Puzzle_Elements.md) · [Level Design](../01_Game_Design/Level_Design.md) · [Worlds](../01_Game_Design/Worlds.md) |
| **Related Documents** | [Save System](Save_System.md) · [Roadmap](../00_Project/Roadmap.md) · [Prototype Status](../00_Project/Prototype_Status.md) |

## Navigation

| ← Previous | Next → | Index |
|------------|--------|-------|
| [Technical Implementation Plan](Technical_Implementation_Plan.md) | [Architecture](Architecture.md) | [Technical README](README.md) · [LLDS Home](../README.md) |

---

## Version History

| Version | Date | Author | Summary |
|---------|------|--------|---------|
| 1.0.0 | 2026-07-02 | Cursor | Initial authoritative level JSON schema for M1 vertical slice |
| 1.0.1 | 2026-07-02 | Cursor | Codex review: path node count metric, strict unknown-key validation, boundary wall rule, moveLimit M1 constraint |
| 1.0.2 | 2026-07-02 | ChatGPT | ChatGPT technical architecture review completed — approved for M1 engine implementation prerequisites |

---

## Table of Contents

1. [Purpose](#1-purpose)
2. [Authority and Dependencies](#2-authority-and-dependencies)
3. [What a Level File Is Responsible For](#3-what-a-level-file-is-responsible-for)
4. [What a Level File Must Not Define](#4-what-a-level-file-must-not-define)
5. [File Location and Naming Convention](#5-file-location-and-naming-convention)
6. [Level JSON Top-Level Schema](#6-level-json-top-level-schema)
7. [Grid Model](#7-grid-model)
8. [Coordinate System](#8-coordinate-system)
9. [Cell Model](#9-cell-model)
10. [Wall / Blockage Model](#10-wall--blockage-model)
11. [Start and Exit Encoding](#11-start-and-exit-encoding)
12. [Supported MVP Element Types](#12-supported-mvp-element-types)
13. [Objective Encoding](#13-objective-encoding)
14. [Reward and Star Threshold Encoding](#14-reward-and-star-threshold-encoding)
15. [Tutorial Metadata](#15-tutorial-metadata)
16. [Validation Rules](#16-validation-rules)
17. [Engine Loading Expectations](#17-engine-loading-expectations)
18. [Example level_001.json](#18-example-level_001json)
19. [Example level_002.json](#19-example-level_002json)
20. [Future Extensions Deliberately Deferred](#20-future-extensions-deliberately-deferred)
21. [Review and Approval Requirements](#21-review-and-approval-requirements)

---

## 1. Purpose

This document defines the **authoritative JSON schema and validation contract** for hand-authored Labyrinth Legends levels used by the first playable vertical slice and **Milestone M1** (pure Dart engine core).

It answers:

> **What does a level JSON file contain, how is it structured, and what must the engine validate at load time?**

### Milestone M1 target

```text
Pure Dart engine loads level_001.json
  → validates player path (GP2)
  → executes deterministically (GP2 · GP7)
  → reaches exit (GP5 primary objective)
  → calculates stars (GP5 · Level_Design.md)
  → passes unit tests
```

### Level validation priority

| Level band | Priority | Notes |
|------------|----------|-------|
| **001–003** | **Validation priority** | M1 engine tests and first vertical slice minimum |
| **004–005** | **Stretch** | Fog and relic tutorial — after core loop stable |
| **006–020** | **Out of scope** | Existing JSON may remain in repo; not validated for first vertical slice |

### Design principle

**JSON describes content. Dart implements behaviour.**

Level files declare **what exists on the grid** and **what success means**. Path validation, step resolution order, collection rules, and star calculation logic live in `lib/game_engine/` per [GP2](../01_Game_Design/Gameplay/GP2_Movement_System.md), [GP5](../01_Game_Design/Gameplay/GP5_Objectives_Completion.md), and [GP7](../01_Game_Design/Gameplay/GP7_Gameplay_Rules.md).

---

## 2. Authority and Dependencies

### Authority hierarchy

```text
Vision.md
    ↓
Game_Loop.md
    ↓
Gameplay Core — GP1, GP2, GP7
    ↓
GP3 Puzzle Element Series + Puzzle_Elements.md
    ↓
GP4–GP6 Feature Specifications
    ↓
Gameplay.md
    ↓
Level_Design.md · Worlds.md
    ↓
Technical Documentation — docs/04_Technical/*
    ↓
Level_Format.md (this document)
    ↓
assets/levels/{worldId}/level_NNN.json
    ↓
lib/game_engine/ — parsing, validation, execution
```

| Question | Authoritative source |
|----------|-------------------|
| Movement rules, path validation | [GP2](../01_Game_Design/Gameplay/GP2_Movement_System.md) |
| Objective meaning, completion | [GP5](../01_Game_Design/Gameplay/GP5_Objectives_Completion.md) |
| Step resolution order | [GP7](../01_Game_Design/Gameplay/GP7_Gameplay_Rules.md) |
| Puzzle element taxonomy | [Puzzle_Elements.md](../01_Game_Design/Gameplay/Puzzle_Elements.md) |
| Tutorial arc, star thresholds | [Level_Design.md](../01_Game_Design/Level_Design.md) |
| World assignment | [Worlds.md](../01_Game_Design/Worlds.md) |
| **JSON field definitions** | **This document** |
| **Load-time structural validation** | **This document** |
| **Runtime rule implementation** | **`game_engine/` Dart code** |

### Conflict protocol

1. **Preserve** the higher-authority gameplay document
2. **Report** the conflict in a review package
3. **Do not** encode workarounds in JSON that redefine mechanics

---

## 3. What a Level File Is Responsible For

A level JSON file **must** declare:

| Responsibility | Description |
|----------------|-------------|
| **Identity** | Stable `id`, display `name`, `worldId` |
| **Schema version** | `schemaVersion` for forward-compatible parsing |
| **Grid topology** | Width, height, and per-cell content |
| **Spatial anchors** | Exactly one `start` cell and one `exit` cell |
| **Traversability** | Which cells are walkable vs blocked |
| **Placed elements** | Gems, keys, locks, relics (when used) at cell coordinates |
| **Objectives** | Required win conditions for this chamber |
| **Star thresholds** | Path-length breakpoints for 1–3 stars |
| **Tutorial metadata** | Optional teaching hints for tutorial band levels |
| **Discovery mode flag** | Level-wide visibility mode (M1: `full` only) |

---

## 4. What a Level File Must Not Define

Level JSON **must not** contain:

| Excluded | Reason |
|----------|--------|
| **Behaviour scripts or logic** | Engine implements GP7 pipeline in Dart |
| **Rule precedence overrides** | GP7 is global — no per-level exceptions |
| **Movement validation algorithms** | GP2 lives in `PathValidator` |
| **Hazard resolution rules** | GP4 — not in M1 tutorial band |
| **UI layout or LLDL tokens** | Screen specs + design system |
| **Procedural generation parameters** | Hand-authored only |
| **Firebase / cloud / analytics fields** | Out of vertical slice scope |
| **Monetization or economy values** | Out of scope |
| **LiveOps or event modifiers** | Out of scope |
| **Full GP3 element catalogue** | M1 subset only — see §12 |
| **Player save state** | `ProgressRepository` / Save_System.md |
| **Animations, timings, or feedback copy** | GP6 + screen specs |

> If a field would require the engine to invent a new mechanic, it does **not** belong in level JSON.

---

## 5. File Location and Naming Convention

### Runtime asset path

```text
assets/levels/{worldId}/level_{NNN}.json
```

| Segment | Rule | Example |
|---------|------|---------|
| `{worldId}` | Lowercase snake_case world identifier | `world_1` |
| `{NNN}` | Three-digit zero-padded level number | `001`, `020` |
| Filename | Must match top-level `id` field | `level_001.json` → `"id": "level_001"` |

### Vertical slice world

| World | Folder | Levels in slice |
|-------|--------|-----------------|
| Crumbling Temple | `assets/levels/world_1/` | 001–005 (stretch); 001–003 (M1 minimum) |

### Authorship

- **Hand-authored JSON only** — no procedural generation
- Authored by level designers; validated against this schema before merge
- Levels 006–020 may exist as stubs but are **not** part of first vertical slice validation

---

## 6. Level JSON Top-Level Schema

### Required top-level fields (schema version 1)

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `schemaVersion` | `integer` | ✅ | Must be `1` for this document version |
| `id` | `string` | ✅ | Unique level identifier; matches filename stem |
| `name` | `string` | ✅ | Player-facing level title |
| `worldId` | `string` | ✅ | Parent world identifier |
| `discoveryMode` | `string` | ✅ | Level-wide visibility mode — see §15 |
| `objectives` | `object` | ✅ | Win conditions — see §13 |
| `starThresholds` | `object` | ✅ | Star breakpoints — see §14 |
| `grid` | `object` | ✅ | Spatial model — see §7 |

### Optional top-level fields

| Field | Type | Default | Description |
|-------|------|---------|-------------|
| `moveLimit` | `integer \| null` | `null` | **Deferred** — must be `null` in schema v1; non-null rejected at validation (see §15) |
| `tutorial` | `object` | omitted | Tutorial metadata — see §15 |
| `author` | `string` | omitted | Content author note (non-runtime) |
| `tags` | `string[]` | omitted | Editor/search tags (non-runtime) |

### Top-level object shape

```json
{
  "schemaVersion": 1,
  "id": "level_001",
  "name": "First Steps",
  "worldId": "world_1",
  "discoveryMode": "full",
  "moveLimit": null,
  "objectives": { },
  "starThresholds": { },
  "tutorial": { },
  "grid": { }
}
```

---

## 7. Grid Model

The `grid` object defines the labyrinth as a **rectangular cell matrix**.

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `width` | `integer` | ✅ | Column count (≥ 3) |
| `height` | `integer` | ✅ | Row count (≥ 3) |
| `cells` | `cell[][]` | ✅ | Row-major 2D array — see §8–§9 |

### Constraints

| Rule | Requirement |
|------|-------------|
| `cells.length` | Must equal `height` |
| `cells[row].length` | Must equal `width` for every row |
| Minimum size | 3×3 (practical minimum for start + exit + path) |
| Maximum size (M1) | 15×15 recommended cap for tutorial band performance |

### Grid invariants

- Outer boundary should be predominantly `wall` cells (enforced by validation — see §16)
- Exactly **one** `start` cell
- Exactly **one** `exit` cell
- All non-wall gameplay cells must be **orthogonally connected** from start to exit (solvability — engine may validate at load or in CI)

---

## 8. Coordinate System

### Indexing convention

```text
cells[row][col]   where row = y, col = x

Origin (0, 0) = top-left cell
+x = right
+y = down
```

| Name | JSON access | Range |
|------|-------------|-------|
| **x** (column) | `cells[y][x]` | `0 … width - 1` |
| **y** (row) | `cells[y][x]` | `0 … height - 1` |

### Path coordinates

Player paths in the engine use the same coordinate system:

```json
{ "x": 1, "y": 1 }
```

Path is an **ordered list** of positions from start through intermediate nodes to exit.

### Adjacency

Orthogonal (4-directional) only — per [GP2](../01_Game_Design/Gameplay/GP2_Movement_System.md):

```text
(x, y) adjacent to (x±1, y) or (x, y±1)
```

No diagonal edges in schema version 1.

---

## 9. Cell Model

Each cell is a JSON object with a required `type` and optional modifiers.

### Base cell object

```json
{
  "type": "floor"
}
```

### Cell `type` enum (schema version 1)

| Type | Traversable | M1 support | Description |
|------|-------------|------------|-------------|
| `floor` | ✅ (default walkable) | ✅ Required | Open traversable node |
| `wall` | ❌ | ✅ Required | Impassable boundary or obstacle |
| `start` | ✅ | ✅ Required | Explorer origin — exactly one per level |
| `exit` | ✅ | ✅ Required | Primary completion target — exactly one per level |

> **`blocked`** is not a separate type in schema v1. Use `wall` for impassable cells. Optional future `blocked` type is deferred (see §20).

### Optional cell modifiers

Modifiers apply to traversable cells (`floor`, `start`, `exit`). Multiple modifiers may coexist on one cell where logically valid.

| Field | Type | Applies to | M1 band | Description |
|-------|------|------------|---------|-------------|
| `hasGem` | `boolean` | `floor` | 002+ | Cell contains a collectible gem |
| `keyId` | `string` | `floor` | 003+ | Key collected on traversal; consumed by matching lock |
| `lockId` | `string` | `floor` | 003+ | Cell blocked until matching `keyId` collected |
| `hasRelic` | `boolean` | `floor` | 005 stretch | Cell contains a relic |
| `relicId` | `string` | `floor` | 005 stretch | Relic identifier for discovery gating |
| `hiddenUntilRelicId` | `string` | any traversable | 005 stretch | Cell hidden until relic collected |
| `visibility` | `string` | any traversable | 005 stretch | `"hidden"` when gated; omitted when visible |

### Modifier rules

| Rule | Specification |
|------|---------------|
| `hasGem: true` | Implies collectible on traversal — engine auto-collects per GP1 |
| `keyId` | Must match a `lockId` used in the same level (or validation warning) |
| `lockId` on `floor` | Cell is **impassable** until key collected; not a separate cell type |
| `start` / `exit` | May include stretch modifiers (e.g. hidden exit in 005) — not required for M1 |
| Unknown fields | **Rejected** at structural validation — see LV-15; use `_meta` for editor-only data |

---

## 10. Wall / Blockage Model

### Walls

```json
{ "type": "wall" }
```

| Property | Rule |
|----------|------|
| Traversable | Never |
| Path drawing | Cannot include wall coordinates |
| Validation | Path validator rejects any path through wall cells (GP2) |
| Purpose | Maze boundary, permanent obstacles |

### Locked floors (key + lock)

Lock is **not** a separate cell type. A locked passage is a `floor` cell with `lockId`:

```json
{ "type": "floor", "lockId": "bronze_key" }
```

| Property | Rule |
|----------|------|
| Traversable | Only after matching key collected on path **before** this cell |
| Key encoding | `{ "type": "floor", "keyId": "bronze_key" }` |
| Behaviour | Implemented in engine step resolver — GP7 interactive phase |
| M1 scope | level_003 validation band |

### Blocked vs wall

| Concept | Schema v1 encoding |
|---------|-------------------|
| Permanent impassable | `type: "wall"` |
| Key-gated passage | `type: "floor"` + `lockId` |
| Visually blocked, no key | Use `wall` or `floor` + future modifier — **do not invent ad-hoc types** |

---

## 11. Start and Exit Encoding

### Start cell

```json
{ "type": "start" }
```

| Rule | Specification |
|------|---------------|
| Count | Exactly **one** per level |
| Path origin | Player path **must** begin at start coordinates |
| Traversable | Yes |
| Modifiers | Generally none in M1; optional `hasGem` etc. discouraged on start |

### Exit cell

```json
{ "type": "exit" }
```

| Rule | Specification |
|------|---------------|
| Count | Exactly **one** per level |
| Primary objective | Traversal onto exit satisfies `objectives.reachExit` per [GP5](../01_Game_Design/Gameplay/GP5_Objectives_Completion.md) |
| Traversable | Yes |
| Completion | Engine marks primary objective complete when exit step resolves |

### Start/exit placement guidance

Per [Level_Design.md](../01_Game_Design/Level_Design.md) and [GP3.5](../01_Game_Design/Gameplay/GP3/GP3.5_Puzzle_Composition_Level_Design_Rules.md):

- Start and exit must be visually distinct in authored content
- Tutorial levels should minimize distance before teaching new mechanics
- No fake exits (decorative cells that look like exit) — use `exit` type only for real goals

---

## 12. Supported MVP Element Types

### M1 required element set

Engine **must** support these for Milestone M1 and levels 001–003:

| Element | Cell encoding | Authority |
|---------|---------------|-----------|
| **Floor** | `{ "type": "floor" }` | GP3.2 Static |
| **Wall** | `{ "type": "wall" }` | GP3.2 Static |
| **Start** | `{ "type": "start" }` | GP3.2 Static |
| **Exit** | `{ "type": "exit" }` | GP3.2 Static · GP5 |

### Near-term tutorial extension (levels 002–003)

Engine **should** support for vertical slice tutorial band:

| Element | Cell encoding | First level | Authority |
|---------|---------------|-------------|-----------|
| **Gem** | `{ "type": "floor", "hasGem": true }` | 002 | GP3.2 Collectible · GP5 optional |
| **Key** | `{ "type": "floor", "keyId": "<id>" }` | 003 | GP3.2 Collectible · GP3.3 Locks |
| **Lock** | `{ "type": "floor", "lockId": "<id>" }` | 003 | GP3.3 Doors and Gates |

### Stretch tutorial extension (levels 004–005)

Documented for schema completeness; **not required for M1**:

| Element | Encoding | Level | Status |
|---------|----------|-------|--------|
| **Fog / discovery** | `discoveryMode: "fog"` at level root | 004 | Stretch — UI + engine fog system |
| **Relic** | `hasRelic`, `relicId` on cell | 005 | Stretch |
| **Hidden cells** | `hiddenUntilRelicId`, `visibility: "hidden"` | 005 | Stretch |

### Explicitly not in schema v1

| Element family | Status |
|----------------|--------|
| Switches, plates, levers | Deferred — GP3.3; future schema version |
| Teleporters, ice, conveyors | Deferred — GP3.2 Traversal |
| Environmental systems (light, flow, cycles) | Deferred — GP3.4 |
| Hazards | Deferred — GP4; not in tutorial 001–003 |
| One-way tiles | Deferred |

> This document does **not** implement the full [Puzzle_Elements.md](../01_Game_Design/Gameplay/Puzzle_Elements.md) catalogue — only the M1/tutorial subset.

---

## 13. Objective Encoding

The `objectives` object declares **what must be true** for level completion. Meaning is defined by [GP5](../01_Game_Design/Gameplay/GP5_Objectives_Completion.md); JSON declares per-level flags only.

### Schema

```json
"objectives": {
  "reachExit": true,
  "collectAllGems": false,
  "minGems": 0
}
```

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `reachExit` | `boolean` | ✅ | Primary objective — must reach exit (GP5) |
| `collectAllGems` | `boolean` | ✅ | If `true`, every `hasGem` cell must be collected |
| `minGems` | `integer` | ✅ | Minimum gems required when `collectAllGems` is `false` |

### Objective combinations (tutorial band)

| Level | reachExit | collectAllGems | minGems | Teaching |
|-------|-----------|----------------|---------|----------|
| 001 | `true` | `false` | `0` | Draw → exit |
| 002 | `true` | `true` | `0` | Collect all gems |
| 003 | `true` | `false` | `0` | Key + lock |
| 004–005 | `true` | varies | `0` | Stretch |

### Engine evaluation

- Objectives are evaluated during GP7 **objective** step — after traversal and collection
- `reachExit` requires exit cell on confirmed path and traversed during execution
- Gem collection is automatic on traversal per GP1 — engine tracks collected gem coordinates
- Objective failure does not redefine hazard rules — defer to GP4/GP7 for future hazard levels

### Deferred objective fields

Not in schema v1:

| Field | Reason |
|-------|--------|
| `collectRelic` | Use stretch cell modifiers + engine state for 005 |
| `masteryPathLength` | Mastery objectives — post-M1 |
| `timeLimit` | Not in Draw Your Fate identity |

---

## 14. Reward and Star Threshold Encoding

Per [Level_Design.md](../01_Game_Design/Level_Design.md) — **lower path node count = more stars** (Level_Design uses "path length" colloquially; schema v1 metric is path node count per §14 below).

### Schema

```json
"starThresholds": {
  "threeStars": 12,
  "twoStars": 16,
  "oneStar": 20
}
```

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `threeStars` | `integer` | ✅ | Maximum path node count (inclusive) for 3 stars |
| `twoStars` | `integer` | ✅ | Maximum path node count (inclusive) for 2 stars |
| `oneStar` | `integer` | ✅ | Maximum path node count (inclusive) for 1 star |

### Path node count (canonical metric)

**Path node count** is the number of nodes in the player's **confirmed path** — the ordered coordinate list validated per GP2 (PV-01). In engine terms: `confirmedPath.length`.

| Rule | Specification |
|------|---------------|
| Includes start | Yes — the start cell is the first path node |
| Edge vs node | **Not** edge/step count (`pathNodeCount - 1`); thresholds always compare against node count |
| Revisits | Each revisitation adds another node to the count (GP2-L09) |
| Authority | GP2 node-to-node model; `RewardCalculator` must use this metric exclusively |

### Threshold ordering invariant

```text
threeStars ≤ twoStars ≤ oneStar
```

All values are **inclusive upper bounds** on **path node count**.

### Star calculation (engine responsibility)

| Path node count | Stars |
|-----------------|-------|
| ≤ `threeStars` | 3 |
| ≤ `twoStars` (and > `threeStars`) | 2 |
| ≤ `oneStar` (and > `twoStars`) | 1 |
| > `oneStar` | 0 (completion may still succeed if objectives met — product decision; M1: allow 0-star completion) |

### Authorship guidance

- Tutorial levels should have **achievable 3-star paths** per Level_Design.md ("par paths exist")
- Thresholds should be set after playtesting shortest valid path
- Stars reward **planning efficiency**, not reflex speed

---

## 15. Tutorial Metadata

### Discovery mode (level-wide)

| Value | M1 support | Description |
|-------|------------|-------------|
| `"full"` | ✅ Required for M1 | Entire grid visible during planning |
| `"fog"` | Stretch (004) | Partial visibility — engine/UI fog system required |
| `"relicGated"` | Stretch (005) | Hidden cells until relic collected |

```json
"discoveryMode": "full"
```

M1 engine and tests **may assume `full`** for levels 001–003. Loaders must accept other values but may reject them until stretch systems exist.

### Tutorial object (optional)

```json
"tutorial": {
  "band": "world_1_tutorial",
  "sequence": 1,
  "teaches": ["draw_path", "confirm", "reach_exit"],
  "hintId": null
}
```

| Field | Type | Description |
|-------|------|-------------|
| `band` | `string` | Tutorial group identifier |
| `sequence` | `integer` | Order within band (matches level number) |
| `teaches` | `string[]` | Machine-readable teaching tags (non-runtime logic) |
| `hintId` | `string \| null` | Optional hint reference — GP6; deferred for M1 |

Tutorial metadata is **informational** for editors, level select UI, and QA — it does not change engine rules.

### Move limit (deferred)

```json
"moveLimit": null
```

When non-null, would gate resource hazard family (GP4 open question GP4-Q02). **Not supported in schema v1.** `LevelFormatValidator` **must reject** non-null `moveLimit` until GP4 resolves and schema version increments.

---

## 16. Validation Rules

Validation occurs at **load time** (structural) and **confirm time** (path — GP2). This section covers **load-time schema validation**.

### Structural validation (reject load on failure)

| ID | Rule |
|----|------|
| LV-01 | `schemaVersion` must be `1` |
| LV-02 | `id` must match `level_{NNN}` pattern and filename |
| LV-03 | `worldId` must match parent folder name |
| LV-04 | `grid.width` and `grid.height` must be ≥ 3 |
| LV-05 | `cells` dimensions must match `width` × `height` |
| LV-06 | Every cell must have a valid `type` enum value |
| LV-07 | Exactly one `start` cell |
| LV-08 | Exactly one `exit` cell |
| LV-09 | `starThresholds` must satisfy `threeStars ≤ twoStars ≤ oneStar` |
| LV-10 | `objectives.reachExit` must be `true` for schema v1 tutorial levels |
| LV-11 | If `collectAllGems` is `true`, at least one cell must have `hasGem: true` |
| LV-12 | `keyId` values should have matching `lockId` in the same level (warning if not) |
| LV-13 | All perimeter cells (`row` 0 or `height-1`, or `col` 0 or `width-1`) must be `type: "wall"` |
| LV-14 | `moveLimit` must be `null` in schema v1 |
| LV-15 | Unknown keys are rejected — see [Allowed keys and extensions](#allowed-keys-and-extensions) |

### Allowed keys and extensions

Schema v1 uses a **closed key set** for runtime level data. `LevelFormatValidator` must **reject** unrecognized keys so authoring mistakes (e.g. misspelled `starThresholds`) surface at load time.

| Scope | Allowed keys |
|-------|--------------|
| Top-level | `schemaVersion`, `id`, `name`, `worldId`, `discoveryMode`, `objectives`, `starThresholds`, `grid`, `moveLimit`, `tutorial`, `author`, `tags`, `_meta` |
| `grid` | `width`, `height`, `cells` |
| `objectives` | `reachExit`, `collectAllGems`, `minGems` |
| `starThresholds` | `threeStars`, `twoStars`, `oneStar` |
| `tutorial` | `band`, `sequence`, `teaches`, `hintId` |
| Cell | `type` plus modifiers from §9 for the cell's traversability band |
| `_meta` | Any keys — **editor/QA only**; stripped before `LevelDefinition`; never affects engine rules |

Future schema versions may introduce a namespaced `extensions` object. M1 validators do not accept `extensions`.

### Solvability validation (recommended at CI / author time)

| ID | Rule |
|----|------|
| LV-20 | There must exist at least one valid orthogonal path from start to exit |
| LV-21 | If `collectAllGems`, a valid path must visit all gem cells |
| LV-22 | If locks present, a valid path must collect keys before locked cells |
| LV-23 | Levels 001–003 must pass solvability check before merge |

### Path validation (runtime — GP2, not JSON)

Implemented in `PathValidator` — summary only:

| ID | Rule | Authority |
|----|------|-----------|
| PV-01 | Path is non-empty ordered list of coordinates | GP2 |
| PV-02 | Path starts at start cell | GP2 |
| PV-03 | Path ends at exit cell | GP2 |
| PV-04 | Each step is orthogonally adjacent to previous | GP2 |
| PV-05 | No duplicate revisit unless element rules allow (M1: no revisit benefit) | GP2 · GP7 open |
| PV-06 | No wall cells on path | GP2 |
| PV-07 | Locked cells only after matching key collected along path prefix | GP3.3 · GP7 |
| PV-08 | Invalid path **cannot** be confirmed | GP2 · GP7 |

### Validation error handling

| Stage | On failure |
|-------|------------|
| Load | Throw parse error; level unavailable in LevelRepository |
| Path confirm | Return validation result; UI shows GP6 feedback — no execution |
| Objective | Engine reports incomplete; no save |

---

## 17. Engine Loading Expectations

### Load pipeline

```text
AssetBundle
  → read assets/levels/{worldId}/level_{NNN}.json
  → jsonDecode
  → LevelFormatValidator.validate (structural — §16)
  → LevelDefinition.fromJson (immutable model)
  → cached in LevelRepository
```

### Parser responsibilities (`data/` + `game_engine/models/`)

| Step | Owner | Output |
|------|-------|--------|
| Read bytes | `LevelRepository` | JSON string |
| Structural validation | `LevelFormatValidator` | Pass / typed errors |
| Parse | `LevelDefinition`, `MazeGrid`, `Cell` | Immutable domain models |
| Expose | `LevelRepository.getById` | `LevelDefinition` |

### Engine responsibilities (not in JSON)

| Concern | Class (planned) | Authority |
|---------|-----------------|-----------|
| Path validation | `PathValidator` | GP2 |
| Session lifecycle | `GameplaySession` | GP1 · GP2 |
| Step execution | `PathExecutor`, `StepResolver` | GP7 |
| Gem/key collection | `StepResolver` | GP1 · GP3.2 · GP3.3 |
| Objective check | `ObjectiveEvaluator` | GP5 |
| Star calculation | `RewardCalculator` | GP5 · Level_Design.md |

### M1 scope boundary

For Milestone M1, the engine **must**:

1. Load and validate `level_001.json` per this schema
2. Accept a confirmed orthogonal path
3. Execute traversal deterministically
4. Complete when exit is reached
5. Calculate stars from path node count vs `starThresholds`

M1 **may defer**: fog, relics, gems, keys, locks (add in M1 extension tests for 002–003 as Phase 2 grows).

### Flutter import rule

`game_engine/` models and validators **must not** import Flutter UI packages.

---

## 18. Example level_001.json

Tutorial level 001 — **draw → confirm → exit**. Validation priority. M1 acceptance fixture.

```json
{
  "schemaVersion": 1,
  "id": "level_001",
  "name": "First Steps",
  "worldId": "world_1",
  "discoveryMode": "full",
  "moveLimit": null,
  "starThresholds": {
    "threeStars": 12,
    "twoStars": 16,
    "oneStar": 20
  },
  "objectives": {
    "reachExit": true,
    "collectAllGems": false,
    "minGems": 0
  },
  "tutorial": {
    "band": "world_1_tutorial",
    "sequence": 1,
    "teaches": ["draw_path", "confirm", "reach_exit"]
  },
  "grid": {
    "width": 7,
    "height": 7,
    "cells": [
      [
        {"type": "wall"}, {"type": "wall"}, {"type": "wall"}, {"type": "wall"}, {"type": "wall"}, {"type": "wall"}, {"type": "wall"}
      ],
      [
        {"type": "wall"}, {"type": "start"}, {"type": "floor"}, {"type": "floor"}, {"type": "floor"}, {"type": "floor"}, {"type": "wall"}
      ],
      [
        {"type": "wall"}, {"type": "floor"}, {"type": "wall"}, {"type": "wall"}, {"type": "wall"}, {"type": "floor"}, {"type": "wall"}
      ],
      [
        {"type": "wall"}, {"type": "floor"}, {"type": "wall"}, {"type": "floor"}, {"type": "floor"}, {"type": "floor"}, {"type": "wall"}
      ],
      [
        {"type": "wall"}, {"type": "floor"}, {"type": "wall"}, {"type": "wall"}, {"type": "wall"}, {"type": "floor"}, {"type": "wall"}
      ],
      [
        {"type": "wall"}, {"type": "floor"}, {"type": "floor"}, {"type": "floor"}, {"type": "floor"}, {"type": "exit"}, {"type": "wall"}
      ],
      [
        {"type": "wall"}, {"type": "wall"}, {"type": "wall"}, {"type": "wall"}, {"type": "wall"}, {"type": "wall"}, {"type": "wall"}
      ]
    ]
  }
}
```

**Canonical runtime file:** `assets/levels/world_1/level_001.json` (`schemaVersion` aligned; optional `tutorial` block may be added in a follow-up content pass).

---

## 19. Example level_002.json

Tutorial level 002 — **collect all gems + reach exit**. Near-term extension validation.

```json
{
  "schemaVersion": 1,
  "id": "level_002",
  "name": "Shimmering Stones",
  "worldId": "world_1",
  "discoveryMode": "full",
  "moveLimit": null,
  "starThresholds": {
    "threeStars": 14,
    "twoStars": 18,
    "oneStar": 24
  },
  "objectives": {
    "reachExit": true,
    "collectAllGems": true,
    "minGems": 0
  },
  "tutorial": {
    "band": "world_1_tutorial",
    "sequence": 2,
    "teaches": ["collect_gem", "optional_route_planning"]
  },
  "grid": {
    "width": 7,
    "height": 7,
    "cells": [
      [
        {"type": "wall"}, {"type": "wall"}, {"type": "wall"}, {"type": "wall"}, {"type": "wall"}, {"type": "wall"}, {"type": "wall"}
      ],
      [
        {"type": "wall"}, {"type": "start"}, {"type": "floor", "hasGem": true}, {"type": "floor"}, {"type": "floor", "hasGem": true}, {"type": "floor"}, {"type": "wall"}
      ],
      [
        {"type": "wall"}, {"type": "floor"}, {"type": "wall"}, {"type": "wall"}, {"type": "wall"}, {"type": "floor"}, {"type": "wall"}
      ],
      [
        {"type": "wall"}, {"type": "floor"}, {"type": "floor", "hasGem": true}, {"type": "floor"}, {"type": "floor"}, {"type": "floor"}, {"type": "wall"}
      ],
      [
        {"type": "wall"}, {"type": "floor"}, {"type": "wall"}, {"type": "wall"}, {"type": "wall"}, {"type": "floor"}, {"type": "wall"}
      ],
      [
        {"type": "wall"}, {"type": "floor"}, {"type": "floor"}, {"type": "floor", "hasGem": true}, {"type": "floor"}, {"type": "exit"}, {"type": "wall"}
      ],
      [
        {"type": "wall"}, {"type": "wall"}, {"type": "wall"}, {"type": "wall"}, {"type": "wall"}, {"type": "wall"}, {"type": "wall"}
      ]
    ]
  }
}
```

**Canonical runtime file:** `assets/levels/world_1/level_002.json`

---

## 20. Future Extensions Deliberately Deferred

The following are **intentionally out of schema version 1** to keep M1 implementable by a solo developer:

| Extension | Target | Notes |
|-----------|--------|-------|
| Schema version 2 element types | Post-M1 | Switches, teleporters, hazards |
| `blocked` cell type distinct from `wall` | GP3.2 alignment | Use `wall` for now |
| Per-cell fog radius | Level 004+ | Level-wide `discoveryMode` first |
| `moveLimit` enforcement | GP4 resolution | Field present; must be `null`; non-null rejected in v1 |
| Procedural / template chambers | Levels 6–20 | Hand-authored only for slice |
| Multi-world JSON packaging | Post-slice | One file per level remains |
| Localization blocks | Post-M1 | `name` is single string for now |
| Versioned objective schema | GP5 expansion | Relic/mastery objective flags |
| Edge-based walls (between nodes) | Future | Cell-based model sufficient for M1 |
| Diagonal traversal | Never without GP2 change | Orthogonal only |

Levels **006–020** are **not** validated against this document for the first vertical slice. They may be revised or replaced in a later content pass.

---

## 21. Review and Approval Requirements

### Document status

This document is **Approved**. It satisfies the Level Format prerequisite for **Milestone M1** engine coding per [Technical Implementation Plan §14](Technical_Implementation_Plan.md#14-technical-docs-to-expand-before-coding), pending Human lock workflow.

### Review gate G1 — Prerequisites

| Reviewer | Required | Focus |
|----------|----------|-------|
| **Codex** | ✅ | Schema completeness, engine mapping, testability, no gameplay redefinition |
| **ChatGPT** | Recommended | Tutorial band alignment, teaching progression |
| **Human** | ✅ | Approve schema before M1 coding |

### Review package

```bash
./scripts/new_review_package.sh Releases level_format --phase "M0 Level Format Schema" --update-index
```

### Approval criteria

- [x] Schema supports levels 001–003 without inventing mechanics
- [x] GP2 path model mapped to grid coordinates
- [x] GP5 objectives and stars encoded without ambiguity
- [x] Stretch elements (004–005) documented but clearly bounded
- [x] Levels 006–020 explicitly excluded from slice validation
- [x] No conflict with Gameplay, GP2, GP5, GP7, or Puzzle_Elements authority
- [x] Codex confirms engine can implement from this doc alone

### After approval

1. Add optional `tutorial` blocks to `level_001.json`–`level_003.json` ( `schemaVersion` already aligned)
2. Implement `LevelFormatValidator` and `LevelDefinition` in `game_engine/`
3. Add `test/game_engine/level_001_test.dart`
4. Proceed to Milestone M1 per Technical Implementation Plan §15

---

## 17. Schema Version 2 — Edge-Blocked Grids

**Status:** Active (M2.7). Supersedes wall-cell perimeter model for new and migrated levels.

### Concept

| v1 | v2 |
|----|-----|
| Outer `wall` cells + interior `wall` pillars | All cells are walkable types (`floor`, `start`, `exit`) |
| Impassability via `!cell.isWalkable` | Impassability via **blocked edges** + out-of-bounds perimeter |
| Autotile combined PNGs per cell | `tile_floor` base + `edge_*` overlay stack |

### `schemaVersion`

| Value | Meaning |
|-------|---------|
| `1` | Legacy wall-cell grids — auto-converted to v2 at parse time via `LevelV1ToV2Converter` |
| `2` | Edge-blocked walkable grid (authoritative for new content) |

### Cell `edges` object (optional per cell)

```json
{
  "type": "floor",
  "edges": {
    "north": true,
    "east": false,
    "south": false,
    "west": true
  }
}
```

| Field | Type | Meaning |
|-------|------|---------|
| `north` / `east` / `south` / `west` | `boolean` | `true` = raised impassable side on that edge |

Omitted edges default to `false` (open). Grid perimeter edges are **implicitly blocked** at runtime (`MazeGrid.resolvedEdgesAt`).

### Movement rule

Path step `A → B` is legal iff:

1. `A` and `B` are orthogonally adjacent
2. `MazeGrid.canTraverse(A, B)` — shared edge is not blocked on either cell

### Validation changes (v2)

| ID | Rule |
|----|------|
| LV-01 | `schemaVersion` must be `1` or `2` |
| LV-13 | **Skipped** for v2 — perimeter is implicit via edge resolution |
| LV-20 | v2 cells must **not** use `type: "wall"` — use `edges` instead |

### Example v2 level

```json
{
  "schemaVersion": 2,
  "id": "level_001",
  "grid": {
    "width": 3,
    "height": 3,
    "cells": [
      [{"type": "start"}, {"type": "floor"}, {"type": "floor"}],
      [{"type": "floor"}, {"type": "floor"}, {"type": "floor"}],
      [{"type": "floor"}, {"type": "floor"}, {"type": "exit"}]
    ]
  }
}
```

### M1 validated band (edge QA)

`level_001`–`level_010` in `assets/levels/world_1/` are purpose-built v2 edge-test levels. `LevelRepository.m1ValidatedLevelIds` loads this band for runtime progression.

### Migration

- v1 JSON: cropped to walkable bounding box; wall cells become neighbor edge flags; interior wall cells become impassable floor pillars
- Tool: `WRITE_V2_LEVELS=1 fvm flutter test test/tool/write_v2_levels_test.dart`
- Decision record: [Decisions.md](../00_Project/Decisions.md) — edge-based maze model

---

## Cross References

- [Technical Implementation Plan](Technical_Implementation_Plan.md)
- [Architecture](Architecture.md)
- [Folder Structure](Folder_Structure.md)
- [Gameplay](../01_Game_Design/Gameplay/Gameplay.md)
- [GP2 Movement System](../01_Game_Design/Gameplay/GP2_Movement_System.md)
- [GP5 Objectives & Completion](../01_Game_Design/Gameplay/GP5_Objectives_Completion.md)
- [GP7 Gameplay Rules](../01_Game_Design/Gameplay/GP7_Gameplay_Rules.md)
- [Puzzle Elements](../01_Game_Design/Gameplay/Puzzle_Elements.md)
- [Level Design](../01_Game_Design/Level_Design.md)
- [Worlds](../01_Game_Design/Worlds.md)

---

## Navigation

| ← Previous | Next → | Index |
|------------|--------|-------|
| [Technical Implementation Plan](Technical_Implementation_Plan.md) | [Architecture](Architecture.md) | [Technical README](README.md) · [LLDS Home](../README.md) |
