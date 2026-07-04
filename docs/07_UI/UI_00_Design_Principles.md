# UI 00 --- Design Principles

  Field            Value
  ---------------- -----------------------------------------
  Status           Draft v2
  Phase            M1.8 -- UI Architecture & Design System
  Milestone        M1.8.0
  Category         UI Architecture
  Canonical Path   `docs/07_UI/UI_00_Design_Principles.md`

## Purpose

This document defines the **guiding principles** for user interface
design in **Labyrinth Legends**.

It establishes the decision-making framework used by downstream UI
documents. It does **not** define concrete layouts, components, design
tokens, animations, or implementation details.

## Scope

This document governs:

-   UI design principles
-   Visual decision priorities
-   Interaction philosophy
-   Long-term UI consistency

This document does **not** govern:

-   Gameplay rules (see `docs/01_Game_Design/Gameplay/Gameplay.md`)
-   Overall design architecture (see
    `docs/02_Design_System/LLDL/LLDL.md`)
-   Asset production (see `docs/06_Asset_Bible/Asset_Bible.md`)
-   Flutter implementation

## Dependencies

This document derives its authority from:

-   `docs/07_UI/README.md`
-   `docs/README.md`
-   `AGENTS.md`
-   `docs/00_Project/Vision.md`
-   `docs/01_Game_Design/Game_Loop/Game_Loop.md`
-   `docs/01_Game_Design/Gameplay/Gameplay.md`
-   `docs/02_Design_System/LLDL/LLDL.md`
-   `docs/06_Asset_Bible/Asset_Bible.md`
-   `docs/04_Technical/Engine_Architecture.md`

## Downstream Documents

The following documents inherit these principles. Authored documents may still be draft until approved:

-   `docs/07_UI/UI_01_UI_Philosophy.md`
-   `docs/07_UI/UI_02_Layout_System.md`
-   `docs/07_UI/UI_03_Gameplay_Screen_Specification.md`
-   `docs/07_UI/UI_04_Design_Tokens.md`
-   `docs/07_UI/UI_05_Component_Library.md`
-   `docs/07_UI/UI_06_Animation_System.md`
-   `docs/07_UI/UI_07_Responsive_Guidelines.md`
-   `docs/07_UI/UI_08_Asset_Integration.md`

## Planned Downstream Documents

The current `docs/07_UI/` architecture sequence from `UI_00` through `UI_08` is now fully authored. Future additions should extend the stack only through formal review.

## Authority

`LLDL.md` remains the authoritative design architecture reference for
the project.

This document is the authoritative reference for **UI design
principles** within `docs/07_UI/` and must remain consistent with the
Vision, Gameplay, LLDL, Asset Bible, Engineering Architecture, and
repository governance documents.

Authority and conflict resolution follow `AGENTS.md`,
`docs/README.md`, and `docs/07_UI/README.md`. If a conflict exists,
preserve the higher-authority document and report the conflict.

## Core Principles

### 1. Gameplay is the Hero

The labyrinth and gameplay remain the player's primary focus. Interface
elements support gameplay without competing for attention.

### 2. Premium Minimalism

Every interface element must justify its existence. Remove unnecessary
visual noise before adding new UI.

### 3. Context Before Permanence

Information should appear when needed and gracefully disappear when no
longer relevant.

### 4. Spatial Harmony

UI should feel integrated with the world through thoughtful positioning,
generous spacing, and respect for the playable area.

### 5. Motion Has Meaning

Animation communicates state, intention, progression, and feedback.
Decorative animation should never reduce clarity.

### 6. Consistency Creates Mastery

Established interaction patterns should be reused throughout the product
to improve player familiarity.

### 7. Calm Before Complexity

Complex systems should be introduced progressively so players are never
overwhelmed.

### 8. Touch-First Precision

Interactions must feel natural on mobile while supporting accurate path
creation.

### 9. Beauty Never Reduces Usability

Visual quality must reinforce comprehension and accessibility rather
than obscure them.

### 10. Timeless Over Trendy

Prefer enduring design principles over fashionable interface styles.

### 11. Respect the World

The interface should preserve exploration and immersion. Players should
remember the labyrinth---not the HUD.

## Governance

This document governs **principles**, not implementation.

Changes to layouts, components, design tokens, or interaction patterns
should be made in their respective downstream documents while remaining
consistent with these principles.

If a new UI pattern requires changing a principle, this document must be
updated and approved before downstream documents are modified.

## Review Workflow

1.  Architecture draft
2.  Editorial review
3.  Human approval
4.  Lock
5.  Repository publication

## Revision History

  Version    Date      Status   Notes
  ---------- --------- -------- -------------------------------------
  Draft v2   2026-07   Draft    Revised following editorial review.
