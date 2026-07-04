# UI 08 - Asset Integration

| Field | Value |
|-------|-------|
| **Document ID** | LLDS-DOC-07-UI-008 |
| **Version** | 1.0.0 |
| **Status** | Approved |
| **Owner** | Apoorv |
| **Last Updated** | 2026-07-04 |
| **Domain** | UI Architecture |
| **Related Milestone** | M1.8 - UI Architecture & Design System |
| **Canonical Path** | `docs/07_UI/UI_08_Asset_Integration.md` |
| **Related Documents** | `docs/07_UI/UI_00_Design_Principles.md` · `docs/07_UI/UI_01_UI_Philosophy.md` · `docs/07_UI/UI_02_Layout_System.md` · `docs/07_UI/UI_03_Gameplay_Screen_Specification.md` · `docs/07_UI/UI_04_Design_Tokens.md` · `docs/07_UI/UI_05_Component_Library.md` · `docs/07_UI/UI_06_Animation_System.md` · `docs/07_UI/UI_07_Responsive_Guidelines.md` |

## Purpose

This document defines how **visual assets integrate into UI architecture** for Labyrinth Legends.

It explains how icons, illustrations, backgrounds, decorative surfaces, and gameplay-adjacent asset usage should be governed inside the interface so that the UI remains coherent with LLDL, the Asset Bible, the approved gameplay-screen architecture, and the reusable component library.

This document exists so future UI work can answer a consistent question:

> **How should approved visual assets enter the interface in a way that strengthens clarity, identity, and hierarchy without becoming ungoverned decoration?**

This document does **not** define engine asset loading implementation, texture compression, code, or platform-specific memory management.

## Scope

### In Scope

- Asset philosophy for UI integration
- Asset ownership boundaries between UI, gameplay-world, and public-brand domains
- Rules for UI use of icons, illustrations, backgrounds, decorative assets, and gameplay-adjacent assets
- Layering and visibility expectations for assets inside UI surfaces
- Architectural loading behavior and memory-awareness guidance
- Asset lifecycle, consistency, and governance within the UI architecture layer
- Review criteria for downstream implementation and art integration

### Out of Scope

- Asset creation pipelines, export settings, naming syntax, or production tooling
- Engine asset-loading systems, texture compression, or code
- Raw implementation memory budgets
- Gameplay rule changes or engine behavior
- Marketing/store asset governance owned outside the in-product UI domain

## Intended Audience

- UI architecture authors in `docs/07_UI/`
- Designers integrating approved assets into screens and components
- Artists and technical artists mapping Asset Bible outputs into UI use
- Implementers turning UI asset rules into code and packaging choices
- Reviewers validating asset clarity, hierarchy, and consistency

## Dependencies

### Upstream Dependencies

- `AGENTS.md`
- `docs/README.md`
- `docs/templates/Architecture_Document_Template.md`
- `docs/00_Project/Vision.md`
- `docs/01_Game_Design/Gameplay/Gameplay.md`
- `docs/02_Design_System/LLDL/LLDL.md`
- `docs/02_Design_System/LLDL/WS8_Iconography_Language.md`
- `docs/02_Design_System/LLDL/WS9_Accessibility_Language.md`
- `docs/06_Asset_Bible/Asset_Bible.md`
- `docs/06_Asset_Bible/AB3_UI_Brand_Assets.md`
- `docs/07_UI/UI_00_Design_Principles.md`
- `docs/07_UI/UI_01_UI_Philosophy.md`
- `docs/07_UI/UI_02_Layout_System.md`
- `docs/07_UI/UI_03_Gameplay_Screen_Specification.md`
- `docs/07_UI/UI_04_Design_Tokens.md`
- `docs/07_UI/UI_05_Component_Library.md`
- `docs/07_UI/UI_06_Animation_System.md`
- `docs/07_UI/UI_07_Responsive_Guidelines.md`

### Assumptions

- The Asset Bible remains the production authority for asset creation and lifecycle, while this document governs how approved assets are used inside UI architecture
- In-maze gameplay-world assets remain distinct from UI chrome and overlays even when both are visible on the gameplay screen
- Asset integration includes when and where assets appear, not only which asset files exist
- Memory considerations in this document remain architectural and prioritization-focused, not implementation-budget definitions

## Downstream Documents

- Future implementation-facing UI asset and presentation work in `lib/design_system/` and feature presentation layers
- Future screen refinements that must preserve governed asset roles and layering

## Related Documents

- `docs/07_UI/README.md`
- `docs/07_UI/UI_03_Gameplay_Screen_Specification.md`
- `docs/07_UI/UI_04_Design_Tokens.md`
- `docs/07_UI/UI_05_Component_Library.md`
- `docs/07_UI/UI_06_Animation_System.md`
- `docs/07_UI/UI_07_Responsive_Guidelines.md`
- `docs/06_Asset_Bible/Asset_Bible.md`
- `docs/06_Asset_Bible/AB3_UI_Brand_Assets.md`
- `docs/02_Design_System/LLDL/WS8_Iconography_Language.md`

## Authority

### Governs

- How approved assets are integrated into UI architecture and reusable component surfaces
- Asset-role boundaries within UI layers such as HUD, overlays, backgrounds, and support chrome
- Layering, prominence, and contextual use of UI-facing assets
- What implementation must preserve when placing, scaling, and presenting assets inside UI

### Does Not Govern

- Asset creation workflow or source-art production
- Engine asset loading implementation or memory code
- Marketing/store asset treatment outside in-product UI authority
- Gameplay-world asset behavior that belongs to in-maze presentation rather than UI chrome
- Token values, component APIs, or layout breakpoints

### Conflict Resolution

`docs/06_Asset_Bible/Asset_Bible.md` and AB3 remain the asset-production and in-product brand authorities. `docs/02_Design_System/LLDL/WS8_Iconography_Language.md` remains the iconography authority. `docs/07_UI/UI_03_Gameplay_Screen_Specification.md`, `docs/07_UI/UI_05_Component_Library.md`, `docs/07_UI/UI_06_Animation_System.md`, and `docs/07_UI/UI_07_Responsive_Guidelines.md` remain higher or adjacent authorities for gameplay-screen behavior, canonical components, motion, and adaptation.

This document extends those authorities into **UI asset integration behavior**.

If a conflict exists:

- preserve Asset Bible ownership and domain boundaries first
- preserve clarity and gameplay hierarchy before decorative richness
- preserve iconography and accessibility authorities before visual novelty
- record the conflict in the review package before downstream implementation continues

## Architectural Position

This document translates the UI architecture stack in the following order:

```text
Component Library + Responsive Guidelines + Animation System
    ↓
Asset Integration
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
Animation System + Responsive Guidelines
    ↓
Asset Integration
    ↓
Implementation
```

| Layer | Role |
|-------|------|
| **Gameplay Screen Specification** | Defines where asset-bearing UI appears and what it must communicate |
| **Design Tokens** | Define semantic roles for visual emphasis and state |
| **Component Library** | Defines which reusable UI surfaces may carry assets |
| **Animation / Responsive** | Define how assets move and adapt across contexts |
| **Asset Integration** | Defines how approved assets enter those surfaces coherently |
| **Implementation** | Turns those rules into code and runtime behavior |

This document is where approved visual material becomes governed UI presence.

## Asset Philosophy

Assets in the interface should feel like **architectural extensions of the temple**, not stickers placed on top of a generic application shell.

UI asset integration should:

- reinforce meaning before decoration
- protect readability before spectacle
- strengthen atmosphere without competing with gameplay
- preserve a single civilization identity across gameplay, meta-game, and system surfaces
- remain sparse enough that the board and key actions still dominate when they should

An asset should enter the UI because it clarifies role, supports identity, or improves emotional pacing, not because a surface looked empty.

## Asset Ownership

Asset ownership boundaries must remain explicit.

| Domain | Owns | Does Not Own |
|--------|------|--------------|
| **AB2 Game Assets** | In-maze visuals, puzzle devices, world collectibles, world feedback objects | UI chrome, pause frames, HUD icons, system overlays |
| **AB3 UI & Brand Assets** | HUD chrome, menu framing, splash/loading surfaces, in-product brand identity, overlay shells | In-maze world objects, public marketing assets |
| **UI Architecture (`docs/07_UI/`)** | How approved assets are used inside screens, components, layering, and interaction hierarchy | Asset production pipelines, file exports, source creation |
| **AB4 Marketing & Store** | Public brand and off-device presentation | In-product UI authority |

When an element could belong to both world and UI:

- if it is part of the maze and read as world truth, it belongs to game-asset authority
- if it is part of chrome, overlay, guidance, or menu communication, it belongs to UI/brand authority

## Icons

Icons in UI integration must inherit WS8 directly.

Rules:

- functional icons communicate action, state, or status clearly
- ceremonial icons are reserved for milestone, reward, or identity-rich moments
- icons must support, not replace, readability
- HUD icons remain functional first
- critical actions must not rely on glyph-only meaning

Integration guidance:

- place functional icons where scan speed matters
- use ceremonial frames or glyph richness only when the context is truly celebratory or identity-bearing
- avoid mixing too many symbolic styles in one surface
- preserve a stable icon family for the same meaning across screens

## Illustrations

Illustrations in UI should serve:

- scene framing
- emotional pacing
- guided context
- celebratory or narrative support

They should not:

- overwhelm decision-making surfaces
- turn utility screens into posters
- compete with gameplay-critical information

Illustrative assets work best when they establish mood or support a state transition, then recede behind the interface structure.

## Backgrounds

Background assets should provide atmosphere and structural grounding without weakening foreground clarity.

Rules:

- backgrounds support the screen; they do not become the main event when interaction is active
- gameplay backgrounds must preserve board readability
- menu and progression backgrounds may carry more atmospheric presence, but still must protect text and navigation clarity
- backgrounds should harmonize with the same world identity across all UI surfaces

Background treatment should always remain subordinate to content and action hierarchy.

## Decorative Assets

Decorative assets include:

- ornamental frames
- engraved motifs
- seal accents
- edge treatment
- atmospheric support marks

Decorative assets should:

- reinforce identity
- clarify tier or significance when useful
- remain quieter near interactive targets
- avoid crowding active gameplay surfaces

Decoration is a support language, not a substitute for structure.

## Gameplay Assets

Gameplay-adjacent assets in UI must respect the boundary between **world truth** and **chrome support**.

Rules:

- the board, explorer, hazards, and in-maze interactables are not UI decorative assets
- UI may frame or reveal gameplay information, but must not visually re-own the maze
- gameplay-support icons and counters should remain clearly separate from world objects
- world assets should not be reskinned as HUD just to force consistency

The gameplay screen must continue to feel like a chamber being observed, not a themed dashboard.

## Layering

Asset layering in UI should follow this priority:

1. gameplay/world readability
2. critical text and action clarity
3. component structure and support surfaces
4. atmospheric and decorative integration

Layering rules:

- decorative assets must sit behind meaning-bearing content unless the moment is explicitly ceremonial
- modal and overlay assets must preserve content focus, not produce visual clutter
- reward assets may gain emphasis, but must still preserve actionable clarity
- iconographic emphasis should not compete with objective or action clarity on active gameplay screens

## Loading Behavior

UI asset loading behavior, architecturally, should feel:

- calm
- honest
- readable
- non-chaotic

Loading states should:

- preserve structural continuity where possible
- avoid sudden empty collapses when assets are unavailable momentarily
- use loading overlays or placeholders that respect the same interface identity
- never depend on animated spectacle alone to explain waiting

Detailed loading implementation belongs outside this document, but its architectural behavior must remain premium and restrained.

## Memory Considerations

Memory considerations in this document are architectural only.

Guiding principles:

- prioritize assets that are necessary for comprehension over those that are purely decorative
- favor reusable asset families over unique one-off flourishes on every screen
- avoid asset dependency chains that make critical UI meaning fragile
- ensure fallback states remain understandable if richer assets are unavailable or delayed

Architectural memory-awareness means the interface should still remain coherent when richness is reduced.

## Asset Lifecycle

UI asset lifecycle should follow this path:

1. **Authority identified**  
   Confirm whether the asset belongs to world, UI/brand, or public-brand ownership.

2. **Asset approved**  
   Asset Bible and relevant LLDL/brand review are satisfied.

3. **UI integration defined**  
   This document and related `docs/07_UI/` authorities determine where and how the asset appears.

4. **Implementation applied**  
   Code integrates the asset according to screen, component, responsive, and motion rules.

5. **Review and maintenance**  
   Later revisions preserve semantic consistency and domain boundaries.

This lifecycle keeps UI asset integration architectural rather than opportunistic.

## Asset Consistency

Asset consistency should be evaluated across:

- symbolic language
- material identity
- ornamental density
- color-role alignment
- gameplay vs chrome boundaries
- state and milestone expression

Consistency means the player should feel one civilization, one interface language, and one tone across screens.

## Asset Governance

UI asset integration should use this governance logic:

- if the asset changes meaning, check LLDL and WS8
- if the asset changes UI structure or presence, check `docs/07_UI/`
- if the asset changes production ownership or lifecycle, check the Asset Bible
- if the asset affects gameplay readability, preserve gameplay and accessibility authorities first

Asset integration decisions should never be made from aesthetics alone.

## Asset Anti-Patterns

The asset-integration layer must avoid:

- decorative assets covering or competing with gameplay
- glyph-only critical actions
- world assets reused as chrome without clear boundary logic
- ceremonial icon richness on persistent gameplay HUD
- loading experiences that depend on spectacle instead of clarity
- asset layering that buries text or touch targets
- one-off screen asset dialects that break civilization consistency
- integrating assets without clear ownership or authority
- using large decorative assets to justify persistent noise on larger devices

## Asset Success Criteria

Future reviewers should be able to ask:

- Do assets clarify role and identity instead of merely decorating space?
- Are world assets and UI chrome assets kept in the correct ownership domains?
- Do icons remain readable, consistent, and appropriately functional or ceremonial?
- Do backgrounds and decorative assets preserve interaction clarity?
- Does gameplay remain visually primary on gameplay screens?
- Do loading and fallback states remain calm and comprehensible?
- Do asset choices remain consistent with responsive, motion, and component authorities?

If the answer to several of these questions is "no," the asset-integration architecture is not stable enough for downstream implementation.

## Governance

This document governs **UI asset integration behavior**, not asset production or code.

Downstream work should use this document to justify:

- whether an asset belongs in a given UI surface
- how strong or restrained an asset presence should be
- how assets layer around gameplay, components, and overlays
- how iconographic and decorative systems remain consistent
- how asset loading and fallback behavior should feel architecturally

### Change Rules

- Do not define engine loading implementation, memory budgets, or compression detail here
- Do not allow decorative assets to override gameplay clarity or action hierarchy
- Do not blur the AB2/AB3 boundary for convenience
- Do not create isolated asset dialects per screen or device class
- Record material ownership or integration conflicts in the review package before downstream implementation continues

### Approval Conditions

- The document must remain aligned with `docs/06_Asset_Bible/Asset_Bible.md`
- The document must remain aligned with `docs/06_Asset_Bible/AB3_UI_Brand_Assets.md`
- The document must remain aligned with `docs/07_UI/UI_03_Gameplay_Screen_Specification.md`
- The document must remain aligned with `docs/07_UI/UI_05_Component_Library.md`
- The document must remain aligned with `docs/07_UI/UI_06_Animation_System.md`
- The document must remain aligned with `docs/07_UI/UI_07_Responsive_Guidelines.md`
- Downstream implementation should map asset presence back to these ownership and layering rules

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

This document successfully establishes the canonical UI asset-integration architecture for Labyrinth Legends. It defines how approved visual assets enter the interface while preserving the authority of the Asset Bible, LLDL, iconography language, gameplay screen specification, component library, animation system, and responsive guidelines.

The document correctly treats assets as governed architectural material rather than decoration. It protects gameplay readability, preserves the distinction between world assets and UI chrome, and gives future implementation a clear framework for integrating icons, illustrations, backgrounds, decorative motifs, loading states, and gameplay-adjacent visuals.

### Architecture Notes

The strongest architectural decisions include:

- Clear ownership boundaries between AB2 game assets, AB3 UI/brand assets, UI architecture, and AB4 marketing/store assets.
- Strong distinction between world truth and UI chrome, especially on the gameplay screen.
- Asset layering priorities that preserve gameplay readability before decorative richness.
- Icon guidance that inherits from WS8 while reinforcing accessibility and functional clarity.
- Architectural loading and fallback guidance that keeps the interface calm and coherent when richer assets are unavailable.
- Memory-awareness guidance that remains architectural rather than implementation-specific.
- Anti-patterns that prevent decoration, asset dialect drift, glyph-only critical actions, and visual clutter.

The document remains fully aligned with the approved `docs/07_UI` stack and completes the remaining UI behavior/support layer together with Animation System and Responsive Guidelines.

### Recommendations

- Future implementation should map all UI-facing asset usage back to the ownership and layering rules defined here.
- New UI asset categories should be added only after confirming whether the authority belongs to the Asset Bible, LLDL, or `docs/07_UI`.
- Gameplay-world assets should not be reused as UI chrome unless the boundary and intent are explicitly documented.
- Future review packages should call out any asset ownership conflicts before implementation proceeds.
- Public marketing/store assets should remain outside this document unless they become in-product UI assets.

### Approval Notes

Approved as Version 1.0.0.

This document becomes the canonical UI asset-integration architecture reference for all future Labyrinth Legends UI implementation.

## Revision History

| Version | Date | Author | Notes |
|---------|------|--------|-------|
| Draft v1 | 2026-07-04 | Cursor | Initial draft of the UI asset-integration architecture document for M1.8 |
| 1.0.0 | 2026-07-04 | Apoorv / ChatGPT | Approved after architecture review |
