# WS9 — Accessibility Language

| Field | Value |
|-------|-------|
| **Project** | Labyrinth Legends |
| **Document Name** | WS9 — Accessibility Language |
| **Document ID** | LLDL-DOC-WS9-001 |
| **Series** | WS9 — Labyrinth Legends Design Language (LLDL) Accessibility Authority |
| **Version** | 1.0.0 |
| **Status** | Approved |
| **Owner** | Apoorv |
| **Prepared By** | ChatGPT (workshop) · Cursor (compiler) |
| **Last Updated** | 2026-06-30 |
| **Workshop** | WS9 — Accessibility Language |
| **Path** | `docs/02_Design_System/LLDL/WS9_Accessibility_Language.md` |
| **Dependencies** | [Vision](../../00_Project/Vision.md) · [WS0 — Design Philosophy](WS0_Design_Philosophy.md) · [WS1 — Visual Identity](WS1_Visual_Identity_Artistic_Direction.md) · [WS2 — Color Language](WS2_Color_Language.md) · [WS3 — Environment Language](WS3_Environment_Language.md) · [WS4 — UI Language](WS4_UI_Language.md) · [WS5 — Motion Language](WS5_Motion_Language.md) · [WS6 — Audio Language](WS6_Audio_Language.md) · [WS7 — Typography Language](WS7_Typography_Language.md) · [WS8 — Iconography Language](WS8_Iconography_Language.md) |
| **Related Documents** | [LLDL](../LLDL.md) · [Accessibility](../Accessibility.md) · `docs/03_Screens/*` |

## Navigation

| ← Previous | Next → | Index |
|------------|--------|-------|
| [WS8 — Iconography Language](WS8_Iconography_Language.md) | [WS10 — Design Tokens Language](WS10_Design_Tokens_Language.md) | [Documentation Home](../../README.md) · [LLDL](../LLDL.md) |

---

## Version History

| Version | Date | Author | Summary |
|---------|------|--------|---------|
| 1.0.0 | 2026-06-30 | ChatGPT / Cursor | WS9 — accessibility language authority for LLDL |

## Change Log

| Version | Change |
|---------|--------|
| 1.0.0 | Initial workshop record: accessibility as design quality, fairness through comprehension, multichannel communication, comfort, mobile-first, identity-preserving clarity, progressive assistance |

---

## Document Authority

**WS9 is the accessibility authority within the Labyrinth Legends Design Language (LLDL).**

| Conflict type | Authority |
|---------------|-----------|
| Product intent and fairness philosophy | [Vision](../../00_Project/Vision.md) wins |
| Design philosophy | [WS0 — Design Philosophy](WS0_Design_Philosophy.md) wins |
| Artistic identity | [WS1 — Visual Identity](WS1_Visual_Identity_Artistic_Direction.md) wins |
| Color meaning | [WS2 — Color Language](WS2_Color_Language.md) wins |
| Environmental language | [WS3 — Environment Language](WS3_Environment_Language.md) wins |
| UI philosophy | [WS4 — UI Language](WS4_UI_Language.md) wins |
| Motion philosophy | [WS5 — Motion Language](WS5_Motion_Language.md) wins |
| Audio philosophy | [WS6 — Audio Language](WS6_Audio_Language.md) wins |
| Typography philosophy | [WS7 — Typography Language](WS7_Typography_Language.md) wins |
| Iconography philosophy | [WS8 — Iconography Language](WS8_Iconography_Language.md) wins |
| Accessibility philosophy, comprehension, comfort, inclusivity | **WS9 wins** |
| Gameplay fairness and hazard rules | [GP4 Hazards & Failure](../../01_Game_Design/Gameplay/GP4_Hazards_Failure.md) · [GP7 Gameplay Rules](../../01_Game_Design/Gameplay/GP7_Gameplay_Rules.md) — WS9 does not override gameplay law |
| Technical settings, contrast values, platform implementation | [Accessibility](../Accessibility.md) · technical docs — must align with WS9; WS9 does not define implementation |

WS9 extends Vision and WS0–WS8. It synthesizes accessibility across all sensory and interaction channels. When accessibility comfort conflicts with spectacle in motion, audio, or reward presentation, WS9 prevails within the accessibility domain unless [Vision](../../00_Project/Vision.md) or gameplay fairness documents impose a stronger constraint — recorded in [Decisions](../../00_Project/Decisions.md) when ambiguous.

WS8 defines *how symbols communicate*. **WS9 defines how every player can perceive, understand, and comfortably engage** with the temple — fairness through comprehension, not through reduced challenge.

---

## Intended Audience

| Role | Use this document to… |
|------|------------------------|
| UI/UX Designers | Author inclusive interfaces within LLDL identity |
| Gameplay Designers | Scope feedback and assistance without solving puzzles |
| Visual & Audio Designers | Balance spectacle with comfort and multichannel clarity |
| Writers & Tutorial Designers | Author onboarding that teaches without overwhelming |
| Localization Leads | Plan language and layout inclusivity |
| Settings & Systems Designers | Frame player controls philosophy without prescribing menus |
| QA & Review Leads | Apply design-level accessibility criteria |
| Screen Spec Authors | Extend WS9 into `docs/03_Screens/*` without redefining philosophy |
| Implementation Agents | Reject directions that violate WS9 locked decisions or anti-patterns |

---

## Table of Contents

1. [Purpose of the Accessibility Language](#1-purpose-of-the-accessibility-language)
2. [Accessibility Philosophy](#2-accessibility-philosophy)
3. [Accessibility as Design Quality](#3-accessibility-as-design-quality)
4. [Fairness Through Comprehension](#4-fairness-through-comprehension)
5. [Multichannel Communication](#5-multichannel-communication)
6. [Visual Accessibility](#6-visual-accessibility)
7. [Color Accessibility](#7-color-accessibility)
8. [Typography Accessibility](#8-typography-accessibility)
9. [Iconography Accessibility](#9-iconography-accessibility)
10. [Motion Accessibility](#10-motion-accessibility)
11. [Audio Accessibility](#11-audio-accessibility)
12. [UI Accessibility](#12-ui-accessibility)
13. [Gameplay Readability](#13-gameplay-readability)
14. [Touch & Mobile Usability](#14-touch--mobile-usability)
15. [Onboarding Accessibility](#15-onboarding-accessibility)
16. [Feedback Accessibility](#16-feedback-accessibility)
17. [Puzzle Assistance Philosophy](#17-puzzle-assistance-philosophy)
18. [Settings Philosophy](#18-settings-philosophy)
19. [Comfort & Sensory Load](#19-comfort--sensory-load)
20. [Localization & Language Accessibility](#20-localization--language-accessibility)
21. [Accessibility Consistency Rules](#21-accessibility-consistency-rules)
22. [Accessibility Anti-Patterns](#22-accessibility-anti-patterns)
23. [Design Decision Framework](#23-design-decision-framework)
24. [Summary](#24-summary)
25. [Workshop Conclusions](#25-workshop-conclusions)
26. [Related Documents](#26-related-documents)

---

## 1. Purpose of the Accessibility Language

Accessibility is how Labyrinth Legends **honors every explorer** — ensuring failure comes from decisions, not from unreadable state, uncomfortable sensation, or inaccessible information. Accessibility treated as a late compliance pass produces generic overlays that break identity. Accessibility treated as core design produces a clearer, more premium game for everyone.

WS9 answers:

> **How should Labyrinth Legends be fair, comprehensible, comfortable, and inclusive while preserving ancient-mystery identity?**

Without accessibility authority, teams default to color-only hazard cues, glyph-only controls, motion-heavy feedback, audio-dependent teaching, and clinical high-contrast modes that disconnect from LLDL. Fairness erodes. Player trust erodes. Premium craft erodes.

WS9 establishes the **permanent accessibility philosophy** across visual, color, typographic, iconographic, motion, audio, UI, gameplay, touch, onboarding, and assistance systems. It does not define platform APIs, exact thresholds, settings layouts, or certification checklists.

### What WS9 Governs

- Accessibility as integral design quality
- Fairness through comprehension and multichannel communication
- Comfort and sensory load discipline
- Mobile-first touch and readability
- Identity-preserving clarity improvements
- Progressive assistance boundaries
- Anti-patterns and approval framework

### What WS9 Does Not Govern

- Exact contrast ratios, font sizes, or touch target values
- Platform-specific implementation or QA tooling
- Gameplay rule precedence (see GP7)
- Per-screen accessibility requirement matrices

### Design Intent

Give every discipline a shared accessibility vocabulary before settings specs, technical docs, and screen requirements are authored.

---

## 2. Accessibility Philosophy

Accessibility in Labyrinth Legends is **design quality** — not a separate product mode.

### Core Accessibility Temperament

The temple must be **readable, fair, comfortable, and dignified** — ancient in identity, never hostile in comprehension. Inclusivity strengthens premium craft; it does not dilute it into generic utility UI.

### Accessibility Pillars

| Pillar | Meaning |
|--------|---------|
| **Quality** | Clear games are better games for everyone |
| **Fairness** | Fail on decisions, not perception gaps |
| **Multichannel** | Critical state never carried by one sense alone |
| **Comfort** | Spectacle yields to sustained play comfort |
| **Mobile** | Small screens, touch, variable light, short sessions |
| **Identity** | Clarity preserves LLDL — not clinical detachment |
| **Assistance** | Clarify state — do not solve puzzles |

### Locked Workshop Decisions

| # | Decision |
|---|----------|
| 1 | **Accessibility is design quality** — not a separate mode of quality |
| 2 | **Fairness through comprehension** — players fail on decisions, not perception |
| 3 | **Multichannel communication** — critical information never single-channel |
| 4 | **Comfort before spectacle** — motion, effects, audio, rewards remain controlled |
| 5 | **Mobile-first usability** — small screens, touch, short sessions, variable lighting, one-handed contexts |
| 6 | **Identity-preserving accessibility** — clarity without generic clinical disconnect from LLDL |
| 7 | **Progressive assistance** — support understanding without undermining mastery |

### Alignment

WS9 inherits player-first intent from [WS0](WS0_Design_Philosophy.md) and synthesizes channel-specific accessibility principles already stated in WS2–WS8 into one coherent authority.

### Design Intent

Freeze accessibility as a first-class design pillar before implementation specs fragment it.

---

## 3. Accessibility as Design Quality

**Locked workshop decision:** Accessibility is **not a separate mode of quality**. A clear, readable, comfortable game is a better game for everyone.

### Quality Integration

Accessibility improvements are **premium improvements**:

- Clearer hierarchy improves scan speed for all players
- Multichannel feedback reduces confusion for all players
- Comfortable motion and audio extend session length for all players
- Readable typography and icons reduce support burden for all players

### Not a Bolt-On

Reject the pattern of:

- Designing for spectacle first, then adding accessibility patches
- Treating high-contrast or reduced-motion as shameful minimum modes
- Assuming accessibility equals ugliness or identity loss

### Design Intent

Position accessibility as craft excellence aligned with Vision premium goals.

---

## 4. Fairness Through Comprehension

**Locked workshop decision:** Players should **fail because of decisions**, not because they could not perceive, read, hear, or understand game state.

### Fairness Principles

- Hazard state must be **perceivable before commitment** where GP4 requires
- Validation feedback must be **understandable** without audio-only or color-only dependence
- Mechanism state changes must be **legible** through multichannel cues
- Failure must teach — not punish obscurity

### Fairness vs Difficulty

Accessibility does **not** mean easier puzzles. It means **honest puzzles** — the player always knows what the world is asking.

### Alignment

Fairness through comprehension aligns with [GP4 Hazards & Failure](../../01_Game_Design/Gameplay/GP4_Hazards_Failure.md) and [GP6 Gameplay Feedback](../../01_Game_Design/Gameplay/GP6_Gameplay_Feedback.md) — WS9 governs presentation inclusivity; gameplay docs govern rules.

### Design Intent

Protect Draw Your Fate integrity while eliminating perception-based unfairness.

---

## 5. Multichannel Communication

**Locked workshop decision:** Critical information must **never rely on only one channel**. Color, shape, motion, sound, text, iconography, value, and spatial placement reinforce each other.

### Channel Reinforcement Model

| Information type | Minimum channels (conceptual) |
|------------------|-------------------------------|
| **Hazard warning** | Shape/icon + color role + spatial placement; motion optional |
| **Success / failure** | Visual state + sound or haptic; text when teaching |
| **Mechanism state** | Environmental read + icon or motion; energy highlight secondary |
| **Primary action** | Label + button shape + warm authority color per WS2 |
| **Reward** | Visual seal + brief audio; text name on summary |

### Single-Channel Prohibitions

Critical meaning must not depend on:

- Color alone
- Sound alone
- Motion alone
- Glyph alone
- Particle flash alone

### Design Intent

Make comprehension resilient across sensory and situational variation.

---

## 6. Visual Accessibility

Visual accessibility ensures **readable world and UI state** across lighting conditions and vision differences.

### Visual Principles

- Play surface and focal structure remain legible per [WS3](WS3_Environment_Language.md)
- HUD and UI subordinate to labyrinth without obscuring critical tiles
- Sufficient figure-ground separation between interactive and decorative elements
- Effects and particles do not permanently obscure traversal readability
- Busy visual noise is a accessibility failure — not only an art failure

### Variable Lighting

Mobile play occurs in bright sun and dark rooms. Visual design must tolerate **contrast variation** without losing state communication — multichannel reinforcement assists.

### Design Intent

Keep the ruin readable as a puzzle field, not only as a screenshot.

---

## 7. Color Accessibility

Color supports meaning per [WS2](WS2_Color_Language.md) — it must **not sole-carry** critical meaning.

### Color Accessibility Principles

- Semantic roles (authority, energy, danger, neutral) remain **distinct in value and shape pairing**
- Hazard, reward, and collectible families visually differentiable without hue alone
- Text on surfaces maintains readable relationship per WS7 — not gold-on-gold ceremony
- Energy highlight discipline prevents strobe-like color pulsing on HUD

### Identity Preservation

Accessibility does not mean abandoning WS2 palette — it means **using roles with shape, icon, and label backup**.

### Design Intent

Preserve ancient color identity while eliminating color-only traps.

---

## 8. Typography Accessibility

Typography accessibility inherits [WS7](WS7_Typography_Language.md) readability-first philosophy and extends it inclusively.

### Typography Principles

- Functional text remains legible at mobile scale
- Critical instructions not buried in ceremonial type alone
- Text expansion tolerance for localization
- Player text size preferences respected in implementation — philosophy requires essential content to remain usable when scaled
- Plain language available where ceremonial copy risks ambiguity

### Cognitive Load

Short lines, clear breaks, and minimal simultaneous text blocks reduce load during puzzle play.

### Design Intent

Ensure written language includes, not excludes.

---

## 9. Iconography Accessibility

Iconography accessibility inherits [WS8](WS8_Iconography_Language.md) meaning-first and clarity guardrail philosophy.

### Iconography Principles

- Critical controls never glyph-only
- Hazard icons distinct from collectibles and rewards by **shape family**, not color alone
- HUD icons instantly understandable after teaching
- Decorative glyph density kept off functional controls
- Icon state (locked, active, complete) distinguishable without animation alone

### Design Intent

Make symbolic richness inclusive, not cryptic.

---

## 10. Motion Accessibility

Motion accessibility inherits [WS5](WS5_Motion_Language.md) calm temperament and extends comfort requirements.

### Motion Principles

- State changes comprehensible without requiring motion to understand
- Reduced motion preference honored — essential feedback available through static or simple cross-fade alternatives
- No seizure-risk strobing, rapid full-screen flash, or aggressive camera shake
- Reward and feedback motion restrained per WS5 — comfort before spectacle
- Camera stability preserves orientation per WS5 camera philosophy

### Design Intent

Keep movement instructive and optional for comprehension, not mandatory for survival.

---

## 11. Audio Accessibility

Audio accessibility inherits [WS6](WS6_Audio_Language.md) supportive-not-dominant philosophy.

### Audio Principles

- Critical feedback available without sound
- Separate control philosophy for music, ambience, SFX, and UI sound in implementation — player can reduce channels independently
- No time-critical information audio-only
- Punitive or jump-scare audio avoided on hazards
- Silence and calm pacing respected as inclusive design

### Design Intent

Ensure sound deepens experience without gating comprehension.

---

## 12. UI Accessibility

UI accessibility inherits [WS4](WS4_UI_Language.md) progressive HUD, information density, and physical clarity.

### UI Principles

- One primary purpose per screen — scan path obvious
- Progressive disclosure reduces cognitive overload
- Touch targets comfortable for mobile — implementation defines values; philosophy requires generous interactive affordance
- Modals and confirmations state consequences in readable text
- Store and monetization UI honest and legible — no hidden terms in ornamental inscription styling

### Gameplay vs Meta

Gameplay UI near-minimal; meta-game may be richer but must remain scannable.

### Design Intent

Make temple instrument UI inclusive without becoming generic app UI.

---

## 13. Gameplay Readability

Gameplay readability is the **intersection of environment, HUD, feedback, and puzzle state** during Draw Your Fate.

### Readability Principles

- Study phase: maze and mechanisms readable; minimal text and HUD noise
- Plan phase: path expression visible; validation multichannel
- Commit phase: consequence clear before irreversible action
- Execute phase: sequential readable feedback; no overlapping spectacle
- Evaluate phase: outcome explained; then release

### Environmental Obligation

Traversal readability is an environmental and accessibility obligation per WS3 — not optional polish.

### Design Intent

Align accessibility with the cognitive loop, not against it.

---

## 14. Touch & Mobile Usability

**Locked workshop decision:** Accessibility must respect **small screens, touch input, short sessions, variable lighting, and one-handed play**.

### Touch Principles

- Primary actions reachable in common one-handed grips where platform layout allows
- Draw path interaction tolerant of finger scale — precision from design, not tiny hit regions
- No reflex-only interactions incompatible with thoughtful puzzle play
- Session length respected — screens communicate purpose quickly
- Safe areas — critical text and controls not trapped in decorative frame dead zones

### Mobile Context

Players pause, resume, glance, and play in transit. UI must support **interrupted comprehension** — returning player reorients in seconds.

### Design Intent

Design for real mobile life, not ideal lab conditions.

---

## 15. Onboarding Accessibility

Onboarding teaches **how to read the temple** — not how to decode inaccessible UI.

### Onboarding Principles

- Introduce symbols and glyphs with readable labels first
- Teach multichannel feedback patterns early
- Pace teaching — one concept per beat
- Skippable for returning players where appropriate
- No mandatory text walls before first meaningful interaction

### Onboarding Must Not

- Teach inscription-only control habits
- Overwhelm with lore before core loop comprehension
- Lock progress behind unskippable cinematic density

### Design Intent

Onboarding builds literacy, not dependency on assistance.

---

## 16. Feedback Accessibility

Feedback accessibility ensures **GP6 learning** reaches every player through inclusive presentation.

### Feedback Principles

- Validation, hazard, collection, and completion each have distinct multichannel signatures
- Error feedback instructive — not punitive sensation
- Repeat exposure may soften intensity — comprehension remains
- Feedback never the only channel that reveals puzzle solution beyond approved teaching scope

### Alignment

Extends [GP6 Gameplay Feedback](../../01_Game_Design/Gameplay/GP6_Gameplay_Feedback.md) inclusively — does not redefine feedback rules.

### Design Intent

Teach once, inclusively, then quiet.

---

## 17. Puzzle Assistance Philosophy

**Locked workshop decision:** Assistance supports **understanding without solving** the puzzle for the player.

### Assistance Boundaries

**Permitted assistance:**

- Clarify current objective in plain language
- Highlight unreadable UI affordance
- Repeat teaching feedback after failure
- Confirm mechanism state in multichannel form
- Offer optional reminder of control — not solution

**Prohibited assistance:**

- Auto-complete path
- Reveal optimal route without player request tier approved in gameplay docs
- Remove hazard fairness warnings
- Solve symbol puzzles through text substitution

### Mastery Preservation

Accessibility clarifies the **question** — never the **answer** unless explicit approved assist tier exists in gameplay design and Human records decision.

### Design Intent

Protect puzzle integrity while eliminating opaque state.

---

## 18. Settings Philosophy

Settings exist to **restore comfort and clarity** — not to hide accessibility as shameful remediation.

### Settings Principles (Philosophical)

- Player controls for motion reduction, audio channels, and text scale where platform supports
- Settings language dignified — "Comfort," "Clarity," "Feedback" — not buried jargon
- Changes preview effect where possible — player understands consequence
- Defaults favor WS9 comfort and clarity baseline; adjustments personalize
- Settings accessible from meta-game without labyrinth penalty

### Settings Must Not

- Bury critical comfort controls five menus deep
- Treat reduced motion or muted audio as broken experience messaging
- Reset without confirmation when player relies on accommodations

### Design Intent

Frame player control as premium respect — implementation docs define menus later.

---

## 19. Comfort & Sensory Load

**Locked workshop decision:** **Comfort before spectacle** — motion, effects, flashes, camera movement, audio, and reward presentation remain controlled.

### Sensory Load Principles

- Cumulative intensity matters across a session — not only single moments
- Reward celebration brief relative to industry norms per WS5 and WS6
- Ambient particle and glow discipline per WS2 and WS4
- No sustained pulsing on idle UI
- Player can reduce load without losing comprehension

### Sensory Vulnerability

Consider photosensitivity, migraine triggers, auditory overwhelm, and motion discomfort as **design constraints**, not edge cases.

### Design Intent

Make calm tension inclusive — not only aesthetic.

---

## 20. Localization & Language Accessibility

Language accessibility ensures **global comprehension** without breaking LLDL identity.

### Localization Principles

- Layout tolerates text expansion
- Critical strings translatable — no meaning locked in untranslatable glyphs
- Cultural neutrality in hazard and instruction icon metaphors where possible
- Plain-language subtitles or summaries where ceremonial copy risks ambiguity
- Numerals, units, and currency readable per locale conventions

### Design Intent

Ancient identity travels globally through clarity, not untranslatable obscurity.

---

## 21. Accessibility Consistency Rules

Consistency makes accessibility **predictable** across biomes, screens, and updates.

### Consistency Rules

1. **One multichannel grammar** — hazard, success, lock, energy roles stable
2. **One fairness ethic** — comprehension before difficulty tricks
3. **One comfort baseline** — calm spectacle discipline
4. **One assistance boundary** — clarify state, not solve puzzle
5. **One mobile usability ethic** — touch, glance, session respect
6. **One identity rule** — clarity improvements stay temple-authentic
7. **One settings dignity** — comfort controls are first-class

### Cross-Discipline Handoff

| Source | Consumer |
|--------|----------|
| WS9 philosophy | [Accessibility](../Accessibility.md) implementation guidance |
| WS9 philosophy | WS2–WS8 channel reviews |
| WS9 philosophy | `docs/03_Screens/*` inclusive presentation |
| WS9 philosophy | Onboarding and tutorial specs |
| WS9 philosophy | Gameplay feedback presentation |

Downstream documents **implement** WS9 — they do not fork parallel accessibility dialects.

### Version Changes

Accessibility exceptions that reduce fairness or comprehension require [Decisions](../../00_Project/Decisions.md) and Human approval.

### Design Intent

Prevent inconsistent inclusive design as teams scale.

---

## 22. Accessibility Anti-Patterns

The following are **rejected** unless explicit Human-approved exception exists.

### Comprehension Anti-Patterns

- Color-only hazard or success communication
- Glyph-only primary actions or purchases
- Audio-only critical warnings
- Motion-only state that cannot be read when still
- Puzzle solution revealed through inaccessible channel only

### Comfort Anti-Patterns

- Strobe, rapid flash, or aggressive shake on routine feedback
- Casino reward sensory overload
- Forced unskippable high-intensity celebration
- Sustained pulsing HUD unrelated to phase

### Identity Anti-Patterns

- Generic clinical UI mode that breaks LLDL entirely as default "fix"
- Accessibility improvements that remove all ancient identity without replacement craft
- Plain white screens with system defaults as "accessible theme"

### Assistance Anti-Patterns

- Auto-solve disguised as accessibility
- Hint systems that remove mastery without player consent tier
- Punitive failure feedback for players using accommodations

### Mobile Anti-Patterns

- Tiny touch regions on primary draw and confirm actions
- Critical text in unreachable corners
- Sessions that require perfect lighting to parse state

### Design Intent

Give reviewers explicit rejection language.

---

## 23. Design Decision Framework

Use this framework when evaluating accessibility impact of design proposals.

### Evaluation Questions

1. **Quality** — Does this make the game clearer for everyone?
2. **Fairness** — Can players fail only on decisions, not perception?
3. **Multichannel** — Is critical meaning backed by more than one channel?
4. **Visual** — Is play surface and UI state readable in variable conditions?
5. **Color** — Distinct without hue-only dependence?
6. **Typography** — Legible, scalable, plain backup where needed?
7. **Iconography** — Not glyph-only on critical actions?
8. **Motion** — Comprehensible when reduced? Comfortable?
9. **Audio** — Comprehensible when muted?
10. **UI** — Scannable, progressive, touch-respecting?
11. **Gameplay** — Readable across Draw Your Fate phases?
12. **Assistance** — Clarifies without solving?
13. **Comfort** — Spectacle controlled?
14. **Identity** — Still temple-authentic?
15. **Consistency** — Matches WS9 or invents exception?

### Outcomes

- **Approve** — proceed to screen, component, or technical spec
- **Revise** — add channel backup, reduce sensory load, or clarify assistance scope
- **Reject** — cite locked decision violation or anti-pattern
- **Escalate** — Human approval for fairness or assistance boundary exception

### Design Intent

Make accessibility review repeatable across design, gameplay, and product agents.

---

## 24. Summary

Labyrinth Legends accessibility is **premium clarity** — fairness through comprehension, multichannel communication, mobile comfort, identity-preserving inclusivity, and assistance that respects mastery.

**WS9 establishes that:**

- Accessibility is design quality — not a bolt-on compliance layer
- Players fail on decisions, not on unreadable or unperceivable state
- Critical information never relies on a single sensory channel
- Comfort precedes spectacle across motion, audio, and reward
- Mobile touch, session, and lighting contexts shape all accessibility choices
- Clarity improvements preserve ancient-mystery identity — not generic clinical UI
- Assistance clarifies state and feedback — never solves puzzles by default
- WS2–WS8 channel principles unify under one accessibility authority

Downstream [Accessibility](../Accessibility.md), screen specs, settings, and onboarding docs implement WS9 — they do not redefine it.

---

## 25. Workshop Conclusions

WS9 — Accessibility Language Workshop records the following locked conclusions:

| # | Conclusion |
|---|------------|
| 1 | WS9 is the accessibility authority within LLDL, subordinate to Vision and WS0–WS8; gameplay fairness docs constrain when stronger |
| 2 | **Accessibility is design quality** — better for everyone, not separate mode |
| 3 | **Fairness through comprehension** — fail on decisions, not perception |
| 4 | **Multichannel communication** — never single-channel critical meaning |
| 5 | **Comfort before spectacle** — controlled motion, audio, effects, rewards |
| 6 | **Mobile-first usability** — touch, small screens, sessions, lighting, one-handed play |
| 7 | **Identity-preserving accessibility** — clarity without generic LLDL disconnect |
| 8 | **Progressive assistance** — clarify understanding; do not undermine mastery |
| 9 | WS9 synthesizes WS2–WS8 channel accessibility into one coherent authority |
| 10 | Accessibility, settings, and screen docs must inherit WS9 without parallel inclusivity dialects |

### Design Intent

Freeze workshop outcomes before technical accessibility guides and settings specifications are authored.

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
- [WS7 — Typography Language](WS7_Typography_Language.md)
- [WS8 — Iconography Language](WS8_Iconography_Language.md)

### Downstream

- [WS9 — Accessibility Language](WS9_Accessibility_Language.md) — Accessibility authority
- [WS10 — Design Tokens Language](WS10_Design_Tokens_Language.md) — Design tokens authority
- [LLDL](../LLDL.md) — Design language specification
- [Accessibility](../Accessibility.md) — Technical accessibility guidance
- [Design_Tokens](../Design_Tokens.md) · [Components](../Components.md)
- `docs/03_Screens/*` — Per-screen specifications

### Gameplay alignment

- [Gameplay](../../01_Game_Design/Gameplay.md) · [GP4 Hazards & Failure](../../01_Game_Design/Gameplay/GP4_Hazards_Failure.md) · [GP6 Gameplay Feedback](../../01_Game_Design/Gameplay/GP6_Gameplay_Feedback.md) · [GP7 Gameplay Rules](../../01_Game_Design/Gameplay/GP7_Gameplay_Rules.md)

### Governance

- [Decisions](../../00_Project/Decisions.md)
- [Roadmap](../../00_Project/Roadmap.md)

---

## Navigation

| ← Previous | Next → | Index |
|------------|--------|-------|
| [WS8 — Iconography Language](WS8_Iconography_Language.md) | [WS10 — Design Tokens Language](WS10_Design_Tokens_Language.md) | [Documentation Home](../../README.md) · [LLDL](../LLDL.md) |
