# WS11 — Components Language

| Field | Value |
|-------|-------|
| **Project** | Labyrinth Legends |
| **Document Name** | WS11 — Components Language |
| **Document ID** | LLDL-DOC-WS11-001 |
| **Series** | WS11 — Labyrinth Legends Design Language (LLDL) Components Authority |
| **Version** | 1.0.0 |
| **Status** | Approved |
| **Owner** | Apoorv |
| **Prepared By** | ChatGPT (workshop) · Cursor (compiler) |
| **Last Updated** | 2026-06-30 |
| **Workshop** | WS11 — Components Language |
| **Path** | `docs/02_Design_System/LLDL/WS11_Components_Language.md` |
| **Dependencies** | [Vision](../../00_Project/Vision.md) · [WS0 — Design Philosophy](WS0_Design_Philosophy.md) · [WS1 — Visual Identity](WS1_Visual_Identity_Artistic_Direction.md) · [WS2 — Color Language](WS2_Color_Language.md) · [WS3 — Environment Language](WS3_Environment_Language.md) · [WS4 — UI Language](WS4_UI_Language.md) · [WS5 — Motion Language](WS5_Motion_Language.md) · [WS6 — Audio Language](WS6_Audio_Language.md) · [WS7 — Typography Language](WS7_Typography_Language.md) · [WS8 — Iconography Language](WS8_Iconography_Language.md) · [WS9 — Accessibility Language](WS9_Accessibility_Language.md) · [WS10 — Design Tokens Language](WS10_Design_Tokens_Language.md) |
| **Related Documents** | [LLDL](LLDL.md) · [Components](../Components.md) · [Design_Tokens](../Design_Tokens.md) · `docs/03_Screens/*` |

## Navigation

| ← Previous | Next → | Index |
|------------|--------|-------|
| [WS10 — Design Tokens Language](WS10_Design_Tokens_Language.md) | [LLDL Complete](LLDL.md) | [Documentation Home](../../README.md) · [LLDL](LLDL.md) |

---

## Version History

| Version | Date | Author | Summary |
|---------|------|--------|---------|
| 1.0.0 | 2026-06-30 | ChatGPT / Cursor | WS11 — components language authority for LLDL |

## Change Log

| Version | Change |
|---------|--------|
| 1.0.0 | Initial workshop record: component philosophy, inheritance model, functional vs ceremonial tiers, domain-specific component families, states, feedback, governance, anti-patterns |

---

## Document Authority

**WS11 is the reusable components authority within the Labyrinth Legends Design Language (LLDL).**

| Conflict type | Authority |
|---------------|-----------|
| Product intent | [Vision](../../00_Project/Vision.md) wins |
| Design philosophy | [WS0 — Design Philosophy](WS0_Design_Philosophy.md) wins |
| Channel languages (color, type, motion, iconography, accessibility, tokens) | WS2–WS10 win on meaning within their domain |
| Component philosophy, inheritance, state behavior, reuse, governance | **WS11 wins** |
| Component APIs, token values, per-screen layout | [Components](../Components.md) · [Design_Tokens](../Design_Tokens.md) · `docs/03_Screens/*` — must align with WS11; WS11 does not define implementation |

WS11 extends Vision and WS0–WS10. It translates workshop authorities into **governed reusable interface building blocks** without prescribing APIs, dimensions, widget trees, or production workflows. When a proposed component conflicts with WS4 UI restraint, WS2 color roles, WS5 motion temperament, WS9 accessibility defaults, or WS10 token hierarchy, the upstream workshop document prevails until [Decisions](../../00_Project/Decisions.md) records an explicit, Human-approved exception.

WS10 defines *how design decisions become named tokens*. **WS11 defines how tokens and workshop languages compose into reusable components** — consistent, readable, temple-authentic, and accessible at scale.

Whenever component-related documentation conflicts within the component domain, **WS11 takes precedence** over [Components](../Components.md), screen specs, and feature-level UI notes until those documents are reconciled.

---

## Intended Audience

| Role | Use this document to… |
|------|------------------------|
| Design System Leads | Author component families and governance before catalog expansion |
| UI/UX Designers | Propose components that inherit LLDL without one-off styling |
| Component Authors | Map new building blocks to token layers and upstream workshops |
| Screen Spec Authors | Compose screens from approved families — not ad-hoc widgets |
| Engineers | Understand inheritance and state expectations before implementation |
| Accessibility Reviewers | Verify component defaults respect WS9 multichannel communication |
| Monetization Designers | Frame store and offer components within ancient-instrument identity |
| Implementation Agents | Reject generic mobile widgets and ungoverned one-off UI in features |

---

## Table of Contents

1. [Purpose of the Components Language](#1-purpose-of-the-components-language)
2. [Components Philosophy](#2-components-philosophy)
3. [Components as LLDL Expressions](#3-components-as-lldl-expressions)
4. [Component Inheritance Model](#4-component-inheritance-model)
5. [Relationship to Design Tokens](#5-relationship-to-design-tokens)
6. [Functional vs Ceremonial Components](#6-functional-vs-ceremonial-components)
7. [Gameplay Components](#7-gameplay-components)
8. [Meta-Game Components](#8-meta-game-components)
9. [Button Philosophy](#9-button-philosophy)
10. [Panel & Card Philosophy](#10-panel--card-philosophy)
11. [Modal & Overlay Philosophy](#11-modal--overlay-philosophy)
12. [Navigation Components](#12-navigation-components)
13. [HUD Components](#13-hud-components)
14. [List & Collection Components](#14-list--collection-components)
15. [Reward Components](#15-reward-components)
16. [Inventory & Artifact Components](#16-inventory--artifact-components)
17. [Store & Monetization Components](#17-store--monetization-components)
18. [Settings & Utility Components](#18-settings--utility-components)
19. [Component States](#19-component-states)
20. [Component Feedback](#20-component-feedback)
21. [Component Motion](#21-component-motion)
22. [Component Iconography](#22-component-iconography)
23. [Component Typography](#23-component-typography)
24. [Component Accessibility](#24-component-accessibility)
25. [Component Composition](#25-component-composition)
26. [Component Consistency Rules](#26-component-consistency-rules)
27. [Component Governance](#27-component-governance)
28. [Component Anti-Patterns](#28-component-anti-patterns)
29. [Design Decision Framework](#29-design-decision-framework)
30. [Summary](#30-summary)
31. [Workshop Conclusions](#31-workshop-conclusions)
32. [Related Documents](#32-related-documents)

---

## 1. Purpose of the Components Language

Reusable components are how LLDL **enters the player's hands** — every button pressed, panel read, modal acknowledged, reward received, and artifact inspected passes through a component decision. Ungoverned components become generic mobile widgets. Generic mobile widgets destroy temple identity and puzzle clarity.

WS11 answers:

> **How should reusable interface building blocks preserve consistency, readability, ancient-world identity, accessibility, and premium interaction quality across Labyrinth Legends?**

Without component authority, teams default to platform stock controls, one-off styled buttons, decorative HUD clutter, and screen-specific inventions that drift from WS0–WS10. Premium craft erodes. Review becomes subjective. Players encounter a puzzle temple wrapped in a utility app.

WS11 establishes the **permanent component philosophy and governance** for all reusable UI families. It does not define exact APIs, layout specs, numeric values, or implementation files.

### What WS11 Governs

- Component purpose and identity within LLDL
- Inheritance from WS0–WS10 and design tokens
- Functional vs ceremonial component tiers
- Domain-specific families: gameplay, meta-game, navigation, HUD, rewards, collection, store, settings
- State, feedback, motion, typography, and iconography expectations at component level
- Composition, consistency, governance, and anti-patterns

### What WS11 Does Not Govern

- Exact component APIs or property names
- Token hex values or spacing scales
- Per-screen layout and information architecture detail
- Gameplay rules or mechanical precedence
- Production workflows or asset pipelines

---

## 2. Components Philosophy

**Locked workshop decision:** Components are **reusable expressions of LLDL** — not generic UI widgets borrowed from platform defaults.

### Core Principles

1. **LLDL first** — Every component should feel like it belongs inside a forgotten temple interface, not a stock mobile shell.
2. **Tokens inherit** — Components consume approved semantic and component tokens; they do not author raw values independently.
3. **Clarity before decoration** — Carved surfaces, engraved borders, and mystical highlights enrich — they never reduce readability, comprehension, touch usability, or functional clarity.
4. **Gameplay restraint** — Gameplay-facing components remain minimal, contextual, and non-competitive with the labyrinth.
5. **Meta-game craftsmanship** — Meta-game components may feel more crafted, ceremonial, and ancient-instrument-like.
6. **State clarity** — States must be understandable through multiple signals: shape, color, motion, text, iconography, and placement.
7. **Accessibility by default** — Components inherit accessibility-respecting defaults from WS9 and WS10.
8. **Consistency over novelty** — New variants are created only when an existing component family cannot express the need.

### The Component Identity Test

Before approving any component family, ask:

> Would a player believe this control was **carved, forged, or inscribed** for this temple — or imported from a generic app template?

If the answer is the latter, the component fails WS11 regardless of visual polish.

### Design Intent

Anchor all future component work in durable philosophy — independent of engine, framework, or production method.

---

## 3. Components as LLDL Expressions

Components are the **smallest governed unit of interface identity** that repeats across screens. They carry forward decisions from every upstream workshop:

- **WS0** — player-first clarity and calm tension
- **WS1** — ancient tech and mythical ruins material language
- **WS2** — semantic color roles — gold authority, energy activation, danger restraint
- **WS3** — environmental weight, depth, and ruin continuity
- **WS4** — hybrid UI, progressive HUD, physical foundation
- **WS5** — deliberate, premium motion temperament
- **WS6** — restrained audio feedback identity
- **WS7** — dual typographic system — functional vs ceremonial
- **WS8** — symbolic iconography with functional guardrails
- **WS9** — multichannel accessible communication
- **WS10** — semantic token hierarchy and governance

A component that looks correct but violates upstream meaning is **not** an LLDL component — it is decoration on a foreign control.

### Expression Layers

| Layer | What the component expresses |
|-------|------------------------------|
| **Material** | Stone, metal, crystal, inscribed surfaces per WS1 and WS4 |
| **Semantic** | Action, energy, danger, reward roles per WS2 |
| **Behavior** | States, feedback, motion per WS4, WS5, WS6 |
| **Communication** | Labels, icons, hierarchy per WS7, WS8, WS9 |
| **Governance** | Token consumption and catalog discipline per WS10 |

### Design Intent

Make component authorship a translation exercise — not an invention exercise.

---

## 4. Component Inheritance Model

**Locked workshop decision:** Components **inherit upstream authority by category** — they do not redefine channel meaning locally.

### Inheritance Map

| Component concern | Primary upstream authority |
|-------------------|---------------------------|
| Visual identity and materials | [WS1 — Visual Identity](WS1_Visual_Identity_Artistic_Direction.md) · [WS4 — UI Language](WS4_UI_Language.md) |
| Color roles and state emphasis | [WS2 — Color Language](WS2_Color_Language.md) |
| Environmental continuity | [WS3 — Environment Language](WS3_Environment_Language.md) |
| UI presentation and density | [WS4 — UI Language](WS4_UI_Language.md) |
| Motion and transition | [WS5 — Motion Language](WS5_Motion_Language.md) |
| Audio feedback | [WS6 — Audio Language](WS6_Audio_Language.md) |
| Text roles and hierarchy | [WS7 — Typography Language](WS7_Typography_Language.md) |
| Icons and sigils | [WS8 — Iconography Language](WS8_Iconography_Language.md) |
| Accessibility defaults | [WS9 — Accessibility Language](WS9_Accessibility_Language.md) |
| Token consumption | [WS10 — Design Tokens Language](WS10_Design_Tokens_Language.md) |

### Inheritance Rules

- Components **compose** upstream decisions — they do not fork parallel dialects
- Component families reference **semantic or component tokens** — not raw literals
- Screen-specific layout uses screen context — shared components remain context-agnostic
- When inheritance conflicts arise, **higher workshop authority wins** until Decisions records an exception

### Component Family Hierarchy

```text
Vision + WS0 philosophy
  └── Channel workshops (WS1–WS9)
        └── WS10 token hierarchy
              └── WS11 component families
                    └── Components.md catalog (APIs and variants)
                          └── Screen specs (composition and layout)
```

### Design Intent

Ensure component changes propagate philosophy — not isolated visual taste.

---

## 5. Relationship to Design Tokens

Components and tokens are **paired layers** of the same system. WS10 governs token philosophy; WS11 governs how tokens assemble into reusable parts.

### Consumption Rules

- Components consume **component tokens** where defined — composed from semantic tokens
- When no component token exists, consume **semantic tokens** — never global primitives or raw literals in feature code
- New component families require **component token sets** alongside catalog entries — not ad hoc assembly per screen
- Component tokens do not redefine WS2 color semantics — they compose them

### Token–Component Alignment

| Token tier | Component relationship |
|------------|------------------------|
| Semantic | Default consumption layer for shared behavior (action, surface, text, motion) |
| Component | Encodes approved identity of a family (primary button, stone panel, seal badge) |
| Screen | Rare layout density overrides — never embedded inside shared components |

### Promotion Path

Repeated ad hoc token assembly in features signals a **missing component family**. Propose component + component tokens → approve → catalog → reuse everywhere.

### Design Intent

Prevent features from becoming accidental design system forks.

---

## 6. Functional vs Ceremonial Components

**Locked workshop decision:** Components divide into **functional** and **ceremonial** tiers — not as separate catalogs, but as behavioral and expressive modes within families.

### Functional Components

- Prioritize **legibility, touch clarity, and task completion**
- Minimal ornament near interactive targets
- Functional typography roles by default
- Restrained motion and audio
- Examples: settings rows, gameplay HUD chips, confirmation controls, utility toggles

### Ceremonial Components

- Prioritize **celebration, discovery, and ancient craft**
- May use inscription typography, seal framing, warm metallic emphasis, brief luminous accent
- Still readable; still accessible; still governed by WS9
- Examples: reward seals, relic presentation plates, world-completion marks, premium unlock framing

### Tier Discipline

- Ceremonial treatment **never replaces** functional clarity on critical paths
- Gameplay components default **functional** — ceremonial accents are rare and brief
- Meta-game components may shift toward **ceremonial** when the moment warrants — reward, unlock, artifact reveal
- The same family (e.g., button, panel) may support both modes through governed variants — not through one-off screen styling

### Design Intent

Allow temple identity to breathe in celebration without sacrificing puzzle usability.

---

## 7. Gameplay Components

Gameplay components serve **Draw Your Fate** — study, plan, commit, execute, resolve. They must remain subordinate to the labyrinth.

### Gameplay Component Qualities

- **Minimal footprint** — smallest effective presence during planning and execution
- **Progressive appearance** — elements surface only when the loop phase requires them
- **Non-competitive** — no persistent chrome that fights maze readability
- **Contextual** — path tools, confirm actions, phase indicators tied to current decision
- **Functional tier default** — ornament reduced near the chamber

### Gameplay Component Families

- Planning and path expression affordances
- Commit and undo controls
- Phase indicators (study, draw, execute, resolve)
- Objective and hazard summaries when fairness requires visibility
- Brief execution feedback — not celebration panels

### Gameplay Components Must Not

- Introduce dashboard density over the maze
- Use ceremonial typography for live HUD labels
- Pulse, bounce, or compete with path energy for attention
- Hide fairness-critical information behind decoration
- Persist reward or store affordances during active chamber focus

### Design Intent

Protect WS0 readability and WS4 progressive HUD philosophy through component restraint.

---

## 8. Meta-Game Components

Meta-game components support **navigation, progression, collection, commerce, and utility** outside active chamber focus. They may express greater craftsmanship.

### Meta-Game Component Qualities

- **Temple instrument identity** — carved archives, inscribed tablets, sealed mechanisms
- **Moderate density** — scannable lists and clear focal actions per WS4
- **Ceremonial allowance** — rewards, unlocks, and relic moments may elevate expression
- **Progressive disclosure** — secondary detail behind expansion, tabs, or reveal
- **Warm authority** — gold emphasis for primary navigation and commitment per WS2

### Meta-Game Component Families

- Navigation rails, tabs, and back affordances
- World and chamber selection tiles
- Progression summaries and seal marks
- Collection plates and catalog entries
- Store offerings and purchase actions
- Settings groups and utility controls

### Meta-Game Components Must Not

- Collapse into generic list-and-card mobile patterns without LLDL materials
- Shame incomplete progression with aggressive visual tally language
- Present equal-weight competing primary actions on one surface
- Use casino spectacle for rewards or purchases

### Design Intent

Make outside-chamber UI feel like operating ancient temple apparatus — not managing a utility app.

---

## 9. Button Philosophy

Buttons are **mechanisms of commitment** — engraved plates, sealed actions, toggle apparatus. They inherit WS4 control philosophy and WS2 gold semantic role.

### Primary Actions

- Warm metallic emphasis — authority and commitment
- Clear text label; sigil supports but never replaces label on critical paths
- One primary button per decision surface
- Distinct default, pressed, focused, disabled, and loading states — perceptible without color alone

### Secondary Actions

- Recessed stone or subdued metal — lower visual weight
- Ghost and outline treatments still use temple materials — not generic flat text links

### Destructive or Irreversible Actions

- Clear labeling; deliberate pacing; confirmation patterns
- Ceremonial weight without mockery or alarm flooding
- Danger semantics per WS2 — not undifferentiated red panic

### Button Variants Governance

- New button variants require **documented semantic purpose** — not aesthetic preference alone
- Energy-colored buttons serve **activation and magical secondary actions** — not default primary CTAs
- Icon-only buttons permitted only where WS8 and WS9 multichannel requirements are met

### Design Intent

Align every press with inscription language and player trust.

---

## 10. Panel & Card Philosophy

Panels and cards are **stone slabs and catalog plates** — containers that group information without becoming wallpaper.

### Panel Qualities

- Physical material foundation — carved stone, chamfered edges, engraved border restraint
- Readable interior field — content sits on calm surface, not busy relief
- Hierarchy through inset, border weight, and elevation — not rainbow outlines
- Compact variants for HUD and dense meta lists; full variants for focal content

### Card Qualities

- Lighter elevation for scannable rows — world entries, shop rows, reward list items
- Tappable when the whole unit is the action; static panel when grouping only
- Object identity over spreadsheet density — especially for artifacts and offers

### Panel & Card Must Not

- Become generic flat rectangles with default platform shadows
- Carry decoration that reduces text contrast or touch target clarity
- Multiply nested panels without hierarchy justification
- Use energy glow as default idle container state

### Design Intent

Frame content as temple architecture — not card UI from a template library.

---

## 11. Modal & Overlay Philosophy

Modals and overlays **interrupt the ruin** — they must earn interruption per WS4.

### Overlay Qualities

- Inscribed panel or seal tablet framing — not system alert aesthetic
- Temple darkness dimming — environment or chamber remains perceptible beneath
- Clear dismiss affordance; no trap patterns
- Brief during gameplay; more expansive in meta-game when commitment or reward warrants

### Modal Use Cases

- Confirmation of irreversible or costly actions
- Reward and unlock presentation
- Critical information that cannot defer
- Blocking errors that require acknowledgment

### Modal Must Not

- Replace routine navigation
- Stack deeply without escape clarity
- Obscure costs, subscriptions, or destructive consequences
- Use hyperactive motion or audio on appearance

### Design Intent

Make interruption feel like opening a sealed tablet — not triggering an operating system dialog.

---

## 12. Navigation Components

Navigation components orient the player through **ruins and archives** — home, world map, level select, back paths, tab families.

### Navigation Qualities

- Persistent wayfinding without persistent clutter
- Current location understandable through label, icon, and state — not color alone
- Back and close affordances consistent across meta-game
- Tab and segment controls use temple materials — engraved selectors, not stock underlines

### Navigation Hierarchy

1. **Primary route** — where the player is going now
2. **Context** — where they came from; world or chamber identity
3. **Secondary destinations** — settings, store, collection access
4. **Decorative framing** — subordinate to route clarity

### Navigation Must Not

- Bury primary routes behind excessive depth
- Use icon-only primary navigation without text backup
- Introduce competing navigation paradigms per screen family

### Design Intent

Wayfinding should feel like reading temple markers — not switching app tabs blindly.

---

## 13. HUD Components

HUD components are **phase-aware instruments** overlaid on gameplay — the most restraint-demanding component family.

### HUD Qualities

- Appear when the loop phase requires them; recede otherwise
- Minimal count — objective summary, phase cue, essential action only
- Functional typography and iconography exclusively
- Touch targets adequate without expanding footprint unnecessarily
- Energy accents only for active path or activation states

### HUD Families

- Objective and collectable summaries
- Phase indicators (study, draw, confirm, execute)
- Non-intrusive resource or streak displays when product requires
- Contextual tool toggles tied to planning

### HUD Must Not

- Form permanent dashboard frames around the maze
- Animate continuously when idle
- Introduce store, social, or promotional widgets during chamber focus
- Use ceremonial seals or reward language during execution

### Design Intent

HUD exists to **support the puzzle** — never to compete with it.

---

## 14. List & Collection Components

Lists and collections present **structured sets** — worlds, chambers, settings groups, shop rows, relic catalogs.

### List Qualities

- Scannable rows with clear primary label and supporting context
- Selection and current-item states multichannel per WS9
- Group headers and sections when density requires — not undifferentiated walls
- Progressive disclosure for lore-heavy secondary detail

### Collection Presentation

- Rows feel like **catalog entries or archive plates** — not generic list items
- Rarity and status use WS2 semantic accents — warm metal, crystal violet — with restraint
- Empty states explain next action — not decorative dead ends

### List & Collection Must Not

- Collapse to undecorated platform list rows without LLDL containers
- Present equal visual weight for every row when hierarchy exists
- Hide critical status (locked, unavailable, purchased) behind hover-only or color-only cues

### Design Intent

Structured data should read as **exploration records** — not spreadsheet exports.

---

## 15. Reward Components

Reward components celebrate **earned intelligence** — escape, discovery, mastery, optional excellence.

### Reward Qualities

- Ceremonial tier expression — seals, engraved plates, brief luminous accent
- Clear statement of what was earned and why
- Warm emphasis without slot-machine particle storms
- Proportionate duration — elevation then graceful return per WS5
- Optional layers visually distinct from primary success

### Reward Families

- Escape and chamber completion seals
- Collectible and relic acquisition reveals
- Mastery and optional objective marks
- Currency or resource grants when applicable

### Reward Components Must Not

- Use casino reel, loot-box spectacle, or explosive overshoot aesthetics
- Obscure actual reward content behind excessive animation
- Shame partial success on optional objectives
- Default to generic star ratings without thematic mark language

### Design Intent

Rewards feel like **receiving a temple mark** — not winning a mini-game spectacle.

---

## 16. Inventory & Artifact Components

Inventory and artifact components present **civilization objects** — archaeological catalog, not gear-stat power fantasy.

### Artifact Qualities

- Object-first presentation — plate, niche, tablet framing
- Name="relic" identity through silhouette, inscription, and material — not shopping-mall product cards
- Lore and inscription optional behind disclosure
- Rarity communicated through material accent and framing — not neon badges

### Inventory Families

- Artifact detail plates
- Collection grid or catalog entries
- Equipped or active indicators when systems require
- Filter and sort controls with utility clarity

### Inventory Must Not

- Become RPG stat-wall interfaces by default
- Use deceptive rarity pulsing or fake scarcity timers on sacred objects
- Hide equipped effects that affect fairness or player understanding

### Design Intent

Collection UI supports **explorer fantasy** — curiosity and catalog, not inventory grind.

---

## 17. Store & Monetization Components

Store and monetization components are **temple instruments for exchange** — premium, honest, restrained per WS4 and Vision non-goals.

### Store Qualities

- Engraved merchant archive or offering altar framing — not carnival shop
- Prices, terms, and actions always legible — symbols decorative only
- Primary purchase emphasis through warm gold — not aggressive pulsing
- Clear selected and purchased states

### Store Families

- Offer tiles and package plates
- Purchase and restore actions
- Subscription or recurring terms disclosure surfaces
- Currency balance displays when applicable

### Store Components Must Not

- Employ dark-pattern concealment, fake urgency theater, or bait-and-switch framing
- Use loot-box aesthetics or gambling metaphors
- Compete with gameplay components during chamber focus
- Sacrifice accessibility for promotional ornament

### Design Intent

Commerce remains on-brand — **ancient merchant archive**, not mobile sale banner.

---

## 18. Settings & Utility Components

Settings and utility components are the **most restrained** meta-game family — clarity over ceremony.

### Settings Qualities

- Grouped logical sections with plain-spoken labels
- Minimal ornament on interactive rows
- Accessibility controls prominent and understandable
- Stone tablet simplicity for toggles, sliders, and selections
- Functional typography throughout

### Utility Families

- Settings section headers and rows
- Toggles, checkboxes, and radio groups
- Sliders for audio, haptics, and accessibility preferences
- Destructive utility actions (reset, delete) with confirmation patterns

### Settings Must Not

- Become marketing surfaces for unrelated features
- Hide accessibility behind decorative maze navigation
- Use ceremonial inscription fonts for control labels
- Introduce undifferentiated platform control clones without LLDL styling

### Design Intent

Utility earns trust through **plain clarity** — the temple's administrative annex, not a lore dump.

---

## 19. Component States

**Locked workshop decision:** Component states must be **multichannel** — understandable through more than color alone.

### Standard State Set

| State | Communication expectation |
|-------|---------------------------|
| **Default / idle** | Resting material appearance; no false urgency |
| **Hover / focus** | Visible focus ring or elevation shift per WS9 |
| **Pressed / active** | Material depression or inset; optional brief motion |
| **Selected** | Shape, border, icon, or label change — not hue alone |
| **Disabled** | Reduced contrast with maintained readability where possible; non-interactive clarity |
| **Loading / pending** | Non-blocking indicator; preserve layout stability |
| **Error** | Label or icon support; danger semantics per WS2 |
| **Success** | Brief confirmation; warm accent without spectacle |

### State Rules

- Gameplay components use **fewer states** — avoid decorative state proliferation
- State transitions respect WS5 calm temperament — no bounce or elastic overshoot on core controls
- Disabled states must not look identical to default without non-color cue
- Selected states in lists and tabs must persist clearly for orientation

### Design Intent

Players always know **what can be acted upon, what is active, and what is unavailable**.

---

## 20. Component Feedback

Component feedback communicates **action outcomes** across visual, motion, and audio channels.

### Feedback Principles

- **Immediate acknowledgment** — press, toggle, and selection register instantly
- **Proportionate celebration** — reward feedback scales to moment importance
- **Non-blocking** — toasts and inline confirmations do not trap navigation
- **Multichannel** — WS9-compliant redundancy for critical outcomes

### Feedback Families

- Press and toggle acknowledgment
- Inline validation and error messages
- Toasts and banners for transient system messages
- Tooltips and inscription reveals for supplementary detail
- Reward and unlock celebration sequences

### Feedback Must Not

- Use audio alone for critical success or failure
- Stack multiple simultaneous feedback layers without hierarchy
- Employ alarm aesthetics for recoverable errors
- Persist transient messages beyond comprehension time

### Design Intent

Feedback feels **crafted and trustworthy** — not noisy or manipulative.

---

## 21. Component Motion

Component motion inherits [WS5 — Motion Language](WS5_Motion_Language.md) — calm, deliberate, premium.

### Motion Qualities on Components

- State transitions soft and restrained
- Modals and panels enter with weight — not snap-pop elasticity
- Reward moments may elevate briefly — then settle gracefully
- Loading indicators loop calmly — not frantic spinning spectacle
- Gameplay HUD motion minimal — phase transitions only when helpful

### Motion Rules

- Motion supports **state communication** — not decoration for its own sake
- Reduced motion preferences honored per WS9 — essential information never motion-only
- Continuous idle animation reserved for **environment or energy states** — not utility buttons
- Execution-phase components avoid motion that distracts from path reading

### Design Intent

Components move like **temple mechanisms** — precise, weighted, intentional.

---

## 22. Component Iconography

Component iconography inherits [WS8 — Iconography Language](WS8_Iconography_Language.md).

### Icon Use on Components

- Icons **support labels** on primary and destructive actions
- Sigils may appear alone only where space, repetition, and WS9 requirements allow
- Stroke weight and material treatment consistent within component family
- Energy-colored icons for activation states — not default idle chrome

### Icon Rules

- Navigation icons paired with text unless space-constrained with proven comprehension
- Reward and artifact icons respect object identity — not generic pictogram shortcuts
- Store icons never replace price or purchase clarity
- Hazard and danger icons paired with text in gameplay-adjacent components

### Design Intent

Symbols enrich the temple interface — they do not replace language on critical paths.

---

## 23. Component Typography

Component typography inherits [WS7 — Typography Language](WS7_Typography_Language.md) dual system.

### Typography on Components

- **Functional roles** default — button labels, HUD values, settings rows, list primary text
- **Ceremonial roles** scoped — reward headlines, seal inscriptions, relic names, world titles on presentation components
- Hierarchy through role selection — not ad hoc size escalation
- Line length and wrapping respect mobile readability philosophy

### Typography Rules

- Gameplay components use functional roles exclusively
- Ceremonial roles prohibited on live interactive HUD labels
- All caps inscription styling reserved for short ceremonial strings — not paragraphs
- Localization tolerance — components must not assume fixed string length for layout integrity

### Design Intent

Text on components reads instantly — inscription styling is **earned by context**.

---

## 24. Component Accessibility

Component accessibility inherits [WS9 — Accessibility Language](WS9_Accessibility_Language.md) — not optional overlay.

### Accessibility Defaults

- Touch targets meet inclusive sizing philosophy
- Focus order logical within component groups
- Contrast pairs respect WS9 on all functional text and controls
- States communicated through label, shape, icon, and pattern — not color alone
- Motion-reduced paths preserve full information
- Audio feedback optional and supplementary — never sole channel for critical state

### Component-Specific Accessibility

- Buttons and toggles expose clear accessible names — not unlabeled sigils
- Modals trap focus appropriately and restore on dismiss
- Lists communicate position and selection to assistive technologies
- Store components expose full price and terms in accessible form
- Settings include accessibility controls without buried navigation

### Accessibility Must Not Be

- Deferred to implementation phase as an afterthought
- Used as excuse to strip temple identity — accessible components remain LLDL-authentic
- Sacrificed for decorative density

### Design Intent

Inclusive components are **first-class LLDL components** — not alternate modes.

---

## 25. Component Composition

Screens compose from **approved component families** — assembly rules prevent one-off mutation.

### Composition Principles

- **Catalog first** — reach for existing family before proposing new
- **Variant before duplicate** — extend governed variant when semantics match
- **Single primary action** — composition respects WS4 hierarchy per surface
- **Token-backed** — composed trees consume tokens; no hardcoded literals in features
- **Layer discipline** — decorative framing wraps functional core — not reverse

### Composition Hierarchy

```text
Screen shell (background, safe regions)
  └── Layout regions (sections, scroll areas)
        └── Component families (panels, lists, buttons)
              └── Atomic content (labels, icons, values)
```

### Composition Must Not

- Inline-style individual instances to bypass catalog
- Nest competing primary buttons in one focal region
- Mix unrelated component dialects on one screen without documented reason

### Design Intent

Composition scales identity — screens differ by **arrangement and content**, not by reinventing controls.

---

## 26. Component Consistency Rules

Consistency is **mechanical trust** — players learn the temple interface once.

### Consistency Rules

1. **One primary action pattern** per decision context — gold authority per WS2
2. **One panel dialect** for grouped content — stone slab family, not mixed card styles
3. **One navigation back pattern** across meta-game
4. **One reward framing language** across success types — variant, not reinvention
5. **One disabled-state language** across interactive families
6. **One modal dismiss pattern** across interrupt surfaces
7. **One list row architecture** per content type — worlds, settings, store

### Cross-Screen Consistency

- Gameplay and meta-game differ in **density and ceremony** — not in contradictory semantics (e.g., gold meaning different things)
- Biome atmosphere may modulate surfaces — not swap component dialects wholesale
- Platform conventions adopted only when they **strengthen** WS9 — never when they erase LLDL identity

### Design Intent

Consistency reduces cognitive load — players read the temple, not the framework.

---

## 27. Component Governance

Components evolve through **governed proposal** — not feature accumulation.

### Governance Roles

| Role | Responsibility |
|------|----------------|
| Design System Lead | Maintains WS11 alignment; approves new families |
| Component Author | Proposes family with inheritance trace and token map |
| Accessibility Reviewer | Verifies WS9 defaults before catalog entry |
| Human Owner | Approves new families, ceremonial exceptions, monetization surfaces |

### Proposal Requirements

New component families require:

1. **Semantic purpose** — what need existing families cannot serve
2. **Inheritance trace** — WS0–WS10 alignment by category
3. **Token map** — semantic and component tokens consumed
4. **State model** — standard states and multichannel communication
5. **Tier classification** — functional, ceremonial, or hybrid
6. **Domain placement** — gameplay, meta-game, or shared
7. **Anti-pattern check** — explicit rejection of generic platform clone

### Approval Outcomes

- **Approve** — add to Components.md catalog with variants
- **Revise** — merge with existing family or reduce scope
- **Reject** — cite WS11 anti-pattern or upstream violation
- **Escalate** — Human approval for monetization, new ceremonial family, or gameplay HUD expansion

### Deprecation

- Deprecated families documented with migration target
- No silent removal from catalog while screens depend
- Showcase and dev reference updated on deprecation

### Design Intent

Keep the component catalog **lean, traceable, and authoritative**.

---

## 28. Component Anti-Patterns

The following are **rejected** unless explicit Human-approved exception exists in Decisions.

### Identity Anti-Patterns

- Platform stock buttons, lists, dialogs, and toggles without LLDL wrapping
- Generic Material, iOS, or web-default visual language as final UI
- Cyberpunk neon, casino spectacle, or cartoon blob components
- One-off styled controls in feature screens bypassing catalog

### Token Anti-Patterns

- Raw literals for color, spacing, radius, or type in component instances
- Component-local color semantics that invert WS2 gold-primary rule
- Screen tokens embedded in shared components
- Undocumented token assembly repeated across features

### Gameplay Anti-Patterns

- Persistent HUD dashboards during chamber focus
- Promotional or store components overlaying active puzzles
- Ceremonial reward framing during execution phase
- Motion or audio that competes with path planning attention

### Clarity Anti-Patterns

- Sigil-only primary actions on critical paths
- Color-only state without shape, label, or icon backup
- Ornament reducing contrast or touch target clarity
- Modal stacks and trap dismiss patterns

### Monetization Anti-Patterns

- Dark-pattern store rows — hidden costs, fake urgency, deceptive selection
- Loot-box visual language on any component family
- Purchase buttons that mimic gameplay commit controls

### Governance Anti-Patterns

- Feature-invented components without catalog entry
- Duplicate families differing only cosmetically
- Parallel component dialects per team or screen
- Deprecation without migration documentation

### Design Intent

Give reviewers explicit rejection language for component proposals and implementation review.

---

## 29. Design Decision Framework

Use this framework when evaluating component proposals, variants, and screen compositions.

### Evaluation Questions

1. **Philosophy** — Does this express approved LLDL intent per WS0?
2. **Identity** — Does it feel temple-authentic per WS1 and WS4?
3. **Semantics** — Do color and emphasis honor WS2 roles?
4. **Context tier** — Correct functional vs ceremonial mode?
5. **Domain** — Correct gameplay restraint or meta-game craft level?
6. **Tokens** — Consumes governed tokens per WS10 — no raw literals?
7. **States** — Multichannel state communication per §19 and WS9?
8. **Motion & audio** — Restrained and proportionate per WS5 and WS6?
9. **Typography & icons** — Correct roles per WS7 and WS8?
10. **Accessibility** — WS9 defaults met without identity stripping?
11. **Reuse** — Existing family sufficient — or justified new family?
12. **Governance** — Documented, approved, catalog-ready?

### Outcomes

- **Approve** — add or extend catalog entry in Components.md
- **Revise** — adjust tier, tokens, or merge with existing family
- **Reject** — cite anti-pattern or upstream WS violation
- **Escalate** — Human approval for monetization, new HUD family, or ceremonial exception

### Design Intent

Make component approval repeatable across design, engineering, and review agents.

---

## 30. Summary

Labyrinth Legends components are **governed expressions of LLDL** — reusable, token-backed, readable, accessible, and temple-authentic across gameplay and meta-game.

**WS11 establishes that:**

- Components translate WS0–WS10 into repeatable interface building blocks
- Functional and ceremonial tiers balance puzzle restraint with meta-game craft
- Domain families — buttons, panels, modals, navigation, HUD, lists, rewards, artifacts, store, settings — inherit upstream channel authority
- States and feedback communicate through multiple channels — never color alone
- Motion, typography, and iconography on components follow WS5, WS7, and WS8
- Accessibility is default, not optional overlay
- Composition from catalog precedes one-off invention
- Governance keeps the component system lean, traceable, and consistent

Downstream [Components](../Components.md), screen specs, and implementation implement WS11 — they do not redefine component philosophy.

---

## 31. Workshop Conclusions

WS11 — Components Language Workshop records the following locked conclusions:

| # | Conclusion |
|---|------------|
| 1 | WS11 is the reusable components authority within LLDL, subordinate to Vision and WS0–WS10 |
| 2 | **Components are LLDL expressions** — not generic platform widgets |
| 3 | **Token inheritance mandatory** — semantic and component tokens; no raw literals in features |
| 4 | **Clarity before decoration** — ornament never reduces readability or touch usability |
| 5 | **Gameplay restraint / meta-game craft** — density and ceremony scale by context |
| 6 | **Functional vs ceremonial tiers** — governed modes within families |
| 7 | **Multichannel states** — shape, color, motion, text, icon, placement |
| 8 | **Accessibility by default** — WS9 baked into component expectations |
| 9 | **Consistency over novelty** — new families only when reuse fails |
| 10 | Components.md implements APIs and variants; WS11 governs philosophy |
| 11 | Screen specs compose components — they do not redefine component identity |

### Design Intent

Freeze component governance before Components.md reconciliation with WS0–WS11 stack.

---

## 32. Related Documents

### Upstream

- [Vision](../../00_Project/Vision.md)
- [WS0 — Design Philosophy](WS0_Design_Philosophy.md) through [WS10 — Design Tokens Language](WS10_Design_Tokens_Language.md)

### Downstream

- [LLDL](LLDL.md) — Design language specification
- [Components](../Components.md) — Component catalog and APIs
- [Design_Tokens](../Design_Tokens.md) — Canonical token values
- [Typography](../Typography.md) · [Icons](../Icons.md) · [Animations](../Animations.md) · [Audio](../Audio.md)
- [Accessibility](../Accessibility.md)
- `docs/03_Screens/*` — Screen specifications
- `lib/design_system/` — Implementation

### Governance

- [Decisions](../../00_Project/Decisions.md)
- [Roadmap](../../00_Project/Roadmap.md)

---

## Navigation

| ← Previous | Next → | Index |
|------------|--------|-------|
| [WS10 — Design Tokens Language](WS10_Design_Tokens_Language.md) | [LLDL Complete](LLDL.md) | [Documentation Home](../../README.md) · [LLDL](LLDL.md) |
