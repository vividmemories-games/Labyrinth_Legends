# UI 01 - UI Philosophy


| Field                 | Value                                                                                                                                                     |
| --------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Document ID**       | LLDS-DOC-07-UI-001                                                                                                                                        |
| **Version**           | 1.0.0                                                                                                                                                     |
| **Status**            | Approved                                                                                                                                                  |
| **Owner**             | Apoorv                                                                                                                                                    |
| **Last Updated**      | 2026-07-04                                                                                                                                                |
| **Domain**            | UI Architecture                                                                                                                                           |
| **Related Milestone** | M1.8.0 - UI Architecture & Design System                                                                                                                  |
| **Canonical Path**    | `docs/07_UI/UI_01_UI_Philosophy.md`                                                                                                                       |
| **Related Documents** | `docs/07_UI/UI_00_Design_Principles.md` · `docs/07_UI/README.md` · `docs/02_Design_System/LLDL/LLDL.md` · `docs/02_Design_System/LLDL/WS4_UI_Language.md` |


## Purpose

This document defines the **player-facing UI philosophy** for Labyrinth Legends.

It explains how the interface should feel, how it should guide attention, how information should behave, and what kind of experience the interface should create across gameplay, meta-game, and utility surfaces.

This document exists so future UI specifications can answer a consistent question:

> **What should the interface feel like when it is doing its job well?**

This document does **not** define token values, component APIs, screen layouts, animation timings, or platform-specific implementation.

## Scope



### In Scope

- The intended player-facing feel of the interface
- Attention hierarchy and information behavior
- The experiential role of the HUD, overlays, prompts, and actions
- The relationship between interface, atmosphere, and puzzle clarity
- Philosophy-level criteria for future UI specifications and review



### Out of Scope

- Gameplay rules, win/loss logic, or puzzle resolution
- Exact colors, typography, spacing, shapes, or motion timings
- Component specifications and screen layouts
- Asset production workflows
- Engine architecture or implementation detail



## Intended Audience

- UI architecture authors in `docs/07_UI/`
- Designers writing screen or component specifications
- Reviewers validating whether UI work matches Labyrinth Legends identity
- AI agents extending UI documentation without inventing parallel philosophy
- Contributors interpreting how LLDL should feel in player-facing interfaces



## Dependencies



### Upstream Dependencies

- `AGENTS.md`
- `docs/README.md`
- `docs/00_Project/Vision.md`
- `docs/01_Game_Design/Gameplay/Gameplay.md`
- `docs/02_Design_System/LLDL/LLDL.md`
- `docs/02_Design_System/LLDL/WS4_UI_Language.md`
- `docs/02_Design_System/Design_Tokens.md`
- `docs/02_Design_System/Components.md`
- `docs/06_Asset_Bible/Asset_Bible.md`
- `docs/07_UI/README.md`
- `docs/07_UI/UI_00_Design_Principles.md`
- Existing applied screen references in `docs/03_Screens/`



### Assumptions

- `docs/07_UI/` is now the authoritative area for UI architecture and implementation-facing UI specifications
- `docs/03_Screens/` remains an existing applied screen-reference area until later UI documentation explicitly supersedes or absorbs it



## Downstream Documents

- `docs/07_UI/UI_02_Layout_System.md`
- `docs/07_UI/UI_03_Gameplay_Screen_Specification.md`
- `docs/07_UI/UI_04_Design_Tokens.md`
- `docs/07_UI/UI_05_Component_Library.md`
- `docs/07_UI/UI_06_Animation_System.md`
- `docs/07_UI/UI_07_Responsive_Guidelines.md`
- `docs/07_UI/UI_08_Asset_Integration.md`
- Future updates to `docs/03_Screens/*` when those applied specs are revised



## Related Documents

- `docs/07_UI/UI_00_Design_Principles.md`
- `docs/07_UI/README.md`
- `docs/02_Design_System/LLDL/LLDL.md`
- `docs/02_Design_System/LLDL/WS4_UI_Language.md`
- `docs/02_Design_System/Design_Tokens.md`
- `docs/02_Design_System/Components.md`
- `docs/03_Screens/Gameplay.md`
- `docs/03_Screens/Home.md`
- `docs/03_Screens/Victory.md`
- `docs/03_Screens/Pause.md`
- `docs/06_Asset_Bible/Asset_Bible.md`



## Authority



### Governs

- The experiential philosophy of the interface
- How the interface should guide player attention
- How information should appear, recede, and communicate state
- The intended balance between clarity, immersion, restraint, and personality
- The philosophy future UI specifications must inherit



### Does Not Govern

- Design architecture authority already owned by `docs/02_Design_System/LLDL/LLDL.md`
- High-level UI principles already owned by `docs/07_UI/UI_00_Design_Principles.md`
- Token values in `docs/02_Design_System/Design_Tokens.md`
- Component specifications in `docs/02_Design_System/Components.md` or future `docs/07_UI/UI_03_Component_Library.md`
- Screen layouts in `docs/03_Screens/*` or `docs/07_UI/UI_03_Gameplay_Screen_Specification.md`
- Gameplay rules in `docs/01_Game_Design/Gameplay/Gameplay.md`



### Conflict Resolution

`docs/02_Design_System/LLDL/LLDL.md` remains the authoritative design architecture reference. `docs/07_UI/UI_00_Design_Principles.md` remains the authoritative UI principles reference.

This document sits **downstream of UI_00**. It extends UI principles into an experience philosophy for future UI decisions and specifications.

If a conflict exists, follow the hierarchy defined in `AGENTS.md`, `docs/README.md`, and `docs/07_UI/README.md`. Preserve the higher-authority document and report the conflict rather than silently reinterpreting intent.

## Experience Vision

The interface of Labyrinth Legends should feel:

- Premium
- Calm
- Purposeful
- Elegant
- Ancient and mystical
- Immersive
- Clear
- Strategic
- Relaxing but thoughtful
- Exploratory rather than noisy

The interface should **not** feel:

- Arcade-like
- Cluttered
- Aggressive
- Flashy
- Over-instructive
- Ad-driven
- Banner-heavy
- Cheaply "mobile-gamey"

The interface should behave like an **invisible guide**, not a control panel. The player should remember the labyrinth, the puzzle, and the atmosphere more than the HUD.

The UI exists to help the player **read**, **decide**, **commit**, and **understand**. It should not demand attention for its own sake.

The interface should disappear from the player's conscious attention whenever it is no longer actively helping them solve the puzzle.

## Emotional Journey

The intended emotional rhythm of the interface is:

```text
Exploration
    ↓
Observation
    ↓
Planning
    ↓
Commitment
    ↓
Execution
    ↓
Discovery
    ↓
Reward
    ↓
Reflection
```

The interface should support this rhythm rather than flatten it. Different moments may become more present or more restrained, but the emotional sequence should always remain readable:

- exploration and observation should feel spacious
- planning should feel clear and calm
- commitment should feel deliberate
- execution should feel focused rather than noisy
- discovery and reward should feel meaningful without becoming flashy
- reflection should allow the player to understand what happened



## Player Attention Model

The intended attention priority is:

1. World / labyrinth
2. Puzzle state
3. Explorer
4. Objective
5. Current path / action
6. Primary action
7. Secondary HUD
8. Meta information

Future UI specifications must support this hierarchy rather than flatten it.


| Priority | Focus                 | UI obligation                                                           |
| -------- | --------------------- | ----------------------------------------------------------------------- |
| 1        | World / labyrinth     | Keep the playable space visually dominant                               |
| 2        | Puzzle state          | Surface relevant change without obscuring the board                     |
| 3        | Explorer              | Preserve readable execution and position awareness                      |
| 4        | Objective             | Make the current goal understandable without overpowering the scene     |
| 5        | Current path / action | Clarify commitment, validity, or active consequence at the right moment |
| 6        | Primary action        | Keep the next meaningful action obvious when action is required         |
| 7        | Secondary HUD         | Recede unless fairness or comprehension requires visibility             |
| 8        | Meta information      | Stay available without competing with active play                       |


This model means:

- The board must remain more important than chrome
- State communication must be subordinate to gameplay focus
- UI should retreat when it has no decision-critical role
- Multiple equal-loud signals should be treated as a design failure



## Information Philosophy

Information in Labyrinth Legends should be **progressive, contextual, restrained, and legible**.

### Progressive Disclosure

Show what the player needs for the current decision, then allow less critical information to recede.

### Contextual Information

Information should appear in response to the current gameplay phase, interaction moment, or consequence state rather than staying visible permanently "just in case."

### Minimal Persistent HUD

Persistent UI should be the minimum required for orientation, fairness, and confident action. A permanently full dashboard works against the experience.

### Information Density

Prefer fewer high-value elements over many low-value elements.

Empty space is an intentional design tool. Silence is preferable to constant communication when the player already has what they need to think clearly.

### Temporary Prompts

Prompts, overlays, and explanations should be brief, timely, and phase-appropriate. They should help the player continue thinking, not interrupt that thinking with ceremony.

### No Unnecessary Instruction

The interface should not explain what is already clear from the board, the action state, or established patterns. Repetition reduces trust.

### Clear State Feedback

When the interface does communicate, it must explain something the player genuinely needs:

- what is currently possible
- what is currently blocked
- what has changed
- what consequence just occurred



### Avoid Notification Fatigue

Frequent, competing, or decorative messages make the interface feel insecure and noisy. The UI should not narrate every small event.

## Interface Personality

The interface personality should feel like a **crafted temple instrument**:

- quiet in its confidence
- ceremonial only when the moment deserves ceremony
- atmospheric without becoming theatrical
- elegant without becoming ornamental clutter
- supportive without becoming overbearing

The interface should feel as though it was created by the same civilization that built the labyrinth.

In gameplay, personality should come from **restraint**, world coherence, and carefully chosen emphasis.

In meta-game contexts, personality may become more present, but it must still feel like the same civilization. The product should never feel like the labyrinth is one experience and the menus are another.

## Visual Hierarchy Philosophy

Visual hierarchy should express **importance, not decoration**.

This means:

- The board and puzzle state lead during gameplay
- Primary actions are obvious, but not louder than the world
- Secondary controls remain available without competing with critical information
- Decorative treatment supports identity but must never outrank comprehension
- Rewards and completion states may become more ceremonial, but not at the expense of readability

Hierarchy must also stay stable. If every surface behaves like the highest-priority surface, the player loses trust in what matters now.

## Immersion Philosophy

The interface should feel **discovered from the world**, not pasted over it.

Immersion in Labyrinth Legends does not mean hiding all UI. It means ensuring the UI belongs to the same world as the labyrinth:

- it respects the atmosphere
- it does not flatten the sense of place
- it does not turn the chamber into a dashboard
- it does not use generic mobile habits that break tone

The player should feel guided **within** the ruin, not managed from outside it.

Gameplay overlays should therefore be rare, brief, and justified. When the interface dominates for too long, the world stops feeling mysterious.

## Interaction Philosophy

Interaction should feel:

- deliberate
- calm
- readable
- respectful of player intent
- precise without feeling clinical

The interface should support a **scan -> think -> act -> understand** rhythm.

It should not pressure the player into hurried tapping, split-second interpretation, or defensive menu reading. Primary interactions should feel consequential. Secondary interactions should feel supportive. Utility interactions should feel trustworthy and friction-light.

The UI should communicate confidence through clarity, not through urgency theater.

## Cognitive Load Philosophy

Labyrinth Legends should ask the player to think about the **puzzle**, not about the interface.

The interface should reduce unnecessary cognitive load by:

- limiting simultaneous demands on attention
- presenting information in phase-appropriate layers
- reusing stable meanings and patterns
- avoiding verbose explanation where visual or contextual communication is enough
- keeping meta information out of the way during active puzzle reasoning

Thoughtfulness is a goal. Confusion is not.

The UI may support complexity, but it should not present complexity as clutter. A strategic game still needs a calm mental surface.

## Anti-Patterns

The interface must avoid:

- covering the board unnecessarily
- a persistent noisy HUD
- flashing rewards or alerts unrelated to the current decision
- excessive tutorial popups
- multiple competing calls to action on the same surface
- decoration-only animation
- interface layers that feel detached from the world
- generic mobile-app framing that weakens the temple identity
- dense status dashboards during active puzzle play
- constant reminders of information the player already understands
- urgency styling that makes every moment feel equally loud
- interface choices that contradict `docs/07_UI/UI_00_Design_Principles.md`



## Design Success Criteria

Future reviewers should be able to ask:

- Can the player understand the current goal without reading too much?
- Does the board remain visually dominant during active play?
- Does information appear when needed and recede when not needed?
- Does the interface support calm decision-making rather than reactive tapping?
- Does the UI feel consistent with the world, LLDL, and `docs/06_Asset_Bible/Asset_Bible.md`?
- Does the interface avoid contradicting `docs/07_UI/UI_00_Design_Principles.md`?
- Does the player experience feel premium rather than cheap, loud, or trend-driven?
- Are prompts and overlays brief enough to preserve flow?
- Does the interface communicate state clearly without excessive instruction?
- Would a player remember the labyrinth more than the HUD after a session?

If the answer to several of these questions is "no," the UI may still be functional, but it is not yet philosophically aligned with Labyrinth Legends.

## Governance

This document governs **experience philosophy**, not component or layout implementation.

Future UI documents should use this document to justify:

- how much information remains visible
- how strongly a surface should present itself
- when the interface should recede
- how identity and clarity should be balanced

Downstream UI specifications should reference the relevant philosophy sections whenever introducing significant player-facing behavior.

### Change Rules

- Do not add downstream UI specifications that contradict this document without first updating this document through review
- Do not reinterpret premium calm as visual emptiness; clarity and atmosphere must remain balanced
- Do not reinterpret restraint as a reason to hide fairness-critical information
- Do not use this document to override LLDL, Asset Bible, Gameplay, or Engineering Architecture authority



### Approval Conditions

- The document must remain aligned with `docs/07_UI/UI_00_Design_Principles.md`
- The document must remain aligned with `docs/02_Design_System/LLDL/LLDL.md` and `docs/02_Design_System/LLDL/WS4_UI_Language.md`
- The document must not introduce mechanics, layout specs, component APIs, or token values
- Downstream UI documents should cite this philosophy when making materially player-facing choices



## Review Workflow

1. Architecture Draft
2. Editorial Review
3. Architecture Review
4. Human Approval
5. Lock
6. Repository Publication



## Revision History


| Version  | Date       | Author | Notes                                                                                                                                                                                               |
| -------- | ---------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 0.1.0    | 2026-07-04 | Cursor | Initial draft of the UI philosophy architecture document for M1.8                                                                                                                                   |
| Draft v1 | 2026-07-04 | Cursor | Incorporated ChatGPT architecture review: metadata cleanup, experience-vision refinement, information-density guidance, emotional journey, governance note, and repository-standard review workflow |
| 1.0.0    | 2026-07-04 | Apoorv / ChatGPT | Approved after architecture review |

