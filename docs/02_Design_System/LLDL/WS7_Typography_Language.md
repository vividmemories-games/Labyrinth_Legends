# WS7 — Typography Language

| Field | Value |
|-------|-------|
| **Project** | Labyrinth Legends |
| **Document Name** | WS7 — Typography Language |
| **Document ID** | LLDL-DOC-WS7-001 |
| **Series** | WS7 — Labyrinth Legends Design Language (LLDL) Typography Authority |
| **Version** | 1.0.0 |
| **Status** | Approved |
| **Owner** | Apoorv |
| **Prepared By** | ChatGPT (workshop) · Cursor (compiler) |
| **Last Updated** | 2026-06-30 |
| **Workshop** | WS7 — Typography Language |
| **Path** | `docs/02_Design_System/LLDL/WS7_Typography_Language.md` |
| **Dependencies** | [Vision](../../00_Project/Vision.md) · [WS0 — Design Philosophy](WS0_Design_Philosophy.md) · [WS1 — Visual Identity](WS1_Visual_Identity_Artistic_Direction.md) · [WS2 — Color Language](WS2_Color_Language.md) · [WS3 — Environment Language](WS3_Environment_Language.md) · [WS4 — UI Language](WS4_UI_Language.md) · [WS5 — Motion Language](WS5_Motion_Language.md) · [WS6 — Audio Language](WS6_Audio_Language.md) |
| **Related Documents** | [LLDL](LLDL.md) · [Typography](../Typography.md) · [Accessibility](../Accessibility.md) · `docs/03_Screens/*` |

## Navigation

| ← Previous | Next → | Index |
|------------|--------|-------|
| [WS6 — Audio Language](WS6_Audio_Language.md) | [WS8 — Iconography Language](WS8_Iconography_Language.md) | [Documentation Home](../../README.md) · [LLDL](LLDL.md) |

---

## Version History

| Version | Date | Author | Summary |
|---------|------|--------|---------|
| 1.0.0 | 2026-06-30 | ChatGPT / Cursor | WS7 — typography language authority for LLDL |

## Change Log

| Version | Change |
|---------|--------|
| 1.0.0 | Initial workshop record: readability first, dual functional/ceremonial system, hierarchy restraint, symbolic glyph separation, mobile clarity |

---

## Document Authority

**WS7 is the typography authority within the Labyrinth Legends Design Language (LLDL).**

| Conflict type | Authority |
|---------------|-----------|
| Product intent | [Vision](../../00_Project/Vision.md) wins |
| Design philosophy | [WS0 — Design Philosophy](WS0_Design_Philosophy.md) wins |
| Artistic identity | [WS1 — Visual Identity](WS1_Visual_Identity_Artistic_Direction.md) wins |
| Color meaning | [WS2 — Color Language](WS2_Color_Language.md) wins |
| Environmental language | [WS3 — Environment Language](WS3_Environment_Language.md) wins |
| UI philosophy and information density | [WS4 — UI Language](WS4_UI_Language.md) wins |
| Motion and interaction tone | [WS5 — Motion Language](WS5_Motion_Language.md) wins |
| Audio temperament | [WS6 — Audio Language](WS6_Audio_Language.md) wins |
| Typography philosophy, text hierarchy, ceremonial vs functional type | **WS7 wins** |
| Font tokens, type scale values, component text specs | [Typography](../Typography.md) · [Design_Tokens](../Design_Tokens.md) — must align with WS7; WS7 does not define implementation |

WS7 extends Vision and WS0–WS6. It does not override gameplay rules, UI layout philosophy, or color semantics. When typographic ornament conflicts with WS0 readability, WS4 progressive HUD restraint, or WS4 symbol clarity guardrails, the higher document prevails until [Decisions](../../00_Project/Decisions.md) records an explicit, Human-approved exception.

WS4 defines *how the interface behaves*. **WS7 defines how the temple speaks in written form** — functional clarity for decisions, ceremonial weight for identity, and disciplined symbolic text throughout.

---

## Intended Audience

| Role | Use this document to… |
|------|------------------------|
| UI/UX Designers | Author text hierarchy within permanent typography philosophy |
| Visual Designers | Balance ancient identity with mobile legibility |
| Writers & Narrative Designers | Scope lore, artifact, and reward copy presentation |
| Localization Leads | Plan text expansion and cultural adaptation constraints |
| Accessibility Reviewers | Verify typography meets readability and contrast standards |
| Screen Spec Authors | Extend WS7 into `docs/03_Screens/*` without redefining philosophy |
| Monetization Designers | Frame store copy within premium ancient tone |
| Implementation Agents | Reject typography directions that violate WS7 locked decisions or anti-patterns |

---

## Table of Contents

1. [Purpose of the Typography Language](#1-purpose-of-the-typography-language)
2. [Typography Philosophy](#2-typography-philosophy)
3. [Readability First](#3-readability-first)
4. [Functional Typography](#4-functional-typography)
5. [Ceremonial Typography](#5-ceremonial-typography)
6. [Ancient-Inspired Type Identity](#6-ancient-inspired-type-identity)
7. [Text Hierarchy](#7-text-hierarchy)
8. [Heading Philosophy](#8-heading-philosophy)
9. [Body Text Philosophy](#9-body-text-philosophy)
10. [Labels & Microcopy](#10-labels--microcopy)
11. [Numeric Typography](#11-numeric-typography)
12. [Lore & Artifact Text](#12-lore--artifact-text)
13. [Reward Text](#13-reward-text)
14. [Store & Monetization Text](#14-store--monetization-text)
15. [Symbolic Glyphs & Inscriptions](#15-symbolic-glyphs--inscriptions)
16. [Typography in Gameplay HUD](#16-typography-in-gameplay-hud)
17. [Typography in Meta-Game UI](#17-typography-in-meta-game-ui)
18. [Mobile Readability](#18-mobile-readability)
19. [Localization Considerations](#19-localization-considerations)
20. [Accessibility Considerations](#20-accessibility-considerations)
21. [Typography Consistency Rules](#21-typography-consistency-rules)
22. [Typography Anti-Patterns](#22-typography-anti-patterns)
23. [Design Decision Framework](#23-design-decision-framework)
24. [Summary](#24-summary)
25. [Workshop Conclusions](#25-workshop-conclusions)
26. [Related Documents](#26-related-documents)

---

## 1. Purpose of the Typography Language

Written language is how the temple **communicates** — objectives, consequences, relic names, progression seals, and the whisper of lost civilization. Typography that sacrifices legibility for ornament breaks trust. Typography that defaults to generic mobile utility breaks identity.

WS7 answers:

> **How should every written element in Labyrinth Legends support readability, hierarchy, and ancient-world identity?**

Without typography authority, teams default to system fonts, decorative title overload, unreadable inscription-as-button, and hierarchy chaos. Premium identity collapses. Puzzle comprehension suffers. Localization becomes costly and fragile.

WS7 establishes the **permanent typography philosophy** for functional UI text, ceremonial headings, lore delivery, numeric display, symbolic inscriptions, and mobile accessibility. It does not define font families, token values, or rendering implementation.

### What WS7 Governs

- Dual functional and ceremonial typographic temperament
- Readability and hierarchy principles
- Text roles across gameplay HUD, meta-game, lore, rewards, and store
- Symbolic glyph separation from critical controls
- Localization and accessibility typography requirements
- Anti-patterns and approval framework

### What WS7 Does Not Govern

- Exact font files, licenses, or type scale values
- Component-level text style APIs
- Per-screen layout or copywriting content
- Gameplay rules or UI component structure

### Design Intent

Give every text-touching discipline a shared vocabulary before type tokens and screen specs are authored.

---

## 2. Typography Philosophy

Typography in Labyrinth Legends serves **comprehension first** and **identity second** — never the reverse.

### Core Typography Temperament

Written language should feel **inscribed into the temple** — elegant, ceremonial, timeless — while remaining **immediately readable** on mobile screens during short sessions and one-handed play.

### Typography Pillars

| Pillar | Meaning |
|--------|---------|
| **Readable** | Clear at a glance; ancient styling never compromises comprehension |
| **Dual** | Functional text clean; ceremonial text stylized with discipline |
| **Hierarchical** | Size, weight, spacing, and placement communicate priority through restraint |
| **Ancient** | Type supports civilization identity without decorative noise |
| **Separated** | Glyphs and inscriptions enrich identity; they do not replace critical labels |
| **Mobile-first** | Quick understanding, localization-ready, accessibility-aware |

### Locked Workshop Decisions

| # | Decision |
|---|----------|
| 1 | **Readability first** — clear, legible, comfortable on mobile; ancient styling never compromises comprehension |
| 2 | **Premium ancient identity** — elegant, carved, ceremonial, timeless; supports civilization without decorative noise |
| 3 | **Dual typographic system** — functional UI clean and readable; lore, titles, seals, artifacts may use stylized ancient-inspired treatment |
| 4 | **Hierarchy through restraint** — clear hierarchy via size, weight, spacing, placement; avoid excessive variety and ornament |
| 5 | **Symbolic text separation** — glyphs and inscriptions as identity; never replace readable text for critical actions |
| 6 | **Mobile-first clarity** — quick understanding, short sessions, one-handed play, localization, accessibility |

### Alignment

Typography inherits player-first clarity from [WS0](WS0_Design_Philosophy.md), inscription and material identity from [WS1](WS1_Visual_Identity_Artistic_Direction.md), text color roles from [WS2](WS2_Color_Language.md), environmental inscription context from [WS3](WS3_Environment_Language.md), information density and symbol guardrails from [WS4](WS4_UI_Language.md), and calm presentation temperament from [WS5](WS5_Motion_Language.md) and [WS6](WS6_Audio_Language.md).

### Design Intent

Freeze a single typography temperament before any discipline authors parallel text dialects.

---

## 3. Readability First

**Locked workshop decision:** Typography must remain **clear, legible, and comfortable on mobile screens**. Ancient styling must never compromise comprehension.

### Readability Principles

- Player-facing decisions must be readable **without squinting, zooming, or decoding**
- Contrast between text and surface must support legibility per WS2 semantic roles
- Line length and density favor **scan speed** over literary layout
- Decorative type never appears on **primary actions, hazards, or validation messages** unless paired with plain-language duplicate
- Teaching text may be slightly more generous; expert screens may compress — never below comprehension threshold

### Readability vs Identity

When identity and readability conflict:

1. Preserve meaning and legibility
2. Move ornament to frame, background inscription, or secondary line
3. Escalate to Human approval only for intentional ceremonial exceptions

### Design Intent

Make readability the non-negotiable floor for all written UI.

---

## 4. Functional Typography

**Locked workshop decision:** Functional UI text should be **clean and highly readable**.

### Functional Text Scope

Functional typography covers text the player **reads to act**:

- Button and control labels
- HUD objectives and phase prompts
- Validation and error messages
- Settings and utility labels
- Store transaction confirmations
- Tutorial instructions during teaching

### Functional Qualities

- High legibility at mobile scale
- Minimal ornament — clarity over ceremony
- Consistent weight and spacing within role families
- Plain language — no faux-archaic obfuscation of controls
- Distinct from ceremonial layers without feeling like a different app

### Functional Must Not

- Use inscription-style type for critical confirm/dismiss actions alone
- Rely on all-caps shouting for hierarchy
- Compress below comfortable mobile reading
- Compete visually with ceremonial titles on the same surface

### Design Intent

Ensure the player always knows what to tap, read, and decide.

---

## 5. Ceremonial Typography

**Locked workshop decision:** Lore, headings, titles, seals, artifact names, and ceremonial moments may use **more stylized ancient-inspired typography**.

### Ceremonial Text Scope

Ceremonial typography covers text that **celebrates identity and moment**:

- Screen and world titles
- Chapter and biome names
- Relic and artifact names
- Progression seals and mastery marks
- Reward headlines and milestone banners
- Selected lore reveal moments

### Ceremonial Qualities

- Elegant, carved, timeless character
- Feels inscribed — not pasted display type
- Used sparingly — ceremony implies significance
- Paired with functional subtitle or body when meaning must be unambiguous
- Aligns with WS1 inscription and WS4 ancient instrument identity

### Ceremonial Must Not

- Appear on every label — dilutes hierarchy
- Replace functional labels on primary controls
- Sacrifice legibility for flourish
- Introduce a third unrelated display dialect

### Design Intent

Give milestone and identity moments typographic weight without polluting utility surfaces.

---

## 6. Ancient-Inspired Type Identity

**Locked workshop decision:** Typography should feel **elegant, carved, ceremonial, and timeless** — supporting ancient civilization identity without becoming decorative noise.

### Identity Expression

Ancient type identity is expressed through:

- **Proportion** — monumental headings, measured body rhythm
- **Weight contrast** — authority in titles; calm in descriptions
- **Inscription sensibility** — engraved, chiseled, or ritual letterform character without illegibility
- **Material pairing** — type feels set into stone, metal, or tablet surfaces per WS4
- **Restraint** — one civilization voice, not fantasy genre mashup

### Identity Boundaries

Ancient-inspired type is **not**:

- Cartoon medieval spoof lettering
- Generic fantasy blackletter overload
- Sci-fi digital glitch text
- Decorative unicode substitution for real words

### Design Intent

Keep typographic identity archaeologically credible and visually aligned with WS1.

---

## 7. Text Hierarchy

**Locked workshop decision:** **Hierarchy through restraint** — size, weight, spacing, and placement communicate priority clearly; avoid excessive font variety, ornamentation, or loud treatments.

### Hierarchy Levels (Conceptual)

| Level | Role | Temperament |
|-------|------|-------------|
| **Primary** | Screen purpose, main action context | One dominant line per screen |
| **Secondary** | Section headers, supporting titles | Clear step down from primary |
| **Body** | Descriptions, instructions, lore excerpts | Comfortable reading density |
| **Label** | Controls, stats, metadata | Compact, scannable |
| **Caption** | Hints, timestamps, tertiary notes | Subordinate; never competes |
| **Ceremonial** | Titles, seals, relic names | Stylized; used at milestone density |

### Hierarchy Rules

- One **primary textual focal point** per screen
- No more than **two typographic personalities** on a single functional surface
- Weight and spacing do hierarchy work before ornament
- Color supports hierarchy per WS2 — warm authority for primary, neutrals for structure

### Design Intent

Make scan path obvious without visual shouting.

---

## 8. Heading Philosophy

Headings orient the player **where they are and what matters now**.

### Heading Qualities

- **Distinct** from body — immediately recognizable as structure
- **Brief** — titles name, not explain
- **Ceremonial when appropriate** — meta-game and milestone headings carry identity
- **Restrained in gameplay** — HUD headings minimal and functional

### Heading Context

| Context | Heading temperament |
|---------|---------------------|
| **Gameplay HUD** | Functional; near-invisible hierarchy |
| **Meta-game screens** | Ceremonial primary; functional secondary |
| **Lore reveal** | Ceremonial title; readable body |
| **Settings** | Functional throughout |

### Heading Must Not

- Stack multiple competing title sizes
- Use decorative headings for error states
- Truncate critical titles without accessible expansion

### Design Intent

Headings name the chamber; body text explains the path.

---

## 9. Body Text Philosophy

Body text carries **explanation, lore, consequences, and supporting detail**.

### Body Text Qualities

- Comfortable reading rhythm for mobile
- Secondary color role for long passages per WS2
- Short paragraphs and clear breaks — no wall-of-text slabs
- Plain syntax — complex sentences reserved for optional lore depth
- Progressive disclosure — detail behind expand, tab, or secondary screen

### Body Text in Gameplay

During active puzzle play, body text is **rare and brief**. The labyrinth leads; text supports only current decision.

### Design Intent

Body text teaches without lecturing.

---

## 10. Labels & Microcopy

Labels and microcopy are the **smallest readable text** — controls, stats, badges, hints.

### Label Qualities

- Maximum scannability — short, consistent phrasing
- Functional type only
- Never inscription-only for critical meaning
- Verb-first on primary actions where appropriate
- Consistent terminology across screens — one word per concept

### Microcopy Tone

- Calm, instructive, premium — not chatty or arcade
- Errors explain **what happened and what to try** — not blame
- Confirmations state consequence clearly before commit

### Alignment

Microcopy density follows WS4 minimal information density — if it does not help the current decision, it should not be visible by default.

### Design Intent

Make small text do precise work.

---

## 11. Numeric Typography

Numbers communicate **progress, score, resources, timers, and puzzle state**.

### Numeric Qualities

- **Tabular alignment** where columns or comparisons matter
- **Distinct but not loud** — numerals readable at glance
- **Consistent formatting** — separators, units, and suffixes uniform project-wide
- **Functional type** — ceremonial numerals only in seal or milestone presentation

### Numeric Context

| Context | Treatment |
|---------|-----------|
| **HUD stats** | Compact functional |
| **Rewards** | Ceremonial accent possible on achievement value |
| **Store** | Clear price and value — no ambiguity |
| **Puzzle state** | Legible; never decorative-only |

### Numeric Must Not

- Use stylized numerals that confuse digit shapes
- Animate numbers aggressively during planning
- Hide units or currency semantics

### Design Intent

Make quantities trustworthy at a glance.

---

## 12. Lore & Artifact Text

Lore and artifact text deliver **mystery and collection depth** without exposition dumps.

### Lore Text Qualities

- Optional depth — never required to solve core puzzle
- Ceremonial title; readable body
- Shorter default excerpts; fuller text behind deliberate access
- Inference-friendly — suggests civilization, does not lecture history
- Aligns with WS3 environmental storytelling methods

### Artifact Text

- **Name** — ceremonial, distinctive, memorable
- **Classification** — functional label line
- **Description** — body text; evocative but parsable
- **Inscription flourish** — symbolic glyph accent optional on frame, not replacing name

### Lore Must Not

- Block gameplay with unskippable text walls
- Contradict higher-level narrative authority
- Use faux-archaic grammar that impedes comprehension

### Design Intent

Make collection text feel like discovered archive entries.

---

## 13. Reward Text

Reward text celebrates **achievement with ceremony** — not casino excitement.

### Reward Text Qualities

- **Headline** — ceremonial; names the accomplishment
- **Supporting line** — functional; states what was earned
- **Brief** — player returns to exploration quickly
- **Earned tone** — mastery language, not giveaway language

### Reward Hierarchy

Primary reward name > quantity or tier > secondary bonus detail. One focal celebration line.

### Reward Must Not

- Use jackpot, loot-box, or urgency copy styling
- Stack multiple shouting headlines
- Persist blocking text after player dismisses

### Alignment

Reward text pairs with WS5 restrained reward motion and WS6 ceremonial reward audio — text does not out-shout them into casino register.

### Design Intent

Make rewards feel sealed and significant, not spammed.

---

## 14. Store & Monetization Text

Store text must remain **premium, clear, and honest** within ancient instrument framing.

### Store Text Qualities

- Functional clarity for price, contents, and confirmation
- Ceremonial framing on headers and featured offers — not on legal clarity
- No urgency typography — countdown panic styling rejected
- Value stated plainly — no visual trickery through type hierarchy
- Consistent with WS4 store UI philosophy

### Store Must Not

- Use casino or sale-shout display treatments
- Bury terms in caption-sized deception
- Style purchase buttons as inscription-only glyphs

### Design Intent

Monetization surfaces feel like temple archives, not bargain bins.

---

## 15. Symbolic Glyphs & Inscriptions

**Locked workshop decision:** Ancient glyphs, inscriptions, and symbolic marks may appear **heavily as identity elements** — they must **not replace readable player-facing text** for critical actions.

### Symbolic Text Roles

Glyphs and inscriptions enrich:

- Frames, borders, and dividers
- Background panels and inactive decorative fields
- Menu identity and section ornament
- Reward and progression presentation
- Artifact interfaces and seal marks

### Symbolic Separation Rules

- Critical buttons include **readable label** — glyph may accompany, not replace
- Gameplay HUD symbols follow WS4 instant-understandability guardrails
- Inscription density highest on **inactive or ceremonial** surfaces
- Meaning never depends on glyph literacy alone

### Core Rule

The UI may be **symbol-heavy**, but never **meaning-confusing** — inherited from WS4, applied to typography.

### Design Intent

Preserve symbolic richness without sacrificing functional literacy.

---

## 16. Typography in Gameplay HUD

Gameplay HUD typography follows WS4 **progressive HUD** philosophy — text appears only for the current decision.

### Gameplay HUD Rules

- Minimal text presence during study and plan
- Functional type only — no ceremonial titles on HUD chrome
- Phase-appropriate prompts — commit, execute, evaluate
- Text dismisses or fades when decision window closes
- Never obscure labyrinth tiles with text blocks

### HUD Text Must Not

- Persist full objective essays during path drawing
- Use animated or pulsing text unrelated to phase
- Introduce lore paragraphs in-chamber by default

### Design Intent

Keep written language subordinate to the maze during play.

---

## 17. Typography in Meta-Game UI

Meta-game typography may carry **more ceremonial presence** — navigation, progression, collection, settings, store.

### Meta-Game Qualities

- Ceremonial screen titles establish place in the temple
- Functional labels on all controls and lists
- Scannable hierarchy — one primary purpose per screen per WS4
- Decoration on frames; clarity on interactive text
- Continuity — player never feels they left the universe for a utility app

### Meta-Game Restraint

Ceremony does not justify slow comprehension. Titles may be rich; actions must be plain.

### Design Intent

Allow richer typographic identity outside the chamber while preserving mobile usability.

---

## 18. Mobile Readability

**Locked workshop decision:** Text supports **quick understanding, short sessions, one-handed play, localization, and accessibility**.

### Mobile Considerations

- Comfortable reading without pinching or device rotation requirement
- Thumb-zone awareness for primary actions — labels not trapped in unreadable corners
- Short session scan — player grasps screen purpose in seconds
- Glanceable labels — HUD and notifications parsable peripherally
- Safe margins — text not clipped by notches, curves, or engraved frames

### Density Discipline

Mobile screens are small temples — **fewer words, clearer words**. WS4 progressive disclosure applies to text volume.

### Design Intent

Optimize for real mobile play contexts, not desktop documentation comfort.

---

## 19. Localization Considerations

Typography must **survive translation** without breaking layout or hierarchy.

### Localization Principles

- Functional type chosen for **multi-script resilience** in implementation — WS7 does not name fonts
- Layout tolerates **text expansion** without truncation of critical meaning
- Ceremonial titles may remain stylized; translated subtitles carry clarity when needed
- No meaning embedded in untranslatable glyph-only controls
- Consistent terminology glossary across languages for game concepts
- Numeric and unit formatting adapts per locale without visual chaos

### Localization Must Not

- Assume English-short labels for all buttons
- Hard-design ceremonial lockups that cannot accommodate longer scripts
- Use puns or inscription visual puns that fail across cultures without fallback

### Design Intent

Make ancient identity globally legible, not locally clever only.

---

## 20. Accessibility Considerations

Typography must remain **inclusive** — readability cannot depend on perfect vision or color alone.

### Accessibility Principles

- **Contrast** — text meets readability needs against surfaces per WS2 and [Accessibility](../Accessibility.md)
- **Resize support** — critical text remains usable when player increases text size
- **Multichannel** — icon, color, and haptic reinforce text meaning
- **No tiny critical text** — legal, price, and hazard information never caption-sized only
- **Plain language option** where ceremonial copy risks ambiguity

### Dyslexia and Cognitive Load

- Short lines and clear breaks reduce cognitive load
- Avoid justified text blocks and excessive ornamental capitals in functional areas
- Teaching text may repeat once; expert UI compresses without hiding essentials

### Design Intent

Ensure typography is enhancement, not barrier.

---

## 21. Typography Consistency Rules

Consistency makes the temple read like **one civilization's written language** across biomes, screens, and updates.

### Consistency Rules

1. **One functional voice** — clean, readable, consistent across all controls
2. **One ceremonial voice** — ancient-inspired, disciplined, milestone-scoped
3. **One hierarchy grammar** — primary through caption roles stable project-wide
4. **One symbolic separation ethic** — glyphs enrich; labels remain readable
5. **One color-text relationship** — WS2 roles govern emphasis
6. **One microcopy tone** — calm, premium, instructive
7. **One numeric formatting standard** — units, separators, alignment

### Cross-Discipline Handoff

| Source | Consumer |
|--------|----------|
| WS7 philosophy | [Typography](../Typography.md) token and scale guidance |
| WS7 philosophy | [Design_Tokens](../Design_Tokens.md) text roles |
| WS7 philosophy | [Components](../Components.md) text usage |
| WS7 philosophy | `docs/03_Screens/*` copy presentation |
| WS7 philosophy | Localization and accessibility docs |

Downstream documents **implement** WS7 — they do not fork parallel typography identities.

### Version Changes

New typographic dialects require [Decisions](../../00_Project/Decisions.md) entry and Human approval.

### Design Intent

Prevent generic mobile or fantasy drift as teams scale.

---

## 22. Typography Anti-Patterns

The following are **rejected** unless explicit Human-approved exception exists.

### Readability Anti-Patterns

- Inscription-only primary buttons
- Decorative type on errors, hazards, or validation
- Body text walls blocking puzzle view
- Low-contrast gold-on-gold ceremony
- Critical text below comfortable mobile threshold

### Identity Anti-Patterns

- Cartoon medieval fonts as default
- Multiple unrelated display faces on one screen
- Sci-fi digital type in ancient temple UI
- Unicode gimmicks replacing real words

### Hierarchy Anti-Patterns

- Everything is a title — no scan path
- All-caps shouting for routine labels
- Competing ceremonial headlines on one surface
- Numeric celebration typography on routine stats

### Symbolic Anti-Patterns

- Glyph-only gameplay HUD icons without learnability
- Meaning-confusing symbol substitution per WS4 violation
- Untranslatable glyph locks on store purchases

### Store Anti-Patterns

- Countdown panic typography
- Hidden terms in ornamental inscription styling
- Casino-tier reward copy in monetization surfaces

### Design Intent

Give reviewers explicit rejection language.

---

## 23. Design Decision Framework

Use this framework when evaluating new typography proposals.

### Evaluation Questions

1. **Readability** — Legible on mobile without decoding?
2. **Functional vs ceremonial** — Correct voice for this text role?
3. **Hierarchy** — One clear primary? Restraint maintained?
4. **Ancient identity** — Credible civilization voice without noise?
5. **Symbol separation** — Critical actions have readable labels?
6. **Gameplay fit** — HUD text progressive and minimal per WS4?
7. **Meta-game fit** — Ceremony without scan-speed loss?
8. **Numeric clarity** — Quantities unambiguous?
9. **Lore depth** — Optional, parsable, non-blocking?
10. **Reward ethic** — Ceremonial, not casino?
11. **Store honesty** — Clear price and terms?
12. **Localization** — Survives expansion and translation?
13. **Accessibility** — Contrast, resize, multichannel backup?
14. **Consistency** — Matches WS7 or invents new dialect?

### Outcomes

- **Approve** — proceed to type token, component, or screen spec authoring
- **Revise** — adjust hierarchy, role assignment, or ornament placement
- **Reject** — cite locked decision violation or anti-pattern
- **Escalate** — Human approval for new typographic dialect or ceremonial exception

### Design Intent

Make typography approval repeatable across design, writing, localization, and review agents.

---

## 24. Summary

Labyrinth Legends typography is a **dual inscribed language** — functional clarity for decisions, ceremonial elegance for identity — disciplined through hierarchy, symbolic separation, and mobile-first readability.

**WS7 establishes that:**

- Readability is the non-negotiable floor; ancient styling never compromises comprehension
- Functional UI text stays clean; lore, titles, seals, and artifacts may carry ceremonial treatment
- Hierarchy communicates through restraint — not excessive variety or ornament
- Glyphs and inscriptions enrich identity but never replace critical readable labels
- Gameplay HUD text is progressive and minimal; meta-game may carry richer ceremony
- Lore, rewards, and store copy remain premium, clear, and honest
- Localization and accessibility are planned from philosophy, not patched later
- Anti-patterns reject inscription-only controls, casino copy, and hierarchy chaos

Downstream [Typography](../Typography.md), [Design_Tokens](../Design_Tokens.md), [Components](../Components.md), and screen specs implement WS7 — they do not redefine it.

---

## 25. Workshop Conclusions

WS7 — Typography Language Workshop records the following locked conclusions:

| # | Conclusion |
|---|------------|
| 1 | WS7 is the typography authority within LLDL, subordinate only to Vision and WS0–WS6 |
| 2 | **Readability first** — mobile legibility; ancient styling never compromises comprehension |
| 3 | **Premium ancient identity** — elegant, carved, ceremonial, timeless |
| 4 | **Dual typographic system** — functional clean; ceremonial for titles, lore, seals, artifacts |
| 5 | **Hierarchy through restraint** — clear priority without excessive variety or ornament |
| 6 | **Symbolic text separation** — glyphs as identity; readable labels for critical actions |
| 7 | **Mobile-first clarity** — short sessions, one-handed play, localization, accessibility |
| 8 | Gameplay HUD typography follows WS4 progressive minimal presence |
| 9 | Reward and store text remain ceremonial and honest — not casino register |
| 10 | Typography, tokens, and screen specs must inherit WS7 without parallel text dialects |

### Design Intent

Freeze workshop outcomes before type tokens, component text specs, and localization guides are authored.

---

## 26. Related Documents

### Upstream

- [Vision](../../00_Project/Vision.md)
- [WS0 — Design Philosophy](WS0_Design_Philosophy.md)
- [WS1 — Visual Identity & Artistic Direction](WS1_Visual_Identity_Artistic_Direction.md)
- [WS2 — Color Language](WS2_Color_Language.md)
- [WS3 — Environment Language](WS3_Environment_Language.md)
- [WS4 — UI Language](WS4_UI_Language.md)
- [WS5 — Motion Language](WS5_Motion_Language.md)
- [WS6 — Audio Language](WS6_Audio_Language.md)

### Downstream

- [WS7 — Typography Language](WS7_Typography_Language.md) — Typography authority
- [WS8 — Iconography Language](WS8_Iconography_Language.md) — Iconography authority
- [LLDL](LLDL.md) — Design language specification
- [Typography](../Typography.md) — Type scale and style guidance
- [Design_Tokens](../Design_Tokens.md) · [Components](../Components.md)
- [Accessibility](../Accessibility.md)
- `docs/03_Screens/*` — Per-screen specifications

### Governance

- [Decisions](../../00_Project/Decisions.md)
- [Roadmap](../../00_Project/Roadmap.md)

---

## Navigation

| ← Previous | Next → | Index |
|------------|--------|-------|
| [WS6 — Audio Language](WS6_Audio_Language.md) | [WS8 — Iconography Language](WS8_Iconography_Language.md) | [Documentation Home](../../README.md) · [LLDL](LLDL.md) |
