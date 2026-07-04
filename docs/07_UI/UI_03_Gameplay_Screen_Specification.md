# UI 03 - Gameplay Screen Specification

| Field | Value |
|-------|-------|
| **Document ID** | LLDS-DOC-07-UI-003 |
| **Version** | 1.0.0 |
| **Status** | Approved |
| **Owner** | Apoorv |
| **Last Updated** | 2026-07-04 |
| **Domain** | UI Architecture |
| **Related Milestone** | M1.8 - UI Architecture & Design System |
| **Canonical Path** | `docs/07_UI/UI_03_Gameplay_Screen_Specification.md` |
| **Related Documents** | `docs/07_UI/UI_00_Design_Principles.md` · `docs/07_UI/UI_01_UI_Philosophy.md` · `docs/07_UI/UI_02_Layout_System.md` · `docs/07_UI/README.md` |

## Purpose

This document defines the **architectural blueprint** for the primary gameplay screen of Labyrinth Legends.

It explains how the gameplay screen behaves as a player-facing system: what responsibilities it owns, how information is prioritized, how the labyrinth is presented, how interaction phases unfold, how contextual UI appears and recedes, and how overlays, feedback, and accessibility should behave.

This document is the single authoritative gameplay-screen specification from which later UI documents and implementation decisions should derive.

It does **not** define Flutter implementation, widget APIs, exact measurements, colors, typography, animation timings, or reusable component specifications.

## Scope

### In Scope

- Gameplay screen responsibilities
- Gameplay screen structure and lifecycle
- Information hierarchy on the gameplay screen
- Gameplay board presentation
- Explorer presentation
- Objective and resource presentation behavior
- Contextual UI, HUD composition, overlays, and modal behavior
- Transient feedback expectations
- Accessibility expectations at the screen-architecture level
- Review criteria for future gameplay-screen work

### Out of Scope

- Gameplay rules, path legality, or outcome resolution logic
- Reusable component specifications
- Design token definitions
- Animation timing values
- Responsive breakpoint definitions
- Flutter implementation details
- Widget structure or APIs
- Exact measurements

## Intended Audience

- Designers authoring future gameplay-screen updates
- Authors of downstream UI token, component, animation, and responsive documents
- Reviewers validating whether gameplay-screen proposals preserve Labyrinth Legends identity
- AI agents extending gameplay-screen documentation without inventing parallel screen behavior
- Implementers translating approved architecture into code later

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
- `docs/07_UI/UI_02_Layout_System.md`
- Existing applied gameplay-screen reference in `docs/03_Screens/Gameplay.md`

### Assumptions

- `docs/07_UI/` is the authoritative area for UI architecture and implementation-facing UI specifications
- `docs/03_Screens/Gameplay.md` remains an applied reference until this `07_UI` screen specification is approved and later downstream docs formally supersede it where appropriate
- Gameplay mechanics remain owned by gameplay documentation; this document specifies presentation behavior only

## Downstream Documents

- `docs/07_UI/UI_04_Design_Tokens.md`
- `docs/07_UI/UI_05_Component_Library.md`
- `docs/07_UI/UI_06_Animation_System.md`
- `docs/07_UI/UI_07_Responsive_Guidelines.md`
- `docs/07_UI/UI_08_Asset_Integration.md`
- Future gameplay-screen implementation work in downstream technical and code layers

## Related Documents

- `docs/07_UI/UI_00_Design_Principles.md`
- `docs/07_UI/UI_01_UI_Philosophy.md`
- `docs/07_UI/UI_02_Layout_System.md`
- `docs/07_UI/README.md`
- `docs/03_Screens/Gameplay.md`
- `docs/03_Screens/Pause.md`
- `docs/03_Screens/Victory.md`
- `docs/01_Game_Design/Gameplay/Gameplay.md`
- `docs/02_Design_System/LLDL/LLDL.md`
- `docs/06_Asset_Bible/Asset_Bible.md`

## Authority

### Governs

- The architectural behavior of the primary gameplay screen
- What information the gameplay screen owns and when it should appear
- How the gameplay board, explorer, objectives, resources, and actions are presented
- How gameplay-screen states transition visually and structurally
- What future tokens, components, motion, and asset work must support on this screen

### Does Not Govern

- Design architecture owned by `docs/02_Design_System/LLDL/LLDL.md`
- High-level UI principles owned by `docs/07_UI/UI_00_Design_Principles.md`
- UI experience philosophy owned by `docs/07_UI/UI_01_UI_Philosophy.md`
- Layout-system rules owned by `docs/07_UI/UI_02_Layout_System.md`
- Gameplay rules and resolution order owned by `docs/01_Game_Design/Gameplay/Gameplay.md` and GP specifications
- Reusable component internals, token values, or implementation APIs

### Conflict Resolution

`docs/02_Design_System/LLDL/LLDL.md` remains the authoritative design architecture reference. `docs/07_UI/UI_00_Design_Principles.md`, `docs/07_UI/UI_01_UI_Philosophy.md`, and `docs/07_UI/UI_02_Layout_System.md` remain higher-authority UI architecture documents for principles, philosophy, and layout structure.

This document sits downstream of those authorities and translates them into the **screen-specific behavioral architecture** of gameplay.

If a conflict exists, follow the hierarchy defined in `AGENTS.md`, `docs/README.md`, and `docs/07_UI/README.md`. Preserve the higher-authority document and report the conflict rather than silently reinterpreting intent.

## Architectural Position

This document translates the UI architecture stack in the following order:

```text
UI Principles
    ↓
UI Philosophy
    ↓
Layout System
    ↓
Gameplay Screen
    ↓
Design Tokens
    ↓
Component Library
    ↓
Implementation
```

| Layer | Role |
|-------|------|
| **UI Principles** | Establish non-negotiable guidance for all UI decisions |
| **UI Philosophy** | Define how the interface should feel and direct attention |
| **Layout System** | Define how screen space and zones are structured |
| **Gameplay Screen** | Define how the flagship gameplay surface behaves |
| **Design Tokens** | Later define implementation-facing semantic material rules |
| **Component Library** | Later define reusable building blocks that serve this screen |
| **Implementation** | Later translate approved architecture into code |

This document is the bridge between generalized UI architecture and future screen-specific implementation detail.

## Visual References

Direct gameplay-screen reference files for this document are:

- `docs/07_UI/references/Gameplay_Screen_Master_Mockup.md`
- `docs/07_UI/references/Gameplay_Art_Direction_Pitches.md`

These reference files point to the currently available gameplay visual sources and explain how they should be read architecturally.

The visual references illustrate **intent**, atmosphere, density, emphasis, and board-to-chrome relationship.

Mockups illustrate **intent**. Architecture defines **behavior**.

They do **not** override this architecture document.

When mockup interpretation and architecture diverge:

- architecture defines behavior
- mockups illustrate presentation intent
- this document takes precedence for gameplay-screen structure and behavior

## Gameplay Screen Responsibilities

The gameplay screen is responsible for:

- presenting the labyrinth as the dominant active surface
- presenting the explorer as the visible executor of the player's committed path
- supporting observation, planning, confirmation, execution, and consequence understanding
- surfacing objectives and relevant contextual information without becoming a dashboard
- exposing primary and secondary actions appropriate to the current gameplay state
- presenting transient feedback without collapsing the player's focus
- transitioning cleanly into pause, victory, failure, and related modal states

The gameplay screen is **not** responsible for:

- deciding gameplay outcomes
- validating game rules independently of the engine/gameplay authorities
- acting as a dense meta-game container during active puzzle play

## Gameplay Screen Lifecycle

The gameplay screen lifecycle is:

```text
Screen Opens
    ↓
World Settles
    ↓
HUD Appears
    ↓
Objective Becomes Visible
    ↓
Observation
    ↓
Path Planning
    ↓
Confirmation
    ↓
Execution
    ↓
Feedback
    ↓
Idle / Repeat
```

### Lifecycle expectations

- **Screen Opens:** transition into the chamber with world context preserved
- **World Settles:** allow the player to orient before dense guidance appears
- **HUD Appears:** only the minimum structural UI should establish itself
- **Objective Becomes Visible:** the player understands what matters now
- **Observation:** the board is dominant and the player reads the space
- **Path Planning:** interactive support appears for planning and editing
- **Confirmation:** commitment becomes explicit and clear
- **Execution:** the screen recedes structurally so consequence can be observed
- **Feedback:** results, progress, warnings, and consequences become readable
- **Idle / Repeat:** the player returns to a stable, comprehensible state for the next decision

The lifecycle should reinforce the core gameplay loop of **study -> plan -> commit -> witness consequence**.

## Player Attention Model

This screen applies the attention hierarchy defined in `docs/07_UI/UI_01_UI_Philosophy.md`.

Attention priority remains:

1. world / labyrinth
2. puzzle state
3. explorer
4. objective
5. current path / action
6. primary action
7. secondary HUD
8. meta information

For the gameplay screen, this means:

- the board must dominate the visual field
- the explorer must remain readable as the active agent on the board
- objectives must be understandable without becoming the main visual event
- path state must be visible when planning or executing
- controls must support the moment rather than define it
- meta information must recede until it becomes relevant

If the player is looking first at chrome instead of the chamber, the screen is structurally misaligned.

## Information Hierarchy

Gameplay-screen information should be divided into four categories:

### Always Visible

Only information required for continuous orientation or current gameplay understanding should remain persistently visible.

Typical examples:

- the board
- the explorer
- essential objective framing
- the current primary action when action is expected

### Contextual

Information that appears when the current phase, level requirement, or player action makes it relevant.

Typical examples:

- path validation feedback
- collectible counters when the level requires them
- key or resource indicators when their state matters
- contextual support actions

### Transient

Information that appears briefly to explain consequence, progress, warning, or confirmation.

Typical examples:

- success/failure feedback
- brief warnings
- completion acknowledgment
- temporary prompts

### Hidden / Deferred

Information that should not occupy gameplay space unless explicitly needed.

Typical examples:

- deep meta information
- verbose explanation
- secondary progression details
- menu-level utilities

The gameplay screen should never expose all possible information simply because it exists.

## Spatial Layout

This document inherits the zoning and gameplay-dominance rules from `docs/07_UI/UI_02_Layout_System.md`.

For the gameplay screen specifically:

- the central world / board zone remains dominant
- the top context zone should stay low-density and purpose-specific
- the bottom primary action zone should own commitment and related core action behavior
- peripheral zones should carry only secondary, contextual, or temporary support
- overlays and modals should be exceptions, not the default screen mode

This section applies the layout system to gameplay; it does not redefine the underlying layout architecture.

## Gameplay Board

The gameplay board is the **primary stage** of the screen.

Its presentation should:

- preserve clear read of traversable space, hazards, exits, interactables, and current path state
- remain dominant over HUD and support surfaces
- avoid being visually segmented into unrelated UI regions
- support observation first and interaction second

The board should feel like a **place**, not like a panel embedded inside a dashboard.

During planning:

- the board should support reading and route drawing clearly

During execution:

- the board should remain visually dominant while support chrome recedes

During consequence moments:

- the board should still remain contextually present even if overlays briefly appear

## Explorer Presentation

The explorer should be presented as:

- the visible executor of player intent
- subordinate to the board, but never lost within it
- readable during both stillness and movement
- clearly related to the current route, objective, and consequence state

The explorer should visually reinforce the core game contract:

- the player plans
- the explorer carries out the committed plan

The explorer should not feel like a separate controller focus or a UI element layered over the board.

## Path Visualization

Path visualization must support every major gameplay phase:

### Planning

- the route is readable while being authored
- editing remains understandable and reversible
- the player can distinguish intended route from board background

### Preview

- the route can communicate validity, risk, or consequence relevance without solving the puzzle

### Confirmation

- the path shifts from tentative to committed
- commitment should feel unmistakable

### Execution

- the active path remains comprehensible as the explorer follows it
- execution should clarify consequence rather than create clutter

### Completion

- path state should settle cleanly once execution ends
- residual path emphasis should not compete with result understanding

### Cancellation

- if planning is undone, reset, or interrupted before commitment, the path should leave the screen cleanly and unambiguously

Path visualization is a gameplay communication system, not ornamental linework.

## Objective Presentation

Objectives should:

- be understandable early
- remain available without dominating gameplay space
- update clearly when player progress changes
- become more visible when objective state is decision-critical

Objective presentation should support three needs:

1. understand the goal
2. understand current progress
3. understand completion or failure implication

Completion acknowledgment may feel more ceremonial than normal gameplay HUD, but should still preserve clarity and pacing.

Objectives should not become permanent instructional text blocks.

## Resource Presentation

Gameplay-screen resources may include:

- coins
- lives
- stars
- collectibles
- energy
- progress indicators

Architecturally, resource presentation should follow these rules:

- only resources relevant to active gameplay should appear on this screen
- show only what is relevant to the current level or mode
- keep persistent resource presence minimal during active puzzle solving
- avoid turning the gameplay screen into a progression dashboard
- use contextual visibility when fairness or player expectation requires it

Economy-wide and meta-game resource rules belong elsewhere. Resource presentation here should support the chamber experience rather than redirect the player into meta-game thinking.

## Primary Actions

The gameplay screen must support the behavioral presence of primary actions such as:

- Draw
- Confirm
- Undo
- Pause
- Retry
- Continue

Primary actions should:

- appear only when structurally appropriate to the current state
- remain easy to identify
- avoid competing equally with multiple other strong actions
- follow the bottom-zone action logic inherited from `docs/07_UI/UI_02_Layout_System.md`

Behavioral responsibility matters more than control count. The gameplay screen should expose the **right** primary action for the current phase, not every possible action at once.

## Secondary Actions

Secondary actions may include:

- Settings
- Hints
- Inventory
- Contextual interactions

Secondary actions should:

- remain visually and structurally subordinate to the current primary action
- live in contextual or peripheral zones
- become available when useful, but not continuously compete for attention
- avoid breaking the player's observation/planning rhythm

A secondary action is allowed to be available. It is not allowed to become the focal structure of active gameplay unless the state explicitly requires it.

## Input Ownership

The gameplay screen may collect player intent, preview path state, and expose confirm, cancel, undo, pause, retry, and continuation actions.

It must **not** independently determine:

- path legality
- objective completion
- rewards
- failure
- success
- any other gameplay outcome owned by gameplay or engine authorities

The screen owns presentation and player intent capture. Validation, consequence, and outcome ownership remain outside the screen architecture.

## Transient Feedback

Transient feedback may include:

- toasts
- success feedback
- failure feedback
- rewards
- warnings
- educational prompts

Transient feedback should:

- clarify the current consequence or status change
- remain brief
- avoid masking the board longer than necessary
- support learning without narrating every event
- preserve emotional tone: calm, clear, premium, and non-arcade

Feedback should explain, not overwhelm.

## Modal Behaviour

Modal interaction is acceptable when:

- the player must intentionally pause the chamber
- a major state change requires focused acknowledgment
- a failure or victory state requires a structured next choice
- settings or confirmation requires temporary context separation

Relevant modal categories include:

- Pause
- Victory
- Failure
- Confirmation
- Settings

Modal rules:

- do not interrupt active puzzle solving unnecessarily
- do not stack multiple modal demands
- preserve gameplay context where possible
- exit cleanly back to the proper gameplay or result state
- use modal dominance only when normal zoning cannot serve the need clearly

The gameplay screen should not rely on modal behavior to compensate for poor base information architecture.

## Accessibility Considerations

At the screen-architecture level, the gameplay screen should:

- preserve readable separation between board, actions, and support information
- avoid requiring constant scanning across too many competing zones
- support progressive disclosure instead of dense simultaneous information
- avoid depending on a single communication mode for critical understanding
- preserve stable structural anchors so state changes remain understandable
- ensure that pause, failure, and victory states become explicit and unmistakable

Accessibility here means that the gameplay screen remains understandable, navigable, and non-chaotic even before implementation details are defined.

## State Matrix

| Gameplay State | Primary Focus | Visible | Hidden | Disabled |
|----------------|---------------|---------|--------|----------|
| **Idle** | Board orientation | Board, explorer, core context | Transient feedback, heavy overlays | Actions not relevant to the current phase |
| **Invalid Path / Blocked Planning** | Path correction and clarity | Board, explorer, invalid-path feedback, corrective actions, relevant objective context | Execution-only and result-only UI | Confirm/commit actions until planning becomes valid |
| **Planning** | Route authoring | Board, explorer, current objective, path tools, primary planning action | Non-essential meta information | Actions that belong only to execution/result states |
| **Executing** | Consequence observation | Board, explorer, active path state, essential consequence feedback | Most planning HUD, non-essential support actions | Planning/editing controls |
| **Paused** | Temporary interruption | Pause modal/overlay, essential context | Most transient gameplay feedback, non-pause controls behind the modal layer | Active gameplay interaction until pause ends |
| **Victory** | Resolution and next-step choice | Victory modal/surface, outcome feedback, continuation choices | Planning controls, normal gameplay HUD | Active gameplay interaction |
| **Failure** | Failure understanding and recovery | Failure modal/surface, cause/result feedback, retry/exit choices | Planning controls, non-relevant support HUD | Active gameplay interaction |
| **Tutorial** | Learning the current gameplay expectation | Board, core objective framing, brief educational guidance, relevant action support | Non-essential progression/meta detail | Irrelevant advanced or conflicting actions |

## Screen Success Criteria

Future reviewers should be able to ask:

- Does the gameplay screen clearly support the game loop of observe, plan, commit, execute, and reflect?
- Does the board remain the dominant screen element during active play?
- Does the explorer read as the executor of player intent rather than a disconnected decoration?
- Are objectives clear without becoming instructional clutter?
- Do actions appear in a state-appropriate way rather than all at once?
- Do resources remain contextual rather than dashboard-like?
- Does feedback clarify outcome without overwhelming the puzzle space?
- Are pause, victory, failure, and confirmation states structurally justified?
- Does the screen align with `docs/07_UI/UI_00_Design_Principles.md`, `docs/07_UI/UI_01_UI_Philosophy.md`, and `docs/07_UI/UI_02_Layout_System.md`?

If the answer to several of these questions is "no," the gameplay screen may still function, but it is not yet architecturally aligned with Labyrinth Legends.

## Anti-Patterns

The gameplay screen must avoid:

- covering gameplay unnecessarily
- competing HUD elements of equal priority
- permanent instructional text
- visual clutter that weakens puzzle reading
- decorative overlays that interrupt observation
- UI that interrupts puzzle solving for non-essential reasons
- excessive modal use
- banner-style UI layers
- persistent meta-game framing during active chamber play
- control-heavy layouts that make the screen feel like a dashboard
- reward treatment that becomes louder than the chamber itself

## Governance

This document governs **gameplay-screen behavior and structural architecture**, not final implementation detail.

Future UI documents should use this document to justify:

- gameplay-screen zoning decisions
- board, explorer, and path presentation logic
- when HUD elements should appear or recede
- when actions become primary or secondary
- when modal or transient feedback behavior is appropriate

Downstream documents such as tokens, components, animation, responsive guidelines, and asset integration should reference the relevant gameplay-screen sections whenever they define behavior that serves this screen.

### Change Rules

- Do not add downstream gameplay-screen specifications that contradict gameplay dominance or state clarity without first updating this document through review
- Do not define tokens, component internals, implementation APIs, or exact layout measurements here
- Do not use visual-reference convenience to override the architecture defined here
- Do not convert the gameplay screen into a dashboard-style surface through downstream additions

### Approval Conditions

- The document must remain aligned with `docs/07_UI/UI_00_Design_Principles.md`
- The document must remain aligned with `docs/07_UI/UI_01_UI_Philosophy.md`
- The document must remain aligned with `docs/07_UI/UI_02_Layout_System.md`
- The document must remain aligned with gameplay authority in `docs/01_Game_Design/Gameplay/Gameplay.md`
- Downstream UI documents should cite this document when defining gameplay-screen-specific behavior

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
| Draft v1 | 2026-07-04 | Cursor | Initial draft of the gameplay-screen architecture specification for M1.8 |
| 1.0.0 | 2026-07-04 | Apoorv / Cursor | Approved after minor refinements: direct `docs/07_UI/references/` links, milestone cleanup, active-gameplay resource clarification, input ownership, and blocked-planning state |
