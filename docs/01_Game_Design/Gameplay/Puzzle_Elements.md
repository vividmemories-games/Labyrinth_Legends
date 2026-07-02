# Puzzle Elements — GP3 Integration Catalogue

| Field | Value |
|-------|-------|
| **Project** | Labyrinth Legends |
| **Document Name** | Puzzle Elements Integration |
| **Document ID** | LLDS-DOC-01-GP3-INT-001 |
| **Path** | `docs/01_Game_Design/Gameplay/Puzzle_Elements.md` |
| **Version** | 1.0.0 |
| **Status** | Draft — Ready for Review |
| **Owner** | Apoorv |
| **Prepared By** | Cursor (compiler) |
| **Last Updated** | 2026-07-02 |
| **Phase** | GP3 Documentation Integration |
| **Priority** | Integration / Reference |
| **Dependencies** | [Vision](../../00_Project/Vision.md) · [Game Loop](../Game_Loop/Game_Loop.md) · [GP1](GP1_Player_Explorer.md) · [GP2](GP2_Movement_System.md) · [GP7](GP7_Gameplay_Rules.md) · [GP3.1–GP3.5](GP3/README.md) |
| **Related Documents** | [Gameplay Integration](Gameplay.md) · [Gameplay Specs README](README.md) · [GP4 Hazards](GP4_Hazards_Failure.md) · [GP5 Objectives](GP5_Objectives_Completion.md) · [GP6 Feedback](GP6_Gameplay_Feedback.md) |

## Navigation

| ← Previous | Next → | Index |
|------------|--------|-------|
| [GP3.5 — Composition](GP3/GP3.5_Puzzle_Composition_Level_Design_Rules.md) | [Gameplay Integration](Gameplay.md) | [Gameplay Specs](README.md) · [GP3 Series](GP3/README.md) · [LLDS Home](../../README.md) |

---

## Version History

| Version | Date | Author | Summary |
|---------|------|--------|---------|
| 1.0.0 | 2026-07-02 | Cursor | Initial GP3 integration catalogue synthesizing GP3.1–GP3.5 |

---

## Table of Contents

1. [Purpose](#1-purpose)
2. [Authority Model](#2-authority-model)
3. [Source Document Map](#3-source-document-map)
4. [Taxonomy Quick Reference](#4-taxonomy-quick-reference)
5. [Integrated Element Catalogue](#5-integrated-element-catalogue)
6. [Lifecycle and Behaviour Summary](#6-lifecycle-and-behaviour-summary)
7. [Composition Quick Reference](#7-composition-quick-reference)
8. [MVP Scope](#8-mvp-scope)
9. [Open Questions (Integration Index)](#9-open-questions-integration-index)
10. [What Puzzle_Elements.md Must Not Do](#10-what-puzzle_elementsmd-must-not-do)
11. [Cross References](#11-cross-references)
12. [Approval Status](#12-approval-status)

---

## 1. Purpose

This document is the **practical integrated puzzle element catalogue** for Labyrinth Legends. It answers:

> **What puzzle elements exist, how are they classified, and where is each behaviour defined?**

`Puzzle_Elements.md` **synthesizes and indexes** the approved GP3 puzzle design series (GP3.1–GP3.5). It is the GP3 integration layer between the GP3 workshop specifications and the broader [Gameplay.md](Gameplay.md) integration map.

| This document | Authoritative GP3 specs |
|---------------|-------------------------|
| Provides a single lookup table for element families and types | Define taxonomy language, per-element behaviour, composition rules |
| Links every catalogue entry to its owning GP3 section | Hold detailed specifications, examples, locked decisions, and anti-patterns |
| Summarizes lifecycle, combination, and composition patterns | Own the full depth of each mechanic |

**Upstream authority:** [GP1](GP1_Player_Explorer.md) · [GP2](GP2_Movement_System.md) · [GP7](GP7_Gameplay_Rules.md)  
**GP3 authority:** [GP3.1](GP3/GP3.1_Puzzle_Taxonomy.md) through [GP3.5](GP3/GP3.5_Puzzle_Composition_Level_Design_Rules.md)

> **Conflict rule:** If this document conflicts with any GP3.1–GP3.5 specification or Core Specification, **preserve the higher document** and report the conflict — do not silently reinterpret.

### Design Intent

`Puzzle_Elements.md` is the **catalogue index**, not the **mechanics bible**. Engineers, designers, QA, and AI agents use it to find the correct authoritative spec before implementing or authoring content.

---

## 2. Authority Model

```text
Vision.md
    ↓
Game_Loop.md
    ↓
GP1 / GP2 / GP7          ← Core Gameplay Specifications (agency, movement, precedence)
    ↓
GP3.1 – GP3.5            ← Puzzle element & composition series (authoritative)
    ↓
Puzzle_Elements.md       ← This document (integration catalogue only)
    ↓
Gameplay.md              ← Full gameplay system map
    ↓
GP4 / GP5 / GP6          ← Hazards, objectives, feedback (feature specs)
```

| Layer | Documents | Role |
|-------|-----------|------|
| **Core** | GP1, GP2, GP7 | Player agency, movement validation, rule precedence — puzzle elements must comply |
| **Puzzle design** | GP3.1–GP3.5 | Taxonomy, element behaviour, environmental systems, composition rules |
| **GP3 integration** | Puzzle_Elements.md (this doc) | Practical catalogue and cross-links |
| **Gameplay integration** | Gameplay.md | How puzzle elements fit the full gameplay stack |
| **Features** | GP4, GP5, GP6 | Hazard consequences, objective meaning, feedback — extend puzzle elements |

**Key clarifications:**

- **GP3.1** owns taxonomy and philosophy — every element has **one primary category**.
- **GP3.2–GP3.4** own per-family behaviour — this catalogue lists types; specs define rules.
- **GP3.5** owns composition and level design — not individual element mechanics.
- **GP7** owns resolution order when elements interact during execution.
- **Puzzle_Elements.md** may not override any layer above it.

---

## 3. Source Document Map

| Document | ID | Integration role in this catalogue |
|----------|-----|-----------------------------------|
| [GP3.1_Puzzle_Taxonomy.md](GP3/GP3.1_Puzzle_Taxonomy.md) | GP3.1 | §4 Taxonomy Quick Reference |
| [GP3.2_Static_Traversal_Collectible_Elements.md](GP3/GP3.2_Static_Traversal_Collectible_Elements.md) | GP3.2 | §5.1–§5.3 Static, Traversal, Collectible tables |
| [GP3.3_Interactive_Elements.md](GP3/GP3.3_Interactive_Elements.md) | GP3.3 | §5.4 Interactive table |
| [GP3.4_Environmental_Dynamic_Systems.md](GP3/GP3.4_Environmental_Dynamic_Systems.md) | GP3.4 | §5.5 Environmental & Dynamic table |
| [GP3.5_Puzzle_Composition_Level_Design_Rules.md](GP3/GP3.5_Puzzle_Composition_Level_Design_Rules.md) | GP3.5 | §7 Composition Quick Reference |

---

## 4. Taxonomy Quick Reference

Synthesized from [GP3.1 §3](GP3/GP3.1_Puzzle_Taxonomy.md#3-puzzle-element-taxonomy). **Full taxonomy language lives in GP3.1.**

| Primary category | Purpose (summary) | Authoritative spec |
|------------------|-------------------|-------------------|
| **Static** | Immutable spatial facts — the honest graph | [GP3.2 §2](GP3/GP3.2_Static_Traversal_Collectible_Elements.md#2-static-elements) |
| **Collectible** | Route acquisitions that alter legality or objectives | [GP3.2 §4](GP3/GP3.2_Static_Traversal_Collectible_Elements.md#4-collectible-elements) |
| **Interactive** | Mechanisms that change world state on traversal | [GP3.3](GP3/GP3.3_Interactive_Elements.md) |
| **Traversal** | Modifiers to movement on the graph | [GP3.2 §3](GP3/GP3.2_Static_Traversal_Collectible_Elements.md#3-traversal-elements) |
| **Environmental** | Area-wide conditions affecting multiple elements | [GP3.4 §2–§9](GP3/GP3.4_Environmental_Dynamic_Systems.md) |
| **Dynamic** | Deterministic time- or sequence-driven change | [GP3.4 §3, §10–§11](GP3/GP3.4_Environmental_Dynamic_Systems.md) |

**Classification rule (GP3.1):** Every authored mechanic declares **one primary category**. Secondary roles are noted but do not replace primary classification.

**Hierarchy tiers (GP3.1 §7):** Core → World → Legendary introduction pacing — see [GP3.5 §4](GP3/GP3.5_Puzzle_Composition_Level_Design_Rules.md#4-mechanic-introduction-pattern).

---

## 5. Integrated Element Catalogue

Practical lookup tables. **Behaviour detail, locked decisions, and anti-patterns remain in the linked GP3 sections.**

### 5.1 Static Elements

Source: [GP3.2 §2](GP3/GP3.2_Static_Traversal_Collectible_Elements.md#2-static-elements)

| Element type | Primary role | Planning impact | Authority |
|--------------|--------------|-----------------|-----------|
| Floor nodes | Default traversable cells | Route choice | GP3.2 §2 |
| Walls | Block edges between nodes | Path constraint | GP3.2 §2 |
| Boundaries | Playable labyrinth limit | Path constraint | GP3.2 §2 |
| Start nodes | Explorer origin | Path must begin here | GP3.2 §2 |
| Exit nodes | Primary completion target | Goal routing | GP3.2 §2 · [GP5](GP5_Objectives_Completion.md) |
| Blocked nodes | Visible non-occupiable cells | Route avoidance | GP3.2 §2 |
| Chasms / voids | Non-traversable gaps | Requires traversal aid | GP3.2 §2 |
| Decorative geometry | Atmosphere only | **Not a puzzle element** unless functional | GP3.1 · GP3.2 §2 |

### 5.2 Traversal Elements

Source: [GP3.2 §3](GP3/GP3.2_Static_Traversal_Collectible_Elements.md#3-traversal-elements). All extend [GP2](GP2_Movement_System.md) — they do not replace movement commitment.

| Element type | Primary role | Planning impact | Authority |
|--------------|--------------|-----------------|-----------|
| Bridges | Cross gaps between nodes | Include crossing in path | GP3.2 §3 |
| One-way paths | Directed edges | Order and direction choice | GP3.2 §3 |
| Teleporters | Paired entry/exit relocation | Pair mapping in path | GP3.2 §3 |
| Conveyors | Forced step direction | Route commitment | GP3.2 §3 |
| Ice paths | Slide extension behaviour | Extended route foresight | GP3.2 §3 · GP7 (open) |
| Water currents | Flow-assisted movement | Route shape | GP3.2 §3 |
| Wind paths | Force-assisted movement | Route shape | GP3.2 §3 |
| Moving platforms | Relocating traversable nodes | Timing / phase choice | GP3.2 §3 · GP3.4 §10 |

### 5.3 Collectible Elements

Source: [GP3.2 §4](GP3/GP3.2_Static_Traversal_Collectible_Elements.md#4-collectible-elements). Collection is **automatic on traversal** per [GP1](GP1_Player_Explorer.md).

| Element type | Primary role | Planning impact | Authority |
|--------------|--------------|-----------------|-----------|
| Keys | Unlock doors / locks | Visit order before gate | GP3.2 §4 · GP3.3 §7 |
| Relics | Discovery / progression objectives | Optional or required route | GP3.2 §4 · [GP5](GP5_Objectives_Completion.md) |
| Gems / optional treasures | Optional mastery rewards | Risk/reward detour | GP3.2 §4 · GP5 |
| Scrolls / puzzle fragments | Lore or teaching beats | Optional acquisition | GP3.2 §4 |
| Optional treasures (general) | Replay incentive | Branch commitment | GP3.2 §4 · GP3.5 §11 |

### 5.4 Interactive Elements

Source: [GP3.3](GP3/GP3.3_Interactive_Elements.md). Activation is **automatic on Explorer traversal** per GP1/GP3.3.

| Element family | Primary role | Planning impact | Authority |
|----------------|--------------|-----------------|-----------|
| Doors and gates | Access control | Order, key possession, switch state | GP3.3 §3 |
| Switches | Toggle mechanism state | When to flip; sequence order | GP3.3 §4 |
| Pressure plates | Weight / presence triggers | Hold-open or pulse timing | GP3.3 §5 |
| Levers and buttons | Discrete activation | One-shot or toggle beats | GP3.3 §6 |
| Locks and access logic | Open conditions | Key order, multi-lock chains | GP3.3 §7 |
| Multi-state interactables | Staged mechanism progress | Full sequence planning | GP3.3 §8 |
| Linked interactions | Remote cause-and-effect | Discover and plan link topology | GP3.3 §9 |

**Interaction timing and feedback:** [GP3.3 §10–§11](GP3/GP3.3_Interactive_Elements.md#10-interaction-timing). **Resolution order during execution:** [GP7](GP7_Gameplay_Rules.md).

### 5.5 Environmental and Dynamic Systems

Source: [GP3.4](GP3/GP3.4_Environmental_Dynamic_Systems.md)

| System family | Category | Primary role | Authority |
|---------------|----------|--------------|-----------|
| Light and shadow | Environmental | Illumination gates visibility and mechanisms | GP3.4 §4 |
| Electricity / energy | Environmental | Deterministic power flow networks | GP3.4 §5 |
| Water, sand, and flow | Environmental / Dynamic | Fluid or granular channel logic | GP3.4 §6 |
| Wind and force | Environmental | Directional force fields | GP3.4 §7 |
| Gravity and orientation | Environmental | Orientation-dependent traversal | GP3.4 §8 |
| Darkness, fog, visibility | Environmental | Information gating (fair, taught) | GP3.4 §9 |
| Moving and shifting structures | Dynamic | Relocating geometry over time | GP3.4 §10 |
| Timed and cyclical systems | Dynamic | Phase windows and schedules | GP3.4 §11 |

**State communication:** [GP3.4 §12](GP3/GP3.4_Environmental_Dynamic_Systems.md#12-environmental-state-communication). **Hazard overlap:** environmental danger consequences belong in [GP4](GP4_Hazards_Failure.md); GP3.4 defines puzzle-state behaviour.

---

## 6. Lifecycle and Behaviour Summary

Synthesized from [GP3.1 §4–§5](GP3/GP3.1_Puzzle_Taxonomy.md). Per-element state machines are defined in GP3.2–GP3.4.

### Universal lifecycle states

| State | Meaning |
|-------|---------|
| **Inactive** | Not yet relevant — hidden, locked, or unpowered |
| **Available** | Observable; may affect planning |
| **Activated** | Explorer traversal or mechanism trigger fired |
| **State change** | World updates deterministically |
| **Resolved** | Element's puzzle role complete for this attempt |
| **Reset** | Returns on Restart per authored rule |

### Universal behaviour principles (GP3.1)

| # | Principle |
|---|-----------|
| B-01 | One primary purpose per element type |
| B-02 | Every state change is visible or previously taught |
| B-03 | Same path + state → same outcome (deterministic) |
| B-04 | Player can foresee effect before confirm when knowable |
| B-05 | Failure traces to plan or misunderstanding — not hidden rules |
| B-06 | Element type behaves consistently across levels |
| B-07 | Elements combine without ad-hoc exceptions |

**Execution pipeline position:** Puzzle interactions resolve during GP7 per-step order — see [Gameplay.md §8](Gameplay.md#8-gameplay-rule-model) and [GP7](GP7_Gameplay_Rules.md).

---

## 7. Composition Quick Reference

Synthesized from [GP3.5](GP3/GP3.5_Puzzle_Composition_Level_Design_Rules.md). **Full composition rules, checklists, and metrics live in GP3.5.**

### Teaching pattern (GP3.5 §3–§4)

| Stage | Player experience |
|-------|-------------------|
| **Show** | Element visible; low stakes |
| **Teach** | Single mechanic in isolation |
| **Confirm** | Player applies mechanic without hand-holding |
| **Combine** | Pair with previously taught elements |
| **Master** | Optional challenge or efficiency route |

### Approved puzzle archetypes (GP3.5 §8)

| Archetype | Core idea | Primary element families |
|-----------|-----------|--------------------------|
| Route Planning | Find valid path | Static, Start, Exit |
| Key-Order | Collect then unlock | Collectible, Interactive |
| Switch-State | Toggle world | Interactive |
| Timing-Window | Arrive in phase | Dynamic |
| Teleporter Mapping | Entry/exit pairing | Traversal |
| Optional Treasure Detour | Risk/reward branch | Collectible |
| Environmental Logic | Regional rule application | Environmental |
| Multi-Step Chain | A→B→C ordering | Interactive links |
| Mastery Route | Optimize path | Multiple categories |

### Composition guardrails (GP3.5 §7, §13)

- **Cognitive load budget** — limit new mechanics per chamber; see GP3.5 load table.
- **Soft-lock prevention** — player must always have Restart; no silent dead ends.
- **Combination matrix** — approved pairings only; see GP3.5 §7.
- **Forbidden difficulty levers** — reflex traps, hidden mandatory mechanics, undocumented rules.

---

## 8. MVP Scope

MVP puzzle content follows the cross-cutting rule from [Gameplay.md §14](Gameplay.md#14-mvp-gameplay-scope-summary):

> MVP includes all major **element families** with **one simple, readable, testable form per family**. MVP does not require every variant, biome skin, advanced combination, or procedural form.

| Area | MVP meaning | Authority |
|------|-------------|-----------|
| Taxonomy | All six primary categories representable | GP3.1 |
| Static / Traversal / Collectible | Core types per GP3.2 tables — one readable form each | GP3.2 |
| Interactive | Doors, switches, plates, keys — one readable form each | GP3.3 |
| Environmental / Dynamic | At least one taught system per world identity where used | GP3.4 |
| Composition | Show → Teach → Confirm before combination | GP3.5 |

Deferred items (e.g. object-weight plates, advanced flow models) remain **open** in source GP3 docs — see §9.

---

## 9. Open Questions (Integration Index)

This section **indexes** open questions from GP3.2–GP3.5 and related Core specs. It does **not** resolve them. Resolution belongs in the owning document.

| ID | Question (summary) | Owner doc | Status |
|----|-------------------|-----------|--------|
| GP2-Q01 / GP3.3-Q01 | Default revisit interaction: retrigger every visit or once per run? | GP2 · GP3.3 | Open |
| GP2-Q02 | Teleport: truncate path or insert scripted continuation? | GP2 | Open |
| GP3.2-Q01 / GP7-Q01 | Ice slide: included in drawn path or computed extension? | GP3.2 · GP7 | Open |
| GP3.2-Q02 / GP7-Q02 | Multi-key doors: key order in validation or only at door step? | GP3.2 · GP7 | Open |
| GP3.1-Q02 | Environmental vs Dynamic boundary for cycling hazards? | GP3.1 | Open |
| GP3.3-Q02 | Object-weight plates in MVP or post-MVP? | GP3.3 | Open |
| GP3.4-Q01 | Flow fill: instant per step or accumulated volume model? | GP3.4 | Open |
| GP3.4-Q03 | Line-of-sight: grid-based or geometry-based for hidden nodes? | GP3.4 | Open |
| GP3.4-Q04 | Collapsing structures: reset on Restart only or per-cycle? | GP3.4 | Open |

Full integration-level open question list: [Gameplay.md §18](Gameplay.md#18-open-questions--deferred-items).

---

## 10. What Puzzle_Elements.md Must Not Do

`Puzzle_Elements.md` and agents editing it **must not**:

- [ ] Redefine GP1, GP2, or GP7
- [ ] Redefine GP3.1–GP3.5 taxonomy, behaviour, or composition rules
- [ ] Introduce new puzzle element types not defined in GP3.2–GP3.4
- [ ] Change movement validity, rule precedence, or execution order
- [ ] Define hazard consequences ([GP4](GP4_Hazards_Failure.md)), objective rules ([GP5](GP5_Objectives_Completion.md)), or feedback behaviour ([GP6](GP6_Gameplay_Feedback.md))
- [ ] Define UI layouts, tokens, or screen specs
- [ ] Silently resolve open questions listed in §9

> Changes to authoritative puzzle behaviour belong in the **owning GP3 document** (or Core spec), then propagate summaries here.

---

## 11. Cross References

### Product and loops

- [Vision.md](../../00_Project/Vision.md)
- [Game_Loop.md](../Game_Loop/Game_Loop.md)

### Core gameplay specifications

- [GP1_Player_Explorer.md](GP1_Player_Explorer.md)
- [GP2_Movement_System.md](GP2_Movement_System.md)
- [GP7_Gameplay_Rules.md](GP7_Gameplay_Rules.md)

### GP3 puzzle design series

- [GP3 README](GP3/README.md)
- [GP3.1_Puzzle_Taxonomy.md](GP3/GP3.1_Puzzle_Taxonomy.md)
- [GP3.2_Static_Traversal_Collectible_Elements.md](GP3/GP3.2_Static_Traversal_Collectible_Elements.md)
- [GP3.3_Interactive_Elements.md](GP3/GP3.3_Interactive_Elements.md)
- [GP3.4_Environmental_Dynamic_Systems.md](GP3/GP3.4_Environmental_Dynamic_Systems.md)
- [GP3.5_Puzzle_Composition_Level_Design_Rules.md](GP3/GP3.5_Puzzle_Composition_Level_Design_Rules.md)

### Downstream feature and integration specs

- [Gameplay.md](Gameplay.md)
- [GP4_Hazards_Failure.md](GP4_Hazards_Failure.md)
- [GP5_Objectives_Completion.md](GP5_Objectives_Completion.md)
- [GP6_Gameplay_Feedback.md](GP6_Gameplay_Feedback.md)
- [Gameplay Specs README](README.md)

---

## 12. Approval Status

**Status: Draft — Ready for Review**

`Puzzle_Elements.md` is the GP3 integration catalogue. Approval locks this document as the practical lookup layer above GP3.1–GP3.5.

| Ready for | Status |
|-----------|--------|
| Codex engineering review | ☑ |
| ChatGPT product review | ☐ |
| Human approval | ☐ |

---

## Navigation

| ← Previous | Next → | Index |
|------------|--------|-------|
| [GP3.5 — Composition](GP3/GP3.5_Puzzle_Composition_Level_Design_Rules.md) | [Gameplay Integration](Gameplay.md) | [Gameplay Specs](README.md) · [GP3 Series](GP3/README.md) · [LLDS Home](../../README.md) |
