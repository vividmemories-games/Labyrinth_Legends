# AB3 — UI & Brand Assets

| Field | Value |
|-------|-------|
| **Project** | Labyrinth Legends |
| **Document Name** | AB3 — UI & Brand Assets |
| **Document ID** | AB3 |
| **Series** | AB3 — Labyrinth Legends Asset Bible UI & Brand Systems |
| **Version** | 1.0.2 |
| **Status** | Approved — Locked |
| **Owner** | Apoorv |
| **Prepared By** | ChatGPT (specification) · Cursor (compiler) |
| **Last Updated** | 2026-07-02 |
| **Workshop** | AB3 — UI & Brand Assets |
| **Path** | `docs/06_Asset_Bible/AB3_UI_Brand_Assets.md` |
| **Parent** | [AB2 — Game Assets](AB2_Game_Assets.md) |
| **Children** | AB4 · AB5 · AB6 *(downstream Asset Bible workshops — AB3 informs but does not govern)* |
| **Dependencies** | [Vision](../00_Project/Vision.md) · [Gameplay](../01_Game_Design/Gameplay.md) · [LLDL](../02_Design_System/LLDL/LLDL.md) · [AB0](AB0_Asset_Philosophy_Production_Principles.md) · [AB1](AB1_Production_Standards.md) · [AB2](AB2_Game_Assets.md) |
| **Related Documents** | [WS4 — UI Language](../02_Design_System/LLDL/WS4_UI_Language.md) · [Components](../02_Design_System/Components.md) · [WS8 — Iconography](../02_Design_System/LLDL/WS8_Iconography_Language.md) · [WS9 — Accessibility](../02_Design_System/LLDL/WS9_Accessibility_Language.md) · `docs/03_Screens/*` |

## Navigation

| ← Previous | Next → | Index |
|------------|--------|-------|
| [AB2 — Game Assets](AB2_Game_Assets.md) | [AB4 — Marketing & Store Assets](AB4_Marketing_Store_Assets.md) | [Asset Bible](README.md) · [Documentation Home](../README.md) |

---

## Version History

| Version | Date | Author | Summary |
|---------|------|--------|---------|
| 1.0.0 | 2026-07-01 | ChatGPT / Cursor | Initial AB3 workshop record — interface experience specifications |
| 1.0.1 | 2026-07-01 | Cursor | Status hygiene pass — lifecycle aligned across AB3, Asset Bible README, and review package 0031 after Codex review |
| 1.0.2 | 2026-07-02 | Apoorv / Cursor | Human lock — Asset Bible workshop chain locked for integration (`0035`) |

## Change Log

| Version | Change |
|---------|--------|
| 1.0.0 | Initial workshop record: six interface experiences with unified production specification template |
| 1.0.1 | Codex review hygiene — document status, index, and review package lifecycle states aligned; ChatGPT review notes recorded in 0031 |
| 1.0.2 | Human lock recorded — status `Approved — Locked`; no design content changed |

---

## Document Authority

**AB3 is the player-facing interface and in-product brand experience authority within the Labyrinth Legends Asset Bible.**

| Conflict type | Authority |
|---------------|-----------|
| Product intent | [Vision](../00_Project/Vision.md) wins |
| Mechanical meaning and gameplay flow | [Gameplay](../01_Game_Design/Gameplay.md) wins |
| UI philosophy, visual language, tokens, components | [LLDL](../02_Design_System/LLDL/LLDL.md) and WS workshops win |
| Playable-world in-maze visuals | [AB2](AB2_Game_Assets.md) wins — AB3 does not govern |
| Production philosophy and universal standards | [AB0](AB0_Asset_Philosophy_Production_Principles.md) · [AB1](AB1_Production_Standards.md) win |
| Interface experience production specifications | **AB3 wins** |
| Public marketing and store surfaces | AB4 — AB3 does not define them |
| AI pipeline and lifecycle gate detail | AB5–AB6 — AB3 inherits; does not define them |
| Screen layout and widget implementation | `docs/03_Screens/*` · `lib/design_system/` — must align with AB3 and LLDL |

AB3 defines **how player-facing interface experiences are produced** — not how they are coded, wireframed, or marketed off-device.

When any interface production document conflicts with AB3 on **experience responsibility or production specification**, AB3 overrides until [Decisions](../00_Project/Decisions.md) records an explicit, Human-approved exception.

---

## Intended Audience

| Role | Use this document to… |
|------|------------------------|
| UI/UX Designers | Brief interface experiences before screen specs |
| Visual & Brand Designers | Extend in-product identity without parallel dialects |
| Icon & Typography Asset Authors | Produce assets within experience boundaries |
| Screen Spec Authors | Align `03_Screens/*` with experience responsibilities |
| Engineers | Understand what approved interface assets must deliver |
| Producers | Scope UI work as experience systems |
| AI Workflow Operators | Generate within experience families — AB5 extends |

---

## Table of Contents

1. [Introduction](#1-introduction)
2. [Universal Interface Principles](#2-universal-interface-principles)
3. [Player Journey](#3-player-journey)
4. [Brand Experience](#4-brand-experience)
5. [Entry Experience](#5-entry-experience)
6. [Core Navigation Experience](#6-core-navigation-experience)
7. [Gameplay Interface Experience](#7-gameplay-interface-experience)
8. [Progression Experience](#8-progression-experience)
9. [System Experience](#9-system-experience)
10. [Conclusion](#10-conclusion)
11. [Governance](#11-governance)
12. [What AB3 Must Not Do](#12-what-ab3-must-not-do)
13. [Workshop Conclusions](#13-workshop-conclusions)
14. [Related Documents](#14-related-documents)

---

## 1. Introduction

### 1.1 Purpose

Players meet Labyrinth Legends through **interface surfaces** — splash, menus, HUD, pause, rewards, settings — before and between moments inside the maze. Those surfaces must feel like **extensions of the temple**, not a separate application.

**AB3 defines the production specification for every player-facing interface and in-product brand experience** — how each experience supports the adventure, communicates with confidence, and remains consistent across the project lifetime.

AB3 answers:

> **How do we produce interface experiences that guide without competing with exploration and puzzle mastery?**

### 1.2 Authority and Scope

| AB3 owns | AB3 does not own |
|----------|------------------|
| Interface **experience** responsibilities and production specs | Gameplay rules, puzzle logic, movement |
| Player journey mapping for UI surfaces | In-maze world assets ([AB2](AB2_Game_Assets.md)) |
| Information hierarchy and interaction philosophy per experience | LLDL color, type, motion meaning (extends only) |
| Contained interface asset **categories** (not inventories) | Marketing, store, social, press (AB4) |
| Reuse strategy per experience | Wireframes, Figma files, Flutter widgets |
| In-product brand continuity (logo, splash, loading) | Export settings, naming syntax, QA gates (AB5–AB6) |

### 1.3 Inheritance

```text
Vision.md     — why the game exists
    ↓
Gameplay.md   — how the game works
    ↓
LLDL.md       — how the game looks, feels, moves, and communicates visually
    ↓
AB0 / AB1     — production philosophy and universal standards
    ↓
AB2           — playable-world asset systems (in-maze)
    ↓
AB3 (this doc)— interface and in-product brand experiences
    ↓
AB4–AB6       — marketing, AI pipeline, lifecycle
    ↓
03_Screens/*  — screen implementation specs
```

#### Vision

[Vision](../00_Project/Vision.md) requires premium craft and respect for player attention. Interface production must feel **calm, confident, and timeless** — never noisy, manipulative, or trend-chasing.

#### Gameplay

[Gameplay](../01_Game_Design/Gameplay.md) centers planning before action. Interface experiences must support **study, commit, and learn** — especially the gameplay interface experience — without replacing mechanical truth.

#### LLDL

[WS4 — UI Language](../02_Design_System/LLDL/WS4_UI_Language.md) is the UI authority. AB3 **extends** WS4 into production specifications for interface asset families. AB3 does not restate WS4 philosophy or redefine tokens.

#### AB0 and AB1

All interface asset production inherits [AB0](AB0_Asset_Philosophy_Production_Principles.md) discipline and [AB1](AB1_Production_Standards.md) governance — briefs, approval, libraries, traceability.

#### AB2 Boundary

[AB2](AB2_Game_Assets.md) owns **in-maze** visuals — environment, puzzle devices, collectibles as world objects, in-world feedback. AB3 owns **chrome and overlays** — HUD, menus, modals, meta-game frames. When an element could live in both layers, **gameplay communication in-maze stays AB2**; **player control and meta information stays AB3**.

#### Asset Bible and Technical Documentation

`Asset_Bible.md` integrates all workshops. `docs/03_Screens/*` and `lib/design_system/` implement approved experiences — they do not invent parallel interface law.

### 1.4 What AB3 Deliberately Does Not Own

AB3 excludes off-device marketing, store listings, technical implementation guides, and playable-world asset systems. If content describes maze tiles, explorer presentation, or in-world hazard glow — it belongs to AB2, not AB3.

---

## 2. Universal Interface Principles

Every interface experience inherits these principles **once**. Individual sections apply them; they do not restate them.

### 2.1 Interface Philosophy

The interface **quietly guides** — players focus on exploration, puzzle solving, progression, and discovery, not on operating chrome. The best interface is rarely noticed; it reinforces confidence continuously.

### 2.2 Player Confidence

Every surface answers: *Do I know where I am, what I can do, and what happened?* Uncertainty erodes premium trust faster than missing ornament.

### 2.3 Information Hierarchy

One **primary message** per surface. Secondary information yields to primary. Tertiary detail is progressive — revealed when needed, not by default.

### 2.4 Cognitive Load

Density is earned. Gameplay interfaces stay minimal; meta-game interfaces may carry more — per [WS4 §12](../02_Design_System/LLDL/WS4_UI_Language.md#12-information-density-philosophy). AB3 production enforces **progressive disclosure** as a standard, not a preference.

### 2.5 Consistency

Interface patterns repeat across experiences — navigation, controls, rewards, settings — so players learn once. New experiences extend families before inventing layouts.

### 2.6 Accessibility

Interface assets must support inclusive defaults — contrast, touch targets, scalable type, motion sensitivity — per [WS9](../02_Design_System/LLDL/WS9_Accessibility_Language.md). AB3 requires production validation; it does not redefine accessibility rules.

### 2.7 Brand Continuity

In-product brand (logo, splash, loading, ceremonial titles) must match the same civilization as gameplay and meta-game UI — no parallel identity between "menu game" and "maze game."

### 2.8 Interaction Philosophy

Touch-first, deliberate, calm — per [WS4 §25](../02_Design_System/LLDL/WS4_UI_Language.md#25-ui-interaction-tone). Interactions confirm intent; they do not celebrate every tap.

### 2.9 Feedback Philosophy

Interface feedback **confirms** actions and state — it does not solve puzzles or replace [GP6](../01_Game_Design/Gameplay/GP6_Gameplay_Feedback.md) gameplay feedback. Feedback is brief and subsides.

### 2.10 System Thinking

Interface production is organized as **experiences** and **reusable patterns** — not screen-by-screen hero art. See [AB1 §5.7](AB1_Production_Standards.md#57-systems-over-one-offs).

### Interface Experience Validation

Before any experience is complete:

1. Supports **one stage** of the player journey
2. Has **one primary** player-facing responsibility
3. Does **not overlap** another experience
4. Maintains **player confidence**
5. **Extends** — never replaces — higher authorities
6. Remains **scalable** for future features

---

## 3. Player Journey

All interface experiences support a single journey arc:

```text
Launch
    ↓
Splash / Brand
    ↓
Entry (Main Menu · Continue · New Game)
    ↓
Core Navigation (Worlds · Levels · Shop · Profile)
    ↓
Gameplay Interface (HUD · Pause · Contextual overlays)
    ↓
Progression (Complete · Rewards · Unlocks)
    ↓
System (Settings · Accessibility · Help · Legal)
    ↓
Exit
```

| Journey stage | AB3 experience owner |
|---------------|----------------------|
| Launch → Splash | Brand Experience |
| Main menu → first play | Entry Experience |
| Between levels and features | Core Navigation Experience |
| Inside a level (chrome only) | Gameplay Interface Experience |
| After level resolution | Progression Experience |
| Utility and comfort | System Experience |

Players may skip or repeat stages; production must keep **continuity** when they return.

---

## 4. Brand Experience

**Primary responsibility:** Establish identity and trust at first contact.

### Purpose

Brand experience assets introduce **Labyrinth Legends** as a premium ancient puzzle-adventure before gameplay begins. They set emotional tone and craft expectations for every downstream interface.

### Player Journey Context

Occurs at **launch** — cold start, return visit, and platform resume. Precedes entry and navigation. Must hand off cleanly to entry experience without jarring transition.

### Player Expectations

Players expect:

- Immediate recognition of a **serious, crafted** puzzle world
- Calm loading — respect for time
- No aggressive monetization or clutter before play
- Visual continuity with in-game temple identity

### Information Hierarchy

1. **Identity** — game is Labyrinth Legends, ancient temple fantasy
2. **Readiness** — loading or tap-to-continue when applicable
3. **Legal/platform** — only when required; never competes with identity

### Interaction Principles

- Minimal interaction — brand moments are **brief**
- Tap-to-continue only when needed; no arbitrary delays
- No skill tests or ads in brand surfaces
- First interactive element leads naturally to entry experience

### Visual Communication

- Logo and wordmark usage follows LLDL brand discipline — AB3 specifies **production roles** for logo assets, not logo design rules
- Splash and loading frames use ceremonial framing — per WS4 meta-game tone
- Motion is slow and confident — inherits [WS5](../02_Design_System/LLDL/WS5_Motion_Language.md); AB3 does not define motion curves
- States: loading, ready, error-recovery (calm retry messaging)

### Accessibility Considerations

- Loading indicators must not rely on motion alone
- Splash text readable at a glance; supports dynamic type where platform allows
- Sufficient contrast for logo on dark temple backgrounds

### Contained Interface Assets

| Category | Role |
|----------|------|
| **Logo lockups** | Primary and compact marks for in-product use |
| **Splash frames** | Launch identity canvas |
| **Loading presentations** | Progress and waiting communication |
| **App icon source** | Platform icon master — in-product brand reference |
| **Brand motion accents** | Short intro/outro loops for splash |

### Consistency & Reuse Strategy

- **One canonical brand kit** — variants derive from masters
- Splash and loading share **frame vocabulary** with meta-game panels
- Brand assets updated rarely — versioned with explicit approval
- AI-generated brand imagery must match approved lockups — human review mandatory
- Public marketing reskins AB4 — in-product brand remains authoritative here

---

## 5. Entry Experience

**Primary responsibility:** Orient the player and begin or resume play.

### Purpose

Entry experience covers **main menu and first-run orientation** — where players choose to continue, start, or understand what the game is. It bridges brand moment to navigation or direct play.

### Player Journey Context

Follows splash; precedes core navigation or gameplay. Returning players may bypass heavy onboarding.

### Player Expectations

Players expect:

- Clear **Continue** vs **New Game** (or equivalent) when applicable
- Immediate path to last meaningful progress
- Tone consistent with calm temple adventure — not dashboard clutter
- Onboarding that teaches **interface patterns**, not puzzle solutions

### Information Hierarchy

1. **Primary action** — continue or play
2. **Secondary** — settings, profile, light meta links
3. **Tertiary** — version, legal links via system experience

### Interaction Principles

- One obvious primary CTA — gold ceremonial action per LLDL component roles
- Touch targets meet accessibility production standards
- Onboarding is **skippable** for returning players
- No forced loops before play

### Visual Communication

- Ceremonial titles for game name; functional labels for controls — per [Typography](../02_Design_System/Typography.md) roles
- Iconography for menu entries inherits [WS8](../02_Design_System/LLDL/WS8_Iconography_Language.md)
- Entry panels use stone-slab vocabulary — per [Components](../02_Design_System/Components.md) families
- States: default, pressed, disabled, focused

### Accessibility Considerations

- Menu labels readable; icons paired with text where meaning is not universal
- Onboarding text localizable with layout tolerance
- Reduced motion respects brand intro skip

### Contained Interface Assets

| Category | Role |
|----------|------|
| **Main menu compositions** | Layout frames and backgrounds |
| **Primary CTA treatments** | Continue / Play affordances |
| **Onboarding panels** | First-run teaching surfaces |
| **Profile / slot selectors** | When multiple saves exist |
| **Entry iconography** | Menu entry symbols |

### Consistency & Reuse Strategy

- Main menu **shell pattern** reused across updates
- Onboarding modules plug into shell — not one-off flows per feature
- Entry assets share navigation chrome with core navigation experience
- New menu entries extend icon and row patterns — not new layout dialects

---

## 6. Core Navigation Experience

**Primary responsibility:** Move the player between major game destinations confidently.

### Purpose

Core navigation covers **world selection, level selection, shop entry, collections, and hub movement** — the meta-game map of where the player can go.

### Player Journey Context

Between entry and gameplay; also between sessions. High-frequency surface — consistency matters most here.

### Player Expectations

Players expect:

- Always know **where they are** in the structure (world, level list, shop)
- Predictable **back** behavior
- Progress visible without overwhelming detail
- Shop and progression entry feel part of the temple — not a different app

### Information Hierarchy

1. **Current location** — world, list, or hub title
2. **Available destinations** — levels, features
3. **Player resources** — currency chips, summaries
4. **Secondary actions** — settings, help

### Interaction Principles

- **Back** always returns to a predictable parent — per platform norms within LLDL tone
- Tabs and bottom navigation use **one pattern family** — e.g. stone slab bar
- Lists scroll calmly; no infinite-scroll fatigue for level grids
- Locked content reads as **locked** — not hidden unfairly

### Visual Communication

- Navigation chrome: panels, cards, bottom bars — [Components](../02_Design_System/Components.md) catalog
- World and level thumbnails are **preview art** — production category, not layout spec
- Selection states multichannel — border, label, icon per WS11 state discipline
- Currency display uses HUD chip vocabulary consistently

### Accessibility Considerations

- List rows meet touch target standards
- Locked/unlocked not color-only
- Level identifiers readable in grid and list modes

### Contained Interface Assets

| Category | Role |
|----------|------|
| **Navigation chrome** | Bars, headers, tab strips |
| **Hub backgrounds** | Meta-game environmental frames |
| **List and grid row templates** | Level/world rows |
| **Thumbnail frames** | Preview borders and badges |
| **Lock / progress badges** | State overlays on destinations |
| **Currency header chips** | Meta-game resource display |

### Consistency & Reuse Strategy

- **One navigation shell** across worlds and features
- Row templates parameterized by content type — level, shop item, achievement
- Thumbnail aspect ratios fixed per template family
- New hubs reuse shell — add row types only with taxonomy justification

---

## 7. Gameplay Interface Experience

**Primary responsibility:** Support planning and execution without obscuring the maze.

### Purpose

Gameplay interface covers **HUD, pause, contextual overlays, and minimal chrome during play** — everything the player sees **over** the maze that is not an in-maze object ([AB2](AB2_Game_Assets.md)).

### Player Journey Context

Active level — drawing, confirming, executing, failing, retrying. Highest sensitivity to cognitive load.

### Player Expectations

Players expect:

- Maze remains **primary visual focus**
- HUD appears when helpful — progressive disclosure per [WS4 §4](../02_Design_System/LLDL/WS4_UI_Language.md#4-gameplay-hud-philosophy)
- Pause is calm and reversible
- Objectives readable without solving the puzzle for them
- Controls for undo, confirm, retry are obvious at the right phases

### Information Hierarchy

1. **Maze board** — dominant (not an AB3 asset; AB2/environment)
2. **Phase-critical controls** — draw, confirm, retry when active
3. **Objectives and resources** — when phase allows
4. **Pause / menu access** — persistent but quiet

### Interaction Principles

- **Progressive HUD** — chips and control bar hidden during execution when design requires — per `docs/03_Screens/Gameplay.md`
- Touch targets on controls do not cover critical maze cells
- Pause interrupts without punishing
- No real-time steering UI — consistent with [GP2](../01_Game_Design/Gameplay/GP2_Movement_System.md)

### Visual Communication

- HUD uses **functional typography only** during live play — per WS7 gameplay HUD rules
- Primary actions gold; energy/cyan for path semantics only — LLDL roles preserved in production briefs
- Overlays (pause, retry) may use ceremonial titles — paired with functional body
- Icon buttons for pause/settings require semantics labels — production checklist per AB1

### Accessibility Considerations

- HUD controls meet minimum touch size
- Phase changes communicated multichannel — not animation-only
- High contrast for control bar on dark maze backgrounds

### Contained Interface Assets

| Category | Role |
|----------|------|
| **HUD chips** | Objectives, currency during drawing phase |
| **Control bar** | Draw, undo, confirm, retry |
| **Pause overlay frame** | Modal shell and actions |
| **Contextual hint chrome** | Non-solving guidance frames |
| **Phase transition treatments** | Drawing vs executing visual calm |
| **Gameplay icon set** | Pause, settings, retry, confirm |

### Consistency & Reuse Strategy

- **One gameplay HUD family** across worlds — biome accents only
- Control bar layout stable across levels — reduces relearning
- Overlay modals share modal pattern with progression experience
- Gameplay icons subset of global icon library — WS8 inheritance

---

## 8. Progression Experience

**Primary responsibility:** Celebrate outcomes and communicate growth.

### Purpose

Progression experience covers **level complete, rewards, stars, unlocks, treasure reveals, and achievement moments** — the emotional punctuation between levels.

### Player Journey Context

Follows gameplay resolution — success or structured retry flows. Bridges back to navigation or next level.

### Player Expectations

Players expect:

- Success feels **earned** — ceremonial, not arcade spam
- Rewards clearly shown — what was gained and why
- Unlocks explain what opened
- Failure and retry paths are respectful — no shaming
- Continue path obvious

### Information Hierarchy

1. **Outcome** — success, partial success, retry
2. **Rewards** — stars, currency, collectibles summary
3. **Unlocks** — new content if any
4. **Navigation** — next level, map, retry

### Interaction Principles

- Celebration **peaks then releases** — player returns to calm
- Primary CTA for next action is unambiguous
- Retry is always available when rules allow — per GP4/GP5 fairness
- No dark patterns blocking progress

### Visual Communication

- Ceremonial typography permitted on titles — functional on stats
- Reward presentation uses seal / relic visual language — aligned with collectibles identity without duplicating AB2 in-maze assets
- Motion accent on reveal — inherits WS5; production specifies **moment tiers**
- Star and badge assets consistent with progression language

### Accessibility Considerations

- Reward text readable; numerals clear
- Celebration motion skippable or reduced per comfort settings
- Color not sole channel for star tiers

### Contained Interface Assets

| Category | Role |
|----------|------|
| **Victory / complete frames** | Outcome presentation shells |
| **Star and rating displays** | Mastery communication |
| **Reward reveal panels** | Currency, collectibles summary |
| **Unlock banners** | New feature/world announcements |
| **Retry / fail frames** | Respectful failure presentation |
| **Achievement seals** | Milestone badges |

### Consistency & Reuse Strategy

- **Outcome template trio** — success, partial, retry — shared structure
- Reward reveal components reused in shop and progression
- Seal and badge library grows slowly — tiered families
- New reward types extend existing panels — not new celebration dialects

---

## 9. System Experience

**Primary responsibility:** Support comfort, trust, and platform obligations.

### Purpose

System experience covers **settings, accessibility controls, credits, help, legal, save/sync status, and notifications** — utility surfaces that protect player comfort and compliance.

### Player Journey Context

Accessible from entry, navigation, pause — anytime the player seeks control or information outside play.

### Player Expectations

Players expect:

- Settings are **findable and understandable**
- Accessibility options actually affect experience
- Legal and credits are present but unobtrusive
- Help explains **systems**, not puzzle answers
- Save status builds trust — no silent data loss anxiety

### Information Hierarchy

1. **Comfort controls** — audio, haptics, motion, accessibility
2. **Account / save** — when applicable
3. **Help and about**
4. **Legal** — privacy, terms

### Interaction Principles

- Settings use familiar platform patterns **within** LLDL styling — toggles, lists
- Changes apply immediately or with clear save affordance
- Help never links to external clutter without context
- Notifications (if any) respect calm tone — no urgency manipulation

### Visual Communication

- Utility screens use **functional layout** — ceremonial title, functional body
- Section panels reuse `LLSection` / `LLPanel` vocabulary
- Icons for settings categories from global set
- Error states calm — explain and recover

### Accessibility Considerations

- Settings is where accessibility lives — production must exemplify best practice
- All toggles labeled; state announced
- Text scales; layouts tolerate localization

### Contained Interface Assets

| Category | Role |
|----------|------|
| **Settings section templates** | Grouped preference panels |
| **Toggle and control styling** | Comfort control presentation |
| **Help article frames** | In-app guidance layout |
| **Credits scroll shells** | Attribution presentation |
| **Legal text frames** | Policy display |
| **Notification toasts** | System messages — rare, calm |

### Consistency & Reuse Strategy

- **One settings architecture** — new options add rows, not new screens
- Help content modular — topics plug in
- Legal/credits updated centrally
- System icons minimal set — reused across utility surfaces

---

## 10. Conclusion

### 10.1 How Experiences Work Together

Interface production is one **continuous temple instrument**:

```text
Brand (trust) → Entry (orient) → Navigation (move)
        ↓
Gameplay Interface (support plan) → Progression (celebrate)
        ↓
System (comfort) → return to Navigation or Entry
```

Each experience owns one journey role. Overlap creates player confusion and production debt.

### 10.2 Inheritance Summary

| Authority | AB3 inherits by… |
|-----------|------------------|
| **Vision** | Calm premium adventure; respect player attention |
| **Gameplay** | Supporting plan/commit/learn — never replacing rules |
| **LLDL / WS4** | Producing assets that express UI language — not redefining it |
| **AB0 / AB1** | Governance, libraries, approval on all interface assets |
| **AB2** | Respecting in-maze vs chrome boundary |

### 10.3 Foundation for AB4–AB6

| Workshop | Relationship to AB3 |
|----------|---------------------|
| **AB4** | Extends brand to **public** marketing and store — must match in-product brand |
| **AB5** | AI pipeline for interface asset families defined here |
| **AB6** | Lifecycle gates apply AB1 state model to AB3 deliverables |

---

## 11. Governance

### 11.1 Document Authority

AB3 is subordinate to Vision, Gameplay, LLDL, AB0, AB1, and AB2 (for in-maze boundary). AB3 is authoritative for interface experience production specifications.

### 11.2 Document Lifecycle

| State | Meaning |
|-------|---------|
| **Draft** | Active authorship |
| **Approved** | Reviewer acceptance |
| **Approved — Locked** | Human-locked; version bump for changes |

AB3 should normally be approved and locked after AB2 to preserve Asset Bible dependency order. Exceptions require explicit Human approval.

### 11.3 Review Methodology

Follow LLDS compiler workflow — review package, Codex, ChatGPT, Human approval. See [99_Reviews](../99_Reviews/README.md).

---

## 12. What AB3 Must Not Do

AB3 must **not**:

- Define gameplay mechanics, puzzle logic, or movement rules
- Specify in-maze world, puzzle, or collectible assets (AB2)
- Redefine LLDL color, typography, motion, or component meaning
- Create wireframes, Figma files, or Flutter implementation guides
- Define marketing, store, or social assets (AB4)
- Specify export formats, naming syntax, or AI prompts (AB5–AB6)
- Duplicate AB0, AB1, or WS4 prose — reference and extend

---

## 13. Workshop Conclusions

AB3 — UI & Brand Assets records the following workshop conclusions for review:

| # | Conclusion |
|---|------------|
| 1 | Six interface experiences cover all player-facing UI and in-product brand production |
| 2 | Each experience has one journey role and one primary responsibility |
| 3 | AB2/AB3 boundary is explicit — in-maze vs chrome |
| 4 | LLDL/WS4 is extended for production — never redefined |
| 5 | Progressive HUD and calm interaction inherit Gameplay and WS4 |
| 6 | Interface production is pattern- and library-based — scalable across features |
| 7 | Accessibility is production-validated per experience |
| 8 | Brand, entry, navigation, gameplay, progression, and system experiences share reuse families |
| 9 | AB4–AB6 extend AB3 without overlapping in-product scope |
| 10 | AB3 locks after Human approval following AB0 → AB1 → AB2 order |

---

## 14. Related Documents

### Locked authorities

- [Vision](../00_Project/Vision.md)
- [Gameplay](../01_Game_Design/Gameplay.md)
- [LLDL](../02_Design_System/LLDL/LLDL.md)

### Asset Bible

- [AB0](AB0_Asset_Philosophy_Production_Principles.md)
- [AB1](AB1_Production_Standards.md)
- [AB2](AB2_Game_Assets.md)
- [AB4 — Marketing & Store Assets](AB4_Marketing_Store_Assets.md)
- [AB5 — AI Production Pipeline](AB5_AI_Production_Pipeline.md)
- [AB6 — Review & Asset Lifecycle](AB6_Review_Asset_Lifecycle.md)
- [Asset Bible](Asset_Bible.md)
- [Asset Bible README](README.md)

### Design reference

- [WS4 — UI Language](../02_Design_System/LLDL/WS4_UI_Language.md)
- [WS8 — Iconography](../02_Design_System/LLDL/WS8_Iconography_Language.md)
- [WS9 — Accessibility](../02_Design_System/LLDL/WS9_Accessibility_Language.md)
- [Components](../02_Design_System/Components.md)
- [Typography](../02_Design_System/Typography.md)
- `docs/03_Screens/*`

### Governance

- [Decisions](../00_Project/Decisions.md)
- [99_Reviews](../99_Reviews/README.md)
