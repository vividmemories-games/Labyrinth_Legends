# Asset Bible Documentation

Production handbook for all visual, UI, marketing, store, AI-generated, and implementation-ready assets for Labyrinth Legends.

---

## 1. Purpose

The **Asset Bible** is the production handbook for all visual, UI, marketing, store, AI-generated, and implementation-ready assets.

It translates [LLDL](../02_Design_System/LLDL/LLDL.md) design language into practical production standards — folder structure, naming, formats, export rules, lifecycle, and review criteria.

The Asset Bible **does not redefine LLDL**. It inherits from LLDL and extends it with production-specific guidance only.

---

## 2. Authority

```text
Vision.md
    ↓
Gameplay.md
    ↓
LLDL.md
    ↓
Asset_Bible.md
    ↓
Production assets
```


| Layer                 | Controls                     |
| --------------------- | ---------------------------- |
| **Vision**            | Product intent               |
| **Gameplay**          | Mechanical meaning           |
| **LLDL**              | Design language              |
| **Asset Bible**       | Asset production standards   |
| **Production assets** | Must comply with Asset Bible |


Lower-level documents may **extend** higher-level documents but may **never redefine** them. If a conflict exists, preserve the higher-authority document and report the conflict — do not silently reinterpret the design.

---

## 3. Relationship to LLDL

### LLDL defines

- Visual philosophy
- Emotional tone
- Design language
- Color, motion, type, and icon meaning
- Component and token authority

### Asset Bible defines

- Folder structure
- Naming conventions
- File formats
- Export rules
- Asset lifecycle
- AI production rules
- Store asset standards
- Review criteria

LLDL remains the **visual authority**. Asset Bible is the **production authority** — it tells authors and AI agents *how* to produce assets that comply with LLDL, not *what* the visual language is.

---

## 4. Workshop Structure

```text
AB0 — Asset Philosophy & Production Principles
    ↓
AB1 — Production Standards
    ↓
AB2 — Game Assets
    ↓
AB3 — UI & Brand Assets
    ↓
AB4 — Marketing & Store Assets
    ↓
AB5 — AI Production Pipeline
    ↓
AB6 — Review & Asset Lifecycle
    ↓
Asset_Bible.md
```

Each workshop document (AB0–AB6) is authored, reviewed, and locked before the final integration document is compiled.

---

## 5. Workshop Index


| ID          | Planned Document                                                                               | Status      | Purpose                                                                             |
| ----------- | ---------------------------------------------------------------------------------------------- | ----------- | ----------------------------------------------------------------------------------- |
| AB0         | [AB0_Asset_Philosophy_Production_Principles.md](AB0_Asset_Philosophy_Production_Principles.md) | Approved    | Philosophy, scope, quality principles, ownership, governance                        |
| AB1         | [AB1_Production_Standards.md](AB1_Production_Standards.md)                                     | Approved    | Universal production standards — culture, governance, collaboration, sustainability |
| AB2         | [AB2_Game_Assets.md](AB2_Game_Assets.md)                                                       | Approved    | Playable-world asset system specifications (seven systems)                          |
| AB3         | [AB3_UI_Brand_Assets.md](AB3_UI_Brand_Assets.md)                                               | Approved    | Interface experience specifications — brand, entry, navigation, gameplay UI, progression, system |
| AB4         | [AB4_Marketing_Store_Assets.md](AB4_Marketing_Store_Assets.md)                                 | Approved    | Public brand communication — identity, store, campaigns, community, evolution |
| AB5         | AB5_AI_Production_Pipeline.md                                                                  | Not Started | Prompt templates, style lock, references, iteration, upscaling, approval            |
| AB6         | AB6_Review_Asset_Lifecycle.md                                                                  | Not Started | Review gates, quality metrics, outsourcing, lifecycle                               |
| Integration | Asset_Bible.md                                                                                 | Not Started | Final integrated production handbook                                                |


---

## 6. Dependencies

### Depends on

- [Vision.md](../00_Project/Vision.md)
- [Gameplay.md](../01_Game_Design/Gameplay.md)
- [LLDL.md](../02_Design_System/LLDL/LLDL.md)
- [Design_Tokens.md](../02_Design_System/Design_Tokens.md)
- [Components.md](../02_Design_System/Components.md) — where relevant

### Enables

- Consistent AI asset generation
- Production-ready icons
- Store graphics
- UI assets
- Marketing assets
- Game asset production
- Outsourcing handoff

---

## 7. Documentation Methodology

Every Asset Bible document follows the LLDS compiler workflow:

```text
Architecture Discussion
    ↓
Workshop Discussion
    ↓
Master Prompt
    ↓
Cursor Generates Document
    ↓
Review Package
    ↓
Codex Review
    ↓
ChatGPT Review
    ↓
Human Approval
    ↓
Locked
```

Do not bypass this workflow. See [Cursor Workflow](../05_AI/Cursor/Workflow.md) and [99_Reviews](../99_Reviews/README.md).

---

## 8. Rules for Future Authors

- Do not create assets that contradict LLDL.
- Do not redefine gameplay meaning.
- Do not invent new visual language outside LLDL.
- Do not add production standards without documenting rationale.
- Every asset category must define naming, export, quality, and review rules.
- AI-generated assets require human review before approval.
- Store and marketing assets must remain visually consistent with the game.
- Accessibility and readability must be preserved.

---

## 9. Current Status

Asset Bible documentation is **in progress**. AB0, AB1, AB2, AB3, and AB4 are **Approved** (not Approved — Locked). AB5–AB6 and `Asset_Bible.md` remain unauthored.

---

## 10. Next Step

**Next step:** Human approval for AB4 lock when ready; then AB5 — AI Production Pipeline.

---

## Navigation


| ← Previous                                                | Next →                                  | Index                              |
| --------------------------------------------------------- | --------------------------------------- | ---------------------------------- |
| [AB3 — UI & Brand Assets](AB3_UI_Brand_Assets.md) | [AB4 — Marketing & Store Assets](AB4_Marketing_Store_Assets.md) | [Documentation Home](../README.md) |


