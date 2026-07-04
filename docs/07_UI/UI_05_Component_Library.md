# UI 05 - Component Library

| Field | Value |
|-------|-------|
| **Document ID** | LLDS-DOC-07-UI-005 |
| **Version** | 1.0.0 |
| **Status** | Approved |
| **Owner** | Apoorv |
| **Last Updated** | 2026-07-04 |
| **Domain** | UI Architecture |
| **Related Milestone** | M1.8 - UI Architecture & Design System |
| **Canonical Path** | `docs/07_UI/UI_05_Component_Library.md` |
| **Related Documents** | `docs/07_UI/UI_00_Design_Principles.md` · `docs/07_UI/UI_01_UI_Philosophy.md` · `docs/07_UI/UI_02_Layout_System.md` · `docs/07_UI/UI_03_Gameplay_Screen_Specification.md` · `docs/07_UI/UI_04_Design_Tokens.md` |

## Purpose

This document defines the **canonical reusable UI component architecture** for Labyrinth Legends.

It explains what reusable UI components exist conceptually, what responsibilities they own, how they relate to one another, what states and lifecycle behaviors they support, and how future gameplay and non-gameplay screens should be assembled from governed building blocks rather than ad hoc interface invention.

This document exists so future UI work can answer a consistent question:

> **What are the reusable interface building blocks of Labyrinth Legends, and how should they behave architecturally before they are implemented in code?**

This document does **not** define Flutter widgets, implementation APIs, exact measurements, colors, typography, animation timings, or asset files.

## Scope

### In Scope

- Reusable UI component architecture
- Component categories and their intended role in the interface
- Component responsibilities, relationships, and composition rules
- Canonical component concepts used across gameplay, meta-game, and utility surfaces
- Component states, lifecycle expectations, and visibility logic
- Gameplay-screen-to-component mapping derived from the approved gameplay-screen specification
- Accessibility and review criteria for future component implementation

### Out of Scope

- Flutter widgets, code structure, or implementation APIs
- Exact token values, color assignments, typography values, spacing numbers, or motion timings
- Asset production and file ownership
- Gameplay rules, path legality, objective evaluation, reward logic, or engine architecture
- One-off screen mockups or platform-specific UI implementation detail

## Intended Audience

- UI architecture authors in `docs/07_UI/`
- Designers defining reusable interface systems
- Implementers building future Flutter components from approved architecture
- Reviewers validating consistency across screens and reusable interface behavior
- AI agents extending UI documentation without inventing parallel component concepts

## Dependencies

### Upstream Dependencies

- `AGENTS.md`
- `docs/README.md`
- `docs/templates/Architecture_Document_Template.md`
- `docs/07_UI/UI_00_Design_Principles.md`
- `docs/07_UI/UI_01_UI_Philosophy.md`
- `docs/07_UI/UI_02_Layout_System.md`
- `docs/07_UI/UI_03_Gameplay_Screen_Specification.md`
- `docs/07_UI/UI_04_Design_Tokens.md`
- `docs/02_Design_System/Components.md`
- `docs/06_Asset_Bible/Asset_Bible.md`

### Assumptions

- `docs/07_UI/` is now the authoritative area for UI-specific component architecture once approved
- `docs/02_Design_System/Components.md` remains an important upstream implementation-facing reference, but this document governs the reusable component architecture for `docs/07_UI/`
- Canonical components in this document are architectural concepts, not mandatory one-to-one Flutter class names
- Later implementation may split a single architectural component into multiple widgets so long as the governed behavior remains intact

## Downstream Documents

- `docs/07_UI/UI_06_Animation_System.md`
- `docs/07_UI/UI_07_Responsive_Guidelines.md`
- `docs/07_UI/UI_08_Asset_Integration.md`
- Future implementation-facing component work in `lib/design_system/` and related presentation layers
- Future gameplay and meta-game screen specifications that must assemble from these component concepts

## Related Documents

- `docs/07_UI/README.md`
- `docs/07_UI/UI_00_Design_Principles.md`
- `docs/07_UI/UI_01_UI_Philosophy.md`
- `docs/07_UI/UI_02_Layout_System.md`
- `docs/07_UI/UI_03_Gameplay_Screen_Specification.md`
- `docs/07_UI/UI_04_Design_Tokens.md`
- `docs/02_Design_System/Components.md`
- `docs/06_Asset_Bible/Asset_Bible.md`

## Authority

### Governs

- The canonical reusable UI component concepts for Labyrinth Legends
- What responsibilities a component may own and what it must never own
- How components relate, compose, appear, recede, and transition across states
- What future implementation must preserve when translating component architecture into code

### Does Not Govern

- Raw token values or token catalogs owned by `docs/07_UI/UI_04_Design_Tokens.md` and `docs/02_Design_System/Design_Tokens.md`
- Flutter widget APIs or implementation patterns
- Gameplay rules, outcome logic, or engine authority
- Asset production, file naming, or source artwork ownership
- Exact layout measurements or animation timings

### Conflict Resolution

`docs/07_UI/UI_00_Design_Principles.md`, `docs/07_UI/UI_01_UI_Philosophy.md`, `docs/07_UI/UI_02_Layout_System.md`, `docs/07_UI/UI_03_Gameplay_Screen_Specification.md`, and `docs/07_UI/UI_04_Design_Tokens.md` remain higher-authority UI architecture documents for principles, philosophy, layout, gameplay-screen behavior, and token semantics.

`docs/02_Design_System/Components.md` remains an important upstream design-system component reference and implementation-facing catalog. This document extends that authority into the `docs/07_UI/` architecture stack by defining **reusable component meaning, relationships, and behavioral architecture** for future UI work.

If a conflict exists:

- preserve the higher-authority UI architecture document
- preserve token authority where values or semantics are already governed upstream
- do not let implementation detail override architectural component meaning
- record the mismatch in the relevant review package before downstream implementation continues

## Architectural Position

This document translates the UI architecture stack in the following order:

```text
Gameplay Screen Specification
    ↓
Reusable Components
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
Implementation
```

| Layer | Role |
|-------|------|
| **Gameplay Screen Specification** | Defines what the flagship gameplay surface must do |
| **Design Tokens** | Define semantic material language and state vocabulary |
| **Component Library** | Defines reusable building blocks that express those behaviors repeatedly |
| **Implementation** | Translates approved components into concrete widgets and code |

This document is the layer where screen behavior becomes reusable structure.

The gameplay screen defines **what must appear and when**. The component library defines **which reusable building blocks carry those responsibilities**. Implementation later decides **how those building blocks are realized in code** without inventing new architectural concepts.

## Component Philosophy

Labyrinth Legends components should behave like **reliable architectural instruments**, not decorative UI fragments.

Components should:

- preserve gameplay as the hero
- reduce repeated invention across screens
- encode clear responsibility boundaries
- support calm readability over visual noise
- allow functional clarity to remain stronger than ornament
- reinforce a consistent temple-interface language
- make accessibility and state communication natural rather than bolted on

A component should exist because it solves a recurring interface need with governed behavior, not because a single screen wants a unique visual flourish.

The component library should favor:

- reusable concepts over one-off layout fragments
- stable component roles over screen-specific improvisation
- multichannel state communication over color-only status
- progressive disclosure over permanently dense HUD

## Component Classification

Canonical components should be grouped into the following architectural categories:

| Category | Role | Typical Use |
|----------|------|-------------|
| **Structural Components** | Frame or organize surfaces and zones | Screen shells, HUD containers, action bars, section frames |
| **Gameplay Components** | Support active puzzle play and board-related decision making | Objective cards, gameplay HUD, resource display, primary action bar |
| **Feedback Components** | Communicate consequence, status, success, failure, or progress | Toast notifications, reward panels, progress indicators |
| **Navigation Components** | Move the player into, out of, or around a screen state | Pause button, back/navigation controls, progression actions |
| **Overlay Components** | Temporarily take priority over the base screen when justified | Loading overlay, modal dialog, confirmation dialog |
| **Utility Components** | Provide contextual support that is secondary to core play | Hint panels, helper surfaces, secondary support elements |

These categories are architectural, not implementation package names.

## Component Responsibilities

A canonical component may own:

- presentation behavior for a recurring UI concept
- state display and visual-mode transitions appropriate to that concept
- structural relationships to parent and child components
- visibility rules based on approved screen or phase behavior
- semantic dependency on tokens, layout zones, and higher-level UI authorities

A canonical component must never own:

- gameplay outcome logic
- independent rule validation
- duplicated responsibility already owned by a sibling or parent component
- hidden dependence on a specific screen layout when it is meant to be reusable
- ornamental complexity that weakens clarity

In practical terms:

- components present state; they do not decide game truth
- components may expose actions; they do not determine their gameplay validity
- components may organize children; they do not silently become layout systems
- components may animate; they do not invent motion rules outside approved motion authority

## Canonical Components

### Objective Card

| Field | Value |
|-------|-------|
| **Purpose** | Present the current objective in a readable, low-noise, decision-supportive surface |
| **Responsibility** | Clarify goal framing, progress state, and objective-critical status without becoming instructional clutter |
| **Parent** | Gameplay HUD or top context region |
| **Children** | Objective title, supporting progress text, optional progress indicator, optional status icon |
| **Typical States** | Idle, focused, updating, completed, failed, hidden |
| **Visibility Rules** | Persist when objective awareness is required; become more visible when decision-critical; remain restrained during calm observation |
| **Dependencies** | `docs/07_UI/UI_03_Gameplay_Screen_Specification.md` objective behavior, token semantics from `docs/07_UI/UI_04_Design_Tokens.md` |

### Gameplay HUD

| Field | Value |
|-------|-------|
| **Purpose** | Act as the distributed support layer for gameplay-state information |
| **Responsibility** | Organize objective, contextual resources, support actions, and phase-aware status without turning the screen into a dashboard |
| **Parent** | Gameplay screen shell |
| **Children** | Objective Card, Resource Display, Pause Button, optional Hint Panel, contextual status surfaces |
| **Typical States** | Idle, planning, executing, paused, reduced, hidden |
| **Visibility Rules** | Quietest during observation and execution when possible; more present when fairness or comprehension requires it |
| **Dependencies** | `docs/07_UI/UI_02_Layout_System.md`, `docs/07_UI/UI_03_Gameplay_Screen_Specification.md` |

### Resource Display

| Field | Value |
|-------|-------|
| **Purpose** | Present only active-gameplay-relevant resources or counters |
| **Responsibility** | Show contextual resource information without drifting into meta-game dashboard behavior |
| **Parent** | Gameplay HUD, progress header, or contextual support region |
| **Children** | Resource icon/symbol, numeric value, optional label, optional status cue |
| **Typical States** | Hidden, idle, updating, depleted, emphasized |
| **Visibility Rules** | Visible only when the current level, mode, or state makes the resource relevant |
| **Dependencies** | Gameplay-screen resource rules in `docs/07_UI/UI_03_Gameplay_Screen_Specification.md`, token semantics in `docs/07_UI/UI_04_Design_Tokens.md` |

### Primary Action Bar

| Field | Value |
|-------|-------|
| **Purpose** | Anchor the current dominant action for the player |
| **Responsibility** | Present commitment/progression actions clearly in the bottom primary-action zone |
| **Parent** | Gameplay screen shell or action-zone container |
| **Children** | Primary action control, optional supporting secondary action, contextual status cue |
| **Typical States** | Idle, planning, confirm-ready, disabled, executing-hidden, result-ready |
| **Visibility Rules** | Prominent when action is required; reduced or hidden when execution or interruption becomes primary |
| **Dependencies** | `docs/07_UI/UI_02_Layout_System.md` bottom action-zone rules, `docs/07_UI/UI_03_Gameplay_Screen_Specification.md` primary-action behavior |

### Pause Button

| Field | Value |
|-------|-------|
| **Purpose** | Provide reliable access to pause/temporary interruption |
| **Responsibility** | Expose a stable navigation/control affordance without competing with the primary action |
| **Parent** | Gameplay HUD or top/peripheral control region |
| **Children** | Icon or concise label only; no embedded unrelated controls |
| **Typical States** | Idle, focused, disabled, hidden |
| **Visibility Rules** | Usually available during gameplay; may be visually restrained when not immediately relevant |
| **Dependencies** | Navigation hierarchy, overlay rules, accessibility focus behavior |

### Toast Notification

| Field | Value |
|-------|-------|
| **Purpose** | Communicate transient, non-blocking feedback |
| **Responsibility** | Briefly explain consequence, warning, or confirmation without interrupting puzzle flow |
| **Parent** | Feedback layer or screen-level transient container |
| **Children** | Message text, optional icon, optional tone cue |
| **Typical States** | Queued, visible, dismissing, hidden |
| **Visibility Rules** | Only appears for short-lived feedback; must not become permanent HUD or modal behavior |
| **Dependencies** | UI philosophy restraint, transient feedback behavior, accessibility timing requirements |

### Reward Panel

| Field | Value |
|-------|-------|
| **Purpose** | Present reward or outcome information in a more ceremonial but still readable surface |
| **Responsibility** | Summarize positive outcome, reward meaning, and next-step understanding without overshadowing the chamber experience |
| **Parent** | Victory surface, result modal, or progression resolution flow |
| **Children** | Reward summary, progress indicator, action(s), optional celebratory emphasis |
| **Typical States** | Hidden, revealed, emphasized, settling |
| **Visibility Rules** | Appears only at justified resolution moments; never persists as normal gameplay chrome |
| **Dependencies** | Reward-tone guidance from UI philosophy, gameplay-screen modal/result behavior, token semantics for ceremonial emphasis |

### Modal Dialog

| Field | Value |
|-------|-------|
| **Purpose** | Temporarily take focus when structured acknowledgment or interruption is required |
| **Responsibility** | Present focused information and bounded actions while preserving clear separation from the base screen |
| **Parent** | Overlay layer |
| **Children** | Title, body content, action group, optional status icon |
| **Typical States** | Hidden, opening, active, closing |
| **Visibility Rules** | Use only when normal zoning cannot communicate the situation clearly enough |
| **Dependencies** | Overlay rules from `docs/07_UI/UI_02_Layout_System.md`, gameplay-screen modal behavior from `docs/07_UI/UI_03_Gameplay_Screen_Specification.md` |

### Progress Indicator

| Field | Value |
|-------|-------|
| **Purpose** | Show bounded progress, completion, or step advancement |
| **Responsibility** | Represent progress clearly without becoming decorative animation or ambiguous status |
| **Parent** | Objective Card, Reward Panel, loading surface, or progression header |
| **Children** | Track, fill/progress state, optional label, optional milestone markers |
| **Typical States** | Idle, active, complete, failed, hidden |
| **Visibility Rules** | Present only when progress comprehension benefits the player or is required by the current state |
| **Dependencies** | Token semantics for progress, accessibility legibility rules |

### Hint Panel

| Field | Value |
|-------|-------|
| **Purpose** | Provide contextual support or explanatory assistance when explicitly invoked or justified |
| **Responsibility** | Offer guidance without replacing the player's observation and reasoning process |
| **Parent** | Gameplay HUD, utility zone, or overlay layer depending on intensity |
| **Children** | Hint text, optional iconography, optional confirm/dismiss action |
| **Typical States** | Hidden, available, open, dismissed |
| **Visibility Rules** | Must remain contextual and player-respecting; never become permanent instructional wallpaper |
| **Dependencies** | UI philosophy progressive disclosure, gameplay-screen support-action rules |

### Loading Overlay

| Field | Value |
|-------|-------|
| **Purpose** | Communicate temporary blocked or transitional loading states |
| **Responsibility** | Preserve calm orientation and avoid frantic or noisy waiting experiences |
| **Parent** | Overlay layer |
| **Children** | Loading indicator, optional concise status text, optional veil surface |
| **Typical States** | Hidden, appearing, active, dismissing |
| **Visibility Rules** | Only when loading meaningfully interrupts current interaction or requires explicit wait communication |
| **Dependencies** | Motion restraint, overlay hierarchy, accessibility readability |

### Confirmation Dialog

| Field | Value |
|-------|-------|
| **Purpose** | Request explicit commitment for a consequential or destructive action |
| **Responsibility** | Clarify the choice, consequence, and available next actions without dramatic overstatement |
| **Parent** | Modal Dialog or overlay family |
| **Children** | Confirmation prompt, optional explanatory text, confirm action, cancel action |
| **Typical States** | Hidden, opening, active, resolving, closing |
| **Visibility Rules** | Use only for meaningful commitment or destructive reversal, not routine friction |
| **Dependencies** | Modal rules, primary/secondary action hierarchy, accessibility focus order |

## Component Composition Rules

Components must combine in ways that preserve hierarchy rather than flatten it.

Composition rules:

1. A parent component should organize responsibility, not duplicate the content role of its children.
2. Structural components should frame gameplay and support surfaces without becoming decorative shells around everything.
3. Gameplay components should remain subordinate to the gameplay board rather than competing equally with it.
4. Feedback components should layer over the interface only as long as needed to explain consequence.
5. Overlay components should interrupt only when the base layout cannot communicate clearly enough on its own.
6. Utility components must remain contextual and removable.
7. A child component should not silently depend on unrelated sibling behavior to remain understandable.

Preferred composition pattern:

```text
Screen Shell
    ↓
Gameplay HUD / Structural Zones
    ↓
Canonical Components
    ↓
Atomic implementation detail
```

Discouraged composition pattern:

```text
Screen-specific one-off surface
    ↓
Undocumented ad hoc sub-widgets
    ↓
Duplicated behavior already owned elsewhere
```

## Component State Model

Canonical components should support a shared architectural state vocabulary where relevant.

| State | Meaning | Notes |
|-------|---------|-------|
| **Idle** | Default resting presentation | Visible but not demanding attention |
| **Disabled** | Present but unavailable | Must not rely on color alone to communicate unavailability |
| **Focused** | Current keyboard, accessibility, or explicit attention target | Requires clear multichannel emphasis |
| **Hidden** | Not currently shown | Absence should be intentional, not accidental |
| **Loading** | Waiting on meaningful progress or transition | Should remain calm and structurally stable |
| **Success** | Positive completion or acknowledgment | Brief, readable, and not overly flashy |
| **Failure** | Error, loss, blocked action, or negative resolution | Clear, specific, and not chaotic |

Additional contextual states may exist per component, but should inherit this shared vocabulary rather than invent unrelated status dialects.

## Component Lifecycle

Components should be understood architecturally through the following lifecycle:

1. **Creation**  
   The component becomes structurally relevant to the current screen or state.

2. **Display**  
   The component enters visibility in a way aligned with hierarchy, timing, and current player attention needs.

3. **Update**  
   The component reflects changed information, emphasis, or availability without destabilizing the screen.

4. **Dismissal**  
   The component recedes when its job is complete, when the phase changes, or when higher-priority information takes over.

5. **Destruction**  
   The component is removed because its parent state, screen, or flow is no longer active.

Lifecycle behavior should remain:

- predictable
- phase-aware
- respectful of player attention
- free from unnecessary churn

## Gameplay Screen Component Mapping

The approved gameplay screen should be assembled from the following component relationships:

| Gameplay-screen need | Canonical component(s) | Architectural note |
|----------------------|------------------------|--------------------|
| Objective framing | Objective Card | Must remain readable without dominating the board |
| Distributed gameplay support | Gameplay HUD | Must behave as a light support layer, not a dashboard |
| Contextual resources | Resource Display | Only active-gameplay-relevant data should appear |
| Primary commitment action | Primary Action Bar | Owns the main bottom action presence |
| Pause access | Pause Button | Peripheral, stable, and subordinate to core play |
| Transient consequence messaging | Toast Notification | Non-blocking and short-lived |
| Reward or resolution summary | Reward Panel | More ceremonial, but still structurally clear |
| Interruptive choice or acknowledgment | Modal Dialog / Confirmation Dialog | Used only when justified by state |
| Loading / blocked transition | Loading Overlay | Calm interruption layer |
| Optional player support | Hint Panel | Contextual, not permanent |
| Progress expression | Progress Indicator | Can live inside objective, reward, or loading contexts |

This mapping ensures that future gameplay implementation can assemble the screen from governed building blocks instead of inventing new conceptual parts each time.

## Accessibility Considerations

Canonical components must support accessibility at the architectural level before implementation details are chosen.

This means:

- state changes should be understandable without color alone
- focusable and actionable components need clear focus states
- transient feedback should remain readable and not disappear before it can be perceived
- modal and overlay components should preserve clear priority and escape paths
- components should avoid excessive simultaneous density
- hint, reward, and confirmation components should support concise and understandable language
- loading and disabled states should communicate clearly without ambiguity

Accessibility is not a downstream patch. It is part of component meaning.

## Component Anti-Patterns

The component library must avoid:

- components owning gameplay logic
- duplicate component behavior under different names
- hidden dependencies between unrelated components
- decorative-only components with no structural role
- permanent overlays that behave like default screen chrome
- state duplication across parent and child without clear ownership
- screen-specific component inventions that bypass the canonical library
- components that expose every possible state permanently
- components whose ornament becomes louder than their purpose
- components that require implementation detail to understand their architectural role

## Component Success Criteria

Future reviewers should be able to ask:

- Can future screens be assembled from these canonical components without inventing new architectural concepts by default?
- Does each component have a clear responsibility boundary?
- Do components remain subordinate to gameplay, not competitive with it?
- Are overlay and feedback components used as exceptions rather than the baseline?
- Are component states understandable, reusable, and accessibility-aware?
- Does the gameplay-screen mapping align with `docs/07_UI/UI_03_Gameplay_Screen_Specification.md`?
- Does the library remain distinct from a Flutter widget catalog or implementation API document?
- Do components inherit token semantics from `docs/07_UI/UI_04_Design_Tokens.md` rather than inventing styling meaning locally?

If the answer to several of these questions is "no," the component architecture is not stable enough for downstream implementation.

## Governance

This document governs **canonical reusable UI component architecture**, not code implementation.

Downstream UI documents and implementation should use this document to justify:

- when a reusable component concept exists
- when a screen should compose governed components instead of inventing a one-off surface
- which component owns a behavior or state responsibility
- how future UI systems remain consistent across gameplay and non-gameplay contexts

### Change Rules

- Do not define Flutter widget APIs or implementation class structure here
- Do not redefine token values or semantic token meaning already governed upstream
- Do not allow screen-specific inventions to bypass canonical reusable component concepts without review
- Do not let components absorb gameplay logic, validation, or outcome ownership
- Record any material component-boundary conflict in the review package before downstream work continues

### Approval Conditions

- The document must remain aligned with `docs/07_UI/UI_00_Design_Principles.md`
- The document must remain aligned with `docs/07_UI/UI_01_UI_Philosophy.md`
- The document must remain aligned with `docs/07_UI/UI_02_Layout_System.md`
- The document must remain aligned with `docs/07_UI/UI_03_Gameplay_Screen_Specification.md`
- The document must remain aligned with `docs/07_UI/UI_04_Design_Tokens.md`
- Future implementation-facing work should map reusable UI behavior back to these canonical components

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
- **Score:** 9.8 / 10

### Product Notes

This document successfully establishes the canonical reusable UI component architecture for Labyrinth Legends. It correctly treats components as governed architectural concepts rather than Flutter widgets, visual mockups, or implementation classes.

The document is well aligned with the approved `docs/07_UI` stack. It derives naturally from `UI_00` through `UI_04`, preserves gameplay as the visual and experiential priority, and provides a clear bridge between the Gameplay Screen Specification and future implementation-facing work.

### Architecture Notes

The strongest architectural choices are:

- Clear separation between component concepts and implementation widgets.
- Strong responsibility boundaries for what components may and must not own.
- Useful component classification across structural, gameplay, feedback, navigation, overlay, and utility roles.
- A practical canonical component list derived from the approved gameplay screen rather than invented generically.
- A shared component state model that will help future implementation avoid inconsistent state language.
- Explicit anti-patterns that protect the UI from component sprawl, duplicate behavior, and hidden gameplay logic.

The document also correctly reinforces that UI components may present state and expose actions, but must not own gameplay legality, objective evaluation, rewards, success, failure, or engine truth.

### Recommendations

- Future implementation should map Flutter widgets back to these architectural component concepts rather than treating widget names as the source of truth.
- Future screen specifications should reuse these canonical components before introducing new ones.
- If a new component is needed, its responsibility boundary should be documented here before implementation proceeds.
- Component-level animation behavior should remain deferred to `UI_06_Animation_System.md`.
- Responsive component behavior should remain deferred to `UI_07_Responsive_Guidelines.md`.

### Approval Notes

Approved as the canonical reusable component architecture document for M1.8. This document completes the static UI foundation together with Design Principles, UI Philosophy, Layout System, Gameplay Screen Specification, and Design Tokens.

## Revision History

| Version | Date | Author | Notes |
|---------|------|--------|-------|
| Draft v1 | 2026-07-04 | Cursor | Initial draft of the reusable UI component architecture document for M1.8 |
| 1.0.0 | 2026-07-04 | Apoorv / ChatGPT | Approved after architecture review |
