# UI Documentation

Authoritative documentation area for Labyrinth Legends UI architecture and implementation-facing UI specifications.

---

## Purpose

`docs/07_UI/` exists to translate approved product, gameplay, design-language, asset, and engineering authority into **UI-specific architecture**, **UI rules**, and **implementation-facing UI specifications**.

This area governs:

- UI architecture
- UI principles
- UI design-system application
- UI layout rules
- UI component specifications
- Screen specifications
- Animation guidelines
- Responsive behavior
- Asset usage within UI

It does **not** redefine Vision, Gameplay, LLDL, Asset Bible, or Engineering Architecture.

---

## Authority

LLDL remains the authoritative **design architecture** reference for Labyrinth Legends.

`docs/07_UI/` is the authoritative area for **UI-specific architecture** and **implementation-facing UI specifications** once individual UI documents are approved or locked.

```text
AGENTS.md
    ↓
docs/README.md
    ↓
Vision
    ↓
Gameplay
    ↓
LLDL
    ↓
Asset Bible
    ↓
Engineering Architecture
    ↓
docs/07_UI/
    ↓
Flutter UI implementation
```

If a conflict exists, preserve the higher-authority document and report the conflict. `docs/07_UI/` may extend upstream authority but may never redefine it.

---

## Dependencies

### Upstream dependencies

- [AGENTS.md](../../AGENTS.md)
- [LLDS Home](../README.md)
- [Vision](../00_Project/Vision.md)
- [Gameplay](../01_Game_Design/Gameplay/Gameplay.md)
- [LLDL](../02_Design_System/LLDL/LLDL.md)
- [Asset Bible](../06_Asset_Bible/Asset_Bible.md)
- [Technical Documentation](../04_Technical/README.md)
- [Engine Architecture](../04_Technical/Engine_Architecture.md)

### Downstream dependency

- Flutter UI implementation in `lib/features/`, `lib/design_system/`, and related presentation code

---

## Relationship to LLDL

LLDL defines the **design language**: visual philosophy, tone, symbolism, component philosophy, token meaning, and experiential intent.

`docs/07_UI/` applies that language to UI architecture and implementation-facing specifications. It does not replace LLDL or invent parallel visual doctrine.

---

## Relationship to Asset Bible

The Asset Bible governs **asset production**, **asset lifecycle**, **review discipline**, and **how approved assets are created and maintained**.

`docs/07_UI/` governs **how approved UI assets are used within UI architecture, layouts, components, animations, and screen specifications**.

---

## Relationship to Flutter Implementation

`docs/07_UI/` sits upstream of Flutter UI implementation.

Implementation must:

- Follow approved UI documents once they are available
- Respect engineering boundaries defined in `docs/04_Technical/`
- Avoid inventing UI architecture, layouts, patterns, or interaction rules when an approved UI document already exists

---

## Document List

| Document | Status | Purpose |
|----------|--------|---------|
| [UI_00_Design_Principles.md](UI_00_Design_Principles.md) | Draft | Foundational UI design principles and decision framework |
| [UI_01_UI_Philosophy.md](UI_01_UI_Philosophy.md) | Approved | Player-facing UI philosophy, attention model, and information behavior |
| [UI_02_Layout_System.md](UI_02_Layout_System.md) | Approved | Spatial layout philosophy, zoning, gameplay dominance, and overlay structure |
| [UI_03_Gameplay_Screen_Specification.md](UI_03_Gameplay_Screen_Specification.md) | Approved | Canonical gameplay-screen behavior, state, hierarchy, and modal specification |
| [UI_04_Design_Tokens.md](UI_04_Design_Tokens.md) | Approved | UI token application rules derived from approved design-system authority |
| [UI_05_Component_Library.md](UI_05_Component_Library.md) | Approved | UI component behavior, composition, and implementation-facing contracts |
| [UI_06_Animation_System.md](UI_06_Animation_System.md) | Approved | UI motion and transition guidance for implementation-facing UI work |
| [UI_07_Responsive_Guidelines.md](UI_07_Responsive_Guidelines.md) | Approved | Responsive behavior across device sizes and orientations |
| [UI_08_Asset_Integration.md](UI_08_Asset_Integration.md) | Approved | Rules for applying approved UI assets inside implementation-facing UI specifications |

---

## Planned Document List

No additional planned documents remain in the current `UI_00`–`UI_08` architecture sequence.

---

## Governance Rules for Future UI Changes

- New UI patterns, layouts, components, animations, or interaction rules require corresponding `docs/07_UI/` updates before implementation
- Approved UI documents must not contradict Vision, Gameplay, LLDL, Asset Bible, or Engineering Architecture
- Cursor must not invent UI architecture during implementation when an approved UI document already exists
- Lower-level UI documents may extend higher-level authority but may never redefine it

---

## Review / Lock Policy

- Draft UI documents may evolve during active authorship
- Major changes require a review package in [docs/99_Reviews/](../99_Reviews/README.md)
- Review packages for documents authored under `docs/07_UI/` require **ChatGPT review** and **Human approval**
- A separate **Codex review section is not required** for `docs/07_UI/` document-family review packages unless explicitly requested
- UI documents become authoritative once approved
- Locked UI documents require formal review before material changes

Use the repository review workflow defined in [AGENTS.md](../../AGENTS.md) and [docs/99_Reviews/README.md](../99_Reviews/README.md).
