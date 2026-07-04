# AGENTS.md — Labyrinth Legends


| Field            | Value      |
| ---------------- | ---------- |
| **Version**      | 3.0.0      |
| **Status**       | Active     |
| **Last Updated** | 2026-07-02 |


This repository contains **Labyrinth Legends**, a premium Flutter mobile puzzle adventure game for iOS and Android.

All AI agents, coding assistants, and automated contributors must follow this file.

---

# 1. Prime Directive

The **Labyrinth Legends Documentation System (LLDS)** must stay up to date at all times.

- Start at `[docs/README.md](docs/README.md)`
- Product authority: `[docs/00_Project/Vision.md](docs/00_Project/Vision.md)`
- Visual authority: `[docs/02_Design_System/LLDL/LLDL.md](docs/02_Design_System/LLDL/LLDL.md)`

Do not treat documentation as optional.

If a change affects gameplay, architecture, scope, product direction, monetization, UX, art direction, roadmap, or technical decisions, update the relevant LLDS document in the same work session.

---



# 2. Documentation Philosophy

**LLDS is the project's single source of truth.**


| Principle                           | Rule                                                                               |
| ----------------------------------- | ---------------------------------------------------------------------------------- |
| **Defined authority**               | Every document has a place in the hierarchy (see §6)                               |
| **Philosophy above implementation** | Higher-level documents define *why* and *what*; lower-level documents define *how* |
| **Extension, not redefinition**     | Lower-level documents may extend higher-level documents                            |
| **No silent overrides**             | Lower-level documents may **never** redefine higher-level documents                |




### When conflicts occur

1. **Preserve** the higher-level document
2. **Report** the conflict (review package, task summary, or Human escalation)
3. **Never** silently reinterpret the design



### What belongs in LLDS

Update the appropriate LLDS folder when changing:


| Domain               | Primary locations                                                                                      |
| -------------------- | ------------------------------------------------------------------------------------------------------ |
| Game design          | `docs/01_Game_Design/` · `[Game_Loop.md](docs/01_Game_Design/Game_Loop/Game_Loop.md)` · gameplay specs |
| Visual / UX          | `docs/02_Design_System/` · `docs/03_Screens/` · `docs/07_UI/`                                          |
| Technical            | `docs/04_Technical/`                                                                                   |
| Product / governance | `docs/00_Project/` (`Decisions.md`, `Roadmap.md`)                                                      |
| AI workflow          | `docs/05_AI/`                                                                                          |
| Milestone handoff    | `docs/99_Reviews/`                                                                                     |


Avoid duplicate prose — **link** to authoritative documents.

---



# 3. Agent Roles



## Cursor — Builder / Implementer

- Implements code and documentation per LLDS
- Must follow `[.cursor/rules/labyrinth-legends.mdc](.cursor/rules/labyrinth-legends.mdc)`
- Must read relevant docs before implementation (see §5)
- Must update LLDS when implementation changes behavior or design
- **Must generate a review package after every major task** (see §4)



## Codex — Engineering Reviewer

- Reviews architecture, maintainability, performance, scalability, tests, and Flutter quality
- Reads the relevant review package **first**, then verifies claims against the codebase
- Does **not** judge product feel unless explicitly asked



## ChatGPT — Creative Director / Product Architect

- Authoritative source for game design specifications
- Reviews UX, design consistency, LLDL compliance, gameplay feel, monetization implications, player experience, and App Store polish
- Reviews based on review packages, screenshots, summaries, and selected files
- Does not require continuous local repo access



## Human Owner — Final Approval Authority

- Makes product and business decisions
- Approves or rejects review packages before the next phase begins

---



# 4. Mandatory Review Packages

After every **major task**, Cursor must create a review package in `docs/99_Reviews/`. Review packages are the **official handoff artifact** for Codex, ChatGPT, and Human approval.

**Cursor must not mark a major task complete until the review package exists.**

All review packages must use the **v2 template** (`[docs/99_Reviews/Review_Template.md](docs/99_Reviews/Review_Template.md)`), including:

- Motivation, risk assessment, dependencies, product impact
- Future technical debt and recommended next task
- Standardized reviewer notes (Codex, ChatGPT, Human)

1. Run `./scripts/new_review_package.sh <Category> <topic_slug> --update-index`
2. Fill all v2 sections per the template
3. Include screenshots if UI changed
4. Mark **Ready For** checkboxes when complete

**Do not proceed to the next phase until review is approved** (or explicitly waived by Human).

See `[docs/99_Reviews/README.md](docs/99_Reviews/README.md)` for folder structure and naming.

---



# 5. Required Reading Before Work

Read **only what the task requires**, but always start from the general list.

## General Reading

```text
docs/README.md
docs/00_Project/Vision.md
docs/01_Game_Design/Game_Loop/Game_Loop.md
docs/00_Project/Decisions.md
```



## Gameplay Work

**Mandatory:**

```text
docs/00_Project/Vision.md
docs/01_Game_Design/Game_Loop/Game_Loop.md
```

**Gameplay Core Specifications** (foundations — read for any gameplay task):

```text
docs/01_Game_Design/Gameplay/GP1_Player_Explorer.md      (GP1)
docs/01_Game_Design/Gameplay/GP2_Movement_System.md    (GP2)
docs/01_Game_Design/Gameplay/GP7_Gameplay_Rules.md     (GP7)
```

**Puzzle design series** (read when authoring or implementing puzzle elements):

```text
docs/01_Game_Design/Gameplay/GP3/GP3.1_Puzzle_Taxonomy.md           (GP3.1)
docs/01_Game_Design/Gameplay/GP3/GP3.2_Static_Traversal_Collectible_Elements.md   (GP3.2)
docs/01_Game_Design/Gameplay/GP3/GP3.3_Interactive_Elements.md        (GP3.3)
docs/01_Game_Design/Gameplay/GP3/GP3.4_Environmental_Dynamic_Systems.md      (GP3.4)
docs/01_Game_Design/Gameplay/GP3/GP3.5_Puzzle_Composition_Level_Design_Rules.md        (GP3.5)
```

**Gameplay Feature Specifications** (read only documents relevant to the current task):

```text
docs/01_Game_Design/Gameplay/Puzzle_Elements.md       (GP3 Integration)
docs/01_Game_Design/Gameplay/GP4_Hazards_Failure.md       (GP4)
docs/01_Game_Design/Gameplay/GP5_Objectives_Completion.md (GP5)
docs/01_Game_Design/Gameplay/GP6_Gameplay_Feedback.md     (GP6)
```

**Integration layer:**

```text
docs/01_Game_Design/Gameplay/Gameplay.md
```

Index: `[docs/01_Game_Design/Gameplay/README.md](docs/01_Game_Design/Gameplay/README.md)`

## Architecture Work

```text
docs/04_Technical/
```

Key entries: `[docs/04_Technical/Architecture.md](docs/04_Technical/Architecture.md)` · `[docs/04_Technical/Engine_Architecture.md](docs/04_Technical/Engine_Architecture.md)`

**Technical Contracts** — Approved documents that govern implementation (e.g. `Level_Format.md`, `Coding_Standards.md`, `Engine_Architecture.md`).

**Engineering Reference Documents** — Implementation-informed references that inform but do not block coding unless promoted (e.g. `Engine_Session.md`).

## UI / UX Work

```text
docs/02_Design_System/
docs/03_Screens/
docs/07_UI/
```

Key entries: `[docs/02_Design_System/LLDL/LLDL.md](docs/02_Design_System/LLDL/LLDL.md)` · `[docs/07_UI/README.md](docs/07_UI/README.md)`

## AI Workflow

```text
docs/05_AI/
```

Key entries: `[docs/05_AI/Cursor/Workflow.md](docs/05_AI/Cursor/Workflow.md)` · `[docs/05_AI/Codex/Review_Checklist.md](docs/05_AI/Codex/Review_Checklist.md)`

---



# 6. Documentation Authority

When documentation conflicts, **the higher-level document wins**.

Never silently redefine gameplay, product direction, or architecture.

### Hierarchy

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
    ↓
LLDL.md
    ↓
Asset Bible
    ↓
Engineering Architecture / Technical Contracts
    ↓
07_UI Architecture Documents
    ↓
07_UI Specification Documents
    ↓
Implementation (lib/, test/)
```


| Level                                  | Path                                                                                                              |
| -------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| Vision                                 | `docs/00_Project/Vision.md`                                                                                       |
| Game Loop                              | `docs/01_Game_Design/Game_Loop/Game_Loop.md` · WS1–WS5 workshops                                                  |
| Gameplay Core                          | `Gameplay/GP1_Player_Explorer.md` (GP1) · `GP2_Movement_System.md` (GP2) · `GP7_Gameplay_Rules.md` (GP7)          |
| GP3 Puzzle Element Series              | `Gameplay/GP3/` (GP3.1–GP3.5)                                                                                     |
| GP3 Integration                        | `Gameplay/Puzzle_Elements.md` — integrates GP3.1–GP3.5; does not override them                                    |
| Gameplay Features                      | `Gameplay/GP4_Hazards_Failure.md` (GP4) · `GP5_Objectives_Completion.md` (GP5) · `GP6_Gameplay_Feedback.md` (GP6) |
| Gameplay integration                   | `docs/01_Game_Design/Gameplay/Gameplay.md`                                                                        |
| Design system                          | `docs/02_Design_System/LLDL/LLDL.md` · `Design_Tokens.md` · `Components.md`                                       |
| Asset production                       | `docs/06_Asset_Bible/*`                                                                                           |
| Engineering architecture               | `docs/04_Technical/Architecture.md` · `Engine_Architecture.md` · technical contracts                              |
| UI architecture                        | `docs/07_UI/*`                                                                                                    |
| Screens / existing applied screen refs | `docs/03_Screens/*`                                                                                               |
| Technical                              | `docs/04_Technical/*`                                                                                             |




### Conflict protocol

If a lower-level document appears to contradict a higher-level document:

1. **Preserve** the higher-level document
2. **Report** the conflict
3. **Recommend** the required documentation update
4. **Do not** invent a new interpretation

Record material decisions and exceptions in `[docs/00_Project/Decisions.md](docs/00_Project/Decisions.md)`.

---



# 7. Gameplay Documentation Authority

Gameplay documentation is divided into **Core Specifications**, the **GP3 Puzzle Element Series**, **Feature / Integration Specifications**, and the integration layer (`Gameplay.md`).

## Core Gameplay Specifications

Define gameplay **foundations**:


| Document                                                                        | ID  | Defines                                                  |
| ------------------------------------------------------------------------------- | --- | -------------------------------------------------------- |
| `[GP1_Player_Explorer.md](docs/01_Game_Design/Gameplay/GP1_Player_Explorer.md)` | GP1 | Player agency, explorer identity, commitment model       |
| `[GP2_Movement_System.md](docs/01_Game_Design/Gameplay/GP2_Movement_System.md)` | GP2 | Path expression, execution, movement constraints         |
| `[GP7_Gameplay_Rules.md](docs/01_Game_Design/Gameplay/GP7_Gameplay_Rules.md)`   | GP7 | Rule precedence, interaction order, execution philosophy |


Core Specifications must **never** be overridden by Feature Specifications, GP3 element specs, or implementation code.

## GP3 Puzzle Element Series

Puzzle element taxonomy and mechanics (`Gameplay/GP3/`):


| Document                                         | ID    |
| ------------------------------------------------ | ----- |
| `GP3.1_Puzzle_Taxonomy.md`                       | GP3.1 |
| `GP3.2_Static_Traversal_Collectible_Elements.md` | GP3.2 |
| `GP3.3_Interactive_Elements.md`                  | GP3.3 |
| `GP3.4_Environmental_Dynamic_Systems.md`         | GP3.4 |
| `GP3.5_Puzzle_Composition_Level_Design_Rules.md` | GP3.5 |


GP3 defines puzzle **elements** and composition rules. **GP3 always refers to puzzle elements** — not gameplay rules or precedence.

## Gameplay Feature / Integration Specifications

**Extend** Core Specifications and GP3 — they may introduce mechanics but may **never redefine** Core rules:


| Document                                                                                | ID              | Scope                                                                        |
| --------------------------------------------------------------------------------------- | --------------- | ---------------------------------------------------------------------------- |
| `[Puzzle_Elements.md](docs/01_Game_Design/Gameplay/Puzzle_Elements.md)`                 | GP3 Integration | Integrated puzzle catalogue; synthesizes GP3.1–GP3.5; does not override them |
| `[Hazards_Failure.md](docs/01_Game_Design/Gameplay/GP4_Hazards_Failure.md)`             | GP4             | Hazards, failure modes, fairness                                             |
| `[Objectives_Completion.md](docs/01_Game_Design/Gameplay/GP5_Objectives_Completion.md)` | GP5             | Win/lose, goals, completion standards                                        |
| `[Gameplay_Feedback.md](docs/01_Game_Design/Gameplay/GP6_Gameplay_Feedback.md)`         | GP6             | Player learning, feedback, readability                                       |


**GP7 always refers to gameplay rules and precedence** (`GP7_Gameplay_Rules.md`). Do not list `GP7_Gameplay_Rules.md` under GP3 or Feature GP numbers other than GP7.

### Authority layer rule

When implementing or modifying gameplay, first identify whether the change belongs to:

- **Core Specification** (GP1, GP2, GP7)
- **GP3 Puzzle Element Series** (GP3.1–GP3.5)
- **Gameplay Feature Specification** (GP4–GP6)
- **Gameplay Integration Document** (`Puzzle_Elements.md` — GP3 Integration; `Gameplay.md`)

Do not place rules in the wrong authority layer.

## Integration rule

```text
Core documents (GP1, GP2, GP7) define the rules.
GP3 documents define puzzle elements.
Feature documents (GP4–GP6) use the rules.
Puzzle_Elements.md integrates GP3.1–GP3.5.
Gameplay.md integrates all gameplay documentation.
```

No gameplay document may redefine [Vision](docs/00_Project/Vision.md) or [Game Loop](docs/01_Game_Design/Game_Loop/Game_Loop.md) philosophy.

---



# 8. Governance Records

Log governance in LLDS — not in legacy folders.


| Record                        | Location                                                        | When                                              |
| ----------------------------- | --------------------------------------------------------------- | ------------------------------------------------- |
| **Decisions**                 | `[docs/00_Project/Decisions.md](docs/00_Project/Decisions.md)`  | Material product, design, or architecture choices |
| **Open questions**            | Review package **Open Questions** section and/or `Decisions.md` | Unresolved items at task end                      |
| **Roadmap / scope**           | `[docs/00_Project/Roadmap.md](docs/00_Project/Roadmap.md)`      | Phase changes, milestone shifts                   |
| **Rejected / deferred ideas** | `Decisions.md` with status Deferred/Rejected                    | Ideas worth preserving but not building           |


Do not silently make product or architecture decisions without recording them.

---



# 9. Legacy Documentation

The `docs/second-brain/` directory exists **only for historical reference and migration**.


| Rule                                           | Action                                                      |
| ---------------------------------------------- | ----------------------------------------------------------- |
| **Do not** create new documentation there      | Write in LLDS                                               |
| **Do not** maintain duplicate sources of truth | One authoritative home per topic                            |
| **When useful content exists there**           | Migrate into LLDS, preserve history, archive legacy content |


All new documentation belongs inside LLDS (`docs/` per `[docs/README.md](docs/README.md)`).

See `[docs/second-brain/README.md](docs/second-brain/README.md)` for the supersession map.

---



# 10. Architecture Rules

All agents must follow these architecture rules:

- Flutter widgets must not contain core gameplay logic
- UI renders state and forwards input only
- Game rules live in pure Dart domain classes (`lib/game_engine/`)
- Path validation must be testable without UI
- Maze generation must be testable without UI
- Save/load logic is abstracted from the game engine
- Backend/Firebase must not be directly coupled to core gameplay
- Avoid global mutable state, large files, and magic numbers
- Prefer small, focused classes and clear names
- Add tests for core game rules
- `GameplaySession` is the only public engine API
- `GameplaySession` owns runtime state
- Flutter owns timing
- Engine owns deterministic execution



### Architecture Freeze Rule

Engine architecture is frozen for the current milestone once M0 is complete. Do not redesign layer boundaries, dependency direction, or the `GameplaySession` public API during implementation without Human approval and a review package.

Full detail: `[docs/04_Technical/Architecture.md](docs/04_Technical/Architecture.md)` · `[docs/04_Technical/Engine_Architecture.md](docs/04_Technical/Engine_Architecture.md)`

---



# 11. MVP Protection Rule

Protect the MVP from scope creep.

Before adding a feature, classify it:

```text
MVP
Post-MVP
Idea
Rejected
Needs Decision
```

If it is not MVP, do not implement it unless explicitly approved by Human.

Document non-MVP ideas in `[docs/00_Project/Decisions.md](docs/00_Project/Decisions.md)` or the task review package. Scope reference: `[docs/00_Project/Roadmap.md](docs/00_Project/Roadmap.md)`.

---



# 12. Documentation Commit Requirement

Any pull request or major AI-generated change should include:

1. Relevant LLDS documentation updates **and** a review package in `docs/99_Reviews/` for major tasks

**or**

1. A short explanation:

```text
No documentation update needed because this change is purely internal/refactor-only
and does not affect design, architecture, product direction, roadmap, or decisions.
```

Minor fixes may skip a review package; major milestones may not.

---



# 13. Required End-of-Task Summary

At the end of every meaningful task, the agent must report:

```text
Code changed:
-

Docs updated:
-

Review package:
docs/99_Reviews/{Category}/NNNN_topic.md (or N/A for minor fixes)

Decisions added:
-

Open questions added:
-

Backlog items added:
-

Tests added/updated:
-
```

---



# 14. Definition of Done

A task is complete only when:

- The code builds or the issue is clearly documented
- The change aligns with `[Vision.md](docs/00_Project/Vision.md)` and relevant LLDS docs
- The change respects MVP scope (`[Roadmap.md](docs/00_Project/Roadmap.md)`)
- Core game logic remains outside widgets
- Relevant tests are added or updated where practical
- LLDS docs are updated when behavior or design changed
- **A review package exists** in `docs/99_Reviews/` for major tasks
- Important decisions are logged in `Decisions.md`
- Open questions are recorded
- No unrelated scope is introduced

If documentation or the review package is missing for a major task, the task is **not done**.

---



# 15. Documentation Standards

All new architecture and governance documentation must use:

`docs/templates/Architecture_Document_Template.md`

unless an approved specialized template exists.

## Architecture document scope

Architecture and governance documents include, but are not limited to:

- Vision
- Gameplay Architecture
- Engine Architecture
- UI Architecture
- LiveOps
- Backend
- Analytics
- Monetization
- Repository Governance



## Specialized specification templates

Specification documents may use specialized templates when appropriate.

Examples include:

- Gameplay Specifications
- Component Specifications
- Screen Specifications
- Design Tokens



## Required architecture document content

Architecture documents should define:

- Principles
- Scope
- Governance
- Authority
- Dependencies

Architecture documents should not contain implementation details unless implementation detail is explicitly part of the document's intended purpose.

## Required authority framing

Every architecture document should clearly define:

- What it governs
- What it does not govern
- Upstream dependencies
- Downstream documents
- Conflict resolution



## Documentation hierarchy

Repository documentation must remain hierarchical.

Architecture and governance documents must follow the precedence model already defined in this file and in `docs/README.md`.

For architecture-oriented documentation, the practical precedence model is:

```text
AGENTS.md
    ↓
docs/README.md
    ↓
Vision
    ↓
Gameplay
    ↓
LLDL
    ↓
Asset Bible
    ↓
Engineering Architecture
    ↓
07_UI architecture documents
    ↓
07_UI specification documents
    ↓
Implementation
```

This section clarifies how architecture documents fit inside the existing LLDS hierarchy. It does not override the established authority model for gameplay, design language, or repository governance already defined elsewhere in this file and in `docs/README.md`.

If a lower-level document conflicts with a higher-level document:

1. Preserve the higher-level document
2. Report the conflict
3. Do not silently reinterpret intent



## UI documentation authority

`docs/07_UI/` is an authoritative documentation area for UI architecture and implementation-facing UI specifications.

Once UI documents are approved or locked, UI implementation must follow `docs/07_UI/`.

UI documents must not contradict:

- Vision
- Gameplay
- LLDL
- Asset Bible
- Engineering Architecture

If conflicts exist, precedence is:

```text
AGENTS.md
    ↓
docs/README.md
    ↓
Vision
    ↓
Gameplay
    ↓
LLDL
    ↓
Asset Bible
    ↓
Engineering Architecture
    ↓
07_UI architecture documents
    ↓
07_UI specification documents
    ↓
Implementation
```

New UI patterns, layouts, components, animations, or interaction rules require corresponding `docs/07_UI/` updates before implementation.

Cursor must not invent UI architecture during implementation when an approved UI document already exists.

Review packages for documents authored under `docs/07_UI/` require **ChatGPT review** and **Human approval**. A separate **Codex review section is not required** for the `docs/07_UI/` document family unless explicitly requested.

## Backwards compatibility

Documentation changes should preserve backwards compatibility whenever practical.

When structure changes are necessary, migration guidance should be recorded so older references do not become ambiguous.

## Approval and locking

Architecture documents become authoritative once approved and locked.

Any material change to an approved architecture or governance document requires architectural review before implementation proceeds.