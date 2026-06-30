# WS8 — Iconography Language

| Field | Value |
|-------|-------|
| **Project** | Labyrinth Legends |
| **Document Name** | WS8 — Iconography Language |
| **Document ID** | LLDL-DOC-WS8-001 |
| **Series** | WS8 — Labyrinth Legends Design Language (LLDL) Iconography Authority |
| **Version** | 1.0.0 |
| **Status** | Approved |
| **Owner** | Apoorv |
| **Prepared By** | ChatGPT (workshop) · Cursor (compiler) |
| **Last Updated** | 2026-06-30 |
| **Workshop** | WS8 — Iconography Language |
| **Path** | `docs/02_Design_System/LLDL/WS8_Iconography_Language.md` |
| **Dependencies** | [Vision](../../00_Project/Vision.md) · [WS0 — Design Philosophy](WS0_Design_Philosophy.md) · [WS1 — Visual Identity](WS1_Visual_Identity_Artistic_Direction.md) · [WS2 — Color Language](WS2_Color_Language.md) · [WS3 — Environment Language](WS3_Environment_Language.md) · [WS4 — UI Language](WS4_UI_Language.md) · [WS5 — Motion Language](WS5_Motion_Language.md) · [WS6 — Audio Language](WS6_Audio_Language.md) · [WS7 — Typography Language](WS7_Typography_Language.md) |
| **Related Documents** | [LLDL](../LLDL.md) · [Icons](../Icons.md) · [Accessibility](../Accessibility.md) · `docs/03_Screens/*` |

## Navigation

| ← Previous | Next → | Index |
|------------|--------|-------|
| [WS7 — Typography Language](WS7_Typography_Language.md) | [WS9 — Accessibility Language](WS9_Accessibility_Language.md) | [Documentation Home](../../README.md) · [LLDL](../LLDL.md) |

---

## Version History

| Version | Date | Author | Summary |
|---------|------|--------|---------|
| 1.0.0 | 2026-06-30 | ChatGPT / Cursor | WS8 — iconography language authority for LLDL |

## Change Log

| Version | Change |
|---------|--------|
| 1.0.0 | Initial workshop record: meaning first, heavy ancient symbols, clarity guardrails, dual functional/ceremonial system, material integration, semantic consistency, mobile recognition |

---

## Document Authority

**WS8 is the iconography authority within the Labyrinth Legends Design Language (LLDL).**

| Conflict type | Authority |
|---------------|-----------|
| Product intent | [Vision](../../00_Project/Vision.md) wins |
| Design philosophy | [WS0 — Design Philosophy](WS0_Design_Philosophy.md) wins |
| Artistic identity | [WS1 — Visual Identity](WS1_Visual_Identity_Artistic_Direction.md) wins |
| Color meaning | [WS2 — Color Language](WS2_Color_Language.md) wins |
| Environmental language | [WS3 — Environment Language](WS3_Environment_Language.md) wins |
| UI philosophy and symbol guardrails | [WS4 — UI Language](WS4_UI_Language.md) wins |
| Motion and interaction tone | [WS5 — Motion Language](WS5_Motion_Language.md) wins |
| Audio temperament | [WS6 — Audio Language](WS6_Audio_Language.md) wins |
| Typography and symbolic text separation | [WS7 — Typography Language](WS7_Typography_Language.md) wins |
| Iconography philosophy, symbolic meaning, icon hierarchy | **WS8 wins** |
| Icon assets, token values, per-component icon specs | [Icons](../Icons.md) · [Design_Tokens](../Design_Tokens.md) — must align with WS8; WS8 does not define implementation |

WS8 extends Vision and WS0–WS7. It does not override gameplay rules, UI layout, typography roles, or color semantics. When symbolic ornament conflicts with WS0 readability, WS4 clarity guardrails, or WS7 symbolic text separation, the higher document prevails until [Decisions](../../00_Project/Decisions.md) records an explicit, Human-approved exception.

WS4 defines *how the interface uses symbols at large*. **WS8 defines how every icon, glyph, seal, and marker communicates meaning** — functional clarity for decisions, ceremonial richness for identity, and disciplined ancient visual language throughout.

---

## Intended Audience

| Role | Use this document to… |
|------|------------------------|
| Iconographers & Visual Designers | Author permanent symbolic vocabulary |
| UI/UX Designers | Apply icon hierarchy within HUD and meta-game surfaces |
| Gameplay Designers | Scope hazard, collectible, and state icon semantics |
| Level Designers | Align environmental marks with readable icon families |
| Narrative Designers | Scope relic, seal, and progression symbolic language |
| Accessibility Reviewers | Verify icons meet multichannel comprehension standards |
| Screen Spec Authors | Extend WS8 into `docs/03_Screens/*` without redefining philosophy |
| Monetization Designers | Frame store iconography within premium ancient tone |
| Implementation Agents | Reject icon directions that violate WS8 locked decisions or anti-patterns |

---

## Table of Contents

1. [Purpose of the Iconography Language](#1-purpose-of-the-iconography-language)
2. [Iconography Philosophy](#2-iconography-philosophy)
3. [Meaning First](#3-meaning-first)
4. [Ancient Symbol Identity](#4-ancient-symbol-identity)
5. [Functional Iconography](#5-functional-iconography)
6. [Ceremonial Iconography](#6-ceremonial-iconography)
7. [Dual Icon System](#7-dual-icon-system)
8. [Glyphs, Seals & Inscriptions](#8-glyphs-seals--inscriptions)
9. [Material Integration](#9-material-integration)
10. [Icon Shape Language](#10-icon-shape-language)
11. [Icon Detail Density](#11-icon-detail-density)
12. [Mobile Recognition](#12-mobile-recognition)
13. [HUD Icons](#13-hud-icons)
14. [Menu & Navigation Icons](#14-menu--navigation-icons)
15. [Button Icons](#15-button-icons)
16. [Status Indicators](#16-status-indicators)
17. [Hazard Icons](#17-hazard-icons)
18. [Reward Seals](#18-reward-seals)
19. [Collectible & Artifact Icons](#19-collectible--artifact-icons)
20. [Progression Markers](#20-progression-markers)
21. [Map & Location Markers](#21-map--location-markers)
22. [Store & Monetization Icons](#22-store--monetization-icons)
23. [Accessibility Considerations](#23-accessibility-considerations)
24. [Icon Consistency Rules](#24-icon-consistency-rules)
25. [Icon Anti-Patterns](#25-icon-anti-patterns)
26. [Design Decision Framework](#26-design-decision-framework)
27. [Summary](#27-summary)
28. [Workshop Conclusions](#28-workshop-conclusions)
29. [Related Documents](#29-related-documents)

---

## 1. Purpose of the Iconography Language

Icons are how the temple **signals meaning at a glance** — hazards, collectibles, progression, navigation, rewards, and the visual grammar of a lost civilization. Iconography that obscures function breaks trust. Iconography that defaults to generic mobile glyphs breaks identity.

WS8 answers:

> **How should every symbol, icon, seal, and marker in Labyrinth Legends communicate quickly, clearly, and authentically?**

Without iconography authority, teams default to stock icon packs, unreadable inscription-buttons, inconsistent hazard metaphors, and casino reward seals. Premium identity collapses. Puzzle comprehension suffers. The ancient world feels like a themed utility app.

WS8 establishes the **permanent iconography philosophy** for functional HUD icons, ceremonial seals, collectible marks, hazard signs, navigation symbols, and progression indicators. It does not define asset files, pixel dimensions, stroke values, or export pipelines.

### What WS8 Governs

- Dual functional and ceremonial icon temperament
- Ancient symbol identity and clarity guardrails
- Icon roles across gameplay HUD, meta-game, rewards, and store
- Material integration with temple UI surfaces
- Semantic consistency and mobile recognition
- Anti-patterns and approval framework

### What WS8 Does Not Govern

- Individual icon assets or sprite libraries
- Exact sizes, strokes, or token values
- Per-screen layout or component APIs
- Gameplay rules or puzzle mechanics

### Design Intent

Give every symbol-touching discipline a shared vocabulary before icon libraries and component specs are authored.

---

## 2. Iconography Philosophy

Icons in Labyrinth Legends serve **meaning first** and **identity second** — never the reverse.

### Core Iconography Temperament

Visual signs should feel **inscribed into the temple** — carved, engraved, sealed, inlaid — while remaining **instantly readable** on mobile screens during short sessions and one-handed play.

### Iconography Pillars

| Pillar | Meaning |
|--------|---------|
| **Meaningful** | Communicate quickly; ancient styling never obscures function |
| **Ancient** | Strong use of glyphs, seals, and civilization-specific marks |
| **Guarded** | Critical controls never rely on unfamiliar symbols alone |
| **Dual** | Functional icons clear; ceremonial icons ornate with discipline |
| **Material** | Icons feel carved, stamped, or activated in temple surfaces |
| **Consistent** | Same meaning, same icon family — no metaphor drift |
| **Mobile** | Recognizable at small scale; detail density controlled |

### Locked Workshop Decisions

| # | Decision |
|---|----------|
| 1 | **Meaning first** — icons communicate quickly and clearly; ancient styling never obscures function |
| 2 | **Heavy ancient-symbol identity** — strong use of glyphs, seals, carved marks; symbolic richness is core identity |
| 3 | **Functional clarity guardrail** — critical controls instantly understandable; symbols support but do not sole-carry important actions |
| 4 | **Dual icon system** — functional icons clear and consistent; ceremonial icons ornate and ancient-inspired |
| 5 | **Material integration** — icons feel carved, engraved, stamped, sealed, inlaid, or activated in ancient UI materials |
| 6 | **Semantic consistency** — same gameplay meaning always uses same icon family |
| 7 | **Mobile-first recognition** — recognizable at small scale; controlled detail density |

### Alignment

Iconography inherits player-first clarity from [WS0](WS0_Design_Philosophy.md), symbolic and material identity from [WS1](WS1_Visual_Identity_Artistic_Direction.md), icon color roles from [WS2](WS2_Color_Language.md), environmental mark context from [WS3](WS3_Environment_Language.md), symbol guardrails and progressive HUD from [WS4](WS4_UI_Language.md), calm activation presentation from [WS5](WS5_Motion_Language.md), and multichannel clarity from [WS6](WS6_Audio_Language.md) and [WS7](WS7_Typography_Language.md).

### Design Intent

Freeze a single iconography temperament before any discipline authors parallel symbolic dialects.

---

## 3. Meaning First

**Locked workshop decision:** Icons exist to **communicate quickly and clearly**. Ancient styling must never obscure function.

### Meaning Principles

- Player understands icon intent **without tutorial on repeat exposure**
- Shape and silhouette carry meaning before fine detail
- Color reinforces meaning per WS2 — does not replace shape logic
- Ambiguous symbols are **not** used for hazards, exits, or primary actions alone
- Teaching moments may introduce symbols once; expert use must remain instant

### Meaning vs Ornament

When identity and clarity conflict:

1. Preserve recognizable function
2. Move ornament to frame, seal border, or inactive decorative field
3. Pair symbol with label or established pattern where WS4 requires

### Core Rule

The UI may be **symbol-heavy**, but never **meaning-confusing** — inherited from WS4, enforced in WS8.

### Design Intent

Make comprehension the non-negotiable floor for all icons.

---

## 4. Ancient Symbol Identity

**Locked workshop decision:** Labyrinth Legends should make **strong use** of ancient symbols, glyphs, seals, carved marks, and civilization-specific visual language. Symbolic richness is a **core part of game identity**.

### Identity Expression

Ancient icon identity appears through:

- **Glyph families** — consistent civilization grammar across biomes
- **Seal logic** — circular, triangular, or plaque forms with inscribed interiors
- **Carved marks** — chisel character, worn edges, material truth
- **Ritual geometry** — alignment lines, portal rings, mechanism indicators
- **Wear and age** — premium patina without illegibility

### Identity Surfaces

Symbolic richness is strongest on:

- Frames, borders, and menu identity
- Reward and progression presentation
- Artifact and relic interfaces
- Inactive decorative panels
- Ceremonial milestones

### Identity Boundaries

Ancient symbol identity is **not**:

- Generic fantasy rune clipart
- Cyberpunk circuit glyphs
- Cartoon emoji substitutes
- Random symbol mashups per screen

### Design Intent

Make symbolic density a deliberate brand signature — not accidental decoration.

---

## 5. Functional Iconography

**Locked workshop decision:** Functional icons should be **clear, simple, readable, and consistent**.

### Functional Icon Scope

Functional icons cover signs the player **reads to act or understand state**:

- HUD objectives and phase indicators
- Navigation and settings controls
- Validation and error states
- Hazard warnings during play
- Collectible pickup confirmation
- Store transaction and utility marks

### Functional Qualities

- Strong silhouette — recognizable in peripheral glance
- Minimal interior detail — clarity over engraving
- Consistent stroke and mass within functional family
- Distinct from ceremonial seals at a glance
- Paired with label when meaning is not yet universal

### Functional Must Not

- Rely on ornate inscription alone for critical meaning
- Change metaphor mid-project for same concept
- Compete visually with ceremonial seals on same control

### Design Intent

Ensure the player always knows what an icon means during play.

---

## 6. Ceremonial Iconography

**Locked workshop decision:** Ceremonial icons, seals, relic marks, and progression symbols may be **more ornate and ancient-inspired**.

### Ceremonial Icon Scope

Ceremonial icons cover signs that **celebrate identity and milestone**:

- Mastery seals and star awards
- Relic and artifact crests
- World and chapter emblems
- Progression tier badges
- Reward ceremony focal marks
- Portal and threshold insignia

### Ceremonial Qualities

- Ornate interior detail permitted — on milestone density only
- Feels stamped, sealed, or inlaid — not flat stock icon
- Used sparingly — ceremony implies significance
- May include glyph complexity absent from functional HUD
- Aligns with WS1 inscription identity and WS4 reward presentation

### Ceremonial Must Not

- Appear on every HUD element — dilutes hierarchy
- Replace functional hazard or exit readability
- Introduce unrelated visual dialect per biome

### Design Intent

Give achievement and collection moments symbolic weight without polluting utility surfaces.

---

## 7. Dual Icon System

**Locked workshop decision:** Labyrinth Legends uses a **dual icon system** — functional clarity for decisions; ceremonial richness for identity moments.

### System Comparison

| Aspect | Functional | Ceremonial |
|--------|------------|------------|
| **Purpose** | Act and understand state | Celebrate and identify |
| **Detail** | Low, silhouette-first | Higher, inscription-rich |
| **Context** | HUD, controls, hazards | Rewards, relics, progression |
| **Label pairing** | Often required early | Title or name often sufficient |
| **Color** | WS2 semantic roles | Warm authority + disciplined energy highlight |

### Coexistence Rules

- Both systems share **one civilization grammar** — not two unrelated art styles
- Functional icons may sit **inside** ceremonial frames — frame ornate, glyph clear
- Never stack functional and ceremonial competing focal icons in one glance zone

### Design Intent

Allow symbolic richness without sacrificing HUD literacy.

---

## 8. Glyphs, Seals & Inscriptions

Glyphs and seals are the **written-visual language** of the civilization — distinct from but aligned with WS7 typographic inscriptions.

### Glyph Roles

- **Decorative identity** — borders, dividers, background panels
- **Classification** — artifact school, biome family, mechanism type
- **State encoding** — aligned vs dormant vs awakened
- **Narrative suggestion** — implies lore without readable prose

### Seal Roles

- **Achievement** — mastery, completion, perfect run
- **Progression** — tier unlock, world entry permission
- **Relic binding** — collection ownership mark
- **Threshold** — portal, gate, chapter transition

### Separation from Critical Controls

Per WS4 and WS7:

- Glyphs may **accompany** critical buttons — not **replace** readable label or universal functional icon
- Gameplay HUD glyphs must be **instantly understandable** after teaching
- Untranslatable glyph-only store or confirm actions are rejected

### Design Intent

Unify symbolic marks across icon, typography, and frame systems.

---

## 9. Material Integration

**Locked workshop decision:** Icons should feel **carved, engraved, stamped, sealed, inlaid, or activated** within the ancient UI material system.

### Material Behaviors

| Material treatment | Icon character |
|--------------------|----------------|
| **Carved stone** | Recessed glyph, shadowed depth, worn edge |
| **Engraved metal** | Incised line, gold or bronze role per WS2 |
| **Stamped seal** | Impressed mark, authoritative rest state |
| **Inlaid insert** | Flush symbolic insert in plate or tablet |
| **Activated energy** | Highlight glow on meaningful state change only |

### Material Must Not

- Float as flat neon stickers on stone UI
- Use glassmorphism or generic app-icon gloss as default
- Glow uniformly on idle HUD elements

### Alignment

Material integration inherits [WS4](WS4_UI_Language.md) physical foundation and [WS1](WS1_Visual_Identity_Artistic_Direction.md) temple material truth.

### Design Intent

Icons feel discovered from the instrument, not pasted from a stock pack.

---

## 10. Icon Shape Language

Icon shape communicates **category and temperament** before detail is parsed.

### Shape Families

- **Radial seals** — achievement, mastery, binding
- **Angular marks** — hazards, warnings, locks
- **Directional chevrons** — navigation, flow, path affordance
- **Portal rings** — exits, thresholds, transitions
- **Plaque rectangles** — classification, inventory type
- **Mechanism glyphs** — puzzle element families

### Shape Discipline

- One primary shape metaphor per semantic category
- Corners and chamfers echo WS1 panel and stone grammar
- Avoid circles for everything — shape variety aids scan
- Hazard shapes feel **warning-stable** across biomes

### Design Intent

Make silhouette grammar teachable and consistent.

---

## 11. Icon Detail Density

Detail density is the **amount of interior information** an icon carries — controlled by role and scale.

### Density Tiers

| Tier | Density | Use |
|------|---------|-----|
| **Minimal** | Silhouette only | HUD, hazards, navigation |
| **Moderate** | Primary interior mark | Collectibles, status, buttons |
| **Rich** | Inscription and secondary rings | Seals, relics, milestones |
| **Decorative** | Full glyph fields | Frames, inactive panels only |

### Density Rules

- Higher density reserved for **larger presentation** or ceremonial context
- Reduce interior detail as display scale decreases
- Never compress rich seal detail into smallest HUD slot

### Design Intent

Prevent illegible micro-inscriptions on critical surfaces.

---

## 12. Mobile Recognition

**Locked workshop decision:** Icons must remain **recognizable at small mobile scale** with **controlled detail density**.

### Mobile Recognition Principles

- Silhouette readable on smallest intended display context
- Critical icons distinguishable without color alone
- Touch targets not crowded by ornate seal overflow
- Glanceable during one-handed play — no decoding required
- Safe visual margin inside engraved frames — no clipping

### Recognition Testing (Conceptual)

Ask of any icon:

1. Can a player name its meaning after brief teaching?
2. Is it distinct from nearest semantic neighbor?
3. Does it remain clear at mobile HUD scale?
4. Is meaning available through non-icon channels?

If any answer fails, simplify.

### Design Intent

Optimize for real device constraints, not documentation scale mockups.

---

## 13. HUD Icons

HUD icons follow WS4 **progressive HUD** philosophy — appear only for the current decision, functional first.

### HUD Icon Rules

- Functional density tier only — minimal to moderate
- Instant understandability for hazards, objectives, phase state
- No ceremonial seals on persistent HUD chrome
- Icons dismiss or hide when decision window closes
- Never obscure labyrinth tiles critical to planning

### HUD Icon Categories

| Category | Temperament |
|----------|-------------|
| **Objective** | Clear, subordinate to maze |
| **Phase** | Study, plan, commit, execute — distinct but quiet |
| **Resource** | Compact, tabular alignment with numerals per WS7 |
| **Warning** | Fair, legible, non-jump-scare |

### HUD Must Not

- Pulse unrelated icons during planning
- Introduce reflex demands through flashing symbol animation
- Use glyph-only icons without established learnability

### Design Intent

Keep symbolic language subordinate to the labyrinth during play.

---

## 14. Menu & Navigation Icons

Meta-game navigation icons may carry **slightly richer identity** while remaining scannable.

### Navigation Qualities

- Functional silhouette with optional ceremonial frame
- Consistent placement and family across meta screens
- Home, settings, collection, store, play — stable metaphors project-wide
- Selected state clear without neon overload

### Menu Icon Density

- List and grid icons: moderate density maximum
- Section headers may use decorative glyph accent on frame only
- One navigation icon style per tier — no mixed dialects in one menu

### Design Intent

Support temple archive navigation without utility-app genericism.

---

## 15. Button Icons

Button icons accompany **primary and secondary actions** — never sole-carry critical meaning without label.

### Button Icon Rules

- Pair with readable label per WS7 — glyph supports, not replaces
- Primary actions use warm authority color roles per WS2
- Icon mass balanced with engraved button plate per WS4
- Destructive or irreversible actions use distinct warning family

### Button Must Not

- Inscription-only confirm or purchase buttons
- Identical icon on opposing actions without clear state difference
- Oversized ceremonial seal inside compact touch control

### Design Intent

Make tappable symbols honest and unambiguous.

---

## 16. Status Indicators

Status icons communicate **state** — locked, active, complete, available, disabled, loading.

### Status Principles

- **Binary clarity** — on/off states visually unambiguous
- **Consistent grammar** — same lock icon family everywhere
- **Subordinate animation** — activation per WS5; no hyperactive blink
- **Multichannel** — shape, color, and label reinforce

### Status Categories

| State | Communication |
|-------|---------------|
| **Complete** | Seal or check variant — restrained, not celebratory on routine lists |
| **Locked** | Closure metaphor — stable across UI |
| **Active** | Disciplined energy highlight per WS2 |
| **Disabled** | Reduced contrast; never identical to enabled |
| **Loading** | Calm indication — not arcade spinner cliché |

### Design Intent

Make state readable without reading paragraph tooltips.

---

## 17. Hazard Icons

Hazard icons must be **fair, instant, and stable** — player safety and trust depend on them.

### Hazard Principles

- Strong warning silhouette — distinct from collectibles and exits
- Consistent hazard family across biomes — metaphor does not drift
- Fair warning visibility — not hidden in ornamental frame
- Paired with environmental read where GP4 requires
- No jump-scare visual language in icon alone

### Hazard Must Not

- Resemble reward seals or collectible gems
- Change shape between levels for same hazard type
- Rely on color alone without distinctive form

### Alignment

Hazard iconography supports [GP4 Hazards & Failure](../../01_Game_Design/Gameplay/GP4_Hazards_Failure.md) — presentation only; does not redefine rules.

### Design Intent

Make danger legible before execution begins.

---

## 18. Reward Seals

Reward seals are **ceremonial icons** — meaningful, earned, premium.

### Reward Seal Qualities

- Ornate density tier permitted — milestone presentation
- Feels stamped or impressed — craftsmanship over flash
- Tier variation through craft and rarity — not casino sparkle
- Brief focal role — then release to calm UI

### Reward Seal Must Not

- Use jackpot, slot, or coin-shower visual vocabulary
- Animate with hyperactive particle association per WS5 anti-patterns
- Outrank puzzle-critical icons during active play
- Loop celebration mark indefinitely on HUD

### Alignment

Reward seals pair with WS5 restrained reward motion, WS6 ceremonial reward audio, and WS7 earned reward copy.

### Design Intent

Celebrate mastery through seal craft, not dopamine noise.

---

## 19. Collectible & Artifact Icons

Collectible and artifact icons balance **identity richness** with **instant category recognition**.

### Collectible Qualities

- Distinct silhouette from hazards and UI chrome
- Gem, relic, key, and currency families stable project-wide
- Moderate density — readable at pickup and inventory scale
- Ceremonial crest on artifact detail view — not on every pickup flash

### Artifact Marks

- Classification glyph on frame or plaque
- Relic crest at ceremonial density on collection screen
- Name and type carried by WS7 typography — icon supports, not replaces

### Collectible Must Not

- Flash casino pickup vocabulary on routine collection
- Use identical icon for unrelated collectible types
- Hide pickup type inside unreadable micro-glyph

### Design Intent

Make collection feel like archaeological cataloging.

---

## 20. Progression Markers

Progression markers communicate **advancement through ruins** — stars, seals, paths cleared, mastery tiers.

### Progression Qualities

- Clear filled vs unfilled state grammar
- World and chapter markers share civilization seal logic
- Mastery marks distinct from routine completion checkmarks
- Scannable on level select — moderate density maximum

### Progression Must Not

- Use star explosion or battle-pass visual clichés as default
- Change tier metaphor per biome without teaching reason
- Crowd level select with competing seal sizes

### Design Intent

Make advancement readable at a map glance.

---

## 21. Map & Location Markers

Map markers orient the player **where they are and what awaits** — current location, exits, locks, events.

### Marker Principles

- Current position instantly identifiable
- Locked vs available destinations distinct
- Marker family aligns with progression seals — one grammar
- Decorative map parchment may be rich; markers stay functional

### Marker Must Not

- Clutter map with identical glyphs for unrelated states
- Hide lock state inside ornamental inscription only
- Use modern GPS pin cliché as default temple marker

### Design Intent

Make ruin navigation feel like reading a temple chart, not a GPS app.

---

## 22. Store & Monetization Icons

Store icons remain **premium, clear, and honest** within ancient instrument framing.

### Store Icon Qualities

- Functional clarity for currency, bundle, and unlock type
- Ceremonial framing on featured offer headers — not on price clarity
- No loot-box or casino visual metaphors
- Value and content type readable without decoding glyph

### Store Must Not

- Use slot-machine, dice, or jackpot seal vocabulary
- Glyph-only purchase buttons
- Urgency icons that mimic hazard warning family

### Alignment

Store iconography follows WS4 store UI philosophy and WS7 honest monetization text.

### Design Intent

Monetization surfaces feel like temple treasury archives, not arcades.

---

## 23. Accessibility Considerations

Icons must remain **inclusive** — meaning cannot depend on icon alone.

### Accessibility Principles

- **Multichannel** — label, color, shape, haptic, and audio reinforce icon meaning
- **Not color-only** — critical distinctions work without color vision
- **Text labels** available for settings, store, and primary navigation where platform allows
- **High contrast** states for disabled vs active per WS2 and [Accessibility](../Accessibility.md)
- **Reduced motion** — icon state change does not require animation to understand

### Cognitive Accessibility

- Limit novel symbols introduced per session
- Consistent metaphor reduces learning load
- Error and hazard icons visually distinct from reward seals

### Design Intent

Ensure icons are enhancement, not sole barrier or sole carrier of critical meaning.

---

## 24. Icon Consistency Rules

Consistency makes the temple read like **one civilization's symbolic language** across biomes, screens, and updates.

### Consistency Rules

1. **One functional family** — HUD and controls share grammar
2. **One ceremonial family** — seals and relics share grammar
3. **One hazard family** — stable warning metaphors
4. **One collectible family** — stable pickup metaphors
5. **One progression family** — stars, tiers, locks coherent
6. **One material treatment** — carved, engraved, sealed logic per WS4
7. **One semantic map** — concept-to-icon binding documented and stable

### Cross-Discipline Handoff

| Source | Consumer |
|--------|----------|
| WS8 philosophy | [Icons](../Icons.md) asset and usage guidance |
| WS8 philosophy | [Design_Tokens](../Design_Tokens.md) icon roles |
| WS8 philosophy | [Components](../Components.md) icon integration |
| WS8 philosophy | `docs/03_Screens/*` icon presentation |
| WS8 philosophy | Environmental prop and mechanism marks |

Downstream documents **implement** WS8 — they do not fork parallel icon dialects.

### Version Changes

New icon families or metaphor changes require [Decisions](../../00_Project/Decisions.md) entry and Human approval.

### Design Intent

Prevent stock-icon drift and metaphor chaos as teams scale.

---

## 25. Icon Anti-Patterns

The following are **rejected** unless explicit Human-approved exception exists.

### Clarity Anti-Patterns

- Glyph-only primary buttons or purchases
- Hazard icons resembling collectibles or rewards
- Unreadable micro-detail on smallest HUD slots
- Meaning change for same concept mid-project
- Color-only distinction for critical states

### Identity Anti-Patterns

- Generic mobile icon pack as default temple UI
- Cyberpunk circuit glyphs in ancient seals
- Cartoon emoji or thick-outline arcade icons
- Random rune generator aesthetic per screen

### HUD Anti-Patterns

- Persistent ceremonial seals on gameplay chrome
- Flashing unrelated icons during planning
- Icon clutter violating WS4 progressive HUD

### Reward Anti-Patterns

- Jackpot, slot, and coin-shower seal designs
- Hyperanimated reward marks blocking progress
- Casino tier badges in monetization surfaces

### Consistency Anti-Patterns

- Different lock metaphors on settings vs level select
- Biome introduces unrelated icon dialect without teaching
- Flat neon stickers on stone instrument UI

### Design Intent

Give reviewers explicit rejection language.

---

## 26. Design Decision Framework

Use this framework when evaluating new icon proposals.

### Evaluation Questions

1. **Meaning** — Instantly understandable after teaching? Not confusing?
2. **Ancient identity** — Credible civilization symbol? Appropriately rich?
3. **Functional vs ceremonial** — Correct dual-system tier?
4. **Guardrail** — Critical actions have label or universal functional backup?
5. **Material** — Feels carved, sealed, inlaid — not flat stock?
6. **Density** — Appropriate for scale and context?
7. **Mobile** — Recognizable at smallest intended use?
8. **HUD fit** — Progressive, minimal per WS4?
9. **Semantic consistency** — Matches established family for this meaning?
10. **Hazard fairness** — Distinct, stable, not tricking player?
11. **Reward ethic** — Ceremonial, not casino?
12. **Store honesty** — Clear content and value?
13. **Accessibility** — Multichannel backup?
14. **Consistency** — Matches WS8 or invents new dialect?

### Outcomes

- **Approve** — proceed to icon asset, token, or component spec authoring
- **Revise** — adjust density, metaphor, material, or label pairing
- **Reject** — cite locked decision violation or anti-pattern
- **Escalate** — Human approval for new icon family or glyph dialect

### Design Intent

Make iconography approval repeatable across design, gameplay, and review agents.

---

## 27. Summary

Labyrinth Legends iconography is a **dual inscribed visual language** — functional clarity for decisions, ceremonial richness for identity — disciplined through meaning-first guardrails, material integration, and semantic consistency.

**WS8 establishes that:**

- Icons communicate quickly; ancient styling never obscures function
- Ancient symbols, glyphs, and seals are core identity — used heavily with clarity guardrails
- Functional and ceremonial icon systems coexist under one civilization grammar
- Icons feel carved, engraved, stamped, and activated in temple materials
- Same meaning always maps to same icon family
- HUD icons are progressive, minimal, and instantly understandable
- Hazards, collectibles, rewards, and store icons each follow distinct ethical and visual rules
- Mobile recognition and accessibility multichannel requirements protect all players

Downstream [Icons](../Icons.md), [Design_Tokens](../Design_Tokens.md), [Components](../Components.md), and screen specs implement WS8 — they do not redefine it.

---

## 28. Workshop Conclusions

WS8 — Iconography Language Workshop records the following locked conclusions:

| # | Conclusion |
|---|------------|
| 1 | WS8 is the iconography authority within LLDL, subordinate only to Vision and WS0–WS7 |
| 2 | **Meaning first** — quick clear communication; function never obscured |
| 3 | **Heavy ancient-symbol identity** — glyphs, seals, carved marks as core brand |
| 4 | **Functional clarity guardrail** — critical controls never glyph-only |
| 5 | **Dual icon system** — functional clear; ceremonial ornate |
| 6 | **Material integration** — carved, engraved, stamped, sealed, inlaid, activated |
| 7 | **Semantic consistency** — stable meaning-to-icon families |
| 8 | **Mobile-first recognition** — controlled detail density at small scale |
| 9 | HUD, hazard, reward, and store icons each follow WS4-aligned restraint rules |
| 10 | Icons, tokens, and component specs must inherit WS8 without parallel symbolic dialects |

### Design Intent

Freeze workshop outcomes before icon libraries, token roles, and component icon specs are authored.

---

## 29. Related Documents

### Upstream

- [Vision](../../00_Project/Vision.md)
- [WS0 — Design Philosophy](WS0_Design_Philosophy.md)
- [WS1 — Visual Identity & Artistic Direction](WS1_Visual_Identity_Artistic_Direction.md)
- [WS2 — Color Language](WS2_Color_Language.md)
- [WS3 — Environment Language](WS3_Environment_Language.md)
- [WS4 — UI Language](WS4_UI_Language.md)
- [WS5 — Motion Language](WS5_Motion_Language.md)
- [WS6 — Audio Language](WS6_Audio_Language.md)
- [WS7 — Typography Language](WS7_Typography_Language.md)

### Downstream

- [WS8 — Iconography Language](WS8_Iconography_Language.md) — Iconography authority
- [WS9 — Accessibility Language](WS9_Accessibility_Language.md) — Accessibility authority
- [LLDL](../LLDL.md) — Design language specification
- [Icons](../Icons.md) — Icon asset and usage guidance
- [Design_Tokens](../Design_Tokens.md) · [Components](../Components.md)
- [Accessibility](../Accessibility.md)
- `docs/03_Screens/*` — Per-screen specifications

### Gameplay alignment

- [Gameplay](../../01_Game_Design/Gameplay.md) · [GP4 Hazards & Failure](../../01_Game_Design/Gameplay/GP4_Hazards_Failure.md) · [GP6 Gameplay Feedback](../../01_Game_Design/Gameplay/GP6_Gameplay_Feedback.md)

### Governance

- [Decisions](../../00_Project/Decisions.md)
- [Roadmap](../../00_Project/Roadmap.md)

---

## Navigation

| ← Previous | Next → | Index |
|------------|--------|-------|
| [WS7 — Typography Language](WS7_Typography_Language.md) | [WS9 — Accessibility Language](WS9_Accessibility_Language.md) | [Documentation Home](../../README.md) · [LLDL](../LLDL.md) |
