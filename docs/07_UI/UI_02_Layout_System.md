# UI 02 - Layout System

| Field | Value |
|-------|-------|
| **Document ID** | LLDS-DOC-07-UI-002 |
| **Version** | 1.0.0 |
| **Status** | Approved |
| **Owner** | Apoorv |
| **Last Updated** | 2026-07-04 |
| **Domain** | UI Architecture |
| **Related Milestone** | M1.8.0 - UI Architecture & Design System |
| **Canonical Path** | `docs/07_UI/UI_02_Layout_System.md` |
| **Related Documents** | `docs/07_UI/UI_00_Design_Principles.md` · `docs/07_UI/UI_01_UI_Philosophy.md` · `docs/07_UI/README.md` · `docs/02_Design_System/LLDL/LLDL.md` |

## Purpose

This document defines the **spatial layout philosophy** and **structural layout rules** for Labyrinth Legends UI.

It explains how screen space should be organized, how gameplay remains visually dominant, how HUD zones behave, and how future screens should preserve hierarchy, clarity, and immersion.

This document exists so downstream UI specifications can answer a consistent question:

> **How should screen space be structured so the interface supports the labyrinth instead of competing with it?**

This document does **not** define exact pixel values, colors, typography, component internals, or platform-specific implementation.

## Scope

### In Scope

- Spatial layout philosophy for gameplay, meta-game, and utility surfaces
- Screen-space hierarchy and zone behavior
- Gameplay-dominance rules for labyrinth presentation
- Safe-area strategy at an architectural level
- Layout expectations for HUD, actions, information, overlays, and interruptions
- Review criteria for future screen and layout specifications

### Out of Scope

- Gameplay rules, execution logic, or puzzle resolution
- Exact spacing values, breakpoints, or dimensions
- Token values, color usage, or typography definitions
- Component APIs or widget structure
- Final per-screen compositions and production-ready mock layouts

## Intended Audience

- UI architecture authors in `docs/07_UI/`
- Designers writing future screen and HUD specifications
- Reviewers validating whether layout proposals preserve gameplay dominance
- AI agents extending UI documentation without inventing ungoverned layouts
- Contributors translating Labyrinth Legends philosophy into structured screen space

## Dependencies

### Upstream Dependencies

- `AGENTS.md`
- `docs/README.md`
- `docs/templates/Architecture_Document_Template.md`
- `docs/00_Project/Vision.md`
- `docs/01_Game_Design/Gameplay/Gameplay.md`
- `docs/02_Design_System/LLDL/LLDL.md`
- `docs/06_Asset_Bible/Asset_Bible.md`
- `docs/07_UI/README.md`
- `docs/07_UI/UI_00_Design_Principles.md`
- `docs/07_UI/UI_01_UI_Philosophy.md`
- Existing applied screen references in `docs/03_Screens/`

### Assumptions

- `docs/07_UI/` is the authoritative area for UI architecture and implementation-facing UI specifications
- `docs/03_Screens/` remains an existing applied screen-reference area until later UI documents supersede or absorb portions of it
- Layout rules should remain platform-independent and should describe structure, not implementation

## Downstream Documents

- `docs/07_UI/UI_03_Gameplay_Screen_Specification.md`
- `docs/07_UI/UI_04_Design_Tokens.md`
- `docs/07_UI/UI_05_Component_Library.md`
- `docs/07_UI/UI_06_Animation_System.md`
- `docs/07_UI/UI_07_Responsive_Guidelines.md`
- `docs/07_UI/UI_08_Asset_Integration.md`
- Future revisions to `docs/03_Screens/*` when those applied screen references are updated

## Related Documents

- `docs/07_UI/UI_00_Design_Principles.md`
- `docs/07_UI/UI_01_UI_Philosophy.md`
- `docs/07_UI/README.md`
- `docs/02_Design_System/LLDL/LLDL.md`
- `docs/01_Game_Design/Gameplay/Gameplay.md`
- `docs/06_Asset_Bible/Asset_Bible.md`
- `docs/03_Screens/Gameplay.md`
- `docs/03_Screens/Home.md`
- `docs/03_Screens/Victory.md`

## Authority

### Governs

- Spatial layout philosophy for the UI
- How screen space is prioritized and zoned
- How gameplay surfaces remain dominant
- Where primary, secondary, and informational layers conceptually belong
- How overlays and interruptions should behave in relation to the board and world

### Does Not Govern

- Design architecture authority already owned by `docs/02_Design_System/LLDL/LLDL.md`
- High-level UI principles in `docs/07_UI/UI_00_Design_Principles.md`
- Player-facing experience philosophy in `docs/07_UI/UI_01_UI_Philosophy.md`
- Token definitions and values
- Component internals or exact screen implementations
- Gameplay mechanics, objectives, hazards, or outcome logic

### Conflict Resolution

`docs/02_Design_System/LLDL/LLDL.md` remains the authoritative design architecture reference. `docs/07_UI/UI_00_Design_Principles.md` remains the authoritative UI principles reference. `docs/07_UI/UI_01_UI_Philosophy.md` remains the authoritative player-facing UI philosophy reference.

This document sits downstream of those documents and extends them into **spatial structure and layout behavior** for future UI specifications.

If a conflict exists, follow the hierarchy defined in `AGENTS.md`, `docs/README.md`, and `docs/07_UI/README.md`. Preserve the higher-authority document and report the conflict rather than silently reinterpreting intent.

## Layout Philosophy

Labyrinth Legends layout should feel:

- calm
- deliberate
- spacious
- world-supportive
- structurally clear
- premium rather than crowded

Layout is not just where things fit. Layout determines what the player believes matters.

The interface should **float around gameplay**, not box it in. Space should feel arranged in service of observation, planning, commitment, and reflection. If a layout makes the interface feel like the dominant object on the screen, it is misaligned.

Future layouts should prefer:

- fewer, clearer zones over many competing containers
- stable structural anchors over busy rearrangement
- visual breathing room over dense information packing
- support surfaces around the world rather than across it

## Screen Space Model

Labyrinth Legends screen space should be understood as a **zoned system**, not as a uniform canvas.

```text
Top Context Zone
    ↓
Central World / Board Zone
    ↓
Bottom Primary Action Zone

Peripheral Secondary Zones
    ↓
Temporary Overlay / Modal Layer
```

These are conceptual zones, not rigid platform templates. Future screens may adapt them, but should not violate their priority.

| Zone | Role |
|------|------|
| **Central World / Board Zone** | Primary stage for gameplay, world reading, and puzzle understanding |
| **Top Context Zone** | Contextual status, objective framing, or low-density orientation |
| **Bottom Primary Action Zone** | Primary commitment or progression action |
| **Peripheral Secondary Zones** | Supportive actions, utilities, secondary controls |
| **Temporary Overlay / Modal Layer** | Interruptions that must temporarily take priority |

The central zone is not one zone among equals. It is the dominant spatial truth during gameplay.

## Gameplay Dominance Rule

During active puzzle play, the labyrinth must remain the dominant spatial element on the screen.

This means:

- the board should receive the largest contiguous area
- HUD and chrome should retreat to the perimeter
- support information should compress or disappear before the world does
- execution-phase UI should become quieter, not denser
- interruption layers should be rare and justified

If layout trade-offs are required, the order of sacrifice is:

1. secondary information
2. secondary actions
3. persistent HUD density
4. decorative framing
5. only then the size or clarity of the board

The world is not the background behind the UI. The UI is the support system around the world.

## Safe Area Strategy

Safe areas should be treated as **structural boundaries**, not as excuses for layout clutter.

The safe-area strategy is:

- absorb device constraints into support zones first
- keep the central gameplay or world stage as uninterrupted as possible
- avoid letting cutouts, edge insets, or system-reserved regions fracture the main play space
- place secondary or contextual information in constrained edges before moving critical world content

When space becomes limited:

- reduce secondary density before shrinking the board
- collapse or hide non-essential support elements
- preserve clean reachability for primary actions
- keep the world legible even when outer zones compress

Safe-area handling should protect hierarchy, not merely preserve padding.

## HUD Zone Model

The HUD should behave as a **distributed, phase-aware support layer**, not as a permanent dashboard.

This means:

- HUD information should live in intentional zones
- each zone should have a specific role
- zones should appear, recede, or simplify according to current need
- layout should avoid building a full-time frame of bars around gameplay

HUD presence should be lightest when the player is studying or observing the board, and it should become more present only when fairness or state clarity requires it.

The HUD model should favor:

- brief contextual visibility
- low-density support bands
- stable action anchors
- minimal overlap with the board

## Primary Action Zone

The primary action zone should anchor near the **bottom of the screen**.

This is the preferred layout rule because the bottom zone best supports:

- commitment actions
- progression actions
- deliberate thumb-reachable interaction
- separation between active world reading and final action confirmation

The bottom primary action zone should:

- present the current main action clearly
- remain stable across related screen families
- avoid obscuring the board or splitting attention with equal-priority controls
- support one clear dominant action rather than several competing ones

If the player must choose what to do next, the answer should usually be structurally visible in the bottom action zone rather than hidden in peripheral chrome.

## Secondary Action Zones

Secondary actions should live in **peripheral zones** rather than competing with the primary action zone.

Typical secondary zones include:

- top-edge contextual utility
- top-corner navigation or pause utility
- side-adjacent support actions when space and clarity allow
- bottom-adjacent low-emphasis support actions that do not challenge the primary action

Secondary zones should:

- remain visually quieter than the primary action zone
- carry lower density than dashboard-style interfaces
- avoid surrounding the board with equal-strength buttons
- stay support-oriented rather than demand-oriented

Utility controls are allowed. Utility dominance is not.

## Information Zones

Information should occupy different zones according to urgency and purpose.

| Information type | Preferred behavior |
|------------------|--------------------|
| **Immediate decision-critical information** | Closest to the active task without covering it |
| **Contextual session information** | Top or peripheral context zones |
| **Temporary validation or consequence feedback** | Brief, phase-aware status or inline support zones |
| **Meta information** | Peripheral or deferred surfaces |

Information zones should follow three rules:

1. Do not compete with the board unless the information directly serves the current decision
2. Do not stay persistent once their decision window has closed
3. Do not occupy premium space just because the data exists

This keeps layout aligned with `docs/07_UI/UI_01_UI_Philosophy.md`: information should support cognition, not continuously occupy it.

## Board / Labyrinth Presentation Rules

The labyrinth should be presented as the **central stage** of gameplay.

Future gameplay layouts should preserve:

- the largest continuous readable region for the board
- clean visual separation between world space and UI support zones
- enough surrounding air that the board does not feel caged by chrome
- a clear reading path for puzzle state, explorer state, path state, and objectives

Board presentation must avoid:

- boxing the labyrinth inside thick permanent HUD bands
- shrinking the board to accommodate non-essential status panels
- splitting the board into visually competing subregions
- covering puzzle-critical edges, corners, or routes unless interruption is strictly required

The player should feel that the interface has made room for the labyrinth, not that the labyrinth has been squeezed into leftover space.

## Overlay and Modal Rules

Overlays and modals should be treated as **exceptions**, not default layout behavior.

Use them when one of the following is true:

- the player must temporarily stop active interaction
- a consequence must be acknowledged before continuing
- a decision cannot be made clearly within the normal zone structure
- the interface must protect the player from ambiguous or destructive action

Overlay and modal rules:

- preserve world context whenever possible
- interrupt briefly and with a single clear purpose
- avoid stacking multiple layers of interruption
- avoid permanent dependence on overlays for basic comprehension
- return the player to the board or flow cleanly after the interruption ends

An overlay should feel like a necessary pause in the temple experience, not like a separate app screen taking over.

## Layout Anti-Patterns

Future layout specifications must avoid:

- framing the board with dense permanent chrome on all sides
- using the screen edges as storage for every available stat or control
- placing primary actions in structurally weak or inconsistent locations
- splitting attention between multiple equal-priority action zones
- reducing the board to accommodate low-value meta information
- covering the labyrinth with persistent banners, ribbons, or reward panels
- using overlays as a substitute for good base layout
- making the screen feel like a dashboard rather than a place
- letting safe-area handling push critical layout structure into awkward positions
- designing layouts that feel generic, ad-driven, or utility-first

## Layout Success Criteria

Future reviewers should be able to ask:

- Does the board or world remain the dominant spatial element when gameplay is active?
- Do primary actions occupy a stable and structurally sensible zone?
- Do secondary actions remain supportive rather than competitive?
- Does information appear in the right zones for the right reasons?
- Does the layout preserve breathing room rather than collapsing into density?
- Are overlays rare, purposeful, and structurally justified?
- Does the interface feel arranged around the labyrinth rather than layered on top of it?
- Does the layout support calm planning and clear execution?
- Does the screen structure feel premium and intentional rather than generic and crowded?

If the answer to several of these questions is "no," the layout may still function, but it is not yet aligned with Labyrinth Legends.

## Governance

This document governs **layout philosophy and structural screen-space rules**, not final screen implementation.

Future UI documents should use this document to justify:

- how space is divided
- where actions live
- where information lives
- how much permanent HUD is allowed
- when overlays are structurally justified

Downstream UI specifications should reference the relevant layout sections whenever introducing significant changes to screen structure, HUD placement, modal behavior, or gameplay-space allocation.

### Change Rules

- Do not add downstream layouts that contradict gameplay dominance without first updating this document through review
- Do not convert support zones into persistent dashboard zones by convenience
- Do not use this document to define tokens, typography, component APIs, or implementation detail
- Do not treat layout freedom as permission to weaken the board-first hierarchy

### Approval Conditions

- The document must remain aligned with `docs/07_UI/UI_00_Design_Principles.md`
- The document must remain aligned with `docs/07_UI/UI_01_UI_Philosophy.md`
- The document must remain aligned with `docs/02_Design_System/LLDL/LLDL.md`
- The document must not introduce mechanics, component internals, or platform-specific implementation
- Downstream UI specifications should cite this document when making material layout decisions

## Review Workflow

1. Architecture Draft
2. Editorial Review
3. Architecture Review
4. Human Approval
5. Lock
6. Repository Publication

## Revision History

| Version | Date | Author | Notes |
|---------|------|--------|-------|
| Draft v1 | 2026-07-04 | Cursor | Initial draft of the layout-system architecture document for M1.8 |
| 1.0.0 | 2026-07-04 | Apoorv / ChatGPT | Approved after architecture review |
