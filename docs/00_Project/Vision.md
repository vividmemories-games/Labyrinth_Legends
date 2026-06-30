# Vision

| Field | Value |
|-------|-------|
| **Project** | Labyrinth Legends |
| **Document Name** | Vision |
| **Document ID** | LLDS-DOC-00-001 |
| **Version** | 2.1.0 |
| **Status** | Approved — Locked |
| **Owner** | Apoorv |
| **Prepared By** | ChatGPT (specification) · Cursor (compiler) |
| **Last Updated** | 2026-06-28 |
| **Dependencies** | None — root design document |
| **Related Documents** | [Game Loop](../01_Game_Design/Game_Loop.md) · [WS1–WS5](../01_Game_Design/Game_Loop/README.md) · [Gameplay](../01_Game_Design/Gameplay.md) · [LLDL](../02_Design_System/LLDL.md) · [Game Bible](../01_Game_Design/Game_Bible.md) · [Decisions](Decisions.md) · [Roadmap](Roadmap.md) |

## Navigation

| ← Previous | Next → | Index |
|------------|--------|-------|
| — | [Game Loop](../01_Game_Design/Game_Loop.md) · [WS1–WS5](../01_Game_Design/Game_Loop/README.md) | [LLDS Home](../README.md) |

---

## Version History

| Version | Date | Author | Summary |
|---------|------|--------|---------|
| 1.0.0 | 2026-06-28 | Cursor | Phase 1 scaffold — metadata and placeholders |
| 2.0.0 | 2026-06-28 | ChatGPT / Cursor | Full vision specification compiled |
| 2.1.0 | 2026-06-30 | Apoorv / ChatGPT / Codex | Approved and locked after repository documentation review |

## Change Log

| Version | Change |
|---------|--------|
| 2.1.0 | Marked Vision as approved and locked; no design content changed |
| 2.0.0 | Full vision specification; owner Apoorv; Draft — Pending Review; Document Authority; writing order Vision → Game Loop → Gameplay → LLDL → Game Bible |
| 1.0.0 | Document structure and navigation scaffold |

---

## Document Authority

**Vision is the highest authority for product intent** in the Labyrinth Legends Documentation System.

| Conflict type | Authority |
|---------------|-----------|
| Product intent (why, pillars, audience, non-goals) | **Vision wins** |
| Visual and UX execution | [LLDL](../02_Design_System/LLDL.md) wins |
| Mechanical rules | [Gameplay](../01_Game_Design/Gameplay.md) wins (must align with Vision) |
| Session structure | [Game Loop](../01_Game_Design/Game_Loop.md) wins (must align with Vision) |
| Narrative and world detail | [Game Bible](../01_Game_Design/Game_Bible.md) wins (must align with Vision) |

When any downstream document conflicts with Vision on **product intent**, Vision overrides until [Decisions](Decisions.md) records an explicit, Human-approved exception.

AI agents must not resolve product-intent conflicts by inventing new design. Escalate to Apoorv (Owner).

---

## Document Purpose

This document establishes **why Labyrinth Legends exists** and **what it must become**. It is the highest-authority product vision in the Labyrinth Legends Documentation System (LLDS). Every design, art, audio, engineering, and production decision must trace back to a principle defined here.

Vision explains *why*. It does not define *how*. Mechanics, flows, tokens, and architecture belong in downstream documents.

## Intended Audience

| Role | Use this document to… |
|------|------------------------|
| Game Designers | Validate features against pillars and non-goals |
| Gameplay Programmers | Understand intent before implementing rules |
| Flutter Developers | Align implementation priorities with product principles |
| Level Designers | Frame puzzles within player fantasy and discovery philosophy |
| UI/UX Designers | Express vision through [LLDL](../02_Design_System/LLDL.md) without contradicting tone |
| Artists | Ground visual direction in world and theme |
| Audio Designers | Support atmosphere and emotional journey |
| Producers | Scope work against success definition and non-goals |
| QA Engineers | Evaluate whether builds honor non-negotiable principles |
| AI Coding Agents | Refuse scope that violates pillars or invents unauthorized systems |

## How to Use This Document

1. **Before proposing a feature** — run it through [§13 Decision Framework](#13-decision-framework).
2. **When documents conflict** — apply [Document Authority](#document-authority). Vision overrides all product-intent conflicts.
3. **When writing downstream specs** — link back to the relevant pillar or principle rather than duplicating prose.
4. **When rejecting scope** — cite [§12 Non-Goals](#12-non-goals) or [§11 Non-Negotiable Principles](#11-non-negotiable-principles).

## Table of Contents

1. [Executive Summary](#1-executive-summary)
2. [Vision Statement](#2-vision-statement)
3. [Why Labyrinth Legends Exists](#3-why-labyrinth-legends-exists)
4. [Player Experience](#4-player-experience)
5. [Design Pillars](#5-design-pillars)
6. [Product Principles](#6-product-principles)
7. [World & Theme](#7-world--theme)
8. [Target Audience](#8-target-audience)
9. [Inspirations](#9-inspirations)
10. [Success Definition](#10-success-definition)
11. [Non-Negotiable Principles](#11-non-negotiable-principles)
12. [Non-Goals](#12-non-goals)
13. [Decision Framework](#13-decision-framework)
14. [Glossary](#14-glossary)
15. [Related Documents](#15-related-documents)
16. [Appendices](#16-appendices)

---

## 1. Executive Summary

### Project Overview

**Labyrinth Legends** is a premium mobile puzzle-adventure for iOS and Android. Players enter forgotten temple complexes, study unfamiliar layouts, commit to a plan, and watch consequences unfold. Success comes from foresight and curiosity—not reflexes, grind, or power accumulation.

The project is inspired by the *spirit* of classic pen-and-paper labyrinth games—mapping the unknown, reading incomplete information, feeling clever when a route works—but it is **not a remake**. Labyrinth Legends is a single-player environmental puzzle experience built for modern mobile craft standards.

### Vision at a Glance

| Dimension | Direction |
|-----------|-----------|
| Genre | Puzzle-adventure |
| Platform | iOS, Android |
| Session model | Thoughtful, completable sessions |
| Core skill | Planning and discovery |
| Tone | Calm tension, ancient mystery, premium craft |
| Visual identity | Ancient civilization × mystical technology |
| Progression philosophy | Knowledge and mastery, not raw power |

### Executive Design Statement

Labyrinth Legends treats the labyrinth as a **place to understand**, not a treadmill to exhaust. The player is an explorer of ruins where forgotten systems still respond to careful thought. Every chamber should reward observation. Every success should feel earned through intelligence.

The experience must remain **timeless**: readable interfaces, deliberate pacing, and design that ages well rather than chasing mobile trends.

### Design Intent

Establish a single, authoritative statement of what the project is. All teams should be able to read this section alone and align on genre, tone, and skill emphasis before opening any other document.

---

## 2. Vision Statement

### Core Vision

**Uncover forgotten temples by thinking ahead.**

The player enters spaces they do not fully understand, forms a plan under uncertainty, commits, and learns from the outcome. The fantasy is archaeological intelligence—reading a ruin, not overpowering it.

### Mission Statement

Deliver a **premium puzzle-adventure** where planning is the primary skill, discovery is the primary reward, and respect for the player's time is non-negotiable.

### Long-Term Aspiration

Labyrinth Legends should be recognized as a **reference-quality mobile puzzle-adventure**: a game players recommend for how it *feels* to think through a problem, not for how aggressively it monetizes or how long it detains them.

If the project succeeds at scale, it succeeds because craftsmanship, clarity, and curiosity compound across worlds—not because feature count or psychological pressure escalates over time.

### Design Intent

Provide durable language for pitches, reviews, and scope debates. "Thinking ahead" and "premium puzzle-adventure" are the phrases this project defends under pressure.

---

## 3. Why Labyrinth Legends Exists

### Current Puzzle Game Landscape

Mobile puzzle games often fall into predictable patterns:

| Pattern | Limitation |
|---------|------------|
| Reflex-first action disguised as puzzles | Excludes players who want to think |
| Infinite level streams with shallow variation | Rewards repetition, not understanding |
| Opaque difficulty spikes | Punishes curiosity |
| Aggressive retention mechanics | Signals disrespect for player time |
| Visual noise and trend-chasing UI | Ages poorly; undermines readability |

Many titles optimize for session length and monetization pressure rather than for the satisfaction of solving something *properly*.

### Design Opportunity

There is room for a **calm, premium, single-player** puzzle-adventure that:

- Makes **planning** the central act of play
- Treats **partial information** as a source of tension, not frustration
- Rewards **mastery** through understanding, not stat inflation
- Presents **ancient places** with environmental weight and craft
- Ships with **intentional pacing** suitable for adults and thoughtful younger players

Labyrinth Legends occupies this space deliberately.

### Philosophy

| Principle | Meaning |
|-----------|---------|
| Knowledge is progression | Learning the space matters as much as clearing it |
| Planning is the primary skill | Commitment before execution is the core tension |
| Curiosity drives exploration | Hidden structure should invite investigation |
| Clever, not powerful | The player outthinks the ruin; they do not dominate it |
| Craft over feature count | Fewer systems, executed well, beat sprawling checklists |
| Timeless over trend-driven | Decisions should still read well years after ship |

### Problems This Project Intends to Solve

| Problem | Response |
|---------|----------|
| Puzzles that punish thinking slowly | Calm tension; no reflex gate on core loop |
| Games that confuse difficulty with opacity | Readability and fairness as first-class principles |
| Adventures that feel disposable | Premium atmosphere and intentional world tone |
| Grind disguised as progression | Mastery and discovery over power curves |
| Clones of classic games without evolution | Honor discovery from labyrinth tradition; modernize everything else |

See `docs/assets/references/Labyrinth_vs_Labyrinth_Legends_Comparison.md` for positioning against the original Labyrinth game.

### Design Intent

Anchor the project in a clear market and philosophical stance. Teams should understand not only what we build, but what industry habits we refuse to repeat.

---

## 4. Player Experience

### Player Fantasy

The player is an **explorer of forgotten ruins**—not a soldier, not a collector of arbitrary points, not a live-service avatar. They read environments, infer structure, and commit to routes through spaces that outlast their civilization.

Competence feels **intellectual**: "I saw what the room was asking."

### Emotional Journey

| Phase | Emotion | Why |
|-------|---------|-----|
| Arrival | Curiosity, slight unease | Unknown layout, ancient atmosphere |
| Observation | Focus, pattern-seeking | Partial information demands attention |
| Planning | Calm tension | Commitment approaches |
| Execution | Anticipation | Consequences of the plan unfold |
| Resolution | Satisfaction or instructive failure | Outcome teaches something |
| Return | Confidence growth | Knowledge carries forward |

The arc avoids frantic panic. It favors **deliberate engagement**.

### First Minute

The player should immediately understand three things:

1. They are inside a **ruin worth studying**
2. Their job is to **think before acting**
3. The presentation quality signals **premium craft**

No tutorial wall of text. Atmosphere and clarity do the teaching.

### First Session

The first session establishes trust:

- A problem the player can solve with observation
- A moment where commitment matters
- A reward that feels like **progress in understanding**, not arbitrary scoring
- A clean stopping point that respects time

The player should leave thinking: "I want to see the next chamber," not "I am already behind."

### First World

The opening world introduces the contract between player and game:

| Teaching goal | Experience goal |
|---------------|-----------------|
| Observation pays off | Layouts reward looking before planning |
| Commitment has weight | Plans matter; outcomes are legible |
| Ruins have logic | Spaces feel designed, not random |
| Mystery is inviting | Hidden structure teases, not taunts |

World tone is **accessible mystery**—challenging, not hostile.

### Endgame Experience

At mastery depth, the player should feel like a **seasoned ruin-reader**:

- Complex spaces read faster because patterns are learned
- Optional perfection paths exist for those who want depth
- Discovery still offers surprises—not because rules changed, but because combinations deepen
- The tone remains calm; difficulty scales through **composition**, not chaos

Endgame is **elegant problems**, not inflated numbers.

### Design Intent

Describe the felt experience across time horizons without prescribing UI or mechanical implementation. Level, audio, and UX teams align to these beats.

---

## 5. Design Pillars

Each pillar is mandatory. Features that undermine a pillar do not ship without explicit Human approval recorded in [Decisions](Decisions.md).

---

### Pillar 1 — Planning Over Reflexes

**Description**

The defining act of play is forming a plan before consequences unfold. Success rewards foresight; failure teaches the plan, not the player's reaction speed.

**Rationale**

Reflex puzzles exclude a large thoughtful audience and conflict with mobile play contexts. Planning creates shareable "aha" moments and supports the explorer fantasy.

**Design implications**

- Core interaction emphasizes study → commit → outcome
- Difficulty emerges from spatial reasoning, not twitch demands
- Failure should be readable: the player understands *why* the plan failed
- Assist systems must not replace thinking (see [§6 Challenge Philosophy](#challenge-philosophy))

**Examples**

- A chamber where the correct route is visible only after reading multiple cues
- A moment of anticipation as a committed plan executes
- Optional efficiency goals for players who want deeper mastery

**Anti-patterns**

- Real-time dodge requirements in core progression
- Punishing slow deliberation with timers on standard puzzles
- Replacing planning with repeated trial-and-error noise

---

### Pillar 2 — Discovery Over Repetition

**Description**

The unknown is a feature. Spaces should reveal themselves through exploration and attention—not through grinding identical content.

**Rationale**

Classic labyrinth play derived tension from incomplete maps. Labyrinth Legends modernizes that feeling: curiosity should remain central even as presentation evolves.

**Design implications**

- Hidden structure rewards investigation
- Variation should change *what you must understand*, not only cosmetic dressing
- Repeat play should teach something new about the space or optional goals
- Revelation moments must feel earned

**Examples**

- A passage that only makes sense after noticing environmental logic elsewhere
- A optional secret that confirms the player read the room carefully
- Gradual understanding of how a world's rules compose

**Anti-patterns**

- Fully exposed boards that remove all uncertainty without reason
- Infinite shallow variants of the same puzzle skeleton
- Secrets that require opaque pixel-hunting without fair clues

---

### Pillar 3 — Mastery Over Power

**Description**

Player growth is expressed through **understanding and execution quality**, not through stats that trivialize challenge.

**Rationale**

Power inflation collapses puzzle integrity. Mastery preserves long-term engagement for players who want depth without alienating newcomers.

**Design implications**

- Skill expression is cleaner routes, fuller discovery, higher completion standards
- Systems that flatten challenge for paying players are out of scope at vision level
- New players and veterans can coexist through optional depth, not forced grind

**Examples**

- Optional completion standards that reward efficient or thorough play
- Worlds that introduce new compositional rules rather than bigger numbers
- Player pride rooted in "I solved it properly"

**Anti-patterns**

- Permanent power purchases that bypass puzzle logic
- Difficulty reduction sold as convenience without player consent
- Late-game content that only checks accumulated stats

---

### Pillar 4 — Respect Player Time

**Description**

Sessions have natural endpoints. Progress should feel meaningful in short windows. The game does not manufacture obligation.

**Rationale**

Mobile play is interruptible. Premium trust requires that the product never punishes absence or hides basic clarity behind engagement hacks.

**Design implications**

- Clear save and resume expectations (detailed downstream)
- Levels designed for completable arcs, not indefinite loops
- Notifications and retention systems must not become coercive (business rules downstream)
- Front-loaded friction is minimized

**Examples**

- A satisfying stop after one well-designed chamber
- Fast restart when a plan fails—learning, not waiting
- Transparent objectives so time is not wasted on guesswork

**Anti-patterns**

- Energy timers on core puzzle progression
- Opaque fail states that waste minutes without teaching
- Daily punishment for missing sessions

---

### Pillar 5 — Quality Over Quantity

**Description**

Ship fewer things at higher standard. A single excellent chamber beats ten mediocre ones.

**Rationale**

Premium positioning is incompatible with content floods that dilute craft, QA load, and player trust.

**Design implications**

- Content pipelines favor authored quality before scale
- Art, audio, and UX polish are not late-stage optional layers
- Feature proposals must justify maintenance cost
- Technical debt that visibly harms craft is prioritized for removal

**Examples**

- Hand-authored flagship worlds before broad procedural expansion
- Animation and audio that reinforce commitment moments
- LLDL-consistent UI that never reads as prototype

**Anti-patterns**

- Bulk-generated levels with weak teaching intent
- Shipping systems before their presentation meets LLDL bar
- "Good enough" placeholders in production paths

---

### Design Intent

Pillars are the project's immune system. When two requirements conflict, pillars break the tie before convenience does.

---

## 6. Product Principles

### Fairness

Players should lose because their **plan was wrong**, not because the game hid rules. Mechanics must be learnable; surprises must be fair surprises.

### Readability

Information critical to planning must be visually and cognitively legible. Atmosphere may obscure *fiction*; it must not obscure *rules* without intentional, learnable systems behind that obscurity.

### Accessibility

Thoughtful design welcomes more players:

| Area | Intent |
|------|--------|
| Visual clarity | Readable contrast and motion restraint (detailed in LLDL) |
| Cognitive load | One major new idea at a time in early teaching |
| Motor demand | Planning-first play reduces precision burden |
| Difficulty options | Considered downstream without gutting pillars |

Accessibility is not an afterthought layer; it is part of premium craft.

### Challenge Philosophy

Challenge scales through **composition and incomplete information**, not cheap friction.

| Acceptable | Unacceptable |
|------------|------------|
| Multi-step reasoning | Opaque guesswork |
| Optional mastery paths | Mandatory perfection to proceed |
| Teachable failure | Random punishment |

### Craftsmanship

Every screen, sound, and animation should reinforce the temple fantasy and planning contract. Prototype visuals do not ship as final. See [LLDL](../02_Design_System/LLDL.md).

### Replay Philosophy

Replay value comes from **optional depth**—better solutions, secrets, mastery standards—not from forcing repetition of solved problems.

### Design Intent

Translate pillars into day-to-day evaluation criteria for UX, level design, and production tradeoffs.

---

## 7. World & Theme

### Ancient Civilization

Labyrinth Legends takes place in the aftermath of a civilization that merged **ritual architecture** with **mystical technology**. Temples are not mere dungeons; they are machines built by people who believed geometry and energy were the same discipline.

The player uncovers what remains—not to conquer a nation, but to understand a lost way of thinking.

### Atmosphere

| Quality | Expression |
|---------|------------|
| Calm | Deliberate pacing; no arcade panic |
| Mystery | Incomplete knowledge; inviting unknowns |
| Weight | Stone, depth, age |
| Wonder | Subtle magical response to correct thought |
| Melancholy | Civilizations end; ruins remain |

### Environmental Storytelling

Narrative is delivered through **space, symbol, and silence**:

- Layout communicates purpose
- Wear and repair tell time
- Motifs repeat across worlds to imply culture
- Text is sparse; implication is preferred

Full narrative bible lives in [Game Bible](../01_Game_Design/Game_Bible.md).

### Visual Identity

**Ancient civilization × mystical technology × premium mobile craft.**

| We are | We are not |
|--------|------------|
| Carved stone, engraved gold, controlled glow | Flat generic mobile UI |
| Temple interfaces and ritual geometry | Cyberpunk neon arcade |
| Faux-depth spaces with readable boards | Cartoon slapstick fantasy |
| Dark, premium atmospheres | Trend-chasing visual noise |

Token-level rules: [LLDL](../02_Design_System/LLDL.md).

### Audio Identity

Audio supports **focus and revelation**:

| Role | Direction |
|------|-----------|
| Ambience | Temple air, distant mechanism hum, restrained scale |
| Interaction | Subtle confirmation; commitment moments slightly weighted |
| Success | Satisfying but not casino-like |
| Failure | Instructive, not punishing |

Detailed audio direction: [Audio](../02_Design_System/Audio.md).

### Design Intent

Give art and audio a shared world brief independent of mechanical specs. Visual and sonic identity must reinforce planning and discovery, not fight them.

---

## 8. Target Audience

### Primary Audience

**Thoughtful puzzle-adventure players on mobile**, ages roughly 16–45, who:

- Enjoy Monument Valley–class craft and atmosphere
- Prefer planning to reflexes
- Value premium presentation without console time commitment
- Complete sessions in short windows but want depth over time
- Dislike aggressive retention and pay-to-skip integrity breaks

They play to feel **clever and calm**, not rushed and exploited.

### Secondary Audience

| Segment | Appeal |
|---------|--------|
| Classic puzzle fans | Familiar mapping instinct, modern presentation |
| Casual strategy players | Spatial reasoning without PvP pressure |
| Architecture / history enthusiasts | Ruin fantasy and environmental storytelling |
| Parents co-playing with teens | Readable fairness; low shock content |

### Who This Game Is NOT For

| Audience | Why |
|----------|-----|
| Action / combat seekers | No combat fantasy in vision |
| Competitive PvP players | Single-player intellectual focus |
| Idle / passive progression players | Active planning required |
| Players wanting power fantasy | Mastery over domination |
| Trend-chasing minigame collectors | Timeless craft over feature churn |

Exclusion is intentional. Clarity of audience protects pillars.

### Design Intent

Prevent scope creep toward incompatible player promises. Marketing and store positioning must align with this section.

---

## 9. Inspirations

Inspirations inform **lessons**, not copying. No inspiration authorizes lifting mechanics wholesale.

### Games

| Source | Lesson |
|--------|--------|
| Classic Labyrinth (pen-and-paper) | Incomplete maps; discovery as tension |
| Monument Valley | Spatial readability as art; calm premium tone |
| Lara Croft GO / similar | Turn-based commitment; mobile tactility |
| The Room | Tactile mystery; reverence for objects |
| Baba Is You | Cleverness through understanding rules |

### Architecture

| Source | Lesson |
|--------|--------|
| Temple complexes (Angkor, Petra, Mesoamerican sites) | Processional space; ritual progression |
| Sacred geometry | Patterns that imply intentionality |
| Ruins reclaimed by nature | Time, loss, wonder |

### History

| Source | Lesson |
|--------|--------|
| Lost civilizations narrative tradition | Knowledge buried, not destroyed |
| Archaeological method | Observe → hypothesize → test |

### Art

| Source | Lesson |
|--------|--------|
| Engraved metalwork and stone relief | Material language for UI |
| Controlled luminescence in ritual art | Magical technology without neon excess |

### Environmental Storytelling

| Source | Lesson |
|--------|--------|
| Dark Souls (tone reference only) | Space tells story without exposition |
| Museum curation | Objects placed to imply use |

### Design Intent

Provide a shared mood board in words. Teams cite lessons, not clones.

---

## 10. Success Definition

Success is multidimensional. Shipping features without meeting these dimensions is not success.

### Player Success

| Indicator | Description |
|-----------|-------------|
| Comprehension | Players understand the planning contract quickly |
| Satisfaction | Solving feels earned; failure feels instructive |
| Trust | Players believe the game is fair and respectful |
| Return | Players choose to return—not because of guilt, but curiosity |
| Recommendation | "It makes you feel clever" word-of-mouth |

### Product Success

| Indicator | Description |
|-----------|-------------|
| Pillar integrity | Core experience still reads as planning + discovery years later |
| Craft recognition | Presentation meets stated premium bar |
| Documentation health | LLDS stays authoritative; decisions traceable |
| Sustainable scope | Team can maintain quality without burnout content treadmills |

### Commercial Success

| Indicator | Description |
|-----------|-------------|
| Premium positioning credible | Store presence matches in-game craft |
| Ethical monetization alignment | Revenue does not require pillar violations (details downstream) |
| Long tail | Retention driven by mastery and content respect, not coercion |

Specific revenue targets live in product planning documents, not here.

### Community Success

| Indicator | Description |
|-----------|-------------|
| Positive discourse | Players discuss puzzles and secrets, not exploitation |
| Creator respect | Streamers can showcase thinking without spoiler chaos |
| Support load | Fairness and readability reduce confusion tickets |

### Design Intent

Define "done" holistically so producers cannot optimize one metric by damaging another.

---

## 11. Non-Negotiable Principles

These rules do not bend without Human approval and a [Decisions](Decisions.md) entry.

### Design

| Rule | Rationale |
|------|-----------|
| Planning is the primary skill in core progression | Defines the product |
| Discovery must remain meaningful | Honors labyrinth lineage and pillar 2 |
| Mastery beats power | Preserves puzzle integrity |
| Fair readability of learnable rules | Trust |
| LLDL governs all player-facing UI | Premium identity |

### Technical

| Rule | Rationale |
|------|-----------|
| Game rules live outside UI widgets | Testability and integrity |
| Documentation precedes unauthorized systems | LLDS governance |
| No silent pillar violations in "small" features | Scope creep defense |

Detailed architecture: [Architecture](../04_Technical/Architecture.md).

### Player Experience

| Rule | Rationale |
|------|-----------|
| Respect player time in session design | Pillar 4 |
| No coercive retention patterns in core loop | Trust |
| Calm tension only—no panic as default | Audience promise |
| Cleverness celebrated; domination fantasy rejected | Tone |

### Business

| Rule | Rationale |
|------|-----------|
| Monetization must not sell puzzle integrity | Pillar 3 |
| Premium craft is not negotiable for ship | Positioning |
| Vision non-goals stay excluded unless Human reopens | Scope protection |

Monetization detail: [Monetization](../01_Game_Design/Monetization.md) — must conform to these rules.

### Design Intent

Immutable guardrails for conflict resolution when schedules press.

---

## 12. Non-Goals

Labyrinth Legends is **not** attempting to become:

| Non-goal | Why excluded |
|----------|--------------|
| **Combat RPG** | Combat shifts skill profile to reflex and stats |
| **Roguelike** | Run randomization fights authored teaching and mastery arcs |
| **Idle game** | Passive play contradicts planning pillar |
| **Live-service grind hub** | Obligation loops violate respect for time |
| **Pay-to-win experience** | Purchased power breaks mastery and fairness |
| **Multiplayer deduction clone** | Different genre contract than original Labyrinth |
| **Realtime action maze** | Reflex-first play is explicitly rejected |
| **Minigame anthology** | Dilutes identity and craft focus |
| **Narrative-heavy visual novel** | Story serves space; it does not replace play |

Near neighbors (e.g., optional daily challenge) may exist only if they **strengthen** pillars and survive [§13 Decision Framework](#13-decision-framework).

### Design Intent

Give every stakeholder license to say no with authority.

---

## 13. Decision Framework

Every feature, level, screen, economy hook, or live-ops proposal must answer **yes** to all core questions unless Human explicitly waives with documented rationale.

### Core Checklist

| # | Question | Required answer |
|---|----------|-----------------|
| 1 | Does it strengthen **planning** as the primary skill? | Yes |
| 2 | Does it reward **curiosity** without cheap repetition? | Yes |
| 3 | Does it express **mastery** without raw power inflation? | Yes |
| 4 | Does it **respect player time**? | Yes |
| 5 | Does it fit the **ancient labyrinth / temple ruin** fantasy? | Yes |
| 6 | Does it meet **quality over quantity** craft bar? | Yes |
| 7 | Is it **fair and readable**? | Yes |
| 8 | Does it avoid [§12 Non-Goals](#12-non-goals)? | Yes |

### Escalation

| Outcome | Action |
|---------|--------|
| All yes | Proceed to downstream spec and implementation |
| Any no | Revise or reject |
| Pillar conflict | Human decision + [Decisions](Decisions.md) entry |

### Design Intent

Provide a reusable gate so agents and humans evaluate scope consistently.

---

## 14. Glossary

| Term | Definition |
|------|------------|
| **Explorer** | The player's role in fiction—a ruin-reader, not a combatant |
| **Labyrinth** | A structured temple complex of spatial puzzles; setting and subject |
| **Mastery** | Deep understanding expressed through execution quality and optional standards |
| **World** | A major themed region teaching compositional rules through its chambers |
| **Relic** | A persistent discoverable tied to lore and optional revelation (detail downstream) |
| **Core Loop** | Observe → plan → commit → resolve at vision level; see [Game Loop](../01_Game_Design/Game_Loop.md) |
| **Completion** | Finishing a chamber's primary objective |
| **Mastered Completion** | Completion plus optional excellence standards (efficiency, thorough discovery) |
| **Draw Your Fate** | Approved product phrase for plan-then-commit play identity (see [Decisions](Decisions.md)) |
| **LLDL** | Labyrinth Legends Design Language — visual and UX authority |
| **LLDS** | Labyrinth Legends Documentation System — documentation authority |

### Design Intent

Stabilize vocabulary across disciplines and AI agents.

---

## 15. Related Documents

| Document | Purpose | Relationship to Vision |
|----------|---------|----------------------|
| [Game Loop](../01_Game_Design/Game_Loop.md) | Session and meta flow across screens | Structures player time |
| [WS1 — Core Loop](../01_Game_Design/Game_Loop/WS1_Core_Loop.md) | Locked core micro-loop workshop | Defines what player does every few seconds |
| [WS2 — Session Loop](../01_Game_Design/Game_Loop/WS2_Session_Loop.md) | Locked session loop workshop | Defines how core loops compose a satisfying session |
| [WS3 — Progression Loop](../01_Game_Design/Game_Loop/WS3_Progression_Loop.md) | Locked progression loop workshop | Defines long-term mastery and unlock philosophy |
| [WS4 — Completion Loop](../01_Game_Design/Game_Loop/WS4_Completion_Loop.md) | Locked completion loop workshop | Defines milestone closure and optional mastery |
| [WS5 — Retention Loop](../01_Game_Design/Game_Loop/WS5_Retention_Loop.md) | Locked retention loop workshop | Defines voluntary long-term return and player trust |
| [Gameplay](../01_Game_Design/Gameplay.md) | Input, rules, win/lose, execution | Implements pillars mechanically |
| [LLDL](../02_Design_System/LLDL.md) | Visual, typographic, motion rules | Expresses theme and readability |
| [Game Bible](../01_Game_Design/Game_Bible.md) | Narrative voice, faction tone, extended world detail | Expands [§7 World & Theme](#7-world--theme) |
| [Mechanics](../01_Game_Design/Mechanics.md) | Cell and interaction definitions | Downstream of Gameplay |
| [Decisions](Decisions.md) | Approved changes and exceptions | Governance log |
| [Roadmap](Roadmap.md) | Delivery sequencing | Production planning |

### Authoritative Writing Order

```mermaid
flowchart LR
  V[1 Vision] --> GL[2 Game Loop]
  GL --> GP[3 Gameplay]
  GP --> LLDL[4 LLDL]
  LLDL --> GB[5 Game Bible]
```

Do not substantially expand lower-priority documents until upstream documents are approved.

### Design Intent

Orient readers to the documentation graph without duplicating downstream content.

---

## 16. Appendices

### Appendix A — Documentation Principles

| Principle | Application |
|-----------|-------------|
| Vision explains why, not how | No mechanics in this file |
| Single authority per topic | Link; do not duplicate |
| Decisions are logged | Exceptions are visible, not oral |
| Downstream docs cite pillars | Traceability |
| AI agents compile; they do not invent product | ChatGPT specifies; Cursor structures |

### Appendix B — Future Revision Notes

| Topic | Notes |
|-------|-------|
| Monetization specifics | Must be validated against [§11](#11-non-negotiable-principles) when written |
| Live ops cadence | Must not violate Respect Player Time |
| Procedural content scale | Quality Over Quantity gate applies |
| Accessibility certification | Expand with platform requirements when targeting ship |

### Appendix C — Closing Statement

Labyrinth Legends exists to prove that mobile puzzle-adventures can treat players as **thinkers**, ruins as **teachers**, and craft as **non-negotiable**.

If a future decision cannot be explained in terms of planning, discovery, mastery, time respect, and quality, it does not belong in this project.

---

## Open Items

| ID | Item | Owner | Status |
|----|------|-------|--------|
| V-004 | Owner approval of Vision 2.0.0 | Apoorv | Open |
| V-005 | Codex engineering review | Codex | Open |
| V-006 | ChatGPT product review | ChatGPT | Open |

---

## Navigation

| ← Previous | Next → | Index |
|------------|--------|-------|
| — | [Game Loop](../01_Game_Design/Game_Loop.md) · [WS1–WS5](../01_Game_Design/Game_Loop/README.md) | [LLDS Home](../README.md) |
