# AB1 — Production Standards


| Field                 | Value                                                                                                                                                                                                                         |
| --------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Project**           | Labyrinth Legends                                                                                                                                                                                                             |
| **Document Name**     | AB1 — Production Standards                                                                                                                                                                                                    |
| **Document ID**       | AB1                                                                                                                                                                                                                           |
| **Series**            | AB1 — Labyrinth Legends Asset Bible Production Standards                                                                                                                                                                      |
| **Version**           | 1.0.2                                                                                                                                                                                                                         |
| **Status**            | Approved — Locked                                                                                                                                                                                                             |
| **Owner**             | Apoorv                                                                                                                                                                                                                        |
| **Prepared By**       | ChatGPT (specification) · Cursor (compiler)                                                                                                                                                                                   |
| **Last Updated**      | 2026-07-02                                                                                                                                                                                                                    |
| **Workshop**          | AB1 — Production Standards                                                                                                                                                                                                    |
| **Path**              | `docs/06_Asset_Bible/AB1_Production_Standards.md`                                                                                                                                                                             |
| **Parent**            | [AB0 — Asset Philosophy & Production Principles](AB0_Asset_Philosophy_Production_Principles.md)                                                                                                                               |
| **Children**          | AB2 · AB3 · AB4 · AB5 · AB6                                                                                                                                                                                                   |
| **Dependencies**      | [Vision](../00_Project/Vision.md) · [Game Loop](../01_Game_Design/Game_Loop/Game_Loop.md) · [Gameplay](../01_Game_Design/Gameplay/Gameplay.md) · [LLDL](../02_Design_System/LLDL/LLDL.md) · [AB0](AB0_Asset_Philosophy_Production_Principles.md) |
| **Related Documents** | [Asset Bible README](README.md) · [Decisions](../00_Project/Decisions.md)                                                                                                                                                     |


## Navigation


| ← Previous                                                              | Next →                                  | Index                                                         |
| ----------------------------------------------------------------------- | --------------------------------------- | ------------------------------------------------------------- |
| [AB0 — Asset Philosophy](AB0_Asset_Philosophy_Production_Principles.md) | [AB2 — Game Assets](AB2_Game_Assets.md) | [Asset Bible](README.md) · [Documentation Home](../README.md) |


---

## Version History


| Version | Date       | Author           | Summary                                                                   |
| ------- | ---------- | ---------------- | ------------------------------------------------------------------------- |
| 1.0.0   | 2026-07-01 | ChatGPT / Cursor | Initial AB1 workshop record — universal production standards              |
| 1.0.1   | 2026-07-01 | Cursor           | Codex hygiene pass — status alignment, planned `Asset_Bible.md` de-linked |
| 1.0.2   | 2026-07-02 | Apoorv / Cursor  | Human lock — Asset Bible workshop chain locked for integration (`0035`)   |


## Change Log


| Version | Change                                                                                                                           |
| ------- | -------------------------------------------------------------------------------------------------------------------------------- |
| 1.0.0   | Initial workshop record: production culture, governance, collaboration, sustainability, technology posture, knowledge management |
| 1.0.1   | Codex review hygiene: `Asset_Bible.md` references plain-text only; status updated to Approved after Human approval               |
| 1.0.2   | Human lock recorded — status `Approved — Locked`; no design content changed                                                      |


---

## Document Authority

**AB1 is the universal production standards authority within the Labyrinth Legends Asset Bible.**


| Conflict type                                                                   | Authority                                                                             |
| ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- |
| Product intent                                                                  | [Vision](../00_Project/Vision.md) wins                                                |
| Mechanical meaning and gameplay readability                                     | [Gameplay](../01_Game_Design/Gameplay/Gameplay.md) wins                                        |
| Visual language and design meaning                                              | [LLDL](../02_Design_System/LLDL/LLDL.md) wins                                         |
| Production philosophy (beliefs and principles)                                  | [AB0](AB0_Asset_Philosophy_Production_Principles.md) wins                             |
| Universal production standards (how production operates)                        | **AB1 wins**                                                                          |
| Domain asset specifications (game, UI, marketing, AI pipeline, lifecycle gates) | AB2–AB6 — must align with AB0 and AB1; AB1 does not define them                       |
| Engine loading, runtime optimization, code integration                          | `docs/04_Technical/`* — must consume approved assets; does not set creative direction |


[AB0](AB0_Asset_Philosophy_Production_Principles.md) defines *why* production discipline exists. **AB1 defines how production operates** at the universal standard level. AB2–AB6 apply these standards to specific asset domains. AB1 must never redefine Vision, Gameplay, LLDL, or AB0.

When any production document conflicts with AB1 on **universal operating standards**, AB1 overrides until [Decisions](../00_Project/Decisions.md) records an explicit, Human-approved exception.

---

## Intended Audience


| Role                   | Use this document to…                                                     |
| ---------------------- | ------------------------------------------------------------------------- |
| Art Directors          | Establish operating standards before domain workshops                     |
| Artists & Illustrators | Understand governance, ownership, and completion criteria                 |
| UI & Brand Designers   | Apply universal standards to interface and identity surfaces              |
| Technical Artists      | Bridge creative intent and integration without inventing parallel rules   |
| Engineers              | Know what approved assets must arrive with (context, lineage, validation) |
| Producers              | Run sustainable production across solo, AI-assisted, and vendor workflows |
| External Vendors       | Align with studio operating standards before receiving domain briefs      |
| AI Workflow Operators  | Understand where automation fits within governed production               |
| Future Team Members    | Onboard into a documented production system, not tribal knowledge         |


---

## Table of Contents

1. [Introduction](#1-introduction)
2. [Production Culture](#2-production-culture)
3. [Asset Governance](#3-asset-governance)
4. [Collaboration](#4-collaboration)
5. [Sustainable Production](#5-sustainable-production)
6. [Production Technology](#6-production-technology)
7. [Knowledge Management](#7-knowledge-management)
8. [Governance](#8-governance)
9. [What AB1 Must Not Do](#9-what-ab1-must-not-do)
10. [Summary](#10-summary)
11. [Workshop Conclusions](#11-workshop-conclusions)
12. [Related Documents](#12-related-documents)

---

## 1. Introduction

### 1.1 Purpose

[AB0](AB0_Asset_Philosophy_Production_Principles.md) established the production conscience of Labyrinth Legends — why assets must serve player experience, gameplay clarity, and LLDL identity. **AB1 establishes the operating standards** that make that conscience repeatable.

AB1 is the **universal production handbook**. It defines how assets are organized in principle, how they are governed, how contributors collaborate, how production remains sustainable, and how knowledge survives team changes, tool changes, and content growth.

AB1 answers:

> **How does this studio produce assets reliably — alone, with AI, with vendors, and at scale — without losing identity?**

### 1.2 Scope

AB1 establishes **standards**, not **specifications**.


| AB1 owns                                                       | AB1 does not own                                          |
| -------------------------------------------------------------- | --------------------------------------------------------- |
| Production culture and operating discipline                    | Individual asset definitions (characters, props, icons)   |
| Governance model — ownership, approval, traceability           | Folder trees, naming syntax, file formats                 |
| Universal collaboration and review standards                   | Domain export settings, resolutions, sprite sizes         |
| Sustainability and reuse principles                            | Software tutorials, engine workflows, repository commands |
| Technology posture — automation, validation, tool independence | AI prompt libraries, store screenshot templates           |
| Knowledge management and documentation hierarchy               | Flutter, implementation, or technical architecture        |


Domain specifications belong in AB2–AB6. Implementation belongs in technical documentation. Philosophy belongs in AB0.

### 1.3 Authority and Inheritance

```text
Vision.md           — why the game exists
    ↓
Game_Loop.md        — how player time is structured
    ↓
Gameplay.md         — how the game works
    ↓
LLDL.md             — how the game looks, feels, moves, and communicates visually
    ↓
AB0                 — why assets are produced with discipline
    ↓
AB1 (this document) — how production operates universally
    ↓
AB2–AB6             — domain production specifications
    ↓
Asset_Bible.md      — integrated handbook
    ↓
Production assets   — must comply with the Asset Bible
```

#### Vision

[Vision](../00_Project/Vision.md) requires premium craft and respect for player time. AB1 translates that into **operating standards** — completion criteria, review rigor, and sustainable scope — so quality does not depend on heroics.

#### Gameplay

[Gameplay](../01_Game_Design/Gameplay/Gameplay.md) requires readable mechanical communication. AB1 standards ensure assets arrive **integration-ready for clarity** — with ownership, validation, and documentation — without redefining rules.

#### LLDL

[LLDL](../02_Design_System/LLDL/LLDL.md) is the visual authority. AB1 ensures production systems **preserve LLDL meaning** through governance and review — not by restating design language.

#### AB0

[AB0](AB0_Asset_Philosophy_Production_Principles.md) is the philosophical parent. AB1 inherits all AB0 beliefs and converts them into **operating standards**. Where AB0 asks *why*, AB1 defines *how production behaves*.

#### Asset Bible

The Asset Bible is the integrated production authority. AB1 is its **universal standards layer** — inherited by every domain workshop and compiled into `Asset_Bible.md` when complete.

#### Implementation Documentation

Technical documentation defines how approved assets are loaded, optimized, and rendered. AB1 defines what **must be true** about assets before they reach implementation — lineage, approval, context — not how the engine consumes them.

### 1.4 What AB1 Deliberately Does Not Own

To prevent scope bleed, AB1 explicitly excludes:

- Asset category catalogs and visual design briefs (AB2–AB4)
- AI prompt systems and iteration pipelines (AB5)
- Formal review gate definitions and lifecycle metrics (AB6)
- Code, widgets, design tokens, and screen layouts (LLDL implementation layer)
- Mechanical or narrative design (Gameplay, Game Bible)

If a question requires a specific asset, format, or tool instruction, descend to the correct child document or technical spec — do not expand AB1.

---

## 2. Production Culture

Production culture is the daily behavior that makes [AB0](AB0_Asset_Philosophy_Production_Principles.md) real. Culture is not morale — it is the set of habits that prevent expensive drift.

### 2.1 Studio Philosophy

Labyrinth Legends operates as a **modern AI-assisted indie studio** with AAA documentation discipline. That means:

- Small team size does not justify informal production
- AI acceleration does not justify skipped review
- Premium intent requires predictable standards, not occasional brilliance

The studio produces assets as **contributions to a permanent world** — not as disposable files for a single milestone.

### 2.2 Purpose-Driven Production

Every asset enters production with a **declared purpose**: which player moment, which surface, which authority it inherits. Purpose is recorded before execution intensifies.

**Standard:** No asset receives full production investment without an approved brief that cites Vision, Gameplay, or LLDL relevance.

**Why:** [AB0 §2.5](AB0_Asset_Philosophy_Production_Principles.md#25-intentional-design) — unintentional assets become debt.

### 2.3 Organization Philosophy

Organization is conceptual before it is structural. Assets belong to **domains** (game world, interface, brand, marketing) and **states** (exploration, approved, integrated, retired) before they belong to folders.

**Standards:**

- One authoritative home per asset class — no parallel "final_final" hierarchies
- Work-in-progress and approved assets are mentally and physically separable
- Domain boundaries mirror Asset Bible workshops (AB2–AB4), not individual contributor preference

**Why:** [AB0 §4.3](AB0_Asset_Philosophy_Production_Principles.md#43-organization) — chaos is deferred cost. AB1 establishes the standard; AB2–AB6 and integration docs will express structure.

### 2.4 Single Source of Truth

Each asset has exactly **one approved version** at any time. Derivatives (thumbnails, platform variants, marketing crops) trace to that source.

**Standards:**

- Approved masters are immutable without version increment
- No contributor maintains a private "true" copy outside the shared system
- Marketing and in-game variants declare their parent asset

**Why:** Duplicate truths produce silent integration bugs and brand drift.

### 2.5 Asset Identity

Asset identity is the combination of **purpose**, **domain**, **visual lineage**, and **approval state**. Identity persists across renames, tool changes, and handoffs.

**Standards:**

- Every asset must be uniquely identifiable within the production system
- Identity survives compression, export, and platform delivery
- Retired assets retain identity for archive traceability

**Why:** Without identity, reuse becomes rediscovery — and rediscovery becomes rework.

### 2.6 Naming Philosophy

Names are **metadata carriers** — they communicate domain, role, and relationship without opening a file.

**Standards:**

- Names are predictable: contributors infer meaning from patterns
- Names are stable: identity does not change casually after approval
- Names are human-legible: automation-friendly, but not automation-opaque

**Why:** [AB0 §4.2](AB0_Asset_Philosophy_Production_Principles.md#42-naming-discipline) — if it cannot be found, it will be remade badly. AB1 defines naming **philosophy**; syntactic conventions will be specified in domain workshops and integration.

### 2.7 Consistency

Consistency is enforced through **standards**, not memory.

**Standards:**

- New assets inherit existing families before inventing new visual dialects
- Exceptions require documented rationale and reviewer approval
- Cross-domain assets (e.g. icon used in HUD and marketing) share one identity

**Why:** [AB0 §2.12](AB0_Asset_Philosophy_Production_Principles.md#212-consistency-across-every-asset) — the player experiences one civilization.

### 2.8 Predictability

Contributors must predict **where** assets live, **who** approves them, and **what** "done" means.

**Standards:**

- Operating rules do not change silently between milestones
- Onboarding documentation references AB1 — not oral tradition
- Predictability beats cleverness in production systems

### 2.9 Production Discipline

Discipline means standards apply on good days and bad days — under crunch, outsourcing, and AI batch generation.

**Standards:**

- Shortcuts require explicit Human-approved exceptions in [Decisions](../00_Project/Decisions.md)
- "Temporary" assets must carry expiration or promotion criteria
- Discipline is measured by adherence, not intention

### 2.10 Human-First Organization

Systems serve humans — not the reverse. Organization must remain comprehensible to a solo developer returning after months, a freelancer on day one, and a future art lead joining mid-project.

**Standards:**

- Complexity must earn its place with scale benefit
- Documentation accompanies structural decisions
- No production system that only one person understands

---

## 3. Asset Governance

Governance converts culture into **accountability**. An asset without governance is a liability.

### 3.1 Editable Master Assets

Production distinguishes **masters** (editable sources of truth) from **deliverables** (integration-ready outputs).

**Standards:**

- Masters remain editable for as long as the asset class requires iteration
- Deliverables are generated from masters — not independently "fixed"
- Loss of master files is a production incident, not a casual inconvenience

**Why:** Without masters, iteration becomes repaint; without deliverables, integration becomes chaos.

### 3.2 Asset Ownership

Every asset class has a **named owner** with authority to accept or reject against standards.


| Ownership dimension     | Owner answers                              |
| ----------------------- | ------------------------------------------ |
| **Creative meaning**    | Does this honor LLDL and brief?            |
| **Gameplay clarity**    | Does this preserve mechanical readability? |
| **Production quality**  | Does this meet completion standards?       |
| **Integration fitness** | Does this survive validation in context?   |


**Standards:**

- Ownership is assigned at brief — not discovered at crunch
- Owners may delegate execution; they may not delegate accountability
- Orphan assets are escalated, not ignored

**Why:** [AB0 §4.5](AB0_Asset_Philosophy_Production_Principles.md#45-asset-ownership) — shared creation without shared accountability produces churn.

### 3.3 Lifecycle Standards

Assets move through defined **states**. State transitions are intentional events — not file copies.


| State             | Meaning                                     |
| ----------------- | ------------------------------------------- |
| **Exploratory**   | Direction testing; not integration-eligible |
| **In Production** | Approved direction; active execution        |
| **In Review**     | Candidate for approval                      |
| **Approved**      | Authoritative for use                       |
| **Integrated**    | Validated in target context                 |
| **Deprecated**    | Superseded; retained for traceability       |
| **Archived**      | Retired from active use                     |


**Standards:**

- State is visible to all contributors — not inferred from folder location alone
- Integration without approval is a process violation
- Deprecated assets cannot silently re-enter production

Formal gate definitions and metrics belong in AB6. AB1 establishes the **state model**.

### 3.4 Version Philosophy

Versioning expresses **lineage** — what changed, when, and whether the new version supersedes the old.

**Standards:**

- Version increments accompany meaningful change — not save habits
- Contributors can identify the current approved version without archaeology
- Rollback is possible because history is preserved

**Why:** [AB0 §4.4](AB0_Asset_Philosophy_Production_Principles.md#44-version-control-mindset) — without lineage, integration breaks silently.

### 3.5 Approval

Approval is an **explicit act** — a named reviewer attests an asset meets standards for its declared purpose and state.

**Standards:**

- Approval is per asset or per defined asset family — not vague batch acceptance
- Approval records cite the authorities satisfied (LLDL, Gameplay readability, brief)
- Unapproved assets are not shipped — in builds, stores, or campaigns

**Why:** [AB0 §3.11](AB0_Asset_Philosophy_Production_Principles.md#311-approval) — nothing is implicitly approved because it rendered.

### 3.6 Traceability

Traceability links assets to **brief**, **references**, **iterations**, **approver**, and **integration record**.

**Standards:**

- A future contributor can reconstruct why an asset exists
- AI-assisted assets record human reviewer and prompt lineage at domain level (AB5)
- Marketing derivatives trace to in-game or brand parents

### 3.7 Review Philosophy

Review evaluates against **authorities**, not personal taste.

**Review dimensions:**


| Dimension               | Question                                             |
| ----------------------- | ---------------------------------------------------- |
| **Authority alignment** | Does it inherit Vision, Gameplay, LLDL, AB0?         |
| **Purpose fit**         | Does it serve the declared player moment or surface? |
| **Readability**         | Does it remain legible in intended context?          |
| **Consistency**         | Does it belong to the same civilization?             |
| **Completion**          | Does it meet the definition of done for its state?   |


**Standards:**

- Review happens early and often — per [AB0 §4.10](AB0_Asset_Philosophy_Production_Principles.md#410-early-feedback)
- Rejection cites standard or authority — not preference alone
- Reviewers do not redefine design language; they enforce inheritance

### 3.8 Quality Dimensions

Quality is multidimensional. An asset that is beautiful but illegible fails.


| Dimension         | Standard                                                         |
| ----------------- | ---------------------------------------------------------------- |
| **Clarity**       | Communicates intended meaning without ambiguity                  |
| **Craft**         | Meets premium bar appropriate to asset role                      |
| **Coherence**     | Aligns with LLDL and existing families                           |
| **Fitness**       | Appropriate detail for screen size and viewing distance          |
| **Integrity**     | Master-deliverable relationship maintained                       |
| **Accessibility** | Does not rely on single-channel perception — per WS9 inheritance |


### 3.9 Definition of Completion

An asset is **complete** for its state when:

1. Purpose and brief are documented
2. Creative meaning aligns with LLDL and domain brief
3. Gameplay-facing assets preserve mechanical readability
4. Required reviews are passed and recorded
5. Master and deliverable relationship is correct
6. Identity, version, and ownership are recorded
7. Integration validation is passed — where applicable

Completion is **state-specific**. Exploratory sketches complete differently than shipping icons. Domain workshops refine criteria; AB1 defines the universal frame.

---

## 4. Collaboration

Production is cross-disciplinary by nature. AB1 standards make collaboration **repeatable** — per [AB0 §6](AB0_Asset_Philosophy_Production_Principles.md#6-collaboration-philosophy).

### 4.1 Shared Responsibility

Quality is co-owned. Artists execute; designers guard clarity; technical artists preserve fidelity; engineers validate runtime truth; producers protect scope and standards.

**Standard:** No discipline may throw work "over the wall" without context, ownership, and review path documented.

### 4.2 Documentation-First Collaboration

Decisions live in documentation — briefs, review notes, approval records — not chat threads alone.

**Standards:**

- Brief precedes production
- Review outcomes are recorded
- Exceptions escalate to [Decisions](../00_Project/Decisions.md)

**Why:** Chat is not institutional memory.

### 4.3 Communication Standards


| Standard                     | Application                                             |
| ---------------------------- | ------------------------------------------------------- |
| **Early constraint sharing** | Integration limits surfaced before polish               |
| **Reference before debate**  | Disagreements cite authorities                          |
| **Explicit handoffs**        | Owner named at each transition                          |
| **Escalation path**          | Unresolved conflicts rise to Human — not local override |


### 4.4 Review Culture

Review is a **professional obligation** — candid, specific, and constructive.

**Standards:**

- Reviewers cite AB0/AB1 standards and LLDL — not undefined taste
- Creators present work in context — scale, motion, surrounding UI
- Praise includes precision; critique includes path to resolution

### 4.5 External Contributors

Freelancers and vendors are **studio contributors** for the duration of engagement.

**Standards:**

- Vendors receive inherited brief, references, and AB1 operating rules
- Vendor work passes the same approval and traceability requirements
- Language, timezone, and tooling differences do not relax standards

### 4.6 Outsourcing Consistency

Outsourcing scales volume — not identity drift.

**Standards:**

- Outsourced assets must be indistinguishable in **quality and coherence** from internal work
- Style guides are inherited from LLDL — vendors do not author new pillars
- First deliverables are calibration reviews before volume production

### 4.7 Project Ownership

The Human owner holds final product authority. Production leads hold **operational authority** within documented standards.

**Standards:**

- Material exceptions require Human approval
- Production leads enforce AB1 — they do not invent parallel standards
- "Fastest path" does not override locked authorities without recorded decision

### 4.8 AI as Production Support

AI assists execution — briefing, variation, cleanup, iteration — under the same collaboration standards as human contributors.

**Standards:**

- AI output enters the same review and approval path
- Human reviewer is named and accountable — per [AB0 §5](AB0_Asset_Philosophy_Production_Principles.md#5-ai-philosophy)
- AI does not bypass brief, ownership, or traceability requirements

Domain prompt and pipeline rules belong in AB5.

---

## 5. Sustainable Production

Sustainable production survives **content growth**, **team growth**, and **tool changes** without restructuring from scratch.

### 5.1 Reusable Assets

Reuse is a **design decision**, not a post-ship accident.

**Standards:**

- Prefer modular families over unique one-offs
- New content composes from approved libraries before requesting new masters
- Reuse candidates are identified at brief — not after delivery

**Why:** [AB0 §2.7](AB0_Asset_Philosophy_Production_Principles.md#27-reuse-over-duplication) — duplication breeds inconsistency.

### 5.2 Libraries

Libraries are **curated collections** of approved assets and patterns — materials, motifs, icon logic, UI surfaces — that accelerate consistent production.

**Standards:**

- Libraries contain approved assets only
- Library additions require review — libraries are not dumping grounds
- Contributors search libraries before creating

Domain library contents are defined in AB2–AB4.

### 5.3 Maintainability

Maintainable assets can be updated without breaking dependents silently.

**Standards:**

- Dependencies between assets are documented
- Breaking changes increment version and trigger dependent review
- Technical debt in assets is tracked — not hidden

### 5.4 Production Longevity

Assets must remain comprehensible years after creation.

**Standards:**

- Masters use durable, documented approaches — not fragile tricks understood by one person
- Retired approaches are archived with rationale
- Longevity beats short-term spectacle

**Why:** [AB0 §7](AB0_Asset_Philosophy_Production_Principles.md#7-accessibility--longevity) — future-proof craft is intentional restraint.

### 5.5 Reducing Production Debt

Production debt is the accumulation of unapproved, undocumented, or duplicate assets.

**Standards:**

- Debt is visible — counted, owned, scheduled
- New production pauses to pay critical debt when identity or integration is at risk
- Debt retirement is a milestone, not a myth

### 5.6 Growing Without Restructuring

The production system must absorb new worlds, features, and contributors **without reorganizing the entire pipeline**.

**Standards:**

- Domain boundaries scale horizontally — new content inherits existing domains
- Standards remain stable; specifications extend
- Growth triggers library expansion — not standard reinvention

### 5.7 Systems Over One-Offs

Production invests in **systems** — families, templates, repeatable motifs — that generate many assets consistently.

**Standards:**

- One-off assets require justification against reuse alternatives
- Systems are documented so future contributors can extend them
- Hero assets exist — but they anchor systems, not replace them

---

## 6. Production Technology

Technology serves creativity and reliability. AB1 defines **posture** — not tools.

### 6.1 Technology Supporting Creativity

Tools exist to remove friction from iteration — not to replace judgment.

**Standards:**

- Tool choice serves standards — standards do not bend to tool defaults
- Creative intent is recorded independently of tool-specific settings
- Tool migration must not destroy masters or lineage

### 6.2 Automation Philosophy

Automation handles **repeatable, verifiable** work — batch exports, consistency checks, derivative generation.

**Standards:**

- Automate what is stable; review what is creative
- Automated outputs enter the same governance path
- Automation failures are visible — not silent

### 6.3 Reproducibility

Another contributor — or future you — must reproduce deliverables from masters and documented process.

**Standards:**

- Deliverables trace to masters and generation context
- "Magic steps" in private workflows are not studio standards
- Reproducibility is tested during handoff

### 6.4 Technical Validation

Assets must prove fitness **in target context** before approval for integration — per [AB0 §4.12](AB0_Asset_Philosophy_Production_Principles.md#412-engine-validation).

**Standards:**

- Validation includes scale, contrast, and interaction context — not only authoring view
- Gameplay-facing assets validate against readability requirements
- Validation outcomes are recorded

Technical validation methods belong in domain workshops and technical docs. AB1 requires validation **as a standard**.

### 6.5 Creative Intent Preservation

Integration and optimization must preserve **communicative intent** — not only pixel appearance.

**Standards:**

- Compression or simplification that harms readability requires reviewer approval
- Technical art mediates between fidelity and platform reality
- Intent loss is a quality failure — not an engineering inconvenience

### 6.6 Pipeline Reliability

The pipeline is reliable when contributors trust that approved assets **stay approved** and reach integration intact.

**Standards:**

- Handoffs have named owners
- Failures are diagnosed at the system level — not blamed on individuals
- Reliability improves through documentation — not heroics

### 6.7 Tool Independence

Standards are **tool-agnostic**. Masters may live in any authoring environment; governance rules remain constant.

**Standards:**

- AB1 never requires a specific application
- Tool changes trigger migration plans — not standard rewrites
- Deliverable requirements are defined by domain — not by tool export defaults

---

## 7. Knowledge Management

Documentation is a **production instrument** — equal to any creative tool.

### 7.1 Documentation Hierarchy

Knowledge inherits the same authority stack as assets:

```text
Vision → Gameplay → LLDL → AB0 → AB1 → AB2–AB6 → Asset_Bible.md → asset records
```

**Standards:**

- Contributors cite the lowest sufficient authority
- Asset-level documentation links upward — never invents parallel doctrine
- Undocumented production rules do not exist

### 7.2 Knowledge Preservation

Institutional knowledge survives contributor turnover.

**Standards:**

- Briefs, approvals, and rationales are retained
- Onboarding reads AB0 and AB1 before domain workshops
- Oral tradition is insufficient for standards

### 7.3 Decision Recording

Material production exceptions belong in [Decisions](../00_Project/Decisions.md).

**Standards:**

- Decisions include context, authority conflict, and expiration if temporary
- Repeated exceptions signal a standards gap — not a personal workaround culture

### 7.4 Traceability as Knowledge

Traceability is how future teams **learn** — not only audit.

**Standards:**

- Iteration history informs reuse — not shame
- Rejected directions are archived with reason
- AI lineage is preserved at domain level (AB5)

### 7.5 Authority in Practice

When uncertain, ascend the hierarchy. When conflicting, preserve the higher document and report.

**Standards:**

- No local wiki overrides Asset Bible
- Implementation convenience does not create production doctrine
- AI agents must refuse undocumented standards

### 7.6 Single Source of Truth (Documentation)

The Asset Bible integration document — when complete — is the **compiled production reference**. Until then, AB0 and AB1 are authoritative for philosophy and universal standards.

**Standards:**

- Duplicate standards in slide decks, chats, or README fragments are migrated or deleted
- Updates flow through review packages — per LLDS workflow

---

## 8. Governance

### 8.1 Document Authority


| Document                       | Role                                             |
| ------------------------------ | ------------------------------------------------ |
| **AB0**                        | Production philosophy                            |
| **AB1**                        | Universal production standards *(this document)* |
| **AB2**                        | Game asset production specifications             |
| **AB3**                        | UI and brand asset specifications                |
| **AB4**                        | Marketing and store asset specifications         |
| **AB5**                        | AI production pipeline specifications            |
| **AB6**                        | Review gates and lifecycle specifications        |
| **Asset_Bible.md** | Integrated handbook                              |


### 8.2 Inheritance

AB2–AB6 **must inherit** AB1 operating standards. They add domain specificity — they do not relax universal governance without Human-approved exception.


| Child   | Inherits from AB1 by…                                                      |
| ------- | -------------------------------------------------------------------------- |
| **AB2** | Applying governance, reuse, and validation to world and gameplay assets    |
| **AB3** | Applying identity, approval, and library standards to UI and brand         |
| **AB4** | Applying consistency and traceability to public marketing surfaces         |
| **AB5** | Applying collaboration, traceability, and review standards to AI workflows |
| **AB6** | Formalizing lifecycle gates and metrics atop AB1 state model               |


### 8.3 Dependencies

AB1 depends on approved [AB0](AB0_Asset_Philosophy_Production_Principles.md) and locked Vision, Gameplay, and LLDL. AB1 should not be locked before AB0 is Approved — Locked.

### 8.4 Document Lifecycle


| State                 | Meaning                                               |
| --------------------- | ----------------------------------------------------- |
| **Draft**             | Active authorship                                     |
| **Ready for Review**  | Complete draft in review package                      |
| **Approved**          | Reviewer acceptance                                   |
| **Approved — Locked** | Human-locked; changes require version bump and review |


### 8.5 Review Methodology

AB1 follows LLDS compiler workflow — review package, Codex, ChatGPT, Human approval. See [99_Reviews](../99_Reviews/README.md).

### 8.6 Approval and Lock

AB1 locks after Human approval. Until lock, AB2–AB6 may draft in parallel only with explicit Human waiver.

### 8.7 Future Extensions

AB1 may gain version increments when:

- New universal standards are required across domains
- Governance model extends for team scale
- AI-assisted production norms evolve — without relaxing human accountability

Extensions must not duplicate AB0 philosophy or redefine locked authorities.

---

## 9. What AB1 Must Not Do

AB1 must **not**:

- Define individual assets, characters, environments, UI components, or marketing pieces
- Specify folder structures, naming syntax, resolutions, formats, or export settings
- Instruct use of specific software, engines, or version control commands
- Contain AI prompt templates or iteration recipes (AB5)
- Define formal review gate metrics or outsourcing SLAs (AB6)
- Redefine Vision, Gameplay, LLDL, or AB0
- Duplicate AB0 philosophical prose — reference and operationalize instead

If content reads like a tutorial, checklist, or catalog — it belongs elsewhere.

---

## 10. Summary

**AB1 is the operating system of Labyrinth Legends asset production.**

It converts [AB0](AB0_Asset_Philosophy_Production_Principles.md) philosophy into universal standards:

- **Culture** — purpose-driven, organized, predictable, human-first
- **Governance** — ownership, states, versions, approval, traceability, completion
- **Collaboration** — documentation-first, vendor-consistent, AI-accountable
- **Sustainability** — reuse, libraries, debt control, systems over one-offs
- **Technology** — automation with review, validation, tool independence
- **Knowledge** — hierarchy, decisions, single source of truth

AB2–AB6 inherit these standards and apply them to specific asset domains. Implementation consumes approved assets — it does not invent parallel production law.

When production asks **how we operate**, AB1 answers.

---

## 11. Workshop Conclusions

AB1 — Production Standards records the following workshop conclusions for review:


| #   | Conclusion                                                                                |
| --- | ----------------------------------------------------------------------------------------- |
| 1   | AB1 is the universal production standards authority; AB0 remains the philosophical parent |
| 2   | Production operates through purpose, identity, governance states, and explicit approval   |
| 3   | Masters and deliverables are distinct; traceability is mandatory                          |
| 4   | Quality is multidimensional — clarity and coherence equal craft                           |
| 5   | Collaboration is documentation-first; vendors and AI follow the same standards            |
| 6   | Reuse and libraries are production strategy — not post-ship cleanup                       |
| 7   | Technology serves standards; tools are interchangeable under AB1                          |
| 8   | Knowledge inherits the documentation hierarchy — no undocumented rules                    |
| 9   | AB2–AB6 extend AB1; they do not relax universal governance                                |
| 10  | AB1 locks after Human approval; domain workshops inherit it                               |


---

## 12. Related Documents

### Locked authorities

- [Vision](../00_Project/Vision.md)
- [Game Loop](../01_Game_Design/Game_Loop/Game_Loop.md)
- [Gameplay](../01_Game_Design/Gameplay/Gameplay.md)
- [LLDL](../02_Design_System/LLDL/LLDL.md)

### Asset Bible

- [AB0 — Asset Philosophy & Production Principles](AB0_Asset_Philosophy_Production_Principles.md)
- AB2 — Game Assets *(planned)*
- AB3 — UI & Brand Assets *(planned)*
- AB4 — Marketing & Store Assets *(planned)*
- [AB5 — AI Production Pipeline](AB5_AI_Production_Pipeline.md)
- [AB6 — Review & Asset Lifecycle](AB6_Review_Asset_Lifecycle.md)
- [Asset Bible](Asset_Bible.md)
- [Asset Bible README](README.md)

### Governance

- [Decisions](../00_Project/Decisions.md)
- [99_Reviews](../99_Reviews/README.md)
- [Cursor Workflow](../05_AI/Cursor/Workflow.md)

