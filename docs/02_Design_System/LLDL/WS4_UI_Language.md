# WS4 — UI Language

| Field | Value |
|-------|-------|
| **Project** | Labyrinth Legends |
| **Document Name** | WS4 — UI Language |
| **Document ID** | LLDL-DOC-WS4-001 |
| **Series** | WS4 — Labyrinth Legends Design Language (LLDL) UI Authority |
| **Version** | 1.0.0 |
| **Status** | Approved |
| **Owner** | Apoorv |
| **Prepared By** | ChatGPT (workshop) · Cursor (compiler) |
| **Last Updated** | 2026-06-30 |
| **Workshop** | WS4 — UI Language |
| **Path** | `docs/02_Design_System/LLDL/WS4_UI_Language.md` |
| **Dependencies** | [Vision](../../00_Project/Vision.md) · [WS0 — Design Philosophy](WS0_Design_Philosophy.md) · [WS1 — Visual Identity](WS1_Visual_Identity_Artistic_Direction.md) · [WS2 — Color Language](WS2_Color_Language.md) · [WS3 — Environment Language](WS3_Environment_Language.md) |
| **Related Documents** | [LLDL](../LLDL.md) · [Components](../Components.md) · [Typography](../Typography.md) · [Accessibility](../Accessibility.md) · `docs/03_Screens/*` |

## Navigation

| ← Previous | Next → | Index |
|------------|--------|-------|
| [WS3 — Environment Language](WS3_Environment_Language.md) | [WS5 — Motion Language](WS5_Motion_Language.md) | [Documentation Home](../../README.md) · [LLDL](../LLDL.md) |

---

## Version History

| Version | Date | Author | Summary |
|---------|------|--------|---------|
| 1.0.0 | 2026-06-30 | ChatGPT / Cursor | WS4 — UI language authority for LLDL |

## Change Log

| Version | Change |
|---------|--------|
| 1.0.0 | Initial workshop record: hybrid UI, progressive HUD, physical foundation, symbol usage, interaction tone, screen philosophies, decision framework |

---

## Document Authority

**WS4 is the user interface authority within the Labyrinth Legends Design Language (LLDL).**

| Conflict type | Authority |
|---------------|-----------|
| Product intent | [Vision](../../00_Project/Vision.md) wins |
| Design philosophy | [WS0 — Design Philosophy](WS0_Design_Philosophy.md) wins |
| Artistic identity | [WS1 — Visual Identity](WS1_Visual_Identity_Artistic_Direction.md) wins |
| Color meaning | [WS2 — Color Language](WS2_Color_Language.md) wins |
| Environmental language | [WS3 — Environment Language](WS3_Environment_Language.md) wins |
| UI philosophy, presentation, interaction identity | **WS4 wins** |
| Component APIs, token values, per-screen layout | [Components](../Components.md) · [Design_Tokens](../Design_Tokens.md) · `docs/03_Screens/*` — must align with WS4; WS4 does not define implementation |

WS4 extends Vision and WS0–WS3. It does not override gameplay rules, environmental construction, or color semantics. When UI ornament conflicts with WS0 readability or WS2 hierarchy, the higher document prevails until [Decisions](../../00_Project/Decisions.md) records an explicit, Human-approved exception.

WS3 defines *the ruin*. **WS4 defines how the player interacts with the ruin through interface surfaces** — gameplay, meta-game, and utility — without breaking immersion or puzzle clarity.

---

## Intended Audience

| Role | Use this document to… |
|------|------------------------|
| UI/UX Designers | Author screens and flows within permanent UI philosophy |
| Visual Designers | Apply temple-interface identity without generic mobile patterns |
| Iconographers | Balance symbolic richness with functional clarity |
| Motion Designers | Apply soft, deliberate interaction tone |
| Product Designers | Scope information density and progressive disclosure |
| Screen Spec Authors | Extend WS4 into `docs/03_Screens/*` without redefining philosophy |
| Monetization Designers | Frame store and offers within ancient-instrument identity |
| Accessibility Reviewers | Verify UI meets multichannel communication standards |
| Implementation Agents | Reject UI directions that violate WS4 locked decisions or anti-patterns |

---

## Table of Contents

1. [Purpose of the UI Language](#1-purpose-of-the-ui-language)
2. [UI Philosophy](#2-ui-philosophy)
3. [Hybrid UI Direction](#3-hybrid-ui-direction)
4. [Gameplay HUD Philosophy](#4-gameplay-hud-philosophy)
5. [Meta-Game UI Philosophy](#5-meta-game-ui-philosophy)
6. [Interface as Ancient Instrument](#6-interface-as-ancient-instrument)
7. [Physical Material Foundation](#7-physical-material-foundation)
8. [Mystical Energy Usage in UI](#8-mystical-energy-usage-in-ui)
9. [Ancient Symbols, Glyphs & Iconography](#9-ancient-symbols-glyphs--iconography)
10. [Functional Clarity Guardrails](#10-functional-clarity-guardrails)
11. [Menu Decoration Philosophy](#11-menu-decoration-philosophy)
12. [Information Density Philosophy](#12-information-density-philosophy)
13. [Progressive Disclosure](#13-progressive-disclosure)
14. [Screen Purpose & Hierarchy](#14-screen-purpose--hierarchy)
15. [Button & Control Philosophy](#15-button--control-philosophy)
16. [Popup, Modal & Overlay Philosophy](#16-popup-modal--overlay-philosophy)
17. [Progression Screen Philosophy](#17-progression-screen-philosophy)
18. [Reward Screen Philosophy](#18-reward-screen-philosophy)
19. [Inventory & Artifact UI Philosophy](#19-inventory--artifact-ui-philosophy)
20. [Store & Monetization UI Philosophy](#20-store--monetization-ui-philosophy)
21. [Settings & Utility UI Philosophy](#21-settings--utility-ui-philosophy)
22. [UI Feedback & State Communication](#22-ui-feedback--state-communication)
23. [UI Readability Principles](#23-ui-readability-principles)
24. [UI Accessibility Considerations](#24-ui-accessibility-considerations)
25. [UI Interaction Tone](#25-ui-interaction-tone)
26. [UI Anti-Patterns](#26-ui-anti-patterns)
27. [Design Decision Framework](#27-design-decision-framework)
28. [Summary](#28-summary)
29. [Workshop Conclusions](#29-workshop-conclusions)
30. [Related Documents](#30-related-documents)

---

## 1. Purpose of the UI Language

The interface is how the player **acts inside the temple** — planning routes, reading consequences, progressing through ruins, and receiving rewards. UI that feels foreign to the world breaks immersion. UI that overwhelms the labyrinth destroys the core experience.

WS4 answers:

> **How should every interface surface look, behave, and communicate while supporting Draw Your Fate?**

Without UI authority, teams default to generic mobile patterns: persistent HUD clutter, neon buttons, bounce animations, and symbol-free utility screens. Premium identity collapses. Puzzle readability suffers.

WS4 establishes the **permanent interface contract** — inherited from [WS0](WS0_Design_Philosophy.md) through [WS3](WS3_Environment_Language.md), then extended into UI-specific rules for gameplay, meta-game, and utility contexts.

### Scope

WS4 governs UI **philosophy**, **hierarchy**, **density**, **material identity**, **symbol usage**, and **interaction tone**. Component specifications, token values, and per-screen layouts belong in downstream documents.

### Design Intent

Ensure the interface feels **discovered from the ruin**, not pasted on top of it.

---

## 2. UI Philosophy

The UI philosophy of Labyrinth Legends rests on five principles.

### Principle 1 — The Labyrinth Leads

During gameplay, **the chamber is the hero**. Interface exists to support planning and comprehension — never to compete for attention.

### Principle 2 — Temple, Not App

Surfaces read as **carved, engraved, and sealed** — ancient instruments of interaction aligned with [WS1](WS1_Visual_Identity_Artistic_Direction.md) material identity.

### Principle 3 — Meaning Before Ornament

Decoration creates identity; **clarity creates trust**. Ornament that obscures decisions is failure, not craft.

### Principle 4 — Progressive Presence

Information appears when **needed for the current decision** — then recedes. Persistent chrome is the exception, not the default.

### Principle 5 — Soft Authority

Interaction feels **deliberate, elegant, and premium** — never frantic, bouncy, or arcade-stimulating.

### UI Thesis

> Gameplay UI whispers. Meta-game UI speaks with ceremonial weight. Both belong to the same civilization.

### Design Intent

Anchor all interface work in WS0 player-first and readability philosophy.

---

## 3. Hybrid UI Direction

**Locked workshop decision:** Labyrinth Legends uses a **hybrid UI model** — two temperaments, one identity.

### Gameplay UI — Near Invisible

During chamber play, interface is **highly restrained**:

- Minimal persistent chrome
- Information tied to current planning or execution phase
- Visual weight subordinate to maze, path, and environmental read
- No ever-present score ticker, banner ads aesthetic, or dense control clusters

The player should feel they are **inside the ruin**, not inside a mobile shell.

### Meta-Game UI — Crafted Instrument

Between chambers, menus and progression surfaces may carry **greater ceremonial presence**:

- Engraved frames, seal motifs, inscribed panels
- Clearer typographic hierarchy for navigation and collection
- Atmospheric identity without becoming a different product genre

Meta-game UI is still temple language — not a generic app dashboard.

### Unity Rule

Both modes share **material vocabulary, color roles, symbol family, and interaction tone**. Hybrid means **density and presence shift** — not identity shift.

### Design Intent

Formalize the gameplay/meta split that protects puzzle focus while allowing premium menu craft.

---

## 4. Gameplay HUD Philosophy

**Locked workshop decision:** The gameplay HUD is **progressive**, not persistent.

### Progressive HUD Rules

- Display only information required for the **current player decision**
- Hide secondary information by default
- Reveal through contextual appearance, tap-to-expand, brief phase overlays, or menu access
- Fade or dismiss information after its decision window closes
- Never maintain full stat dashboards during study or execution unless explicitly required

### Phase-Appropriate Presence

| Phase | HUD temperament |
|-------|-----------------|
| **Study** | Near-minimal — affordances and objectives only as needed |
| **Plan** | Path expression and validation feedback — no noise |
| **Commit** | Confirmation weight — distinct, not alarming |
| **Execute** | Consequence communication — sequential, not cluttered |
| **Evaluate** | Outcome explanation — then release |

### HUD Must Not

- Permanently obscure labyrinth corners critical to planning
- Pulse or flash unrelated to current phase
- Introduce reflex demands through UI animation
- Solve puzzles through HUD hints beyond approved feedback rules

### Design Intent

Protect Draw Your Fate by keeping the HUD subordinate to the chamber.

---

## 5. Meta-Game UI Philosophy

Meta-game UI covers **navigation between chambers** — home, level select, progression, collection, settings, store, and onboarding.

### Meta-Game Qualities

- **Ceremonial framing** — screens feel like temple archives and instrument panels
- **Scannable hierarchy** — one primary action per screen
- **Atmospheric identity** — ancient tech atmosphere without clutter
- **Continuity** — player never feels they left the universe for a utility app

### Meta-Game Restraint

Ceremony does not justify **slow comprehension**. Decoration lives on frames and inactive surfaces — not on primary labels and controls.

### Design Intent

Allow richer UI presence outside the chamber while preserving mobile usability.

---

## 6. Interface as Ancient Instrument

The interface is conceived as an **ancient instrument** — a system the civilization built to read and command their temples.

### Instrument Qualities

- **Purposeful** — every surface implies function, not decoration alone
- **Worn** — premium age; not factory-fresh consumer UI
- **Inscribed** — information lives in carved and engraved layers
- **Responsive** — activation feels like awakening a mechanism, not tapping plastic

### Discovery, Not Overlay

UI should feel **excavated and understood** — as though the explorer found control surfaces that belong to the ruin. Not as though a modern HUD was layered over a screenshot.

### Design Intent

Give designers a metaphor stronger than "themed mobile app."

---

## 7. Physical Material Foundation

**Locked workshop decision:** UI is **physically crafted** from temple materials.

### Primary UI Materials

- **Carved stone** — panels, tablets, background masses
- **Engraved metal** — frames, primary actions, seals, binding elements
- **Inset recesses** — fields and containers feel set into architecture
- **Mechanism plates** — toggles, switches, and stateful controls as apparatus

### Material Behavior

- Surfaces have **weight and edge** — worn corners, relief depth
- Flat untextured rectangles are out of identity
- Glassmorphism, floating card stacks, and generic rounded rectangles are rejected as default

### Alignment

Material choices inherit [WS1](WS1_Visual_Identity_Artistic_Direction.md) and color roles from [WS2](WS2_Color_Language.md) — warm metal for authority, stone neutrals for structure.

### Design Intent

Ensure UI art direction matches environment art direction — one civilization.

---

## 8. Mystical Energy Usage in UI

**Locked workshop decision:** Mystical energy is **highlight only** — not default treatment.

### When Energy Appears

- Active path expression and committed route states
- Live mechanism activation and state change
- Progression milestones and seal awards
- Portal-like transitions between major UI states
- Rare relic or mastery emphasis

### When Energy Must Not Dominate

- Idle menu backgrounds glowing uniformly
- Every button bordered in runic light
- Persistent HUD elements constantly emissive
- Decorative particle fields behind text

Energy communicates **activation and significance** per WS2 — not ambient noise.

### Design Intent

Prevent cyberpunk HUD drift while preserving mystical technology identity.

---

## 9. Ancient Symbols, Glyphs & Iconography

**Locked workshop decision:** The UI makes **heavy use** of ancient symbols — with clarity guardrails (see §10).

### Symbol-Rich Surfaces

Symbols and glyphs appear strongly on:

- Frames, borders, and dividers
- Background panels and inactive decorative fields
- Menu identity and section headers
- Reward and progression presentation
- Artifact and relic interfaces
- Seal and mastery marks

### Symbol Family

Icons read as **sigils, seals, and inscribed marks** — angular, geometric, civilization-consistent per WS1. Not generic outline icon packs. Not emoji. Not clip-art literals.

### Symbol vs Label

Symbolic richness decorates **context and identity**. Functional meaning uses **symbol plus label** where needed — especially for core navigation and critical actions.

### Design Intent

Enable premium symbolic identity without sacrificing learnability.

---

## 10. Functional Clarity Guardrails

**Locked workshop decision:** The UI may be symbol-heavy; it must **never be meaning-confusing**.

### Guardrails

- **Critical buttons** must not rely on unfamiliar symbols alone
- **Gameplay HUD icons** must be instantly understandable at session start
- **Primary navigation** must be scannable without glyph decryption
- **State changes** require perceptible non-symbol-only cues where feasible
- **New symbols** require teaching through context, label, or progressive introduction

### Clarity Test

If a first-time player cannot identify the primary action within one calm scan, the screen fails WS4 — regardless of beauty.

### Relationship to WS0

Feedback informs without solving puzzles ([WS0](WS0_Design_Philosophy.md)). UI clarifies affordances without becoming the puzzle.

### Design Intent

Operationalize the core rule: symbolic richness with functional literacy.

---

## 11. Menu Decoration Philosophy

**Locked workshop decision:** Meta-game menus are **moderately decorative**.

### Permitted Decoration

- Engraved borders and corner motifs
- Glyph bands and inscription strips
- Seal-shaped section markers
- Layered stone frames with depth
- Atmospheric background relief subordinate to content

### Decoration Limits

- Decoration must not reduce **scan speed** on mobile
- Primary text and controls sit on **readable fields** — not busy relief
- Ornament density decreases near interactive targets
- Animation on decorative surfaces remains subtle

### Design Intent

Balance temple identity with thumb-zone usability and premium scan clarity.

---

## 12. Information Density Philosophy

**Locked workshop decision:** **Minimal information density** — one clear primary purpose per screen.

### Density Rules

- One primary decision or action per screen moment
- Supporting detail hidden unless requested
- No dashboard walls of equal-weight tiles without hierarchy
- No simultaneous competing calls-to-action of equal visual strength

### The Default Visibility Rule

> If an element does not help the player make the **current** decision, it should not be visible by default.

### Density by Context

- **Gameplay** — lowest density; progressive HUD only
- **Meta navigation** — moderate; clear lists and focal actions
- **Reward moments** — focused celebration; not stat explosion
- **Settings** — grouped utility; no feature marketing clutter

### Design Intent

Protect calm tension and respect for player attention per Vision.

---

## 13. Progressive Disclosure

Progressive disclosure is the **primary method** for managing complexity without clutter.

### Disclosure Patterns

- Expandable sections for secondary detail
- Tabs for parallel categories — not infinite nesting
- Contextual actions appearing on selection or focus
- Tap-to-reveal tooltips and inscription panels for lore-heavy content
- Phase-based HUD elements appearing only during relevant loop steps

### Disclosure Must Not

- Hide safety-critical or fairness-critical information
- Bury primary navigation beyond unreasonable depth
- Use disclosure to obscure monetization pressure or deceptive patterns

### Design Intent

Enable depth for mastery and collection without overwhelming first sessions.

---

## 14. Screen Purpose & Hierarchy

Every screen declares **one primary purpose**. Visual hierarchy expresses that purpose without ambiguity.

### Hierarchy Layers

1. **Primary action or focus** — one per screen
2. **Supporting context** — location, objective summary, progression hint
3. **Secondary navigation** — back, menu, settings access
4. **Decorative identity** — frames and atmosphere
5. **Ambient depth** — parallax, dust, background architecture

Layers 4–5 must not overpower layer 1.

### Screen Families

- **Gameplay** — chamber and planning surfaces
- **Navigation** — home, world map, level select
- **Progression** — unlocks, world completion, mastery overview
- **Collection** — relics, artifacts, seals
- **Transaction** — store and offers
- **Utility** — settings, account, accessibility

Each family inherits hybrid UI rules from §3.

### Design Intent

Give screen spec authors a purpose test before layout work begins.

---

## 15. Button & Control Philosophy

Controls are **mechanisms** — engraved plates, sealed actions, toggle apparatus.

### Primary Actions

- Warm metallic emphasis per WS2 — commitment and authority
- Clear label or label-plus-sigil — never sigil alone for critical paths
- Distinct pressed, disabled, and active states — perceptible without color alone
- One primary button per decision surface

### Secondary Actions

- Lower visual weight — recessed stone or subdued metal
- Ghost or outline treatments still use temple materials — not generic flat text

### Destructive or Irreversible Actions

- Clear labeling; ceremonial weight without mockery
- Confirmation patterns use deliberate pacing — not alarm red flooding

### Design Intent

Align control identity with WS1 inscription language and WS2 gold semantic role.

---

## 16. Popup, Modal & Overlay Philosophy

Overlays interrupt the ruin — they must **earn interruption**.

### Overlay Rules

- Use for commitment, confirmation, reward, and critical information — not routine navigation
- Frame as inscribed panels or seal tablets — not system alerts
- Dim environment or chamber with temple darkness — not opaque grey slabs
- Dismiss with clear affordance; no trap patterns

### Gameplay Overlays

During chambers, overlays are **rare and brief**. Planning and execution stay visually continuous with the labyrinth.

### Design Intent

Prevent modal fatigue and generic OS-dialog aesthetic.

---

## 17. Progression Screen Philosophy

Progression screens communicate **journey through ruins** — not battle pass frenzy.

### Progression Qualities

- World and chamber structure readable at a glance
- Mastery and optional layers visible as **invitation**, not guilt
- Seal and mark language for completion per WS2 reward warmth
- Energy highlights on newly unlocked thresholds — not entire screen glow

### Progression Must Not

- Shame incomplete completion with aggressive red tallies
- Present infinite checklist meters as primary metaphor
- Obscure core path behind optional grind visualization

### Design Intent

Align UI with Vision knowledge-as-progression philosophy.

---

## 18. Reward Screen Philosophy

Reward moments celebrate **earned intelligence** — escape, discovery, mastery.

### Reward Presentation

- Ceremonial framing — seals, engraved plates, brief luminous accent
- Clear statement of what was earned and why
- Warm emphasis without slot-machine particle storms
- Optional layers distinguished from primary escape success

### Duration and Tone

Celebration is **proportionate**. Brief elevation; graceful return to study or navigation. Soft settling — not explosive overshoot.

### Design Intent

Support GP5 seal philosophy through UI — thematic marks, not generic stars.

---

## 19. Inventory & Artifact UI Philosophy

Relics and artifacts are **civilization objects** — not RPG inventory grids by default.

### Collection Presentation

- Artifact plates, niches, and catalog tablets
- Violet crystal and warm metal accents for rarity per WS2
- Lore and inscription optional behind disclosure
- Grid or list subordinate to **object identity** — not spreadsheet density

### Artifact UI Must Not

- Become a gear-stat power fantasy interface
- Use shopping-mall product card clichés for sacred objects
- Hide critical equipped effects if such systems exist — disclose clearly

### Design Intent

Frame collection as archaeological catalog — aligned with explorer fantasy.

---

## 20. Store & Monetization UI Philosophy

Monetization surfaces must remain **temple instruments** — premium, honest, restrained.

### Store Identity

- Engraved merchant archive or offering altar framing — not carnival shop
- Clear offer presentation without fake urgency theater
- Warm gold for primary purchase emphasis — not aggressive pulsing
- Symbols decorative; prices and actions always legible

### Ethical Presentation

- No dark-pattern concealment of costs or subscriptions
- No loot-box spectacle aesthetics
- Offers respect WS0 player-first principles and Vision non-goals

Specific prices and packages belong in product documents — not WS4.

### Design Intent

Protect premium brand while allowing commercial surfaces.

---

## 21. Settings & Utility UI Philosophy

Utility screens are the **most restrained** meta-game surfaces — clarity over ceremony.

### Settings Qualities

- Grouped logical sections with scannable labels
- Minimal ornament on interactive rows
- Accessibility controls prominent and plain-spoken
- Stone tablet simplicity for toggles and selections

### Utility Must Not

- Become a marketing hub for unrelated features
- Hide accessibility behind decorative puzzles
- Abandon LLDL material identity entirely — utility is still temple UI, simplified

### Design Intent

Ensure settings feel respectful and fast — especially for accessibility needs.

---

## 22. UI Feedback & State Communication

UI feedback explains **state** — loading, success, failure, disabled, active — without panic.

### Feedback Principles

- Align with [WS0](WS0_Design_Philosophy.md) and gameplay feedback philosophy — inform, do not solve
- State change visible through material shift, subtle energy, or inscription animation
- Loading feels like mechanism awakening — not spinner cliché alone
- Error states instructive and dignified — not punitive mockery

### Gameplay Boundary

UI feedback communicates **interface and phase state**. Gameplay outcome resolution remains in gameplay systems — UI does not contradict them.

### Design Intent

Unify interface feedback tone with GP6 intent at presentation layer.

---

## 23. UI Readability Principles

UI readability extends WS0 and WS2 into interface-specific tests.

### Readability Requirements

- Primary text separated from decorative relief through field contrast
- Touch targets comfortable on mobile — without specifying dimensions here
- Icon-plus-label for ambiguous sigils
- Sufficient value contrast on stone-dark fields
- Motion supports state change — never obscures text mid-read

### Gameplay Readability

HUD elements must not reduce **chamber legibility** established in [WS3](WS3_Environment_Language.md). If UI and environment conflict, gameplay chamber wins.

### Design Intent

Give reviewers concrete UI readability criteria independent of implementation.

---

## 24. UI Accessibility Considerations

Accessibility is mandatory identity — not optional skin.

### Requirements

- Critical distinctions not encoded by color alone — per WS2 and [Accessibility](../Accessibility.md)
- Text resizable within product constraints without breaking layout philosophy
- Motion reduction respected — soft transitions may simplify further
- Screen reader and assistive labels for all functional controls — symbols have text equivalents
- High-contrast modes preserve semantic roles — not new random palette

### Accessible Temple UI

Accessibility increases **separation and clarity** — it does not require abandoning stone-and-gold identity.

### Design Intent

Ensure WS4 compliance with WS0 accessibility-as-identity principle.

---

## 25. UI Interaction Tone

**Locked workshop decision:** Interaction is **soft, elegant, deliberate, premium**.

### Preferred Motion Qualities

- Gentle fades and cross-dissolves
- Smooth slides along architectural axes
- Controlled expansion from recessed panels
- Soft scale emphasis on confirmation — minimal
- Graceful settling into rest state

### Rejected Motion Qualities

- Bounce and elastic overshoot
- Cartoon squash and stretch
- Flashy reward explosions
- Hyperactive micro-interactions on every tap
- Abrupt hard cuts without narrative motivation

### Haptic and Audio (Presentation Layer)

Touch response should feel **mechanism engaging** — coordinated with audio direction elsewhere; WS4 owns visual motion temperament only.

### Design Intent

Formalize premium calm interaction — distinct from casual mobile games.

---

## 26. UI Anti-Patterns

### Identity Anti-Patterns

- Default platform UI without LLDL treatment
- Floating white cards on unrelated backgrounds
- Neon cyberpunk HUD over ancient chambers
- Generic bottom-tab consumer app chrome during gameplay
- Stock icon packs inconsistent with sigil family

### Gameplay Anti-Patterns

- Persistent dense HUD during planning
- Score counters and streak flames during study
- Modal interruptions mid-commitment
- UI solving puzzles through unauthorized hints
- Bouncy reward feedback on failure

### Density Anti-Patterns

- Dashboard home screens with twelve equal tiles
- Settings buried four layers deep
- Store screens with simultaneous urgency banners
- Symbol-only critical navigation

### Motion Anti-Patterns

- Slot-machine victory sequences as default
- Elastic pull-to-refresh theatrics on sacred panels
- Shaking buttons demanding attention

### Design Intent

Provide explicit rejection vocabulary for UI review.

---

## 27. Design Decision Framework

### Evaluation Sequence

1. **Vision & WS0** — Player-first, calm tension, readability?
2. **WS1–WS3** — Material, color, and environment alignment?
3. **Hybrid rule** — Correct gameplay vs meta-game temperament?
4. **Progressive HUD** — Only current-decision information visible?
5. **Physical foundation** — Temple materials, not generic UI?
6. **Energy discipline** — Highlight only where meaningful?
7. **Symbol guardrails** — Rich but not meaning-confusing?
8. **Density** — One primary purpose per screen?
9. **Interaction tone** — Soft, deliberate, premium?
10. **Accessibility** — Multichannel clarity?

### Outcomes

- **Approve** — proceed to screen spec or component authoring
- **Revise** — adjust hierarchy, density, or material treatment
- **Reject** — cite locked decision violation or anti-pattern
- **Escalate** — Human approval for material new UI dialect

### Design Intent

Make UI approval repeatable across design, product, and review agents.

---

## 28. Summary

Labyrinth Legends UI is a **hybrid temple instrument** — near-invisible during gameplay, ceremonially crafted in meta-game — built from stone and engraved metal with disciplined mystical highlights.

**WS4 establishes that:**

- Gameplay HUD is progressive; the labyrinth leads
- Meta-game UI is moderately decorative with scan clarity
- Physical materials and WS2 color roles govern all surfaces
- Ancient symbols enrich identity; guardrails protect meaning
- Information density stays minimal; progressive disclosure manages depth
- Interaction is soft, elegant, and premium — never bouncy or arcade
- Screen families inherit one identity across navigation, progression, rewards, collection, store, and settings
- Anti-patterns reject generic mobile and cyberpunk HUD defaults

Downstream [Components](../Components.md), [Typography](../Typography.md), [Design_Tokens](../Design_Tokens.md), and `docs/03_Screens/*` implement WS4 — they do not redefine it.

---

## 29. Workshop Conclusions

WS4 — UI Language Workshop records the following locked conclusions:

| # | Conclusion |
|---|------------|
| 1 | WS4 is the UI authority within LLDL, subordinate only to Vision and WS0–WS3 |
| 2 | **Hybrid UI** — gameplay near-invisible; meta-game crafted ancient instrument |
| 3 | **Physical foundation** — stone, engraved metal, plates, seals; energy as highlight only |
| 4 | **Moderately decorative menus** — identity without scan-speed loss |
| 5 | **Progressive gameplay HUD** — current-decision information only |
| 6 | **Soft elegant interaction** — no bounce, elastic, or flashy explosions |
| 7 | **Minimal information density** — one primary purpose per screen |
| 8 | **Symbol-heavy with clarity guardrails** — never meaning-confusing |
| 9 | Primary actions use warm authority language; energy for activation per WS2 |
| 10 | Components, tokens, and screen specs must inherit WS4 without parallel UI dialects |

### Design Intent

Freeze workshop outcomes before component catalog and screen specification authoring.

---

## 30. Related Documents

### Upstream

- [Vision](../../00_Project/Vision.md)
- [WS0 — Design Philosophy](WS0_Design_Philosophy.md)
- [WS1 — Visual Identity & Artistic Direction](WS1_Visual_Identity_Artistic_Direction.md)
- [WS2 — Color Language](WS2_Color_Language.md)
- [WS3 — Environment Language](WS3_Environment_Language.md)

### Downstream

- [WS4 — UI Language](WS4_UI_Language.md) — UI authority
- [WS5 — Motion Language](WS5_Motion_Language.md) — Motion authority
- [LLDL](../LLDL.md) — Design language specification
- [Components](../Components.md) — Reusable UI catalog
- [Typography](../Typography.md) · [Icons](../Icons.md) · [Animations](../Animations.md)
- [Design_Tokens](../Design_Tokens.md) · [Accessibility](../Accessibility.md)
- `docs/03_Screens/*` — Per-screen specifications

### Gameplay alignment

- [Gameplay](../../01_Game_Design/Gameplay.md) · [GP6 Gameplay Feedback](../../01_Game_Design/Gameplay/GP6_Gameplay_Feedback.md)

### Governance

- [Decisions](../../00_Project/Decisions.md)
- [Roadmap](../../00_Project/Roadmap.md)

---

## Navigation

| ← Previous | Next → | Index |
|------------|--------|-------|
| [WS3 — Environment Language](WS3_Environment_Language.md) | [WS5 — Motion Language](WS5_Motion_Language.md) | [Documentation Home](../../README.md) · [LLDL](../LLDL.md) |
