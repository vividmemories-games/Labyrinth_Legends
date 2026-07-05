# UI — Chapter Integration Document


| Field                 | Value                                                                                                                                                                                                                                                                          |
| --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Project**           | Labyrinth Legends                                                                                                                                                                                                                                                              |
| **Document Name**     | UI Chapter Integration                                                                                                                                                                                                                                                         |
| **Document ID**       | LLDS-DOC-07-UI-INT-001                                                                                                                                                                                                                                                         |
| **Path**              | `docs/07_UI/UI.md`                                                                                                                                                                                                                                                             |
| **Version**           | 1.0.0                                                                                                                                                                                                                                                                          |
| **Status**            | Approved                                                                                                                                                                                                                                                                       |
| **Owner**             | Apoorv                                                                                                                                                                                                                                                                         |
| **Prepared By**       | Cursor                                                                                                                                                                                                                                                                         |
| **Last Updated**      | 2026-07-05                                                                                                                                                                                                                                                                     |
| **Phase**             | M1.9 — Architecture Integration & Readiness                                                                                                                                                                                                                                    |
| **Priority**          | Integration / Reference                                                                                                                                                                                                                                                        |
| **Dependencies**      | [Vision](../00_Project/Vision.md) · [Gameplay](../01_Game_Design/Gameplay/Gameplay.md) · [LLDL](../02_Design_System/LLDL/LLDL.md) · [Asset Bible](../06_Asset_Bible/Asset_Bible.md) · [Engine Architecture](../04_Technical/Engine_Architecture.md) · [UI_00–UI_08](README.md) |
| **Related Documents** | [07_UI README](README.md) · [Technical Implementation Plan](../04_Technical/Technical_Implementation_Plan.md) · [Decisions](../00_Project/Decisions.md) · [Roadmap](../00_Project/Roadmap.md) · [AGENTS.md](../../AGENTS.md)                                                   |




## Navigation


| ← Previous                                               | Next →                                                                            | Index                                                 |
| -------------------------------------------------------- | --------------------------------------------------------------------------------- | ----------------------------------------------------- |
| [UI_08_Asset_Integration.md](UI_08_Asset_Integration.md) | [Technical Implementation Plan](../04_Technical/Technical_Implementation_Plan.md) | [07_UI README](README.md) · [LLDS Home](../README.md) |


---



## Revision History


| Version | Date       | Author | Summary                                                                             |
| ------- | ---------- | ------ | ----------------------------------------------------------------------------------- |
| 1.0.0   | 2026-07-05 | Cursor | Initial UI chapter integration document — M1.9 Architecture Integration & Readiness |


---



## Table of Contents

1. [Purpose](#1-purpose)
2. [Scope](#2-scope)
3. [Intended Audience](#3-intended-audience)
4. [Dependencies](#4-dependencies)
5. [Related Documents](#5-related-documents)
6. [Authority](#6-authority)
7. [UI Architecture Overview](#7-ui-architecture-overview)
8. [Architecture Position](#8-architecture-position)
9. [UI Document Hierarchy](#9-ui-document-hierarchy)
10. [Reading Order](#10-reading-order)
11. [Authority Matrix](#11-authority-matrix)
12. [Document Relationships](#12-document-relationships)
13. [Implementation Flow](#13-implementation-flow)
14. [Governance](#14-governance)
15. [M2 Readiness Checklist](#15-m2-readiness-checklist)
16. [Implementation Contract](#16-implementation-contract)
17. [Review Workflow](#17-review-workflow)
18. [What UI.md Must Not Do](#18-what-uimd-must-not-do)
19. [Cross References](#19-cross-references)
20. [Approval Status](#20-approval-status)

---



## 1. Purpose

This document is the **consolidated UI chapter integration reference** for Labyrinth Legends. It answers:

> **What is the complete UI architecture chapter, and where does each UI rule live?**

`UI.md` **integrates, connects, indexes, and governs** the approved `docs/07_UI/` architecture stack — it does **not** replace any UI architecture document.


| This document                            | Authoritative UI specs                                                                                                                                                |
| ---------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Explains how UI documents fit together   | Define principles, philosophy, layout, screens, tokens, components, motion, responsiveness, and asset use                                                             |
| Directs readers to the correct owner     | Own decision frameworks, spatial rules, gameplay-screen behavior, semantic tokens, component contracts, motion behavior, responsive adaptation, and asset integration |
| Establishes M2 entry point and readiness | Hold detailed behavior, composition rules, and review criteria                                                                                                        |


**Upstream authority:** [Vision](../00_Project/Vision.md) · [Gameplay](../01_Game_Design/Gameplay/Gameplay.md) · [LLDL](../02_Design_System/LLDL/LLDL.md) · [Asset Bible](../06_Asset_Bible/Asset_Bible.md) · [Engine Architecture](../04_Technical/Engine_Architecture.md)

**Downstream specs:** [UI_00](UI_00_Design_Principles.md) · [UI_01](UI_01_UI_Philosophy.md) · [UI_02](UI_02_Layout_System.md) · [UI_03](UI_03_Gameplay_Screen_Specification.md) · [UI_04](UI_04_Design_Tokens.md) · [UI_05](UI_05_Component_Library.md) · [UI_06](UI_06_Animation_System.md) · [UI_07](UI_07_Responsive_Guidelines.md) · [UI_08](UI_08_Asset_Integration.md)

> **Conflict rule:** If this document conflicts with any higher-authority spec or any approved `UI_00`–`UI_08` document, **preserve the higher document** and report the conflict — do not silently reinterpret.



### Design Intent

`UI.md` is the **map**, not the **terrain**. Readers use it to orient before M2 implementation; they implement and review from `UI_00`–`UI_08`.

---



## 2. Scope



### This document DOES

- Integrate the complete `docs/07_UI/` architecture chapter
- Explain document relationships and reading order
- Establish authority boundaries between Vision, Gameplay, LLDL, Asset Bible, UI, and implementation
- Define governance for UI architecture changes
- Provide a single entry point for M2 UI implementation
- Confirm architecture readiness for the first Flutter UI build phase



### This document DOES NOT

- Redefine layout, components, tokens, animation, responsive behavior, or asset integration
- Duplicate content from `UI_00`–`UI_08`
- Replace [LLDL](../02_Design_System/LLDL/LLDL.md), [Gameplay](../01_Game_Design/Gameplay/Gameplay.md), or [Asset Bible](../06_Asset_Bible/Asset_Bible.md)
- Specify Flutter widgets, APIs, breakpoints, timings, or code structure
- Override [Engine Architecture](../04_Technical/Engine_Architecture.md) or gameplay rules

---



## 3. Intended Audience


| Role                             | Use this document to…                                                    |
| -------------------------------- | ------------------------------------------------------------------------ |
| **Flutter Developers**           | Find the correct UI authority before implementing screens and components |
| **UI/UX Designers**              | Understand how approved UI architecture layers connect                   |
| **Cursor / AI Agents**           | Orient within `docs/07_UI/` without inventing parallel UI doctrine       |
| **ChatGPT (Creative Director)**  | Review chapter completeness and M2 readiness at integration level        |
| **Human Owner**                  | Confirm M1.9 completion and authorize M2 UI implementation               |
| **Codex (Engineering Reviewer)** | Verify UI implementation claims trace to approved architecture owners    |
| **Asset Production**             | Understand where UI asset integration rules live relative to Asset Bible |
| **Producers**                    | Assess whether UI architecture is ready for vertical-slice UI work       |


---



## 4. Dependencies



### Upstream (must be respected)


| Document                                                                             | Why it matters to UI                                            |
| ------------------------------------------------------------------------------------ | --------------------------------------------------------------- |
| [AGENTS.md](../../AGENTS.md)                                                         | Repository governance, documentation hierarchy, review workflow |
| [docs/README.md](../README.md)                                                       | LLDS authority model and documentation priority                 |
| [Vision.md](../00_Project/Vision.md)                                                 | Product intent, premium positioning, player fantasy             |
| [Gameplay.md](../01_Game_Design/Gameplay/Gameplay.md)                                | Planning vs execution, feedback boundaries, gameplay identity   |
| [LLDL.md](../02_Design_System/LLDL/LLDL.md)                                          | Visual language, symbolism, tone, design architecture           |
| [Asset_Bible.md](../06_Asset_Bible/Asset_Bible.md)                                   | Asset production, lifecycle, AB2/AB3 boundaries                 |
| [Engine_Architecture.md](../04_Technical/Engine_Architecture.md)                     | Engine/UI boundary — UI renders state; engine owns rules        |
| [Technical_Implementation_Plan.md](../04_Technical/Technical_Implementation_Plan.md) | M2 build order, vertical slice scope, review gates              |




### Downstream (this document serves)


| Area                      | Consumer                                    |
| ------------------------- | ------------------------------------------- |
| Flutter UI implementation | `lib/features/`, `lib/design_system/`       |
| Screen rebuilds           | Gameplay and meta-game presentation layers  |
| Future UI documents       | Any post-MVP screen or component extensions |


---



## 5. Related Documents



### UI chapter

- [07_UI README](README.md) — folder authority, governance, and document index
- [UI_00_Design_Principles.md](UI_00_Design_Principles.md) through [UI_08_Asset_Integration.md](UI_08_Asset_Integration.md) — approved architecture stack



### Product and gameplay

- [Vision.md](../00_Project/Vision.md)
- [Game Loop](../01_Game_Design/Game_Loop/Game_Loop.md)
- [Gameplay.md](../01_Game_Design/Gameplay/Gameplay.md)
- [GP6_Gameplay_Feedback.md](../01_Game_Design/Gameplay/GP6_Gameplay_Feedback.md)



### Design and assets

- [LLDL.md](../02_Design_System/LLDL/LLDL.md)
- [Design_Tokens.md](../02_Design_System/Design_Tokens.md)
- [Components.md](../02_Design_System/Components.md)
- [Asset_Bible.md](../06_Asset_Bible/Asset_Bible.md)



### Engineering

- [Architecture.md](../04_Technical/Architecture.md)
- [Engine_Architecture.md](../04_Technical/Engine_Architecture.md)
- [Technical_Implementation_Plan.md](../04_Technical/Technical_Implementation_Plan.md)
- [State_Management.md](../04_Technical/State_Management.md)



### Applied references (legacy / transitional)

- `docs/03_Screens/*` — applied screen references; superseded for gameplay screen authority by [UI_03](UI_03_Gameplay_Screen_Specification.md) where conflicts arise



### Governance

- [Decisions.md](../00_Project/Decisions.md)
- [Roadmap.md](../00_Project/Roadmap.md)
- [99_Reviews README](../99_Reviews/README.md)

---



## 6. Authority



### Authority boundaries


| Domain                     | Authority                                                        | UI relationship                                                               |
| -------------------------- | ---------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| **Product intent**         | [Vision](../00_Project/Vision.md)                                | UI must express premium ancient-temple identity without contradicting pillars |
| **Gameplay rules**         | [Gameplay](../01_Game_Design/Gameplay/Gameplay.md) + GP1–GP7     | UI presents state and forwards input; it does not decide outcomes             |
| **Visual language**        | [LLDL](../02_Design_System/LLDL/LLDL.md)                         | UI architecture applies LLDL to screens, components, and motion               |
| **Canonical token values** | [Design_Tokens.md](../02_Design_System/Design_Tokens.md)         | UI_04 governs semantic application; does not replace raw values               |
| **Asset production**       | [Asset_Bible.md](../06_Asset_Bible/Asset_Bible.md)               | UI_08 governs how approved assets enter the interface                         |
| **Engine behavior**        | [Engine_Architecture.md](../04_Technical/Engine_Architecture.md) | UI subscribes to `GameplaySession` state; no gameplay logic in widgets        |
| **UI architecture**        | `docs/07_UI/UI_00`–`UI_08`                                       | Own UI-specific principles through asset integration                          |
| **UI chapter integration** | **This document**                                                | Maps and governs the chapter; does not own detailed rules                     |
| **Flutter implementation** | `lib/` + technical contracts                                     | Must conform to approved UI architecture without redefining it                |




### Conflict protocol

1. **Preserve** the higher-authority document
2. **Report** the conflict in a review package and/or [Decisions](../00_Project/Decisions.md)
3. **Do not** invent a workaround that redefines gameplay, visual language, or UI architecture

---



## 7. UI Architecture Overview

The `docs/07_UI/` chapter translates approved product, gameplay, design-language, asset, and engineering authority into **implementation-facing UI architecture**.

### Chapter philosophy


| Principle                       | Meaning                                                                                          |
| ------------------------------- | ------------------------------------------------------------------------------------------------ |
| **Gameplay dominates**          | The labyrinth board remains the visual and attention center                                      |
| **Interface recedes**           | HUD and chrome support planning and consequence — they do not compete with the puzzle            |
| **Calm premium craft**          | Motion, density, and decoration follow WS5 temperament — no arcade spectacle                     |
| **Architecture before widgets** | Screens, components, tokens, motion, responsiveness, and assets are governed before Flutter code |
| **State presentation only**     | UI renders engine state and forwards input; gameplay rules stay in `lib/game_engine/`            |
| **Extend, never redefine**      | UI docs apply upstream authority; they do not invent parallel product or visual doctrine         |




### Architecture sequence (authored stack)

```text
UI_00 Design Principles
    ↓
UI_01 UI Philosophy
    ↓
UI_02 Layout System
    ↓
UI_03 Gameplay Screen Specification
    ↓
UI_04 Design Tokens
    ↓
UI_05 Component Library
    ↓
UI_06 Animation System
    ↓
UI_07 Responsive Guidelines
    ↓
UI_08 Asset Integration
    ↓
UI.md (this document)
    ↓
Flutter Implementation
```



### Design Intent

The chapter exists so M2 implementers inherit a **single coherent UI system** rather than reconstructing philosophy, layout, and behavior from scattered references.

---



## 8. Architecture Position



### Full project architecture flow

```text
Project Vision
    ↓
Gameplay
    ↓
Engine Architecture
    ↓
LLDL
    ↓
Asset Bible
    ↓
UI Architecture (docs/07_UI/)
    ↓
Flutter Implementation
    ↓
Production Build
```



### LLDS documentation precedence (conflict resolution)

When documents conflict during implementation, the model defined in [AGENTS.md](../../AGENTS.md) and [docs/README.md](../README.md) applies:

```text
Vision.md
    ↓
Game_Loop.md
    ↓
Gameplay Core Specifications — GP1, GP2, GP7
    ↓
GP3 Puzzle Element Series — GP3.1–GP3.5
    ↓
Gameplay Feature Specifications — GP3 Integration, GP4–GP6
    ↓
Gameplay.md
    ↓
LLDL.md
    ↓
Asset Bible
    ↓
Engineering Architecture / Technical Contracts
    ↓
UI Architecture Documents (docs/07_UI/UI_00–UI_08)
    ↓
UI Chapter Integration (docs/07_UI/UI.md)
    ↓
Implementation
```



### Position summary


| Layer              | Role relative to UI                                            |
| ------------------ | -------------------------------------------------------------- |
| Vision / Gameplay  | Define *why* and *what happens* — UI must not alter rules      |
| Engine             | Defines runtime state and execution — UI observes and presents |
| LLDL / Asset Bible | Define visual production authority — UI applies and integrates |
| `UI_00`–`UI_08`    | Define UI architecture — implementation must follow            |
| `UI.md`            | Integrates the chapter — does not add new UI rules             |
| Flutter / `lib/`   | Realizes approved architecture in code                         |


---



## 9. UI Document Hierarchy

Each document below is **authoritative for its domain**. This section summarizes purpose and ownership only — detailed rules remain in the source document.

### UI_00 — Design Principles


| Field            | Value                                                                                              |
| ---------------- | -------------------------------------------------------------------------------------------------- |
| **Purpose**      | Foundational UI decision framework — what the interface must prioritize and reject                 |
| **Owns**         | Design principles, visual decision priorities, interaction philosophy, long-term consistency rules |
| **Does not own** | Layout zones, screen behavior, tokens, components, motion, responsive rules, assets                |




### UI_01 — UI Philosophy


| Field            | Value                                                                                              |
| ---------------- | -------------------------------------------------------------------------------------------------- |
| **Purpose**      | Player-facing UI experience — attention, information behavior, immersion posture                   |
| **Owns**         | Experience vision, attention hierarchy, information density temperament, emotional journey framing |
| **Does not own** | Spatial layout structure, component contracts, token values                                        |




### UI_02 — Layout System


| Field            | Value                                                                                     |
| ---------------- | ----------------------------------------------------------------------------------------- |
| **Purpose**      | Spatial layout philosophy — zoning, gameplay dominance, overlay structure                 |
| **Owns**         | Screen zoning, HUD/support zone logic, gameplay-board dominance, overlay layering posture |
| **Does not own** | Gameplay-screen state machine, component internals, responsive breakpoints                |




### UI_03 — Gameplay Screen Specification


| Field            | Value                                                                                                 |
| ---------------- | ----------------------------------------------------------------------------------------------------- |
| **Purpose**      | Canonical gameplay-screen architectural blueprint                                                     |
| **Owns**         | Screen responsibilities, lifecycle, information hierarchy, board presentation, modal/overlay behavior |
| **Does not own** | Reusable component definitions, semantic token catalog, motion timings, asset files                   |




### UI_04 — Design Tokens


| Field            | Value                                                                            |
| ---------------- | -------------------------------------------------------------------------------- |
| **Purpose**      | Semantic token application architecture for UI                                   |
| **Owns**         | Token categories, naming semantics, usage rules, gameplay-screen token needs     |
| **Does not own** | Canonical raw values in [Design_Tokens.md](../02_Design_System/Design_Tokens.md) |




### UI_05 — Component Library


| Field            | Value                                                                                                    |
| ---------------- | -------------------------------------------------------------------------------------------------------- |
| **Purpose**      | Canonical reusable UI component architecture                                                             |
| **Owns**         | Component classification, responsibilities, composition, state model, lifecycle, gameplay-screen mapping |
| **Does not own** | Flutter widget classes, engine logic, gameplay rules                                                     |




### UI_06 — Animation System


| Field            | Value                                                                                    |
| ---------------- | ---------------------------------------------------------------------------------------- |
| **Purpose**      | Motion philosophy and behavioral animation architecture                                  |
| **Owns**         | Motion hierarchy, transition behavior, feedback motion, accessibility posture for motion |
| **Does not own** | Milliseconds, easing curves, Flutter animation APIs                                      |




### UI_07 — Responsive Guidelines


| Field            | Value                                                                                              |
| ---------------- | -------------------------------------------------------------------------------------------------- |
| **Purpose**      | Responsive behavior architecture across device contexts                                            |
| **Owns**         | Adaptation philosophy, layout/component/HUD scaling rules, safe-area posture, orientation behavior |
| **Does not own** | Pixel breakpoints, Flutter layout code                                                             |




### UI_08 — Asset Integration


| Field            | Value                                                                                                                   |
| ---------------- | ----------------------------------------------------------------------------------------------------------------------- |
| **Purpose**      | How approved visual assets integrate into UI architecture                                                               |
| **Owns**         | AB2/AB3 usage boundaries, icon/illustration/background integration, layering and loading behavior at architecture level |
| **Does not own** | Asset production rules, engine loading implementation, compression systems                                              |


---



## 10. Reading Order


| If you need to…                        | Read…                                                                                                                                     |
| -------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| Orient within the UI chapter           | **This document** ([UI.md](UI.md)) → [07_UI README](README.md)                                                                            |
| Understand UI decision principles      | [UI_00_Design_Principles.md](UI_00_Design_Principles.md)                                                                                  |
| Understand player-facing UI philosophy | [UI_01_UI_Philosophy.md](UI_01_UI_Philosophy.md)                                                                                          |
| Understand spatial layout and zoning   | [UI_02_Layout_System.md](UI_02_Layout_System.md)                                                                                          |
| Understand the gameplay screen         | [UI_03_Gameplay_Screen_Specification.md](UI_03_Gameplay_Screen_Specification.md)                                                          |
| Understand semantic tokens             | [UI_04_Design_Tokens.md](UI_04_Design_Tokens.md) + [Design_Tokens.md](../02_Design_System/Design_Tokens.md)                               |
| Understand reusable components         | [UI_05_Component_Library.md](UI_05_Component_Library.md)                                                                                  |
| Understand motion                      | [UI_06_Animation_System.md](UI_06_Animation_System.md)                                                                                    |
| Understand responsiveness              | [UI_07_Responsive_Guidelines.md](UI_07_Responsive_Guidelines.md)                                                                          |
| Understand assets in UI                | [UI_08_Asset_Integration.md](UI_08_Asset_Integration.md) + [Asset_Bible.md](../06_Asset_Bible/Asset_Bible.md)                             |
| Understand visual language upstream    | [LLDL.md](../02_Design_System/LLDL/LLDL.md)                                                                                               |
| Understand gameplay boundaries for UI  | [Gameplay.md](../01_Game_Design/Gameplay/Gameplay.md) · [GP6](../01_Game_Design/Gameplay/GP6_Gameplay_Feedback.md)                        |
| Plan M2 implementation order           | [§13 Implementation Flow](#13-implementation-flow) · [Technical_Implementation_Plan.md](../04_Technical/Technical_Implementation_Plan.md) |




### Recommended first-time read sequence

```text
UI.md
    ↓
UI_00 → UI_01 → UI_02
    ↓
UI_03 (gameplay screen — anchor document)
    ↓
UI_04 → UI_05
    ↓
UI_06 + UI_07 + UI_08 (behavior layer — read as a set)
```

---



## 11. Authority Matrix


| Question                                           | Authority                                                                                         |
| -------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| Product intent, pillars, non-goals                 | [Vision.md](../00_Project/Vision.md)                                                              |
| Gameplay rules and precedence                      | [Gameplay.md](../01_Game_Design/Gameplay/Gameplay.md) · GP1–GP7                                   |
| Gameplay feedback semantics                        | [GP6_Gameplay_Feedback.md](../01_Game_Design/Gameplay/GP6_Gameplay_Feedback.md)                   |
| Visual language and design architecture            | [LLDL.md](../02_Design_System/LLDL/LLDL.md)                                                       |
| Canonical color/spacing/type values                | [Design_Tokens.md](../02_Design_System/Design_Tokens.md)                                          |
| Legacy component reference                         | [Components.md](../02_Design_System/Components.md) — extend/partition with UI_05; do not override |
| Art style and asset production                     | [Asset_Bible.md](../06_Asset_Bible/Asset_Bible.md)                                                |
| Engine behaviour and session API                   | [Engine_Architecture.md](../04_Technical/Engine_Architecture.md)                                  |
| UI principles                                      | [UI_00_Design_Principles.md](UI_00_Design_Principles.md)                                          |
| UI philosophy and attention model                  | [UI_01_UI_Philosophy.md](UI_01_UI_Philosophy.md)                                                  |
| Layout and zoning                                  | [UI_02_Layout_System.md](UI_02_Layout_System.md)                                                  |
| Gameplay screen behavior                           | [UI_03_Gameplay_Screen_Specification.md](UI_03_Gameplay_Screen_Specification.md)                  |
| Semantic token application                         | [UI_04_Design_Tokens.md](UI_04_Design_Tokens.md)                                                  |
| Component ownership                                | [UI_05_Component_Library.md](UI_05_Component_Library.md)                                          |
| Motion                                             | [UI_06_Animation_System.md](UI_06_Animation_System.md)                                            |
| Responsive adaptation                              | [UI_07_Responsive_Guidelines.md](UI_07_Responsive_Guidelines.md)                                  |
| UI asset integration                               | [UI_08_Asset_Integration.md](UI_08_Asset_Integration.md)                                          |
| UI chapter integration and M2 entry                | **This document**                                                                                 |
| Build order and vertical slice scope               | [Technical_Implementation_Plan.md](../04_Technical/Technical_Implementation_Plan.md)              |
| Flutter folder structure and engineering contracts | [Architecture.md](../04_Technical/Architecture.md) · `docs/04_Technical/*`                        |


---



## 12. Document Relationships



### How the layers work together

```text
Vision
    defines product intent and premium identity
        ↓
Gameplay
    defines planning, execution, feedback boundaries
        ↓
Engine Architecture
    exposes deterministic session state to presentation
        ↓
LLDL + Design_Tokens
    define visual language and canonical values
        ↓
Asset Bible
    governs how assets are produced and maintained
        ↓
UI_00–UI_08
    apply upstream authority to UI architecture
        ↓
UI.md
    integrates the chapter for M2 consumption
        ↓
Flutter Implementation
    renders state, applies tokens/components/motion/responsive/assets
```



### Relationship rules


| Pair                      | Relationship                                                                                |
| ------------------------- | ------------------------------------------------------------------------------------------- |
| **Vision ↔ UI**           | UI expresses Vision through ancient-temple premium craft; UI cannot redefine product intent |
| **Gameplay ↔ UI**         | UI communicates gameplay state; GP6 defines feedback meaning; UI_03/UI_05/UI_06 present it  |
| **LLDL ↔ UI**             | LLDL owns design language; UI_00–UI_08 apply it to architecture without parallel doctrine   |
| **Design_Tokens ↔ UI_04** | Canonical values upstream; UI_04 owns semantic application and governance                   |
| **Asset Bible ↔ UI_08**   | Asset Bible owns production; UI_08 owns in-interface integration and AB2/AB3 boundaries     |
| **Engine ↔ UI**           | Engine owns rules and state; widgets render and forward input only                          |
| **03_Screens ↔ UI_03**    | UI_03 is gameplay-screen authority; legacy screen docs are transitional references          |
| **Implementation ↔ UI**   | Code realizes architecture; gaps escalate to architecture review — not silent invention     |


---



## 13. Implementation Flow



### How M2 should consume the UI architecture

M2 UI work should begin at this integration document, then descend into the authoritative specs in implementation order — not document-number order alone.

```text
UI.md (orient + confirm readiness)
    ↓
UI_03 Gameplay Screen Specification (anchor screen)
    ↓
UI_05 Component Library (reusable building blocks)
    ↓
UI_04 Design Tokens (semantic styling)
    ↓
UI_06 Animation System (motion behavior)
    ↓
UI_07 Responsive Guidelines (device adaptation)
    ↓
UI_08 Asset Integration (approved asset use)
    ↓
Flutter implementation (lib/design_system/, lib/features/)
```



### Supporting reads during implementation


| Phase                 | Also consult                                                                                                                  |
| --------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| Before any UI code    | [UI_00](UI_00_Design_Principles.md) · [UI_01](UI_01_UI_Philosophy.md) · [UI_02](UI_02_Layout_System.md)                       |
| Gameplay screen build | [Engine_Architecture.md](../04_Technical/Engine_Architecture.md) · [GP6](../01_Game_Design/Gameplay/GP6_Gameplay_Feedback.md) |
| Token implementation  | [Design_Tokens.md](../02_Design_System/Design_Tokens.md) · [LLDL.md](../02_Design_System/LLDL/LLDL.md)                        |
| Asset binding         | [Asset_Bible.md](../06_Asset_Bible/Asset_Bible.md)                                                                            |
| Slice sequencing      | [Technical_Implementation_Plan.md](../04_Technical/Technical_Implementation_Plan.md)                                          |




### Implementation rules (summary)

- Read `UI.md` first for orientation
- Implement gameplay screen before peripheral meta screens unless the vertical slice plan explicitly sequences otherwise
- Build shared components in `lib/design_system/` — not ad hoc feature widgets
- Map semantic tokens from UI_04 to canonical values from Design_Tokens.md
- Apply motion and responsive rules as behavioral constraints — not per-screen invention
- Integrate only approved assets per UI_08 and Asset Bible boundaries

---



## 14. Governance



### Core rule

**Implementation must never redefine architecture.**

If implementation discovers a gap, missing rule, or contradiction:

```text
Architecture
    ↓
Review Package (docs/99_Reviews/)
    ↓
ChatGPT review + Human approval (docs/07_UI/ family)
    ↓
Approved documentation update
    ↓
Implementation
```



### Change categories


| Change type                                                                  | Required action                                                                               |
| ---------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| New UI pattern, layout rule, component, motion rule, or interaction behavior | Update the owning `UI_00`–`UI_08` document **before** code                                    |
| Material change to approved UI architecture                                  | Review package + ChatGPT review + Human approval                                              |
| Implementation detail (widget name, file path)                               | Technical docs / code — must not alter architectural intent                                   |
| Conflict with upstream authority                                             | Preserve higher document; record in review package or [Decisions](../00_Project/Decisions.md) |
| Product or gameplay change affecting UI                                      | Update upstream authority first; then cascade to UI docs                                      |




### Cursor / AI agent rule

When an approved UI document exists for a topic, **do not invent UI architecture during implementation**. Escalate gaps through the governance flow above.

---



## 15. M2 Readiness Checklist


| Prerequisite                            | Status | Authority                                                                                   |
| --------------------------------------- | ------ | ------------------------------------------------------------------------------------------- |
| Vision approved                         | ☑      | [Vision.md](../00_Project/Vision.md) v2.1.0 — Approved — Locked                             |
| Gameplay approved                       | ☑      | [Gameplay.md](../01_Game_Design/Gameplay/Gameplay.md) v2.1.0 — Approved                     |
| Engine approved                         | ☑      | [Engine_Architecture.md](../04_Technical/Engine_Architecture.md) v1.0.1 — Approved & Locked |
| LLDL approved                           | ☑      | [LLDL.md](../02_Design_System/LLDL/LLDL.md) v2.0.0 — Approved — Locked                      |
| Asset Bible approved                    | ☑      | [Asset_Bible.md](../06_Asset_Bible/Asset_Bible.md)                                          |
| UI_00–UI_08 approved                    | ☑      | See [07_UI README](README.md) document list                                                 |
| UI chapter integration (`UI.md`)        | ☑      | This document — M1.9                                                                        |
| Review packages complete for UI stack   | ☑      | `docs/99_Reviews/Architecture/0054`–`0059`, `0061`                                          |
| Architecture consistent across chapters | ☑      | Verified at integration authorship                                                          |
| **Ready for M2 UI implementation**      | **☑**  | Pending Human lock of this integration document                                             |




### Known transitional items (non-blocking for M2 UI start)


| Item                                  | Notes                                                                          |
| ------------------------------------- | ------------------------------------------------------------------------------ |
| `docs/03_Screens/*`                   | Applied references; gameplay screen defers to UI_03                            |
| `docs/02_Design_System/Components.md` | Legacy reference; UI_05 is architectural component authority                   |
| Prototype `lib/` code                 | Not authoritative per [Prototype_Status.md](../00_Project/Prototype_Status.md) |
| UI_00 metadata formatting             | Older header format; content treated as approved in chapter context            |


---



## 16. Implementation Contract

M2 UI implementation is expected to **implement the approved UI architecture without changing architectural intent**.

### Implementers agree to

1. Treat `UI_00`–`UI_08` as locked behavioral authority unless formally revised
2. Use `UI.md` as the chapter entry point — not as a substitute for detailed specs
3. Keep gameplay logic in `lib/game_engine/` per [Engine_Architecture.md](../04_Technical/Engine_Architecture.md)
4. Build reusable UI in `lib/design_system/` per UI_05 — not ad hoc duplication in features
5. Apply LLDL and canonical tokens — not hardcoded styling
6. Present GP6 feedback through governed components and motion — not invented feedback systems
7. Escalate gaps through architecture review — not silent workaround in code
8. Follow [Technical_Implementation_Plan.md](../04_Technical/Technical_Implementation_Plan.md) slice order and review gates



### Success criterion

The first vertical-slice gameplay UI should be recognizable as the approved architecture: gameplay-dominant layout, calm premium motion, governed components, semantic tokens, and asset integration consistent with `docs/07_UI/` — without requiring architectural reinterpretation during build.

---



## 17. Review Workflow

UI chapter documents follow the repository compiler workflow defined in [docs/README.md](../README.md) and [AGENTS.md](../../AGENTS.md).


| Stage                   | UI chapter expectation                                                               |
| ----------------------- | ------------------------------------------------------------------------------------ |
| **Authorship**          | ChatGPT specification → Cursor compile into `docs/07_UI/`                            |
| **Engineering review**  | Codex optional for `docs/07_UI/` family unless explicitly requested                  |
| **Product / UX review** | ChatGPT review required                                                              |
| **Human approval**      | Required before lock                                                                 |
| **Review package**      | Required for major `docs/07_UI/` milestones in [99_Reviews](../99_Reviews/README.md) |
| **Lock**                | Approved documents govern implementation until formally revised                      |




### This document's review package

- [0061_ui_chapter_integration.md](../99_Reviews/Architecture/0061_ui_chapter_integration.md)



### Prior UI architecture review packages


| Review ID | Topic                                           |
| --------- | ----------------------------------------------- |
| 0054      | UI_01 UI Philosophy                             |
| 0055      | UI_02 Layout System                             |
| 0056      | UI_03 Gameplay Screen Specification             |
| 0057      | UI_04 Design Tokens                             |
| 0058      | UI_05 Component Library                         |
| 0059      | UI_06–UI_08 Behavior Layer                      |
| 0060      | Docs hygiene — UI architecture status alignment |
| 0061      | UI chapter integration (M1.9)                   |


---



## 18. What UI.md Must Not Do


| Prohibited                         | Reason                                    |
| ---------------------------------- | ----------------------------------------- |
| Redefine layout zones              | Owned by UI_02                            |
| Redefine gameplay screen behavior  | Owned by UI_03                            |
| Redefine token semantics or values | Owned by UI_04 + Design_Tokens.md         |
| Redefine component contracts       | Owned by UI_05                            |
| Redefine motion behavior           | Owned by UI_06                            |
| Redefine responsive rules          | Owned by UI_07                            |
| Redefine asset integration         | Owned by UI_08                            |
| Redefine gameplay rules            | Owned by Gameplay + GP1–GP7               |
| Redefine visual language           | Owned by LLDL                             |
| Specify Flutter implementation     | Owned by technical docs + code            |
| Silently resolve conflicts         | Must preserve higher authority and report |


---



## 19. Cross References



### Product and gameplay

- [Vision.md](../00_Project/Vision.md)
- [Game_Loop.md](../01_Game_Design/Game_Loop/Game_Loop.md)
- [Gameplay.md](../01_Game_Design/Gameplay/Gameplay.md)



### Design and assets

- [LLDL.md](../02_Design_System/LLDL/LLDL.md)
- [Design_Tokens.md](../02_Design_System/Design_Tokens.md)
- [Asset_Bible.md](../06_Asset_Bible/Asset_Bible.md)



### UI chapter

- [07_UI README](README.md)
- [UI_00](UI_00_Design_Principles.md) · [UI_01](UI_01_UI_Philosophy.md) · [UI_02](UI_02_Layout_System.md) · [UI_03](UI_03_Gameplay_Screen_Specification.md) · [UI_04](UI_04_Design_Tokens.md) · [UI_05](UI_05_Component_Library.md) · [UI_06](UI_06_Animation_System.md) · [UI_07](UI_07_Responsive_Guidelines.md) · [UI_08](UI_08_Asset_Integration.md)



### Engineering and governance

- [Engine_Architecture.md](../04_Technical/Engine_Architecture.md)
- [Technical_Implementation_Plan.md](../04_Technical/Technical_Implementation_Plan.md)
- [AGENTS.md](../../AGENTS.md)
- [Decisions.md](../00_Project/Decisions.md)
- [99_Reviews README](../99_Reviews/README.md)

---



## 20. Approval Status

**Status: Approved — Pending Human Lock**

`UI.md` is the **approved UI chapter integration document** for M1.9 — Architecture Integration & Readiness. It remains locked unless an upstream `UI_00`–`UI_08` document materially changes or Human Owner approval authorizes a revision.


| Ready for                | Status                                                              |
| ------------------------ | ------------------------------------------------------------------- |
| Codex engineering review | ☐ Optional — not required for `docs/07_UI/` family unless requested |
| ChatGPT product review   | Appoved and Locked                                                  |
| Human approval           | Appoved and Locked                                                  |


---



## Navigation


| ← Previous                                               | Next →                                                                            | Index                                                 |
| -------------------------------------------------------- | --------------------------------------------------------------------------------- | ----------------------------------------------------- |
| [UI_08_Asset_Integration.md](UI_08_Asset_Integration.md) | [Technical Implementation Plan](../04_Technical/Technical_Implementation_Plan.md) | [07_UI README](README.md) · [LLDS Home](../README.md) |


