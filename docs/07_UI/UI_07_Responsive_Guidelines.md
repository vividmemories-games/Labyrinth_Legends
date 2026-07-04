# UI 07 - Responsive Guidelines

| Field | Value |
|-------|-------|
| **Document ID** | LLDS-DOC-07-UI-007 |
| **Version** | 1.0.0 |
| **Status** | Approved |
| **Owner** | Apoorv |
| **Last Updated** | 2026-07-04 |
| **Domain** | UI Architecture |
| **Related Milestone** | M1.8 - UI Architecture & Design System |
| **Canonical Path** | `docs/07_UI/UI_07_Responsive_Guidelines.md` |
| **Related Documents** | `docs/07_UI/UI_00_Design_Principles.md` · `docs/07_UI/UI_01_UI_Philosophy.md` · `docs/07_UI/UI_02_Layout_System.md` · `docs/07_UI/UI_03_Gameplay_Screen_Specification.md` · `docs/07_UI/UI_04_Design_Tokens.md` · `docs/07_UI/UI_05_Component_Library.md` · `docs/07_UI/UI_06_Animation_System.md` |

## Purpose

This document defines the **responsive behavior architecture** for Labyrinth Legends UI across phones, large phones, tablets, and future devices.

It explains how layout, component presence, information density, and interaction structure should adapt across supported device contexts so that the interface remains readable, premium, and gameplay-centered without drifting into layout fragmentation or dashboard-like complexity.

This document exists so future UI work can answer a consistent question:

> **How should the interface adapt across device contexts while preserving the same gameplay hierarchy, calm tone, and component architecture?**

This document does **not** define pixel values, breakpoints, Flutter layout code, or implementation-specific responsive utilities.

## Scope

### In Scope

- Responsive philosophy across supported device contexts
- Scaling strategy for layout, component presence, and density
- Layout adaptation for phones, large phones, tablets, and future form factors
- HUD adaptation, safe-area handling, and orientation behavior
- Information-density rules and minimum usability expectations
- Review criteria for downstream responsive implementation

### Out of Scope

- Pixel breakpoints, dimensions, or device-specific code
- Flutter layouts, media-query logic, or platform APIs
- Redefining gameplay-screen behavior, component meaning, or token values
- Adding unsupported orientations or future device types as product commitments
- Engine or gameplay rule changes

## Intended Audience

- UI architecture authors in `docs/07_UI/`
- Designers defining adaptive layouts and screen behavior
- Implementers translating responsive rules into code
- Reviewers validating usability across device classes
- AI agents extending responsive documentation without inventing parallel layout systems

## Dependencies

### Upstream Dependencies

- `AGENTS.md`
- `docs/README.md`
- `docs/templates/Architecture_Document_Template.md`
- `docs/00_Project/Vision.md`
- `docs/01_Game_Design/Gameplay/Gameplay.md`
- `docs/02_Design_System/LLDL/LLDL.md`
- `docs/02_Design_System/LLDL/WS4_UI_Language.md`
- `docs/02_Design_System/LLDL/WS9_Accessibility_Language.md`
- `docs/07_UI/UI_00_Design_Principles.md`
- `docs/07_UI/UI_01_UI_Philosophy.md`
- `docs/07_UI/UI_02_Layout_System.md`
- `docs/07_UI/UI_03_Gameplay_Screen_Specification.md`
- `docs/07_UI/UI_04_Design_Tokens.md`
- `docs/07_UI/UI_05_Component_Library.md`
- `docs/07_UI/UI_06_Animation_System.md`

### Assumptions

- Responsive behavior must preserve the same architectural hierarchy rather than create a different product identity per device class
- Supported device contexts may expand over time, but these guidelines do not require new orientation or platform commitments
- When space is constrained, density should compress before gameplay-board clarity is sacrificed
- Responsive adaptation includes what appears, where it appears, and how much appears, not only how large it becomes

## Downstream Documents

- `docs/07_UI/UI_08_Asset_Integration.md`
- Future implementation-facing adaptive layout work in `lib/design_system/` and feature presentation layers
- Future screen refinements that must preserve this responsive architecture

## Related Documents

- `docs/07_UI/README.md`
- `docs/07_UI/UI_02_Layout_System.md`
- `docs/07_UI/UI_03_Gameplay_Screen_Specification.md`
- `docs/07_UI/UI_05_Component_Library.md`
- `docs/07_UI/UI_06_Animation_System.md`
- `docs/07_UI/UI_08_Asset_Integration.md`
- `docs/02_Design_System/LLDL/WS4_UI_Language.md`
- `docs/02_Design_System/LLDL/WS9_Accessibility_Language.md`

## Authority

### Governs

- UI-specific responsive adaptation across supported device contexts
- How layout, components, and HUD density should scale or reorganize
- Safe-area, orientation, and information-density behavior at the architectural level
- What future implementation must preserve when adapting screens and components across sizes

### Does Not Govern

- Exact pixel breakpoints or implementation logic
- Token values or canonical component definitions
- Motion timing or motion categories beyond responsive implications
- Asset production or file preparation
- Gameplay rules or engine behavior

### Conflict Resolution

`docs/07_UI/UI_02_Layout_System.md` remains the layout authority. `docs/07_UI/UI_03_Gameplay_Screen_Specification.md` remains the gameplay-screen behavior authority. `docs/07_UI/UI_05_Component_Library.md` remains the reusable component authority. `docs/02_Design_System/LLDL/WS9_Accessibility_Language.md` remains the upstream accessibility authority.

This document extends those authorities into **responsive adaptation rules**.

If a conflict exists:

- preserve gameplay-board dominance and screen hierarchy first
- preserve usability and accessibility before decorative balance
- preserve component meaning over device-specific novelty
- record the conflict in the review package before downstream implementation continues

## Architectural Position

This document translates the UI architecture stack in the following order:

```text
Layout System
    ↓
Gameplay Screen + Component Library
    ↓
Responsive Guidelines
    ↓
Implementation
```

Expanded in full context:

```text
UI Principles
    ↓
UI Philosophy
    ↓
Layout System
    ↓
Gameplay Screen Specification
    ↓
Design Tokens
    ↓
Component Library
    ↓
Responsive Guidelines
    ↓
Implementation
```

| Layer | Role |
|-------|------|
| **Layout System** | Defines structural zones and hierarchy |
| **Gameplay Screen Specification** | Defines what information and actions must exist |
| **Component Library** | Defines the reusable building blocks that carry those responsibilities |
| **Responsive Guidelines** | Defines how those structures and components adapt across device contexts |
| **Implementation** | Turns that adaptation into code |

This document is where architectural consistency is protected across size, reach, and density differences.

## Responsive Philosophy

Responsive design in Labyrinth Legends should preserve:

- gameplay as the hero
- calm readability
- premium restraint
- stable structural understanding
- touch-first usability

Responsive behavior should never feel like a different product on a different device.

Adaptation should answer:

- what must stay visible?
- what may compress?
- what may move?
- what must disappear before the board loses clarity?

The goal is not to fill available space. The goal is to preserve architectural integrity.

## Scaling Strategy

Responsive scaling should happen across three axes:

1. **Spatial scaling**  
   How much room zones and components receive relative to the gameplay stage.

2. **Density scaling**  
   How much simultaneous information appears at once.

3. **Structural scaling**  
   How components may reflow, regroup, or separate to remain readable.

Preferred adaptation order:

1. reduce non-essential density
2. reorganize support surfaces
3. expand breathing room where available
4. preserve the board as the dominant element

Avoid interpreting larger devices as permission for permanent HUD bloat.

## Layout Adaptation

Layout adaptation should follow these rules:

- central gameplay or world zones remain primary on every supported device
- support zones may widen, stack differently, or reposition, but must remain secondary
- larger devices should gain clarity and breathing room before gaining more chrome
- smaller devices should compress secondary surfaces before compromising primary interaction

Adaptation by context:

| Device Context | Responsive Priority |
|----------------|---------------------|
| **Phones** | Preserve clarity, reachability, and reduced simultaneous density |
| **Large Phones** | Add breathing room and cleaner separation before adding more persistent information |
| **Tablets** | Expand structure and spatial elegance without turning gameplay into a surrounded dashboard |
| **Future Devices** | Preserve hierarchy and usability first; invent no new visual doctrine without review |

## Component Adaptation

Responsive component behavior should preserve component identity while allowing structural adjustment.

Components may adapt by:

- changing grouping
- changing prominence
- moving to a different support zone
- collapsing optional supporting detail
- widening or relaxing their internal composition

Components must not adapt by:

- changing conceptual meaning
- splitting into unrelated behaviors without architectural justification
- surfacing permanently just because more space exists

Examples of valid adaptation:

- an objective surface gains more comfortable spacing on a tablet
- a support action moves farther from the primary action zone on a larger device
- a hint panel becomes less intrusive when more peripheral room exists

Examples of invalid adaptation:

- a resource display becomes permanent dashboard framing on a tablet
- a primary action loses its structural clarity because more actions were added beside it
- a component changes purpose depending on device class

## HUD Adaptation

HUD adaptation must preserve progressive disclosure.

Rules:

- phones should show only decision-critical HUD by default
- large phones may separate support elements more comfortably, but should not increase baseline noise
- tablets may distribute support elements more elegantly across edges, but must not frame the board as a small central module
- execution phases should still reduce HUD pressure regardless of device size

More space should produce **more calm**, not **more clutter**.

## Safe Areas

Safe areas should be absorbed into support zones first, consistent with `docs/07_UI/UI_02_Layout_System.md`.

Architectural rules:

- do not let cutouts or inset compensation fracture the main gameplay stage
- shift secondary, contextual, or support surfaces before disturbing the board
- preserve action reachability when bottom or side constraints change
- keep interruption layers readable without feeling jammed against unsafe edges

Responsive handling of safe areas should protect hierarchy, not merely satisfy geometry.

## Orientation

These guidelines govern any supported orientation. They do **not** require adding new orientations.

If multiple orientations are supported:

- the same gameplay hierarchy must survive the rotation
- the board must remain the dominant surface
- primary action clarity must remain structurally obvious
- support information may reflow, but should not surround gameplay with equal-priority chrome
- orientation changes must not force sudden density spikes or hidden critical actions

Orientation adaptation should preserve understanding before symmetry.

## Information Density

Information density must adapt responsively with restraint.

Rules:

- smaller contexts should lose optional simultaneity before losing clarity
- larger contexts should gain space and legibility before gaining more persistent information
- meta information should remain deferred unless explicitly needed
- gameplay support should remain contextual even on large displays
- no device class should normalize "show everything" behavior

Density adaptation is successful when the player feels less cramped or more comfortable, not more managed.

## Minimum Usability

Every supported device context must preserve:

- readable objective comprehension
- reliable access to the primary action
- understandable feedback and blocked states
- perceivable support actions when relevant
- clear modal and pause behavior
- touch-first interaction comfort

If a responsive layout cannot preserve these basics, the adaptation is architecturally invalid.

## Responsive Anti-Patterns

The responsive system must avoid:

- turning tablets into dashboards
- shrinking the board to preserve secondary chrome
- duplicating the same information in multiple persistent regions
- exposing more HUD simply because space exists
- hiding the primary action in awkward or low-discoverability positions
- device-specific visual identities that drift from the core product
- orientation changes that break established hierarchy
- adaptive behavior that changes component meaning instead of component layout

## Responsive Success Criteria

Future reviewers should be able to ask:

- Does every supported device context preserve gameplay-board dominance?
- Does more space create more calm rather than more clutter?
- Do smaller devices remain readable without sacrificing the core loop?
- Do canonical components adapt without changing meaning?
- Are safe areas handled structurally instead of cosmetically?
- Does orientation preserve the same hierarchy and action clarity?
- Does responsive behavior remain consistent with layout, screen, component, and motion authorities?

If the answer to several of these questions is "no," the responsive architecture is not stable enough for downstream implementation.

## Governance

This document governs **responsive UI behavior**, not implementation code.

Downstream work should use this document to justify:

- adaptation of structural zones
- regrouping or reduction of support information
- component reflow and emphasis changes
- safe-area and orientation behavior
- density decisions across device classes

### Change Rules

- Do not define pixel breakpoints or Flutter layout code here
- Do not let responsive adaptation redefine component meaning or screen hierarchy
- Do not use additional space as justification for persistent noise
- Do not allow orientation support to outrank usability and clarity
- Record material conflicts between responsive behavior and screen/component architecture in the review package before implementation continues

### Approval Conditions

- The document must remain aligned with `docs/07_UI/UI_02_Layout_System.md`
- The document must remain aligned with `docs/07_UI/UI_03_Gameplay_Screen_Specification.md`
- The document must remain aligned with `docs/07_UI/UI_05_Component_Library.md`
- The document must remain aligned with `docs/07_UI/UI_06_Animation_System.md`
- The document must remain aligned with `docs/02_Design_System/LLDL/WS9_Accessibility_Language.md`
- Downstream implementation should map adaptive behavior back to these structural rules and priorities

## Review Workflow

1. Architecture Draft
2. Editorial Review
3. ChatGPT Product Review
4. Human Approval
5. Lock
6. Repository Publication

## ChatGPT Architecture Review

- **Date:** 2026-07-04
- **Verdict:** 🟢 Approved
- **Score:** 10 / 10

### Product Notes

This document establishes the canonical responsive architecture for Labyrinth Legends and successfully defines how the user interface adapts across supported device contexts without introducing implementation-specific layout behavior.

The document consistently treats responsiveness as the preservation of architectural hierarchy rather than the redistribution of interface elements. It extends the approved layout, gameplay screen, component, and animation architecture into adaptive behavior while maintaining gameplay-first priorities across all supported form factors.

### Architecture Notes

The strongest architectural decisions include:

- Responsive behavior is defined through hierarchy rather than breakpoints.
- Scaling is separated into spatial, density, and structural adaptation rather than simple enlargement.
- Component identity remains stable while layout adapts across device classes.
- Additional screen space is treated as an opportunity to increase clarity and breathing room rather than persistent interface density.
- Safe-area handling, orientation, and information density remain subordinate to gameplay-board dominance.
- The document remains fully aligned with the approved Layout System, Gameplay Screen Specification, Component Library, and Animation System.

This document provides a strong architectural foundation for future responsive implementation while preserving a consistent player experience across supported devices.

### Recommendations

- Future implementation should derive responsive layouts from these architectural principles rather than introducing device-specific UI behavior.
- Any new device category introduced in future releases should extend this responsive architecture instead of defining parallel responsive rules.
- Continue preserving the distinction between responsive architecture and implementation throughout M2.

### Approval Notes

Approved as Version 1.0.0.

This document becomes the canonical responsive architecture reference for all future Labyrinth Legends UI implementation.

## Revision History

| Version | Date | Author | Notes |
|---------|------|--------|-------|
| Draft v1 | 2026-07-04 | Cursor | Initial draft of the UI responsive-guidelines architecture document for M1.8 |
| 1.0.0 | 2026-07-04 | Apoorv / ChatGPT | Approved after architecture review |
