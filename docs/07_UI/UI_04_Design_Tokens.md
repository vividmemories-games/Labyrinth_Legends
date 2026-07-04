# UI 04 - Design Tokens

| Field | Value |
|-------|-------|
| **Document ID** | LLDS-DOC-07-UI-004 |
| **Version** | 1.0.0 |
| **Status** | Approved |
| **Owner** | Apoorv |
| **Last Updated** | 2026-07-04 |
| **Domain** | UI Architecture |
| **Related Milestone** | M1.8 - UI Architecture & Design System |
| **Canonical Path** | `docs/07_UI/UI_04_Design_Tokens.md` |
| **Related Documents** | `docs/07_UI/UI_00_Design_Principles.md` · `docs/07_UI/UI_01_UI_Philosophy.md` · `docs/07_UI/UI_02_Layout_System.md` · `docs/07_UI/UI_03_Gameplay_Screen_Specification.md` · `docs/02_Design_System/Design_Tokens.md` |

## Purpose

This document defines the **semantic design-token architecture** for Labyrinth Legends UI.

It explains how token meaning should be categorized, named, governed, and applied across future UI specifications so that implementation can remain consistent with LLDL, gameplay clarity, and the approved `docs/07_UI/` stack.

This document exists so future UI work can answer a consistent question:

> **How should design decisions be expressed as reusable UI meaning without collapsing into raw values, one-off styling, or screen-specific invention?**

This document does **not** define final Flutter constants, widget APIs, raw numeric values, or replacement token catalogs when those already exist upstream.

## Scope

### In Scope

- Semantic token architecture for Labyrinth Legends UI
- Token categories and how they relate to approved upstream token authorities
- Rules for applying color, typography, spacing, shape, depth, motion, and icon semantics in future UI documents
- Naming principles for future UI-facing token systems
- Usage rules and review criteria for downstream UI specifications
- Gameplay-screen token needs inherited from `docs/07_UI/UI_03_Gameplay_Screen_Specification.md`

### Out of Scope

- Replacing canonical token values already defined in `docs/02_Design_System/Design_Tokens.md`
- Defining new raw hex values, spacing numbers, font sizes, radii, or durations unless approved upstream
- Flutter implementation detail, token classes, or code constants
- Component APIs, widget structure, or final component styling
- Gameplay rules, path validation logic, objective logic, or engine architecture

## Intended Audience

- UI architecture authors in `docs/07_UI/`
- Designers writing future component, animation, responsive, and asset-integration specifications
- Reviewers validating token consistency against LLDL and gameplay readability
- AI agents extending UI documentation without inventing parallel styling systems
- Implementers translating approved token semantics into later design-system code

## Dependencies

### Upstream Dependencies

- `AGENTS.md`
- `docs/README.md`
- `docs/templates/Architecture_Document_Template.md`
- `docs/02_Design_System/LLDL/LLDL.md`
- `docs/02_Design_System/Design_Tokens.md`
- `docs/02_Design_System/Components.md`
- `docs/06_Asset_Bible/Asset_Bible.md`
- `docs/07_UI/README.md`
- `docs/07_UI/UI_00_Design_Principles.md`
- `docs/07_UI/UI_01_UI_Philosophy.md`
- `docs/07_UI/UI_02_Layout_System.md`
- `docs/07_UI/UI_03_Gameplay_Screen_Specification.md`

### Assumptions

- `docs/02_Design_System/Design_Tokens.md` remains the canonical token-value catalog unless a higher-authority design-system document replaces it
- `docs/07_UI/` applies and extends upstream design-system authority for UI architecture, but may not redefine workshop meaning or canonical token values
- Example token names in this document are **architectural illustrations of semantic structure**, not mandatory implementation identifiers
- Detailed animation choreography, responsive adaptation, and asset mapping will be authored in later downstream `docs/07_UI/` documents

## Downstream Documents

- `docs/07_UI/UI_05_Component_Library.md`
- `docs/07_UI/UI_06_Animation_System.md`
- `docs/07_UI/UI_07_Responsive_Guidelines.md`
- `docs/07_UI/UI_08_Asset_Integration.md`
- Future implementation-facing design-system work in `lib/design_system/` and related UI layers

## Related Documents

- `docs/07_UI/README.md`
- `docs/07_UI/UI_00_Design_Principles.md`
- `docs/07_UI/UI_01_UI_Philosophy.md`
- `docs/07_UI/UI_02_Layout_System.md`
- `docs/07_UI/UI_03_Gameplay_Screen_Specification.md`
- `docs/02_Design_System/LLDL/LLDL.md`
- `docs/02_Design_System/Design_Tokens.md`
- `docs/02_Design_System/Components.md`
- `docs/06_Asset_Bible/Asset_Bible.md`

## Authority

### Governs

- The semantic token-application architecture used by downstream UI documents
- How token meaning should be grouped, named, and applied in future UI specifications
- How token usage protects gameplay focus, information hierarchy, and design consistency
- What later UI component, animation, responsive, and asset documents must inherit when they define token-backed behavior

### Does Not Govern

- Canonical token values already owned by `docs/02_Design_System/Design_Tokens.md`
- Design-language meaning already owned by `docs/02_Design_System/LLDL/LLDL.md` and its workshops
- Component family behavior or APIs owned by `docs/02_Design_System/Components.md` and future `docs/07_UI/UI_05_Component_Library.md`
- Layout structure already owned by `docs/07_UI/UI_02_Layout_System.md`
- Gameplay-screen behavior already owned by `docs/07_UI/UI_03_Gameplay_Screen_Specification.md`
- Gameplay rules, outcome logic, and engine architecture

### Conflict Resolution

`docs/02_Design_System/LLDL/LLDL.md` remains the authoritative design-architecture reference. `docs/02_Design_System/Design_Tokens.md` remains the authoritative token-value catalog. `docs/07_UI/UI_00_Design_Principles.md`, `docs/07_UI/UI_01_UI_Philosophy.md`, `docs/07_UI/UI_02_Layout_System.md`, and `docs/07_UI/UI_03_Gameplay_Screen_Specification.md` remain higher-authority UI architecture documents for principles, philosophy, layout, and gameplay-screen behavior.

This document sits downstream of those authorities and translates them into **semantic token-application rules** for future UI work.

If a conflict exists:

- preserve the higher-authority document
- do not override canonical values already defined upstream
- record the mismatch in the relevant review package or governance record
- update upstream authority first if a new canonical token is truly required

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
Animation / Responsive / Asset Integration
    ↓
Implementation
```

| Layer | Role |
|-------|------|
| **UI Principles** | Define non-negotiable decision standards |
| **UI Philosophy** | Define how the interface should feel and guide attention |
| **Layout System** | Define how screen space is structured |
| **Gameplay Screen** | Define how the flagship screen behaves |
| **Design Tokens** | Define semantic material language for later UI specifications |
| **Component Library** | Define reusable token-backed interface building blocks |
| **Animation / Responsive / Asset Integration** | Extend token usage into motion, adaptation, and approved asset use |
| **Implementation** | Translate approved semantics into code |

This document is the bridge between approved screen/layout behavior and the later reusable UI systems that implement that behavior consistently.

## Token Philosophy

Design tokens in Labyrinth Legends should behave as **meaning-bearing UI contracts**, not as convenience buckets for raw values.

The token system should:

- make premium restraint easier than decoration
- protect gameplay-board dominance over UI chrome
- preserve calm, readable information hierarchy
- encode role and intent before appearance
- support consistent reuse across gameplay, meta-game, and utility surfaces
- keep accessibility and multichannel state communication built into the system

Tokens should make the **quiet default** easy and the **loud exception** deliberate.

This means:

- most gameplay surfaces should inherit calm, low-noise token usage
- stronger emphasis should be reserved for decision-critical action, feedback, risk, or resolution
- ceremonial expression should exist, but should remain exceptional rather than baseline
- token structure should prevent feature authors from inventing isolated visual dialects

Examples such as `color.intent.primaryAction` or `space.screen.safeInset` in this document are **semantic architecture examples**. The implementation catalog may expose approved tokens through a different naming API, provided the meaning and governance remain aligned.

## Token Categories

Labyrinth Legends token usage should be understood as a layered system:

| Category | Purpose | Default Consumer | Governance Rule |
|----------|---------|------------------|-----------------|
| **Foundational primitives** | Raw ramps, scales, and base material values | Upstream token system only | Do not reference directly from feature-facing UI specs unless documenting provenance |
| **Semantic tokens** | Role-based meaning such as action, text, feedback, or spacing intent | Default layer for UI architecture and screen/component specs | Preferred authoring layer for `docs/07_UI/` |
| **Component tokens** | Composed token groupings for reusable UI families | `docs/07_UI/UI_05_Component_Library.md` and later implementation | Must inherit semantic meaning; no raw value bypass |
| **Screen / context tokens** | Rare contextual aliases for screen-family behavior | Screen-specific downstream specs when justified | Allowed only when they clarify context without redefining upstream meaning |

For `docs/07_UI/`, the default authoring rule is:

1. inherit upstream meaning
2. reference semantic roles
3. compose component tokens later
4. introduce context tokens only when repeated screen behavior truly requires them

## Color Token Semantics

Color tokens should be named and applied by **intent**, **state**, and **communication role** rather than by hue alone.

Recommended semantic groupings include:

| Semantic family | Purpose | Good examples |
|-----------------|---------|---------------|
| **Surface** | Background, panel, overlay, and recessed material identity | `color.surface.base`, `color.surface.raised`, `color.surface.overlay` |
| **Text** | Primary, secondary, inverse, and muted readability roles | `color.text.primary`, `color.text.supporting`, `color.text.disabled` |
| **Intent / action** | Commitment, support action, magical/energy action, destructive action | `color.intent.primaryAction`, `color.intent.secondaryAction`, `color.intent.danger` |
| **Gameplay state** | Path validity, blocked planning, objective-critical emphasis, interactable state | `color.gameplay.path.active`, `color.gameplay.path.invalid`, `color.gameplay.objective.focus` |
| **Feedback** | Success, warning, error, completion, interruption | `color.feedback.success`, `color.feedback.warning`, `color.feedback.error` |
| **Reward / ceremonial** | Victory, reveal, special acknowledgment, relic-like emphasis | `color.ceremony.reward`, `color.ceremony.unlock` |
| **Focus / accessibility** | Focus rings, target cues, accessible emphasis | `color.accessibility.focus`, `color.accessibility.selection` |

Color usage rules must preserve upstream meaning:

- gold remains the primary commitment/action language
- cyan remains reserved for path, energy, magical route, or related systemic emphasis
- danger colors communicate risk, failure, or destructive action
- success colors communicate confirmation, progress resolution, or positive completion

Future token additions should avoid category collapse such as using the same semantic family for:

- primary commitment
- reward celebration
- ambient decoration
- system warning

The same hue may appear across related tokens, but the token name must communicate **what the color means in the interface**, not merely what it looks like.

## Typography Token Semantics

Typography tokens should define **communication role**, **reading priority**, and **tone**, not implementation size tables in this document.

Recommended semantic groupings include:

| Semantic family | Purpose | Good examples |
|-----------------|---------|---------------|
| **Display / ceremonial** | Rare premium headings, victory surfaces, reveal moments | `type.display.ceremonial`, `type.heading.reward` |
| **Screen title** | Primary screen identity and major structural headers | `type.heading.screen`, `type.heading.section` |
| **Body** | Explanation, objective framing, readable descriptive copy | `type.body.primary`, `type.body.supporting` |
| **Control label** | Buttons, chips, segmented actions, menus | `type.label.action`, `type.label.secondaryAction` |
| **Caption / utility** | Helper text, low-priority status, supporting microcopy | `type.caption.supporting`, `type.caption.meta` |
| **Numeric / progress** | Resource counts, timers, stars, compact indicators | `type.numeric.resource`, `type.numeric.progress` |

Typography semantics should support these architectural behaviors:

- ceremonial type should feel special because it is rare
- gameplay HUD should default to functional readability over decorative flourish
- objectives and decision-critical information should be clear before they are ornamental
- supporting text should recede without becoming illegible
- compact HUD text should remain consistent rather than improvisational

Typography tokens should never become a backdoor for inventing alternate brand voices per screen.

## Spacing Token Semantics

Spacing tokens should encode **structural purpose** rather than raw distance values in this document.

Recommended semantic groupings include:

| Semantic family | Purpose | Good examples |
|-----------------|---------|---------------|
| **Screen boundary** | Safe inset, outer margins, notch-aware structure | `space.screen.safeInset`, `space.screen.edgeMargin` |
| **Zone spacing** | Separation between top context, board, bottom action zone, and support zones | `space.zone.contextGap`, `space.zone.primaryActionGap` |
| **Panel / surface inset** | Internal breathing room for panels, chips, modals, and grouped info | `space.surface.panelInset`, `space.surface.modalInset` |
| **Stack spacing** | Vertical rhythm between grouped content | `space.stack.tight`, `space.stack.section`, `space.stack.ceremonial` |
| **Inline spacing** | Gaps between icons, labels, counters, and compact controls | `space.inline.iconLabel`, `space.inline.controlGap` |
| **Gameplay separation** | Board-to-chrome offset and path/planning clarity spacing | `space.gameplay.boardChromeGap`, `space.gameplay.objectiveOffset` |

Spacing semantics must inherit the board-dominance rule:

- preserve the board before expanding peripheral chrome
- reduce secondary density before compressing the core gameplay stage
- prefer breathable grouping over dense utility packing
- keep primary action zones clear and stable

Spacing tokens should make low-noise layout natural and overpacked layout difficult.

## Radius / Shape Token Semantics

Radius and shape tokens should communicate **material family**, **interaction tone**, and **hierarchy**, not stylistic novelty.

Recommended semantic groupings include:

| Semantic family | Purpose | Good examples |
|-----------------|---------|---------------|
| **Surface shape** | Panels, cards, slabs, modal bodies | `radius.surface.panel`, `radius.surface.modal` |
| **Control shape** | Buttons, chips, segmented actions, icon controls | `radius.control.primary`, `radius.control.compact` |
| **Status shape** | Pills, badges, counters, small status markers | `radius.status.badge`, `radius.status.counter` |
| **Focus / outline shape** | Focus rings, selection plates, highlighted borders | `radius.focus.ring`, `shape.focus.frame` |

Shape semantics should support the Labyrinth Legends identity:

- solid, crafted, temple-like surfaces over generic app-card softness
- clear distinction between major surfaces and compact controls
- stable visual language across gameplay and meta-game
- tactile clarity without cartoon exaggeration

Radius and shape tokens should not drift into a separate visual dialect per feature or screen.

## Elevation / Depth Token Semantics

Depth tokens should communicate **hierarchy**, **material layering**, and **state emphasis** without turning the interface into a floating dashboard.

Recommended semantic groupings include:

| Semantic family | Purpose | Good examples |
|-----------------|---------|---------------|
| **Surface depth** | Base, raised, recessed, modal dominance | `depth.surface.base`, `depth.surface.raised`, `depth.surface.modal` |
| **Action emphasis** | Primary-action prominence and active selection | `depth.action.primary`, `depth.action.selected` |
| **Feedback emphasis** | Success, danger, magical energy, portal glow | `depth.feedback.success`, `depth.feedback.energy`, `depth.feedback.danger` |
| **Focus clarity** | Keyboard/accessibility focus or current-target emphasis | `depth.accessibility.focus` |

Depth usage should follow these rules:

- use depth to clarify priority, not to decorate every surface
- keep gameplay HUD depth quieter than the board's perceived importance
- reserve stronger glow or luminous emphasis for critical, magical, or ceremonial moments
- ensure depth still reads appropriately when motion is reduced

## Motion Token Semantics

Motion tokens should encode **behavioral intent** rather than become a standalone choreography system in this document.

Recommended semantic groupings include:

| Semantic family | Purpose | Good examples |
|-----------------|---------|---------------|
| **Acknowledgment** | Tap, selection, micro-confirmation | `motion.feedback.short`, `motion.feedback.selection` |
| **Transition** | Default UI state changes and panel shifts | `motion.transition.standard`, `motion.transition.emphasis` |
| **Reveal / resolve** | Result, unlock, or ceremonial transitions | `motion.resolve.success`, `motion.resolve.reward` |
| **Gameplay guidance** | Path preview, path invalidation, objective emphasis | `motion.gameplay.pathPreview`, `motion.gameplay.pathBlocked` |
| **Ambient** | Quiet magical loops or subtle environmental UI life | `motion.ambient.energy`, `motion.ambient.portal` |
| **Accessibility** | Reduced-motion substitutions and essential-state fallbacks | `motion.accessibility.reduced`, `motion.accessibility.instant` |

Motion semantics must inherit the approved UI philosophy:

- calm before flashy
- meaningful before decorative
- brief before lingering
- readable before spectacular

Detailed choreography rules belong later in `docs/07_UI/UI_06_Animation_System.md`, but that document must inherit the semantic motion roles defined here.

## Icon / Symbol Token Semantics

Icon and symbol tokens should describe **communication role**, **scale**, and **emphasis level** rather than merely mapping to assets.

Recommended semantic groupings include:

| Semantic family | Purpose | Good examples |
|-----------------|---------|---------------|
| **Size / scale** | Small support icons, standard controls, large feature symbols | `icon.size.supporting`, `icon.size.standard`, `icon.size.feature` |
| **Stroke / density** | Visual weight appropriate to the interface tier | `icon.stroke.standard`, `icon.stroke.emphasis` |
| **Intent** | Objective, system, warning, reward, interactable, magical | `icon.intent.objective`, `icon.intent.warning`, `icon.intent.reward` |
| **State** | Locked, active, disabled, selected, completed | `icon.state.locked`, `icon.state.selected`, `icon.state.completed` |

Symbol semantics should follow these rules:

- icons support comprehension; they do not replace necessary readability
- symbolic language must remain consistent across gameplay and meta-game
- magical symbols should feel ancient and purposeful, not sci-fi or arcade
- icon emphasis should not outrank the board unless the state is truly decision-critical

## Gameplay Screen Token Needs

The gameplay screen defined in `docs/07_UI/UI_03_Gameplay_Screen_Specification.md` introduces token needs that future component and implementation work must support.

| Gameplay-screen concern | Token need | Semantic examples | Architectural expectation |
|-------------------------|------------|-------------------|---------------------------|
| **Board dominance** | Quiet chrome relative to the labyrinth | `color.surface.support`, `space.gameplay.boardChromeGap`, `depth.surface.base` | Support UI must not visually outweigh the board |
| **Planning state** | Clear but calm route-authoring support | `color.gameplay.path.preview`, `motion.gameplay.pathPreview`, `icon.intent.path` | Planning must be legible without becoming noisy |
| **Invalid path / blocked planning** | Immediate correction cues without panic language | `color.gameplay.path.invalid`, `motion.gameplay.pathBlocked`, `color.feedback.warning` | Invalid planning must be clear, not theatrical |
| **Primary action commitment** | Strong but singular commitment emphasis | `color.intent.primaryAction`, `depth.action.primary`, `type.label.action` | Confirm/commit should be obvious without duplicating urgency elsewhere |
| **Objective framing** | Persistent but restrained comprehension support | `type.body.objective`, `color.gameplay.objective.focus`, `space.zone.contextGap` | Objectives should stay readable without dominating the screen |
| **Resource restraint** | Only active-gameplay resource emphasis when relevant | `type.numeric.resource`, `color.text.supporting`, `space.inline.controlGap` | Resources must stay contextual, not dashboard-like |
| **Transient feedback** | Short-lived response tokens for success, failure, and warning | `motion.feedback.short`, `color.feedback.success`, `color.feedback.error` | Feedback should clarify consequence and then recede |
| **Modal states** | Stronger veil, surface, and hierarchy tokens for pause, victory, and failure | `color.surface.overlay`, `depth.surface.modal`, `type.heading.screen` | Modal dominance is allowed only for justified interruptions |
| **Accessibility states** | Focus, selection, and disabled clarity beyond color | `color.accessibility.focus`, `depth.accessibility.focus`, `icon.state.disabled` | Critical states must remain multichannel |

Gameplay-screen token usage should make it easy for future authors to remain consistent with `UI_03` without inventing per-state styling from scratch.

## Token Naming Principles

Token names in UI architecture should follow these principles:

- name by **role**, not by visual description alone
- start with a stable semantic family such as `color`, `type`, `space`, `radius`, `depth`, `motion`, or `icon`
- place the meaning-bearing concept before state-specific variants
- add state or context only when the distinction is behaviorally meaningful
- avoid embedding widget names, platform APIs, or implementation class names
- avoid naming that requires a specific screen to understand a globally reusable role
- use screen/context-specific names only when repeated screen behavior genuinely requires them

Illustrative semantic pattern:

```text
<family>.<domain>.<role>[.<state>][.<context>]
```

Examples of good semantic direction:

- `color.intent.primaryAction`
- `color.feedback.success`
- `space.screen.safeInset`
- `radius.surface.panel`
- `motion.feedback.short`

Examples of bad semantic direction:

- `goldButtonColor`
- `padding16`
- `bigTitleFont`
- `homeScreenGlow`
- `blueMagicThing`

This document governs the **semantic structure** of token names, not the exact implementation syntax of later code catalogs.

## Token Usage Rules

1. Default to **semantic tokens** when authoring future UI documents.
2. Do not invent raw values in `docs/07_UI/` when upstream canonical values already exist.
3. Do not consume foundational primitives directly in screen or feature specifications unless documenting provenance or a governance gap.
4. Compose **component tokens** in `docs/07_UI/UI_05_Component_Library.md`, not ad hoc inside every screen document.
5. Introduce **screen/context tokens** only when a repeated behavioral need cannot be expressed clearly through existing semantic roles.
6. Use stronger emphasis tokens only for decision-critical action, consequence, or justified ceremonial moments.
7. Preserve gameplay-board dominance by keeping support-chrome token usage quieter than core play-space communication.
8. Ensure state communication is multichannel where needed: color, depth, motion, iconography, and text should support one another rather than rely on hue alone.
9. If a canonical token is missing, propose or document the required upstream addition in `docs/02_Design_System/Design_Tokens.md` and the relevant review package before treating it as established authority.
10. Keep token semantics consistent across gameplay, meta-game, and utility surfaces even when expression intensity differs by context.

## Token Anti-Patterns

The token architecture must avoid:

- raw hex values, numeric literals, or one-off visual values inside `docs/07_UI/`
- token names based only on appearance instead of role
- per-screen visual forks that bypass approved semantic roles
- using cyan as a primary commitment/action language
- using reward or ceremonial emphasis as default gameplay HUD treatment
- spacing semantics that normalize crowded chrome around the board
- motion semantics that imply bounce, noise, or arcade energy on critical paths
- icon semantics that replace readability where labels or clearer cues are needed
- token names that encode widgets, code classes, or temporary implementation structure
- token additions that silently override upstream canonical values

## Token Success Criteria

Future reviewers should be able to ask:

- Does the token system describe meaning rather than raw appearance?
- Can downstream UI documents specify styling behavior without inventing raw values?
- Do token families reinforce premium minimalism, calm gameplay focus, and ancient/mystical identity?
- Do gameplay-screen token needs preserve board dominance and low-noise HUD behavior?
- Are gold, cyan, feedback, and ceremonial roles kept distinct and intentional?
- Can component authors build reusable UI language from these semantics without parallel naming systems?
- Do token rules make accessibility, multichannel state communication, and reduced-noise defaults easier?
- Does the document remain clearly downstream of `docs/02_Design_System/Design_Tokens.md` rather than competing with it?

If the answer to several of these questions is "no," the token architecture is not yet stable enough to govern downstream UI work.

## Governance

This document governs **semantic token architecture for UI documents**, not the canonical value catalog itself.

Downstream UI documents should use this document to justify:

- token-family selection
- semantic naming decisions
- distinctions between quiet, functional, and ceremonial emphasis
- gameplay-screen token behavior
- when a contextual token is justified versus when an existing semantic role should be reused

### Change Rules

- Do not add canonical raw values here if those values belong upstream in `docs/02_Design_System/Design_Tokens.md`
- Do not redefine workshop meaning already owned by WS2, WS5, WS7, WS8, WS9, or WS10
- Do not let downstream component or screen docs create parallel token dialects
- Do not introduce Flutter constants, token classes, or widget APIs here
- Record any material token-authority gap in the relevant review package and update the upstream token catalog before treating the new token as canonical

### Approval Conditions

- The document must remain aligned with `docs/02_Design_System/LLDL/LLDL.md`
- The document must remain aligned with `docs/02_Design_System/Design_Tokens.md`
- The document must remain aligned with `docs/07_UI/UI_00_Design_Principles.md`
- The document must remain aligned with `docs/07_UI/UI_01_UI_Philosophy.md`
- The document must remain aligned with `docs/07_UI/UI_02_Layout_System.md`
- The document must remain aligned with `docs/07_UI/UI_03_Gameplay_Screen_Specification.md`
- Downstream UI documents should cite the relevant sections of this document when they define token-backed behavior

## Review Workflow

1. Architecture Draft
2. Editorial Review
3. ChatGPT Product Review
4. Human Approval
5. Lock
6. Repository Publication

## Revision History

| Version | Date | Author | Notes |
|---------|------|--------|-------|
| Draft v1 | 2026-07-04 | Cursor | Initial draft of the UI design-token architecture document for M1.8 |
| 1.0.0 | 2026-07-04 | Apoorv / ChatGPT | Approved after architecture review |
