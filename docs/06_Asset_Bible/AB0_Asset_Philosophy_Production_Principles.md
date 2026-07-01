# AB0 — Asset Philosophy & Production Principles


| Field                 | Value                                                                                                                                                                  |
| --------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Project**           | Labyrinth Legends                                                                                                                                                      |
| **Document Name**     | AB0 — Asset Philosophy & Production Principles                                                                                                                         |
| **Document ID**       | AB0                                                                                                                                                                    |
| **Series**            | AB0 — Labyrinth Legends Asset Bible Foundation                                                                                                                         |
| **Version**           | 1.0.0                                                                                                                                                                  |
| **Status**            | Approved                                                                                                                                                               |
| **Owner**             | Apoorv                                                                                                                                                                 |
| **Prepared By**       | ChatGPT (specification) · Cursor (compiler)                                                                                                                            |
| **Last Updated**      | 2026-06-30                                                                                                                                                             |
| **Workshop**          | AB0 — Asset Philosophy & Production Principles                                                                                                                         |
| **Path**              | `docs/06_Asset_Bible/AB0_Asset_Philosophy_Production_Principles.md`                                                                                                    |
| **Parent**            | [LLDL](../02_Design_System/LLDL/LLDL.md)                                                                                                                               |
| **Children**          | AB1 · AB2 · AB3 · AB4 · AB5 · AB6                                                                                                                                      |
| **Dependencies**      | [Vision](../00_Project/Vision.md) · [Game Loop](../01_Game_Design/Game_Loop.md) · [Gameplay](../01_Game_Design/Gameplay.md) · [LLDL](../02_Design_System/LLDL/LLDL.md) |
| **Related Documents** | [Asset Bible README](README.md) · [WS0 — Design Philosophy](../02_Design_System/LLDL/WS0_Design_Philosophy.md) · [Decisions](../00_Project/Decisions.md)               |


## Navigation


| ← Previous                               | Next →                                                    | Index                                                         |
| ---------------------------------------- | --------------------------------------------------------- | ------------------------------------------------------------- |
| [LLDL](../02_Design_System/LLDL/LLDL.md) | [AB1 — Production Standards](AB1_Production_Standards.md) | [Asset Bible](README.md) · [Documentation Home](../README.md) |


---

## Version History


| Version | Date       | Author           | Summary                                                                  |
| ------- | ---------- | ---------------- | ------------------------------------------------------------------------ |
| 1.0.0   | 2026-06-30 | ChatGPT / Cursor | Initial AB0 workshop record — asset production philosophy and principles |


## Change Log


| Version | Change                                                                                                   |
| ------- | -------------------------------------------------------------------------------------------------------- |
| 1.0.0   | Initial workshop record: production philosophy, lifecycle beliefs, collaboration, AI posture, governance |


---

## Document Authority

**AB0 is the highest philosophical authority within the Labyrinth Legends Asset Bible.**


| Conflict type                                                                 | Authority                                                                                |
| ----------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| Product intent (why, pillars, audience, non-goals)                            | [Vision](../00_Project/Vision.md) wins                                                   |
| Mechanical meaning and gameplay readability requirements                      | [Gameplay](../01_Game_Design/Gameplay.md) wins                                           |
| Visual language, emotional tone, design meaning                               | [LLDL](../02_Design_System/LLDL/LLDL.md) and its workshops win                           |
| Asset production philosophy (principles and beliefs — not detailed standards) | **AB0 wins**                                                                             |
| Production standards, formats, naming, pipelines                              | AB1–AB6 and `Asset_Bible.md` *(planned)* — must align with AB0; AB0 does not define them |


AB0 defines *why* assets are produced the way they are. [LLDL](../02_Design_System/LLDL/LLDL.md) defines *how the game should look and feel*. Later Asset Bible workshops define *how production is executed*. AB0 must never redefine Vision, Gameplay, or LLDL.

When any production document conflicts with AB0 on **philosophical intent**, AB0 overrides until [Decisions](../00_Project/Decisions.md) records an explicit, Human-approved exception.

---

## Intended Audience


| Role                                    | Use this document to…                                                             |
| --------------------------------------- | --------------------------------------------------------------------------------- |
| Art Directors                           | Anchor production culture before standards and pipelines are defined              |
| Environment & Character Artists         | Understand quality expectations without waiting for asset lists                   |
| UI Artists & Icon Designers             | Ground craft in player readability and LLDL inheritance                           |
| Technical Artists                       | Apply constraints that preserve identity across integration                       |
| Engineers                               | Understand why production discipline protects implementation stability            |
| Producers                               | Evaluate scope, outsourcing, and timeline against durable principles              |
| Marketing & Brand Contributors          | Extend the game's visual identity without inventing parallel dialects             |
| External Vendors & Outsourcing Partners | Align with studio philosophy before receiving briefs                              |
| AI Workflow Operators                   | Treat automation as acceleration under human direction — not creative authority   |
| Reviewers & QA                          | Judge whether production choices serve the player and the documentation hierarchy |


---

## Table of Contents

1. [Introduction](#1-introduction)
2. [Asset Production Philosophy](#2-asset-production-philosophy)
3. [Asset Lifecycle Philosophy](#3-asset-lifecycle-philosophy)
4. [Production Principles](#4-production-principles)
5. [AI Philosophy](#5-ai-philosophy)
6. [Collaboration Philosophy](#6-collaboration-philosophy)
7. [Accessibility & Longevity](#7-accessibility--longevity)
8. [Governance](#8-governance)
9. [What AB0 Must Not Do](#9-what-ab0-must-not-do)
10. [Summary](#10-summary)
11. [Workshop Conclusions](#11-workshop-conclusions)
12. [Related Documents](#12-related-documents)

---

## 1. Introduction

### 1.1 Purpose of the Asset Bible

Labyrinth Legends is built for long-term development. Premium craft is not achieved by heroic one-off assets. It is achieved by a production culture that protects clarity, consistency, and player trust across every world, screen, update, and marketing surface.

The **Asset Bible** exists to translate locked design authority into durable production behavior. It answers a question LLDL alone cannot answer:

> **How do we produce assets that remain faithful to the game's identity as the project scales?**

[LLDL](../02_Design_System/LLDL/LLDL.md) defines the experiential architecture — what the temples should feel like, how interfaces communicate, how color and motion carry meaning. The Asset Bible defines how those intentions survive contact with schedules, tools, vendors, iteration, and volume.

AB0 is the philosophical foundation of that system. Every later workshop — production standards, game assets, UI and brand assets, marketing and store assets, AI pipeline, review and lifecycle — inherits from this document.

### 1.2 Scope

AB0 establishes **principles**, not specifications.


| In scope                                      | Out of scope                                         |
| --------------------------------------------- | ---------------------------------------------------- |
| Why production discipline exists              | Asset inventories and category lists                 |
| Beliefs about quality, reuse, and scale       | Technical export settings                            |
| Philosophy of lifecycle, review, and approval | Naming conventions and folder trees                  |
| Studio posture toward AI-assisted work        | Software, engine, or file-format rules               |
| Collaboration and governance culture          | Individual character, environment, or UI definitions |


Specifications belong in AB1–AB6. Visual meaning belongs in LLDL. Mechanical meaning belongs in Gameplay. Product intent belongs in Vision.

### 1.3 Relationship to Locked Authorities

```text
Vision.md          — why the game exists
    ↓
Game_Loop.md       — how player time is structured
    ↓
Gameplay.md        — how the game works
    ↓
LLDL.md            — how the game looks, feels, moves, and communicates visually
    ↓
AB0 (this document) — how visual assets are produced
    ↓
AB1–AB6            — how production is specified
    ↓
Asset_Bible.md     — integrated production handbook
    ↓
Production assets  — must comply with the Asset Bible
```

#### Vision

[Vision](../00_Project/Vision.md) establishes premium positioning, player respect, calm tension, and timeless craft. Asset production must serve those commitments. Assets that impress in isolation but undermine readability, fairness, or emotional tone violate Vision even if they appear polished.

Production therefore treats **player experience** as the first quality gate — not portfolio spectacle.

#### Game Loop

[Game Loop](../01_Game_Design/Game_Loop.md) defines how play unfolds across moment, session, progression, completion, and return. Assets must support those rhythms. A collectible that reads beautifully in a marketing still but disappears during live play fails the loop it was meant to serve.

Production respects **where** an asset appears in the player's journey and **how often** it is encountered.

#### Gameplay

[Gameplay](../01_Game_Design/Gameplay.md) defines mechanical meaning — planning before action, deterministic consequences, readable hazards, honest feedback. Assets are not decoration applied after rules exist. They are part of how players **learn**, **commit**, and **understand**.

An environment texture, hazard silhouette, or HUD element that obscures mechanical truth is a gameplay failure expressed through art. Production must protect mechanical readability without redefining rules.

#### LLDL

[LLDL](../02_Design_System/LLDL/LLDL.md) is the visual and experiential authority. Ancient Tech × Mythical Ruins, ceremonial interface language, disciplined gold and cyan roles, calm motion, inclusive defaults — these are not suggestions for artists. They are inherited meaning.

The Asset Bible **extends** LLDL into production. It does **not** reinterpret it. If production convenience conflicts with LLDL, production adapts — the design language does not bend silently.

#### Production vs Implementation


| Layer                       | Question it answers                                                      |
| --------------------------- | ------------------------------------------------------------------------ |
| **AB0–AB6 / Asset Bible**   | How assets are authored, reviewed, approved, and maintained              |
| **LLDL / screen specs**     | What assets must communicate and how they must feel                      |
| **Technical documentation** | How assets are loaded, optimized, and shipped in code                    |
| **Implementation**          | Runtime behavior — must consume approved assets, not invent parallel art |


AB0 governs the production layer only. It informs implementation by delivering assets that are consistent, documented, and validated — it does not define engine architecture.

### 1.4 Inheritance Rule

Lower-level Asset Bible documents may **extend** AB0 and LLDL. They may **never redefine** Vision, Gameplay, or LLDL.

When conflict appears:

1. **Preserve** the higher-authority document
2. **Report** the conflict in review or [Decisions](../00_Project/Decisions.md)
3. **Do not** invent a local production exception without Human approval

---

## 2. Asset Production Philosophy

Asset production in Labyrinth Legends is a **discipline of respect** — respect for the player, the design language, the gameplay systems that assets must clarify, and the teammates who will inherit the work years later.

The following principles are foundational. Each exists because undisciplined production is the fastest path from premium intent to generic mobile noise.

### 2.1 Player Experience First

**Principle:** Every asset exists to serve a player moment — not to demonstrate technique for its own sake.

**Why:** [Vision](../00_Project/Vision.md) defines a premium puzzle-adventure where intelligence and discovery matter. Assets that compete with comprehension — visual noise, illegible symbols, ornamental clutter — destroy the experience LLDL and Gameplay are built to protect.

**Implication:** Production evaluates assets by what they help the player understand, feel, or commit to — not by complexity alone.

### 2.2 Gameplay Before Decoration

**Principle:** Mechanical readability precedes aesthetic embellishment.

**Why:** [Gameplay](../01_Game_Design/Gameplay.md) treats planning, hazards, objectives, and feedback as a coherent system. Decoration that obscures traversable space, hazard state, or interactive affordances forces players to guess — violating fairness and trust.

**Implication:** Artists and designers collaborate early so beauty reinforces clarity. Ornament is applied **after** function is legible, not instead of it.

### 2.3 Emotional Consistency

**Principle:** Assets must sustain one emotional world — calm tension, ancient mystery, earned intelligence.

**Why:** [WS0 — Design Philosophy](../02_Design_System/LLDL/WS0_Design_Philosophy.md) establishes emotional targets that must persist across environments, UI, marketing, and updates. A single off-tone asset fractures immersion and signals craft inconsistency.

**Implication:** Production rejects assets that are individually attractive but emotionally alien — arcade neon, cartoon exaggeration, horror shock, or trend-chasing styling that contradicts the temple fantasy.

### 2.4 Readability

**Principle:** Assets must remain legible at production scale — on device, at distance, under motion, and across content growth.

**Why:** Mobile play happens in imperfect conditions: glare, one-handed use, short sessions, partial attention. Premium craft is readable craft. LLDL accessibility philosophy depends on assets that survive real viewing conditions.

**Implication:** Production treats contrast, silhouette, scale, and visual hierarchy as non-negotiable qualities — not polish items deferred to the end.

### 2.5 Intentional Design

**Principle:** No asset ships without a documented reason for existing.

**Why:** Accidental assets accumulate debt — duplicate motifs, orphaned variants, unexplained style drift. Intentional production keeps worlds coherent and teams aligned.

**Implication:** Briefs, references, and approval records matter philosophically even before AB6 defines their format. Purpose precedes pixels.

### 2.6 Quality Over Quantity

**Principle:** Fewer excellent assets outperform large libraries of mediocre ones.

**Why:** Vision positions Labyrinth Legends as premium, not content-flooded. Volume without standard dilutes QA, integration cost, and player trust.

**Implication:** Production prefers depth of craft on reusable foundations over one-off spectacle. Scope debates default toward **refinement**, not **proliferation**.

### 2.7 Reuse Over Duplication

**Principle:** Build families, variants, and modular systems — not parallel unrelated solutions.

**Why:** Long-term development rewards assets that compose. Duplication creates inconsistency, increases maintenance, and encourages silent style forks.

**Implication:** Production seeks reusable visual language — material families, modular ruins, icon logic, UI surfaces — so new content inherits quality instead of reinventing it.

### 2.8 Scalable Production

**Principle:** The pipeline must support more worlds, screens, and campaigns without collapsing standards.

**Why:** A philosophy that only works for the first vertical slice is not a studio philosophy. Scale is a design constraint from day one.

**Implication:** Production favors systems thinking — documented patterns, inherited motifs, reviewable templates — over artisan-only workflows that cannot survive growth.

### 2.9 Long-Term Maintainability

**Principle:** Assets are maintained products, not disposable deliverables.

**Why:** Games live through updates, platform refreshes, localization, and re-renders. Assets without clear ownership and lineage become expensive to change or replace.

**Implication:** Production culture values traceability, disciplined iteration, and documentation that future contributors can trust.

### 2.10 Human Creativity Supported by Tools

**Principle:** Tools accelerate craft; they do not replace judgment.

**Why:** Premium identity requires taste, context, and accountability. Automation that bypasses review produces fast inconsistency.

**Implication:** Artists remain authors of quality. Tools — including AI — serve defined direction under human approval.

### 2.11 Production Discipline

**Principle:** Consistency is engineered through habits, not hope.

**Why:** Without discipline, even talented individuals produce incompatible work. Documentation exists to make excellence repeatable.

**Implication:** Reviews, naming mindset, ownership, and cross-discipline communication are cultural requirements — not bureaucratic optional extras.

### 2.12 Consistency Across Every Asset

**Principle:** Game, UI, marketing, and store surfaces speak one visual language.

**Why:** Players encounter the brand before, during, and after play. Parallel dialects undermine premium positioning and marketing trust.

**Implication:** Production treats every surface as part of the same temple world — not separate art directions sharing a logo.

---

## 3. Asset Lifecycle Philosophy

Assets are not static files. They are decisions that move through time — from intent to integration to retirement. AB0 describes the **philosophy of that journey**, not a procedural checklist.

The lifecycle exists to protect quality as ideas become shipped reality.

### 3.1 Briefing

Production begins with clarity of purpose: what player moment the asset serves, what authority it inherits, and what success looks like. A brief is not bureaucracy — it is the translation layer between Gameplay meaning, LLDL tone, and artistic execution.

Poor briefing produces beautiful mistakes.

### 3.2 Research

Research grounds invention in the locked world. Artists study architectural logic, material behavior, symbolic language, and reference tone aligned with LLDL — not generic fantasy trends.

Research prevents artists from solving the wrong problem elegantly.

### 3.3 References

References align taste before execution. They are shared visual contracts between art direction, design, and vendors — reducing subjective debate after work is expensive.

References express **direction**, not permission to copy unrelated IP.

### 3.4 Concept Exploration

Exploration is encouraged — within boundaries. Multiple directions may be tested to find the strongest expression of a locked principle.

Exploration without constraints produces novelty without identity.

### 3.5 Review

Review is a quality instrument, not a gatekeeping ritual. Early review catches drift when change is cheap. Late review confirms readiness for integration and public surfaces.

Review asks: Does this asset honor Vision, Gameplay, and LLDL — and is it production-ready?

### 3.6 Production

Production is the disciplined execution of an approved direction. Craftsmanship matters here — but craftsmanship in service of clarity, not self-reference.

Speed is valuable only when it does not mortgage future consistency.

### 3.7 Iteration

Iteration is expected. Premium assets rarely emerge fully formed. Iteration refines readability, emotional tone, and integration fit.

Iteration without documentation, however, becomes reinvention — the enemy of maintainability.

### 3.8 Integration

An asset does not exist in isolation. Integration reveals truth: scale on device, relationship to motion, interaction with UI, performance cost, and gameplay legibility.

Integration is where philosophy meets reality. Assets that fail here return to iteration — not force-fit into the build.

### 3.9 Validation

Validation confirms the asset still serves its purpose after integration. Does it communicate the right meaning? Does it survive animation, lighting, and compression? Does it hold under accessibility expectations?

Validation protects players from production assumptions.

### 3.10 Optimization

Optimization preserves identity while respecting platform reality. The goal is not minimal files at any visual cost — it is sustainable shipping without betraying readability or tone.

Optimization decisions remain accountable to LLDL and AB0 — not only to performance metrics.

### 3.11 Approval

Approval is an explicit act of responsibility. Someone with authority attests that the asset is fit for use — in-game, in UI, or in public marketing.

Nothing is implicitly approved because it rendered successfully.

### 3.12 Archiving

Retired assets retain value as history. Archiving prevents deprecated work from resurfacing accidentally and preserves lessons for future content.

A project that cannot retire assets cleanly cannot scale content safely.

### 3.13 Lifecycle Intent

```mermaid
flowchart LR
  intent[Brief & Research] --> explore[Concept & Review]
  explore --> make[Production & Iteration]
  make --> prove[Integration & Validation]
  prove --> ship[Approval]
  ship --> live[Use & Maintain]
  live --> archive[Archive]
```



The lifecycle is circular, not linear. Live assets may return to iteration when systems evolve — but always through the same philosophical discipline.

---

## 4. Production Principles

Universal production standards exist because talent alone does not scale. The following principles describe how disciplined studios protect coherence across people, time, and tools.

### 4.1 Consistency

Consistency is the player-visible result of invisible discipline. When two walls, icons, or marketing frames feel like they belong to the same civilization, trust increases. When they do not, players sense craft failure even if they cannot name it.

Consistency is a moral commitment to the world — not a style preference.

### 4.2 Naming Discipline

Names carry meaning across years and handoffs. Disciplined naming reduces search cost, prevents duplicate creation, and makes automation possible.

AB0 asserts the **philosophy** of naming discipline. AB1 will define conventions. The belief precedes the syntax: **if it cannot be found, it will be remade — badly.**

### 4.3 Organization

Organization is respect for future contributors. Structured asset homes mirror conceptual structure — game vs UI vs marketing, source vs delivery, work-in-progress vs approved.

Chaos is not creative freedom; it is deferred cost.

### 4.4 Version Control Mindset

Assets evolve. Production treats change as normal and traceability as essential. Teams must know what changed, why, and which version is authoritative.

Without lineage, integration breaks silently.

### 4.5 Asset Ownership

Every asset class has a responsible owner — art direction, design, technical art, or production — who can approve meaning and quality. Shared creation does not mean shared ambiguity about accountability.

Ownership prevents orphaned work and endless opinion loops.

### 4.6 Documentation

Documentation is part of the deliverable. An asset without context forces guesswork downstream — in engineering, localization, marketing, and future content.

Documentation-first production keeps the Asset Bible honest: standards mean nothing if authors do not record decisions.

### 4.7 Communication

Production failures are often communication failures. Artists, designers, engineers, and producers must share constraints early — readability needs, integration limits, schedule reality, and LLDL boundaries.

Silence breeds silent rework.

### 4.8 Cross-Discipline Collaboration

Labyrinth Legends is not an art-only product. Technical artists bridge vision and implementation. Designers guard mechanical clarity. Engineers expose integration truth. Producers protect scope.

Collaboration is not consultation at the end — it is co-authorship of quality.

### 4.9 Review Culture

Review is continuous, candid, and constructive. Praise without precision does not improve craft. Critique without reference to authority does not improve alignment.

The best reviews cite **which principle** an asset serves or violates.

### 4.10 Early Feedback

Late feedback is expensive emotionally and financially. Production culture rewards showing work early — greybox, blockout, rough icon, layout mock — when direction can still change cheaply.

Early feedback is a sign of professionalism, not weakness.

### 4.11 Iteration

Iteration is not failure. Shipping the wrong asset is failure. Teams iterate to converge on clarity and tone — not to chase infinite perfection without ship criteria.

Iteration must remain bounded by approval gates and player value.

### 4.12 Engine Validation

Assets must prove themselves in context — not only in authoring tools. Engine validation is the philosophical requirement that production serves the shipped experience.

What looks correct in isolation may be wrong in play.

---

## 5. AI Philosophy

AI-assisted production is part of modern craft. Labyrinth Legends adopts AI as **acceleration under direction** — never as creative authority.

### 5.1 AI Accelerates Work

AI can shorten exploration cycles, generate variations, assist cleanup, and support repetitive tasks — freeing human time for judgment, refinement, and integration.

Acceleration without direction produces volume without identity.

### 5.2 AI Never Replaces Artistic Direction

[LLDL](../02_Design_System/LLDL/LLDL.md) and art direction define the temple world. AI does not set tone, invent pillars, or redefine visual language. It executes within boundaries humans establish.

If AI output contradicts LLDL, the output is wrong — not the language.

### 5.3 Humans Remain Responsible

Accountability cannot be delegated to a model. The studio — not the tool — owns what ships. Every AI-assisted asset requires a named human reviewer who can explain why it is fit for use.

Responsibility is non-transferable.

### 5.4 Prompt Libraries as Production Memory

Prompt libraries encode approved direction — motifs, materials, compositions, exclusions — so AI output converges instead of wandering. They are institutional memory, not creative shortcuts around review.

AB5 will define pipeline detail. AB0 establishes the belief: **prompts are standards expressed in language.**

### 5.5 Style Consistency

AI is especially dangerous for style drift. Without locked references and review, each generation becomes a micro-fork of the visual language.

Consistency requires human-curated style anchors and rejection of "close enough" outputs.

### 5.6 Review Requirements

AI-generated or AI-assisted assets pass through the **same** philosophical gates as handmade work — briefing alignment, LLDL compliance, gameplay readability, accessibility, and approval.

No bypass lane exists for automation.

### 5.7 Ethical Considerations

Production respects creator rights, consent, and fair use. AI must not launder unlicensed sources into shipped assets. Ethical production protects the studio, collaborators, and players.

Speed never justifies unexamined provenance.

### 5.8 IP Protection

Labyrinth Legends is a commercial product with long-term brand value. Production safeguards distinctive identity — avoiding outputs that imitate protected works or dilute ownable visual signatures.

IP discipline is part of premium stewardship.

### 5.9 Human Approval

Approval is always human. Models do not approve models. Final authority rests with designated reviewers per asset class — art direction, design, technical art, marketing brand, and Human owner where required.

AB0 locks this principle permanently.

### 5.10 AI Posture Summary


| AI is…                         | AI is not…                      |
| ------------------------------ | ------------------------------- |
| A production assistant         | A creative director             |
| A variation engine under brief | A source of new visual pillars  |
| A tool requiring review        | A substitute for accountability |
| A way to scale iteration       | Permission to skip LLDL         |


---

## 6. Collaboration Philosophy

Asset production is a team sport across disciplines, locations, and organizations. AB0 defines how collaboration protects quality — not org charts.

### 6.1 Shared Responsibility

Quality is everyone's obligation. Artists produce clarity. Designers protect mechanical meaning. Technical artists preserve fidelity through integration. Engineers expose truth in runtime. Producers guard scope and schedule without sacrificing standards.

When quality fails, the failure is shared — and so is the repair.

### 6.2 Artists

Artists express the temple world — environment, character, prop, VFX, and marketing imagery — within LLDL boundaries. Their responsibility is not only beauty but **communicative precision**.

### 6.3 Designers

UI/UX and game designers ensure assets serve player understanding — HUD restraint, icon semantics, puzzle readability, progressive disclosure. Design collaborates before production hardens the wrong idea.

### 6.4 Technical Artists

Technical artists translate artistic intent into sustainable implementation — materials, atlases, LOD philosophy, shader restraint, and validation in engine context. They prevent "beautiful but impossible" from becoming "beautiful but shipped broken."

### 6.5 Engineers

Engineers implement systems that consume assets faithfully. They flag integration issues early — scale, batching, accessibility hooks, dynamic states — without becoming unauthorized art directors.

### 6.6 Marketing & Brand

Marketing extends the fantasy to store pages, social surfaces, and campaigns. Marketing assets inherit LLDL and AB0 — they do not invent a brighter, louder, or unrelated game to chase clicks.

### 6.7 External Vendors & Outsourcing

Outsourcing scales craft only when philosophy travels with the brief. Vendors receive inherited direction, references, and review expectations — not vague freedom.

External work is studio work once approved. The player cannot tell who rendered it — and should not need to.

### 6.8 Communication Norms


| Norm                      | Why it exists                            |
| ------------------------- | ---------------------------------------- |
| Brief before production   | Aligns meaning early                     |
| Reference before debate   | Grounds taste in shared authority        |
| Critique with principle   | Speeds convergence                       |
| Document decisions        | Protects future teams                    |
| Escalate conflicts upward | Prevents silent overrides of locked docs |


### 6.9 Review Ownership

Reviews have owners with authority to accept or reject against documented standards. Opinion without ownership produces churn. Ownership without standards produces tyranny.

Balance: **principled authority**, not personal preference.

### 6.10 Documentation-First Production

If it is not documented, it is not yet studio knowledge. Briefs, approvals, and rationale belong to the Asset Bible ecosystem — so AI agents, new hires, and vendors inherit the same truths.

---

## 7. Accessibility & Longevity

Accessibility and longevity are production virtues — not compliance checkboxes applied after assets are finished.

AB0 does not redefine [WS9 — Accessibility Language](../02_Design_System/LLDL/WS9_Accessibility_Language.md). It explains why production must **preserve** those commitments as assets are authored, integrated, and reused.

### 7.1 Readable Assets

Production chooses contrast, scale, silhouette, and motion restraint so gameplay and UI remain legible. Readability is designed into source assets — not patched solely in code.

### 7.2 Accessible Production

Inclusive craft begins in production: color relationships that do not rely on hue alone, icon forms that communicate without tiny detail, text surfaces that tolerate scaling and localization growth.

Accessibility failures are production failures when they could have been prevented upstream.

### 7.3 Inclusive Defaults

Default asset choices should work for the broadest reasonable audience without requiring special modes to be understandable. Modes and settings may extend access — they should not excuse unclear base assets.

### 7.4 Maintainable Assets

Maintainable assets have clear ownership, modular structure, and documented intent. Future teams can update, localize, or re-render without archeology.

### 7.5 Future-Proof Craft

Timeless craft avoids trend locks — excessive micro-detail that collapses on mobile, ornamental noise that ages poorly, or stylistic bets that contradict Vision's premium positioning.

Future-proof does not mean bland. It means **intentional restraint**.

### 7.6 Reusable Systems

Reusable materials, icon families, and modular ruins reduce regression risk when content expands. Longevity favors systems that absorb new levels without new visual dialects.

### 7.7 Consistency Across Future Content

Every future world, event, or campaign must feel like it was always part of the same civilization. Production philosophy does not relax after ship one.

Content growth is the stress test of AB0.

---

## 8. Governance

### 8.1 Asset Bible Hierarchy

```text
AB0 — Asset Philosophy & Production Principles (foundation)
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
Asset_Bible.md — integrated handbook
```

Each layer inherits the layers above. AB1–AB6 may add specificity. They may not contradict AB0 or LLDL.

### 8.2 Inheritance


| Document                   | Owns                       |
| -------------------------- | -------------------------- |
| Vision                     | Product intent             |
| Gameplay                   | Mechanical meaning         |
| LLDL                       | Design language            |
| **AB0**                    | Production philosophy      |
| AB1                        | Standards and structure    |
| AB2–AB4                    | Domain production guidance |
| AB5                        | AI pipeline specification  |
| AB6                        | Review gates and lifecycle |
| Asset_Bible.md *(planned)* | Integrated reference       |


### 8.3 Authority

When questions arise:

1. Start from the highest relevant authority
2. Descend only as far as needed
3. Never solve philosophy conflicts by inventing local production rules

Production authority does not override design authority. It implements design with discipline.

### 8.4 Workshop Structure

Asset Bible workshops follow the LLDS compiler workflow:

```text
Architecture / specification discussion
    ↓
Workshop authorship
    ↓
Review package
    ↓
Codex engineering review
    ↓
ChatGPT product review
    ↓
Human approval
    ↓
Locked
```

See [Cursor Workflow](../05_AI/Cursor/Workflow.md) and [99_Reviews](../99_Reviews/README.md).

### 8.5 Approval Workflow

AB0 becomes **Approved — Locked** only after Human approval. Until then, it is Draft — subject to revision.

Later workshops do not begin formal lock until AB0 is approved — they may draft in parallel only with explicit Human waiver.

### 8.6 Document Lifecycle


| State                 | Meaning                                   |
| --------------------- | ----------------------------------------- |
| **Draft**             | Active authorship; not yet production law |
| **Ready for Review**  | Complete draft awaiting reviewer pass     |
| **Approved**          | Accepted for use                          |
| **Approved — Locked** | Change requires version bump and review   |


Material exceptions to AB0 require [Decisions](../00_Project/Decisions.md) entry and Human approval.

### 8.7 Children of AB0


| ID  | Workshop                 | Inherits AB0 by…                                       |
| --- | ------------------------ | ------------------------------------------------------ |
| AB1 | Production Standards     | Applying philosophy to structure and discipline        |
| AB2 | Game Assets              | Applying philosophy to world and gameplay-facing craft |
| AB3 | UI & Brand Assets        | Applying philosophy to interface and identity surfaces |
| AB4 | Marketing & Store Assets | Applying philosophy to public-facing consistency       |
| AB5 | AI Production Pipeline   | Applying philosophy to automation boundaries           |
| AB6 | Review & Asset Lifecycle | Applying philosophy to gates, metrics, and retirement  |


---

## 9. What AB0 Must Not Do

AB0 must **not**:

- List individual assets, characters, environments, or UI components
- Define export settings, resolutions, compression, or file formats
- Specify software, engines, plugins, or pipeline tools
- Redefine LLDL color, motion, typography, or component meaning
- Redefine Gameplay rules, hazard logic, or feedback systems
- Redefine Vision pillars, audience, or non-goals
- Replace AB1–AB6 specifications before those workshops are authored
- Act as a marketing pitch or external brand manifesto

If a sentence belongs in a checklist, a folder tree, or a tool tutorial — it belongs in a later workshop, not here.

---

## 10. Summary

Labyrinth Legends earns its premium positioning through disciplined production — not accidental polish.

**AB0 establishes that:**

- Assets serve player experience, gameplay clarity, and LLDL identity — in that order of authority
- Quality is protected through lifecycle discipline, review culture, and documentation-first collaboration
- AI accelerates work under human direction — never around it
- Accessibility and longevity are authored into assets, not patched later
- AB1–AB6 and the integrated Asset Bible inherit this philosophy without redefining locked authorities

This document is the permanent production conscience of the project. When production debates arise, AB0 answers **why** before any later document answers **how**.

---

## 11. Workshop Conclusions

AB0 — Asset Philosophy & Production Principles records the following workshop conclusions for review:


| #   | Conclusion                                                                           |
| --- | ------------------------------------------------------------------------------------ |
| 1   | The Asset Bible is the production authority; LLDL remains the visual authority       |
| 2   | AB0 is the philosophical foundation for AB1–AB6 — principles before specifications   |
| 3   | Player experience, gameplay readability, and LLDL identity govern all asset work     |
| 4   | Quality over quantity; reuse over duplication; discipline over heroic one-offs       |
| 5   | Lifecycle review is continuous — early feedback is professional, not optional        |
| 6   | AI assists production under human review — never replaces art direction or approval  |
| 7   | Outsourcing and marketing must inherit the same philosophy as in-game craft          |
| 8   | Accessibility and longevity are production responsibilities, not downstream patches  |
| 9   | Conflicts escalate upward — higher-authority documents are never silently overridden |
| 10  | AB0 locks after Human approval; all later Asset Bible workshops inherit it           |


---

## 12. Related Documents

### Locked authorities

- [Vision](../00_Project/Vision.md)
- [Game Loop](../01_Game_Design/Game_Loop.md)
- [Gameplay](../01_Game_Design/Gameplay.md)
- [LLDL](../02_Design_System/LLDL/LLDL.md)

### Asset Bible

- [Asset Bible README](README.md)
- AB1 — Production Standards *(planned)*
- AB2 — Game Assets *(planned)*
- AB3 — UI & Brand Assets *(planned)*
- AB4 — Marketing & Store Assets *(planned)*
- AB5 — AI Production Pipeline *(planned)*
- AB6 — Review & Asset Lifecycle *(planned)*
- `Asset_Bible.md` *(planned — integration)*

### Design reference

- [WS0 — Design Philosophy](../02_Design_System/LLDL/WS0_Design_Philosophy.md)
- [WS9 — Accessibility Language](../02_Design_System/LLDL/WS9_Accessibility_Language.md)

### Governance

- [Decisions](../00_Project/Decisions.md)
- [99_Reviews](../99_Reviews/README.md)
- [Cursor Workflow](../05_AI/Cursor/Workflow.md)

