# UI 06 - Animation System

| Field | Value |
|-------|-------|
| **Document ID** | LLDS-DOC-07-UI-006 |
| **Version** | 1.0.0 |
| **Status** | Approved |
| **Owner** | Apoorv |
| **Last Updated** | 2026-07-04 |
| **Domain** | UI Architecture |
| **Related Milestone** | M1.8 - UI Architecture & Design System |
| **Canonical Path** | `docs/07_UI/UI_06_Animation_System.md` |
| **Related Documents** | `docs/07_UI/UI_00_Design_Principles.md` · `docs/07_UI/UI_01_UI_Philosophy.md` · `docs/07_UI/UI_02_Layout_System.md` · `docs/07_UI/UI_03_Gameplay_Screen_Specification.md` · `docs/07_UI/UI_04_Design_Tokens.md` · `docs/07_UI/UI_05_Component_Library.md` |

## Purpose

This document defines the **animation philosophy and behavioral motion architecture** for Labyrinth Legends UI.

It explains how motion should support gameplay, hierarchy, feedback, transitions, readability, and emotional pacing across the interface so that future implementation inherits a single coherent motion language rather than accumulating screen-specific animation habits.

This document exists so future UI work can answer a consistent question:

> **How should interface motion behave so it reinforces thoughtful play, calm premium craft, and clear consequence without becoming spectacle?**

This document does **not** define milliseconds, easing curves, implementation APIs, or code animation systems.

## Scope

### In Scope

- Motion philosophy for UI and UI-adjacent gameplay presentation
- Motion hierarchy, transition rules, and animation priorities
- Gameplay feedback motion behavior
- Motion categories across navigation, overlays, actions, and results
- Motion ownership across screens, components, and transient feedback layers
- Animation lifecycle expectations
- Accessibility and comfort rules for interface motion
- Review criteria for downstream implementation and screen behavior

### Out of Scope

- Raw duration values, curves, or animation token implementation
- Flutter animation classes, controllers, or widget APIs
- Character locomotion systems or engine timing implementation
- Gameplay rule changes or outcome logic
- Screen-specific choreography details that belong in implementation or later applied specs

## Intended Audience

- UI architecture authors in `docs/07_UI/`
- Designers defining feedback, transition, and state behavior
- Implementers translating motion architecture into code
- Reviewers validating readability, restraint, and accessibility
- AI agents extending UI motion documentation without inventing parallel animation dialects

## Dependencies

### Upstream Dependencies

- `AGENTS.md`
- `docs/README.md`
- `docs/templates/Architecture_Document_Template.md`
- `docs/00_Project/Vision.md`
- `docs/01_Game_Design/Gameplay/Gameplay.md`
- `docs/01_Game_Design/Gameplay/GP6_Gameplay_Feedback.md`
- `docs/02_Design_System/LLDL/LLDL.md`
- `docs/02_Design_System/LLDL/WS5_Motion_Language.md`
- `docs/02_Design_System/LLDL/WS9_Accessibility_Language.md`
- `docs/07_UI/UI_00_Design_Principles.md`
- `docs/07_UI/UI_01_UI_Philosophy.md`
- `docs/07_UI/UI_02_Layout_System.md`
- `docs/07_UI/UI_03_Gameplay_Screen_Specification.md`
- `docs/07_UI/UI_04_Design_Tokens.md`
- `docs/07_UI/UI_05_Component_Library.md`

### Assumptions

- WS5 remains the motion authority within LLDL, while this document governs UI-specific motion behavior downstream of that authority
- `docs/07_UI/UI_04_Design_Tokens.md` defines motion semantics and role categories, while this document defines how those semantics behave architecturally
- Future implementation may split one architectural motion pattern into multiple code-level transitions without changing its governed purpose
- Motion should stay subordinate to gameplay comprehension, not the other way around

## Downstream Documents

- `docs/07_UI/UI_07_Responsive_Guidelines.md`
- `docs/07_UI/UI_08_Asset_Integration.md`
- Future implementation-facing motion work in `lib/design_system/` and screen presentation layers
- Future applied screen refinements that must inherit this motion architecture

## Related Documents

- `docs/07_UI/README.md`
- `docs/07_UI/UI_03_Gameplay_Screen_Specification.md`
- `docs/07_UI/UI_04_Design_Tokens.md`
- `docs/07_UI/UI_05_Component_Library.md`
- `docs/07_UI/UI_07_Responsive_Guidelines.md`
- `docs/07_UI/UI_08_Asset_Integration.md`
- `docs/02_Design_System/LLDL/WS5_Motion_Language.md`
- `docs/02_Design_System/LLDL/WS9_Accessibility_Language.md`

## Authority

### Governs

- UI-specific motion behavior and transition intent
- How interface motion is prioritized, layered, and restrained
- How feedback, overlays, actions, and state changes move across the UI
- What future implementation must preserve when animating canonical components and screens

### Does Not Govern

- Raw token values or motion timing catalogs
- Gameplay rules, state resolution, or engine execution
- Character animation systems beyond their UI-facing interpretive implications
- Responsive layout adaptation rules owned by `docs/07_UI/UI_07_Responsive_Guidelines.md`
- Asset file creation or art production owned by the Asset Bible

### Conflict Resolution

`docs/02_Design_System/LLDL/WS5_Motion_Language.md` remains the upstream motion authority. `docs/07_UI/UI_01_UI_Philosophy.md`, `docs/07_UI/UI_02_Layout_System.md`, `docs/07_UI/UI_03_Gameplay_Screen_Specification.md`, `docs/07_UI/UI_04_Design_Tokens.md`, and `docs/07_UI/UI_05_Component_Library.md` remain higher or adjacent authorities for interface feel, layout, gameplay-screen behavior, semantic motion categories, and reusable component behavior.

This document extends those authorities into **UI motion architecture**.

If a conflict exists:

- preserve WS5 motion temperament and WS9 accessibility requirements
- preserve gameplay readability and board dominance before animation flourish
- preserve higher UI-architecture behavior over implementation preference
- record the conflict in the review package before downstream work continues

## Architectural Position

This document translates the UI architecture stack in the following order:

```text
Gameplay Screen Specification
    ↓
Component Library
    ↓
Animation System
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
Animation System
    ↓
Implementation
```

| Layer | Role |
|-------|------|
| **Gameplay Screen Specification** | Defines when states and phase changes happen |
| **Design Tokens** | Define semantic motion families and emphasis roles |
| **Component Library** | Defines which reusable elements move and why |
| **Animation System** | Defines how motion behaves across those elements consistently |
| **Implementation** | Turns governed motion behavior into code |

This document is where motion becomes a reusable architectural behavior instead of a per-screen flourish.

## Motion Philosophy

Motion in Labyrinth Legends UI should feel:

- calm
- deliberate
- readable
- premium
- supportive
- phase-aware
- emotionally disciplined

Motion is not decoration. It is **timed explanation**.

Good UI motion should:

- help the player notice what changed
- reinforce hierarchy without shouting
- clarify action, consequence, and resolution
- preserve stillness when stillness improves understanding
- allow ceremonial emphasis only at earned moments

The interface should never appear restless just because motion is available.

## Motion Hierarchy

When multiple motion candidates compete, priority should be resolved in this order:

1. gameplay-critical consequence or state clarity
2. primary action or commitment change
3. overlay or interruption entry/exit
4. objective or progress emphasis
5. secondary support transitions
6. ambient decorative or atmospheric motion

This hierarchy means:

- one strong motion signal is better than many simultaneous ones
- secondary HUD motion must defer to gameplay-critical changes
- ambient motion should quiet itself around important state changes
- reward motion must never overpower consequence comprehension

## Transition Rules

Transitions should follow these architectural rules:

- enter clearly
- settle quickly
- avoid bouncing, jitter, or theatrical exaggeration
- preserve spatial orientation between states
- avoid obscuring the board longer than needed
- support the current phase instead of competing with it

Transition intensity should scale with significance:

- small state changes receive restrained acknowledgment
- phase changes receive clearer structural transition
- major outcomes may receive brief ceremonial emphasis
- all transitions must release back to calm

Stillness is a valid transition strategy when it improves understanding.

## Gameplay Feedback Motion

Gameplay feedback motion exists to answer:

- what changed?
- what mattered?
- what should the player understand now?

Gameplay feedback motion should support:

- path planning feedback
- invalid path / blocked planning cues
- commitment acknowledgment
- execution consequence visibility
- objective progress clarity
- success and failure explanation

Feedback motion should:

- teach once, then quiet down
- remain subordinate to the board
- avoid stacking with too many simultaneous signals
- remain multichannel rather than motion-only

Gameplay feedback motion communicates outcomes. It does not decide them.

## Motion Categories

Canonical motion behavior should be grouped into these categories:

| Category | Purpose | Typical Use |
|----------|---------|-------------|
| **Ambient Motion** | Low-intensity environmental or magical UI life | Quiet portal glows, subtle support-surface breathing |
| **Structural Transition Motion** | State-to-state or screen-to-screen movement of interface structure | Screen entry, modal appearance, HUD reduction or restoration |
| **Interaction Motion** | Immediate confirmation of touch, focus, or selection | Button acknowledgment, selection response, hint open/close |
| **Gameplay Guidance Motion** | Clarifies planning, blocked states, or objective relevance | Path preview, invalid-path response, objective emphasis |
| **Feedback Motion** | Communicates consequence or status clearly | Warning, confirmation, error, completion acknowledgment |
| **Resolution Motion** | Handles pause, victory, failure, and result surfaces | Reward reveal, failure arrival, pause opening |
| **Ceremonial Motion** | Rare, earned, identity-rich emphasis | Milestone rewards, major completion, brand entry moments |

Every motion pattern should fit one of these categories rather than inventing a private screen dialect.

## Motion Ownership

Motion ownership should stay clear:

| Layer | Owns |
|------|------|
| **Screen architecture** | Phase transitions, visibility changes, hierarchy shifts |
| **Component architecture** | Reusable motion responsibilities tied to canonical components |
| **Token semantics** | Motion role naming and emphasis intent |
| **Implementation** | The concrete animation mechanism, sequencing details, and technical realization |

Motion must never be owned implicitly by a visual asset or code convenience alone.

A component may own:

- how it enters
- how it updates
- how it recedes

It must not own:

- gameplay truth
- outcome timing independent of state authority
- parallel motion rules that contradict system-wide behavior

## Animation Lifecycle

UI motion should follow a readable lifecycle:

1. **Trigger**  
   A meaningful change in state, visibility, action, or hierarchy occurs.

2. **Onset**  
   Motion begins clearly enough to establish what changed.

3. **Travel**  
   The motion communicates structure, consequence, or acknowledgment.

4. **Settlement**  
   The motion resolves into a stable readable state.

5. **Release**  
   Attention returns to the appropriate resting hierarchy, usually the board or next meaningful action.

Motion that never settles becomes noise.

## Animation Priorities

When performance, clarity, or screen pressure requires trade-offs, sacrifice in this order:

1. decorative ambient motion
2. secondary support motion
3. ceremonial flourish
4. non-critical transition richness
5. only then critical explanatory motion

If motion must be simplified, preserve:

- blocked-state clarity
- action acknowledgment
- overlay priority transitions
- success/failure readability

## Accessibility Considerations

Animation accessibility must follow these rules:

- reduced-motion modes must preserve clarity without requiring spectacle
- critical changes must remain understandable without motion alone
- motion should not induce confusion, discomfort, or loss of orientation
- focus and selection changes must remain perceivable in multichannel form
- loading motion must not be the only communication of waiting state
- reward motion must remain compatible with comfort and readability

This document inherits the accessibility principle that comfort outranks spectacle.

## Motion Anti-Patterns

The animation system must avoid:

- constant ambient motion on persistent HUD elements
- bounce, jitter, elastic exaggeration, or arcade-like celebration
- motion that obscures the board during active puzzle play
- simultaneous competing feedback motions
- using motion as the only signal for critical state
- decorative motion that outshines puzzle consequence
- permanent pulsing on controls that are not urgent
- motion that makes the interface feel busier than the gameplay itself
- overlay motion that disorients the player or hides the return path

## Motion Success Criteria

Future reviewers should be able to ask:

- Does motion clarify rather than distract?
- Does gameplay-critical motion outrank decorative motion?
- Does the system preserve board dominance and player orientation?
- Do transitions settle back to calm rather than escalating noise?
- Is reduced-motion compatibility preserved without losing meaning?
- Do feedback and result motions remain multichannel and readable?
- Does motion feel like one coherent system across gameplay, overlays, and navigation?

If the answer to several of these questions is "no," the animation architecture is not yet stable enough for downstream implementation.

## Governance

This document governs **UI motion behavior**, not implementation code.

Downstream work should use this document to justify:

- motion category selection
- transition intensity
- component-level motion responsibilities
- gameplay feedback motion behavior
- accessibility trade-offs in animation design

### Change Rules

- Do not define raw timing values, curves, or APIs here
- Do not introduce motion spectacle that conflicts with WS5 calm temperament
- Do not let decorative motion outrank gameplay comprehension
- Do not create per-screen animation dialects that bypass canonical categories
- Record material conflicts between motion behavior and screen/component architecture in the review package before implementation continues

### Approval Conditions

- The document must remain aligned with `docs/02_Design_System/LLDL/WS5_Motion_Language.md`
- The document must remain aligned with `docs/07_UI/UI_01_UI_Philosophy.md`
- The document must remain aligned with `docs/07_UI/UI_03_Gameplay_Screen_Specification.md`
- The document must remain aligned with `docs/07_UI/UI_04_Design_Tokens.md`
- The document must remain aligned with `docs/07_UI/UI_05_Component_Library.md`
- Downstream implementation should map motion behavior back to these governed categories and priorities

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

This document establishes the canonical motion architecture for Labyrinth Legends and successfully completes the behavioral specification for UI animation without introducing implementation detail.

The document consistently treats motion as an architectural communication system rather than a visual effect. Motion is governed through hierarchy, ownership, lifecycle, and accessibility principles that align with the project's UI philosophy and gameplay-first design approach.

### Architecture Notes

The strongest architectural decisions include:

- Motion is defined as a communication tool rather than decoration.
- Clear ownership boundaries separate architectural behavior from implementation.
- Motion hierarchy ensures gameplay clarity always outranks visual flourish.
- Lifecycle definitions provide a reusable model for all future interface motion.
- Accessibility remains a first-class architectural concern rather than an implementation afterthought.
- The document remains fully aligned with the approved UI philosophy, gameplay screen specification, semantic design tokens, and reusable component architecture.

This document provides an excellent foundation for future implementation while preserving long-term consistency across the UI system.

### Recommendations

- Future implementation should derive concrete animation timing and easing from this architecture rather than embedding motion behavior directly into widgets.
- Any new animation pattern introduced during M2 should first be validated against the motion categories and hierarchy defined in this document.
- Continue preserving the distinction between motion architecture and implementation throughout future documentation.

### Approval Notes

Approved as Version 1.0.0.

This document becomes the canonical animation architecture reference for all future UI implementation within Labyrinth Legends.

## Revision History

| Version | Date | Author | Notes |
|---------|------|--------|-------|
| Draft v1 | 2026-07-04 | Cursor | Initial draft of the UI animation-system architecture document for M1.8 |
| 1.0.0 | 2026-07-04 | Apoorv / ChatGPT | Approved after architecture review |
