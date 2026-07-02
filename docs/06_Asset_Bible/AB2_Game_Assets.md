# AB2 — Game Assets

| Field | Value |
|-------|-------|
| **Project** | Labyrinth Legends |
| **Document Name** | AB2 — Game Assets |
| **Document ID** | AB2 |
| **Series** | AB2 — Labyrinth Legends Asset Bible Game Asset Systems |
| **Version** | 1.0.2 |
| **Status** | Approved — Locked |
| **Owner** | Apoorv |
| **Prepared By** | ChatGPT (specification) · Cursor (compiler) |
| **Last Updated** | 2026-07-02 |
| **Workshop** | AB2 — Game Assets |
| **Path** | `docs/06_Asset_Bible/AB2_Game_Assets.md` |
| **Parent** | [AB1 — Production Standards](AB1_Production_Standards.md) |
| **Children** | AB3 · AB4 · AB5 · AB6 *(downstream Asset Bible workshops — AB2 informs but does not govern)* |
| **Dependencies** | [Vision](../00_Project/Vision.md) · [Gameplay](../01_Game_Design/Gameplay/Gameplay.md) · [LLDL](../02_Design_System/LLDL/LLDL.md) · [AB0](AB0_Asset_Philosophy_Production_Principles.md) · [AB1](AB1_Production_Standards.md) |
| **Related Documents** | [WS3 — Environment Language](../02_Design_System/LLDL/WS3_Environment_Language.md) · [GP3 Series](../01_Game_Design/Gameplay/GP3/README.md) · [GP6 — Gameplay Feedback](../01_Game_Design/Gameplay/GP6_Gameplay_Feedback.md) · [Asset Bible README](README.md) |

## Navigation

| ← Previous | Next → | Index |
|------------|--------|-------|
| [AB1 — Production Standards](AB1_Production_Standards.md) | [AB3 — UI & Brand Assets](AB3_UI_Brand_Assets.md) | [Asset Bible](README.md) · [Documentation Home](../README.md) |

---

## Version History

| Version | Date | Author | Summary |
|---------|------|--------|---------|
| 1.0.0 | 2026-07-01 | ChatGPT / Cursor | Initial AB2 workshop record — playable-world asset system specifications |
| 1.0.1 | 2026-07-01 | Cursor | Status hygiene — aligned to Approved across Asset Bible index and review package `0030` |
| 1.0.2 | 2026-07-02 | Apoorv / Cursor | Human lock — Asset Bible workshop chain locked for integration (`0035`) |

## Change Log

| Version | Change |
|---------|--------|
| 1.0.0 | Initial workshop record: seven asset systems with unified production specification template |
| 1.0.1 | Status hygiene — aligned to Approved across README and review package `0030` |
| 1.0.2 | Human lock recorded — status `Approved — Locked`; no design content changed |

---

## Document Authority

**AB2 is the playable-world visual asset systems authority within the Labyrinth Legends Asset Bible.**

| Conflict type | Authority |
|---------------|-----------|
| Product intent | [Vision](../00_Project/Vision.md) wins |
| Mechanical meaning, puzzle behaviour, hazard logic | [Gameplay](../01_Game_Design/Gameplay/Gameplay.md) and GP series win |
| Visual language, environment meaning, color roles | [LLDL](../02_Design_System/LLDL/LLDL.md) and WS workshops win |
| Production philosophy | [AB0](AB0_Asset_Philosophy_Production_Principles.md) wins |
| Universal production standards | [AB1](AB1_Production_Standards.md) wins |
| Playable-world asset system production specifications | **AB2 wins** |
| UI, brand, marketing, store assets | AB3–AB4 — AB2 does not define them |
| AI pipeline and lifecycle gate detail | AB5–AB6 — AB2 inherits; does not define them |
| Engine integration and runtime loading | `docs/04_Technical/*` — consumes approved assets |

AB2 defines **what each playable-world asset system is responsible for** and **how it is produced consistently**. It does not define gameplay rules, visual style, or implementation.

When any game-asset production document conflicts with AB2 on **system responsibility or production specification**, AB2 overrides until [Decisions](../00_Project/Decisions.md) records an explicit, Human-approved exception.

---

## Intended Audience

| Role | Use this document to… |
|------|------------------------|
| Environment Artists | Produce ruins, chambers, and navigation surfaces per system spec |
| Character / Explorer Artists | Present the explorer as a readable planning anchor |
| Prop & Puzzle Artists | Build interactive and decorative world systems without mechanic invention |
| VFX Artists | Deliver feedback that communicates — not decorates — gameplay state |
| Level Designers | Brief asset production against system responsibilities |
| Technical Artists | Validate in-world assets against system readability standards |
| Producers | Scope world content as systems, not one-off lists |
| External Vendors | Receive domain briefs grounded in AB2 system boundaries |
| AI Workflow Operators | Generate variations within defined system families |

---

## Table of Contents

1. [Introduction](#1-introduction)
2. [Universal Principles](#2-universal-principles)
3. [Explorer Assets](#3-explorer-assets)
4. [Environment Assets](#4-environment-assets)
5. [Puzzle Assets](#5-puzzle-assets)
6. [Collectible Assets](#6-collectible-assets)
7. [World Props](#7-world-props)
8. [Visual Feedback Assets](#8-visual-feedback-assets)
9. [Supporting System Assets](#9-supporting-system-assets)
10. [Conclusion](#10-conclusion)
11. [Governance](#11-governance)
12. [What AB2 Must Not Do](#12-what-ab2-must-not-do)
13. [Workshop Conclusions](#13-workshop-conclusions)
14. [Related Documents](#14-related-documents)

---

## 1. Introduction

### 1.1 Purpose

Labyrinth Legends is played **inside** forgotten temples. The playable world is not a backdrop — it is the primary surface where players study, plan, commit, and learn.

**AB2 defines the production specification for every playable-world visual asset system** — the organized families of art that make exploration, navigation, puzzle reading, progression, reward, and atmosphere possible.

AB2 answers:

> **What does each in-world visual system communicate, and how do we produce it consistently across worlds and years?**

### 1.2 Authority and Scope

| AB2 owns | AB2 does not own |
|----------|------------------|
| System responsibilities for playable-world visuals | Gameplay rules, puzzle logic, movement validation |
| Player-expectation framing per system | Art direction, color palettes, lighting philosophy (LLDL) |
| Readability and production principles per system | UI, HUD, icons, typography (AB3) |
| Asset category boundaries (not exhaustive inventories) | Marketing, store, brand surfaces (AB4) |
| Library and reuse strategy per system | Export settings, resolutions, naming syntax |
| How systems compose without overlap | Engine loading, sprite implementation |

### 1.3 Inheritance

```text
Vision.md        — why the game exists
    ↓
Gameplay.md      — how the game works
    ↓
LLDL.md          — how the game looks, feels, moves, and communicates visually
    ↓
AB0              — why production discipline exists
    ↓
AB1              — how production operates universally
    ↓
AB2 (this doc)   — playable-world asset system specifications
    ↓
AB3–AB6          — other asset domains and pipeline detail
    ↓
Technical docs   — implementation
```

#### Vision

[Vision](../00_Project/Vision.md) positions Labyrinth Legends as a premium puzzle-adventure where **intelligence and discovery** matter. Playable-world assets must reward observation and respect player time — never obscure fairness for spectacle.

#### Gameplay

[Gameplay](../01_Game_Design/Gameplay/Gameplay.md) defines planning-before-action, deterministic consequences, and readable hazards. AB2 systems **support** mechanical communication through visuals — they do not define outcomes. Puzzle element behaviour lives in GP3; hazard meaning in GP4; feedback philosophy in GP6.

#### LLDL

[LLDL](../02_Design_System/LLDL/LLDL.md) and [WS3 — Environment Language](../02_Design_System/LLDL/WS3_Environment_Language.md) define environmental and visual meaning. AB2 specifies how **playable-world production** preserves that meaning — not what the meaning is.

#### AB0 and AB1

[AB0](AB0_Asset_Philosophy_Production_Principles.md) and [AB1](AB1_Production_Standards.md) govern all asset production. AB2 applies their philosophy and standards to **in-world systems** — ownership, approval, reuse, and validation per [AB1 §3](AB1_Production_Standards.md#3-asset-governance).

#### Asset Bible and Technical Documentation

The Asset Bible integrates all workshops. Technical documentation implements approved deliverables. AB2 defines **system specifications** that technical layers must consume — not replace.

### 1.4 What AB2 Deliberately Does Not Own

AB2 excludes UI surfaces, meta-game screens, marketing imagery, pipeline prompts, QA gate metrics, and code. If an asset appears outside the playable maze/chamber view as interface chrome, it belongs to AB3 — not AB2.

---

## 2. Universal Principles

Every asset system in AB2 inherits the following principles **once**. Individual systems apply them; they do not restate them.

### 2.1 Gameplay Communication

Playable-world assets are **communication instruments**. They help players answer: *Where can I go? What matters? What changed? What did I earn?*

Assets communicate **affordances and states** — not rules. Rules remain in Gameplay.

### 2.2 Player Understanding

Players should understand an asset's **role** before interaction when possible. AB2 systems are designed so repeated exposure teaches — per [GP3.1](../01_Game_Design/Gameplay/GP3/GP3.1_Puzzle_Taxonomy.md) taxonomy discipline.

**Primary question test:** Each system answers exactly one primary player question (see [Asset System Validation](#asset-system-validation)).

### 2.3 Readability

Readability is non-negotiable on mobile — one-handed sessions, partial attention, variable lighting. Silhouette, scale, contrast, and state differentiation must survive real play conditions — per [AB0 §2.4](AB0_Asset_Philosophy_Production_Principles.md#24-readability) and LLDL accessibility inheritance.

### 2.4 Consistency

Players learn categories once. Visual dialects must not multiply without taxonomy justification. Cross-world content inherits system families — per [AB1 §2.7](AB1_Production_Standards.md#27-consistency).

### 2.5 Production Philosophy

Purpose-driven briefs, approved masters, traceable lineage, explicit approval — per AB1. No in-world asset ships without declared system membership and reviewer sign-off.

### 2.6 Scalability

Systems absorb new worlds and levels without structural reinvention. Production invests in **families** — not isolated hero pieces — per [AB1 §5](AB1_Production_Standards.md#5-sustainable-production).

### 2.7 System Thinking

Each AB2 section defines a **production system** — shared rules, shared families, shared validation — not a flat asset list.

### 2.8 Reuse

Modular ruins, repeatable motifs, variant-friendly puzzle parts, and feedback templates reduce regression risk when content grows.

### 2.9 Asset Families

Families group assets by **communicative role** and **visual lineage**. New content extends families before inventing parallel categories.

### Asset System Validation

Before any system is considered complete, it must satisfy:

1. **One primary player question** — the system has a single communicative job
2. **One production responsibility** — ownership and approval path are clear
3. **No overlap** — boundaries with sibling systems are explicit
4. **Scalable structure** — future content fits without redefining the system
5. **Inheritance** — Vision, Gameplay, LLDL, AB0, AB1 are referenced — never redefined

---

## 3. Explorer Assets

**Primary player question:** *Who is moving through the plan, and where are they now?*

### Gameplay Responsibility

Explorer assets represent the **player's committed agent** during path execution — the visible embodiment of a planned route. They anchor the Draw Your Fate loop: study → plan → commit → watch consequences.

This system serves **agency visibility** — the explorer is present, legible, and state-readable — without granting real-time steering during core execution ([GP1](../01_Game_Design/Gameplay/GP1_Player_Explorer.md)).

### Player Expectations

Players expect the explorer to:

- Be immediately identifiable against environment and puzzle noise
- Read as a **deliberate wanderer**, not an action avatar
- Show clear position and movement along the committed path
- Reflect outcome states (waiting, moving, success moment, failure moment) without confusion
- Feel belonging to the ancient temple world — not a generic mobile mascot

### Readability Principles

- **Silhouette first** — recognizable at maze scale on device
- **State clarity** — idle, traversing, interacting, success, failure are distinguishable
- **Contrast discipline** — explorer must not disappear into floor or wall families
- **Motion restraint** — movement reads as execution of plan, not player twitch control
- **Scale consistency** — explorer size relative to tiles remains stable across chambers

### Production Principles

- Explorer identity is a **controlled family** — limited variants, not unlimited costumes at MVP
- Presentation states are produced as a **set** — not single-pose illustrations
- Explorer assets inherit LLDL character presentation — AB2 specifies production boundaries only
- Explorer must not carry gameplay-critical information that belongs to puzzle or collectible systems
- Approval requires validation **on maze board** — not illustration canvas alone

### Asset Categories

| Category | Responsibility |
|----------|----------------|
| **Core explorer presentation** | Default in-world appearance |
| **Traversal presentation** | Movement along path execution |
| **Interaction presentation** | Moments at puzzle/collectible contact — visual only |
| **Outcome presentation** | Success, failure, and pause-adjacent states |
| **Identity accents** | Subtle world-appropriate variation within family limits |

Categories describe **roles** — not a character roster or equipment catalogue.

### Library & Reuse Strategy

- One **canonical explorer family** anchors all worlds at MVP
- Future worlds extend through **material accents and ceremonial details** — not new silhouettes
- Animation-ready state sets are modular — new states attach to existing rig/logic presentation
- AI-assisted exploration imagery must converge on approved family references (AB5)
- Variants require taxonomy justification — "new explorer" is not a default content request

---

## 4. Environment Assets

**Primary player question:** *What space am I in, and where can movement happen?*

### Gameplay Responsibility

Environment assets define the **readable structure of the labyrinth** — floors, walls, chambers, ruins, portals, and navigation surfaces that players study before drawing a path.

This system supports **spatial comprehension** and traversal legibility — per [WS3](../02_Design_System/LLDL/WS3_Environment_Language.md) environmental hierarchy. It does not define maze generation rules or path validation ([GP2](../01_Game_Design/Gameplay/GP2_Movement_System.md)).

### Player Expectations

Players expect environments to:

- Read as **ancient temple ruins** with navigable clarity
- Distinguish walkable from non-walkable at a glance
- Reveal chamber boundaries, entrances, and exits without UI dependency
- Support partial information and discovery without unfair concealment of mechanical truth
- Feel cohesive across levels within a world — not random biome noise

### Readability Principles

- **Traversal graph visible** — walls, openings, and corridors communicate before ornament
- **Spatial hierarchy** — foreground play space vs background depth is intentional
- **Material families** — stone, metal, crystal, vegetation read consistently
- **Scale rhythm** — architectural modules repeat; players learn proportions
- **Atmosphere supports** — mood never obscures walkable truth

### Production Principles

- Environment production is **modular** — tileable surfaces, repeatable arch modules, chamber kits
- Navigation-critical surfaces are approved **before** heavy set dressing
- Biome variation extends **families** — per WS3 biome consistency rules
- Environment assets do not embed puzzle logic visuals — those belong to Puzzle Assets
- Validation occurs in **representative maze layouts** — not isolated texture swatches

### Asset Categories

| Category | Responsibility |
|----------|----------------|
| **Traversal surfaces** | Floors, paths, walkable ground treatment |
| **Boundary structures** | Walls, barriers, cliff faces, sealed passages |
| **Chamber architecture** | Rooms, halls, alcoves, structural framing |
| **Ruin construction** | Broken masonry, ancient tech seams, civilizational motifs |
| **Navigation landmarks** | Distinctive structural reads that aid orientation |
| **Portal & threshold treatment** | Entry/exit visual framing — not UI |
| **Biome identity modules** | World-specific architectural extensions |

### Library & Reuse Strategy

- **Chamber kits** compose levels — designers assemble; artists maintain kits
- **Material libraries** per world — limited palette, deep variation
- **Modular scale grid** — all environment pieces align to traversal grid philosophy
- Decorative density scales with performance and readability budgets — not arbitrary fill
- New worlds add **biome extension packs** — not parallel environment dialects

---

## 5. Puzzle Assets

**Primary player question:** *What can I change in the world, and what state is it in?*

### Gameplay Responsibility

Puzzle assets visualize **interactive world mechanisms** — devices the player reads and plans around. They express **state** (inactive, active, pending, satisfied, blocked) without defining resolution rules.

Behaviour belongs to [GP3.3](../01_Game_Design/Gameplay/GP3/GP3.3_Interactive_Elements.md) and related specs. AB2 governs **how interactive elements look and are produced** as a system.

### Player Expectations

Players expect puzzle assets to:

- Look **operable** — ancient machinery, not modern widgets
- Show state changes clearly after commitment and during execution
- Feel fair — states readable before and after interaction
- Belong to learnable categories (plates, gates, switches, rotators, etc.)
- Never disguise mechanical identity as decoration

### Readability Principles

- **State multichannel** — silhouette, material glow, symbol, and motion reinforce the same state
- **Category silhouette** — interactive types distinguishable at planning distance
- **Before/after legibility** — players can compare planned vs outcome states in replay learning
- **Hierarchy** — primary interactives outrank ambient detail
- **Consistency** — same category reads the same across worlds with biome skinning only

### Production Principles

- Puzzle assets are produced as **state families** — each mechanism includes all required visual states
- Interactive assets are validated **adjacent to traversal surfaces** and explorer scale
- Puzzle production follows AB1 approval states — exploratory greybox before final craft
- No new interactive **category** without Gameplay taxonomy alignment ([GP3.1](../01_Game_Design/Gameplay/GP3/GP3.1_Puzzle_Taxonomy.md))
- Puzzle assets must not duplicate collectible or hazard identity

### Asset Categories

| Category | Responsibility |
|----------|----------------|
| **Traversal modifiers** | Bridges, gates, doors, blockers — spatial state |
| **Activation devices** | Plates, switches, triggers — intent expression |
| **Transformation devices** | Rotators, sliders, movable structures — structural change |
| **Ancient machinery** | Composite devices, sealed mechanisms, power conduits |
| **Sequence indicators** | Visual order and progress markers — in-world, not UI |
| **Dependency visuals** | Paired elements that read as connected — appearance only |

### Library & Reuse Strategy

- **Mechanism families** per taxonomy class — biome reskins, not new silhouettes per level
- **State template sets** — each family documents required states upfront
- **Combination kits** — modular parts compose complex devices from approved primitives
- Puzzle library grows by **taxonomy extension** — not one-off exceptions
- AI variation generates **within family** — human approves against state template

---

## 6. Collectible Assets

**Primary player question:** *What can I gather, unlock, or discover here?*

### Gameplay Responsibility

Collectible assets visualize **rewards, keys, objectives, and optional discoveries** the player may route through. They express **presence and pickup identity** — not scoring rules or progression math.

Mechanical definitions live in [GP3.2](../01_Game_Design/Gameplay/GP3/GP3.2_Static_Traversal_Collectible_Elements.md) and [GP5](../01_Game_Design/Gameplay/GP5_Objectives_Completion.md). AB2 governs production consistency.

### Player Expectations

Players expect collectibles to:

- Read as **worth routing toward** — reward, key, relic, treasure hierarchy is learnable
- Distinguish required vs optional pickups when both are present
- Feel ceremonially significant — ancient rewards, not arcade coins
- Remain visible at planning distance when gameplay exposes them
- Celebrate pickup moment without obscuring next planning needs

### Readability Principles

- **Tier silhouette** — coins, gems, keys, relics, stars are distinct families
- **Placement contrast** — collectibles separate from floor noise and props
- **Optional vs required** — visual weight matches design intent without UI dependency
- **Discovery delight** — hidden finds use fair visual language — not invisible pixels
- **Pickup feedback boundary** — moment of collection may trigger Visual Feedback Assets — not duplicate collectible identity

### Production Principles

- Collectibles are **small number of families** with deep polish — not hundreds of variants
- Each family has **planning-scale** and **pickup-scale** validation
- Collectible craft inherits LLDL ceremonial accent discipline — AB2 sets production scope
- New collectible types require Gameplay and progression alignment before production
- Collectibles never mimic hazard or puzzle device silhouettes

### Asset Categories

| Category | Responsibility |
|----------|----------------|
| **Currency & minor rewards** | Coins, gems, stars — routable value |
| **Keys & access tokens** | Lock pairing identity |
| **Treasures & caches** | Session reward moments |
| **Relics & artifacts** | Progression and discovery highlights |
| **Objective markers** | Visual identity for goal objects — in-world |
| **Optional secrets** | Fairly discoverable bonus finds |

### Library & Reuse Strategy

- **Reward tier library** — consistent families across worlds
- **Ceremonial accent pool** — limited variants for rare finds
- **World flavor overlays** — biome materials on canonical silhouettes
- Relic and artifact presentation scales for **meta-game reveal** — AB2 governs in-world form; AB3 governs reveal UI if needed
- Expansion adds **meaningful tiers** — not reskins without progression role

---

## 7. World Props

**Primary player question:** *What story does this place tell without changing the puzzle?*

### Gameplay Responsibility

World props provide **atmospheric set dressing and environmental storytelling** — non-interactive objects that deepen the temple fantasy without altering traversal truth or puzzle state.

Props support **immersion and world identity** — per WS3 environmental storytelling. They must not smuggle mechanical affordances.

### Player Expectations

Players expect props to:

- Enrich the ruin fantasy — fallen statues, broken pillars, ancient inscriptions
- Stay **visually subordinate** to traversal and puzzle systems
- Never look like hidden interactives
- Reinforce world history without requiring lore UI to understand the level
- Increase depth without increasing cognitive load

### Readability Principles

- **Subordinate contrast** — props quieter than floors, walls, and interactives
- **Non-affordance** — prop silhouettes distinct from puzzle and collectible families
- **Density discipline** — clutter does not obscure path reading
- **Story at periphery** — narrative detail lives at edges and backgrounds
- **Repeat motifs** — civilization symbols reinforce identity — not random decoration

### Production Principles

- Props are **library items** — assembled, not bespoke per tile
- Hero props are rare — most dressing is modular and reusable
- Props pass **"interactive confusion" test** — reviewers ask if players will try to tap them
- Prop families align to WS3 material and scale rules
- Props are approved in **context clusters** — not single-object portfolio shots

### Asset Categories

| Category | Responsibility |
|----------|----------------|
| **Architectural fragments** | Broken columns, debris, rubble |
| **Ritual & ceremonial objects** | Altars, bowls, inscriptions — non-interactive |
| **Ancient tech remnants** | Dormant conduits, inactive panels — non-operable |
| **Flora & natural intrusion** | Roots, moss, water — atmosphere |
| **Ambient clutter** | Scatter objects at low gameplay weight |
| **Environmental storytelling focal** | Rare narrative highlights |

### Library & Reuse Strategy

- **Prop scatter libraries** per biome — combinable sets
- **Density tiers** — light, medium, ceremonial — for performance and readability
- **Motif reuse** — same civilization symbols across worlds
- Props never become a parallel puzzle vocabulary
- AI-generated dressing converges on approved scatter families

---

## 8. Visual Feedback Assets

**Primary player question:** *What just happened, and how do I know?*

### Gameplay Responsibility

Visual feedback assets communicate **state changes, interactions, pickups, hazards, and environmental reactions** during and after path execution — in-world and adjacent to play, not in HUD chrome.

They support [GP6 — Gameplay Feedback](../01_Game_Design/Gameplay/GP6_Gameplay_Feedback.md) **visually** — without defining feedback rules or timing.

### Player Expectations

Players expect feedback to:

- Confirm interactions and pickups clearly
- Warn of danger **fairly** — readable before commitment when rules require
- Feel ancient and energetic — not arcade particle spam
- Subside quickly — calm tension returns after the moment
- Never replace puzzle state reading on the device itself

### Readability Principles

- **One primary feedback read per moment** — no competing effects
- **Color role discipline** — energy and danger colors inherit LLDL — AB2 does not redefine palettes
- **Scale appropriate** — feedback visible but not screen-filling
- **Temporal restraint** — effects support comprehension, not spectacle loops
- **Category consistency** — pickup, hazard, activation, and success feedback are distinct families

### Production Principles

- Feedback assets are **template families** — parameterized, not one-off explosions per level
- Templates are validated **on device** with explorer and puzzle context
- Hazard feedback must pass fairness review against GP4 — appearance supports, never invents, hazard logic
- Feedback production is subordinate to puzzle/collectible **state assets** — effects accent, not replace
- Approval includes **reduced motion** consideration — per WS9 inheritance at production layer

### Asset Categories

| Category | Responsibility |
|----------|----------------|
| **Interaction confirmation** | Switches, plates, devices acknowledge activation |
| **Pickup & reward** | Collection spark, seal moments — brief |
| **Hazard communication** | Danger read, cycle hint, impact moment — fair |
| **Traversal feedback** | Footfall, dust, energy trace along path — subtle |
| **Environmental reactions** | Dust, debris, light pulse — chamber response |
| **Completion accents** | Local success bursts — not full-screen UI replacement |

### Library & Reuse Strategy

- **Effect template library** — mix-and-match within LLDL motion discipline
- **Intensity tiers** — subtle, standard, ceremonial — for moment importance
- **Loop avoidance** — templates designed to complete and release
- World-specific feedback is **skinning** — not new effect vocabulary per level
- AB5 may accelerate template iteration — AB2 defines families and validation standards

---

## 9. Supporting System Assets

**Primary player question:** *What in-world guidance helps me plan without solving the puzzle?*

### Gameplay Responsibility

Supporting system assets are **non-UI informational visuals** embedded in the playable world — markers, hints, tutorials-in-world, and guidance that aid learning without replacing player agency.

They support teaching and orientation — per GP6 feedback philosophy. They must not cross into HUD territory (AB3).

### Player Expectations

Players expect supporting assets to:

- Clarify **orientation** — start, goal direction, chamber purpose hints
- Teach **categories once** — not spam repeated tutorials
- Feel diegetic — carved markers, ancient glyphs, temple lighting cues
- Respect intelligence — guide without giving solutions
- Disappear or quiet down as mastery grows when design allows

### Readability Principles

- **Diegetic priority** — guidance looks like world artifacts, not floating UI
- **Progressive disclosure** — early levels may show more; mastery worlds show less
- **Distinct from puzzles** — markers must not look operable
- **Distinct from collectibles** — guidance must not look like rewards
- **Spoiler discipline** — hints reveal structure, not optimal paths

### Production Principles

- Supporting assets are **sparse by default** — added with pedagogical justification
- Marker families align to LLDL symbolic discipline — not generic arrows
- Production requires **level-design brief** citing learning intent
- Supporting assets reviewed for **dependency on text** — prefer universal reads
- Removal plan documented — guidance assets may sunset in later worlds

### Asset Categories

| Category | Responsibility |
|----------|----------------|
| **Orientation markers** | Start, goal, chamber entry emphasis |
| **Tutorial-in-world** | First-encounter category teaching |
| **Progress indicators** | Sequence position, objective proximity — visual |
| **Danger hints** | Fair warning visuals — not hazard themselves |
| **Discovery teases** | Optional path suggestion — subtle |
| **Mastery stripping** | Reduced guidance variants for advanced content |

### Library & Reuse Strategy

- **Guidance tier library** — heavy, light, absent — per progression
- **Symbol set** small and disciplined — grows slowly
- **World-specific carving styles** — skin on canonical marker shapes
- Supporting assets are first candidates for **retirement** when player base masters systems
- AI must not invent new guidance vocabulary without design review

---

## 10. Conclusion

### 10.1 How Systems Work Together

Playable-world production is an **orchestrated stack**:

```text
Environment (space) → Puzzle + Collectible (meaning) → Explorer (agent)
        ↓                      ↓                           ↓
   World Props (story)   Visual Feedback (moments)   Supporting (guidance)
```

Environment establishes readable space. Puzzle and Collectible systems encode plan-relevant meaning. Explorer assets anchor execution. Props deepen identity without competing. Feedback confirms moments. Supporting assets teach without solving.

No system may absorb another's primary question.

### 10.2 Gameplay Support

AB2 systems exist so players can **study, commit, and learn** — the core loop from [Vision](../00_Project/Vision.md) and [Gameplay](../01_Game_Design/Gameplay/Gameplay.md). Every production decision should strengthen planning clarity, not reflex reaction.

### 10.3 Inheritance Summary

| Authority | AB2 inherits by… |
|-----------|------------------|
| **Vision** | Premium craft, player respect, timeless worlds |
| **Gameplay** | Communicating affordances — not defining rules |
| **LLDL / WS3** | Producing environmental and visual meaning — not inventing it |
| **AB0** | Philosophy of readability, reuse, and discipline |
| **AB1** | Governance, approval, libraries, and validation standards |

### 10.4 Future Workshops

| Workshop | Extends AB2 by… |
|----------|-----------------|
| **AB3** | UI, HUD, icons — outside playable-world chrome |
| **AB4** | Marketing and store surfaces — public-facing consistency |
| **AB5** | AI pipeline detail for family-constrained generation |
| **AB6** | Formal lifecycle gates and metrics atop AB1 state model |

AB2 remains authoritative for **in-world system boundaries** unless Human-approved exceptions record otherwise.

---

## 11. Governance

### 11.1 Document Authority

AB2 is subordinate to Vision, Gameplay, LLDL, AB0, and AB1. It is authoritative for playable-world asset system specifications.

### 11.2 Document Lifecycle

| State | Meaning |
|-------|---------|
| **Draft** | Active authorship |
| **Ready for Review** | Complete draft in review package |
| **Approved** | Reviewer acceptance |
| **Approved — Locked** | Human-locked; changes require version bump |

AB2 should normally be approved and locked after AB1 to preserve Asset Bible dependency order. Exceptions require explicit Human approval.

### 11.3 Review Methodology

Follow LLDS compiler workflow — review package, Codex, ChatGPT, Human approval. See [99_Reviews](../99_Reviews/README.md).

---

## 12. What AB2 Must Not Do

AB2 must **not**:

- Define gameplay rules, puzzle logic, movement, objectives, or failure resolution
- Redefine LLDL art direction, color palettes, lighting, motion, or typography
- Specify UI, HUD, brand, marketing, or store assets
- List exhaustive asset inventories or per-level asset manifests
- Define naming syntax, folder trees, export settings, resolutions, or software workflows
- Contain AI prompt templates (AB5) or formal QA gate metrics (AB6)
- Duplicate AB0 or AB1 prose — reference and apply instead

---

## 13. Workshop Conclusions

AB2 — Game Assets records the following workshop conclusions for review:

| # | Conclusion |
|---|------------|
| 1 | Seven playable-world asset systems cover all in-world visual production domains |
| 2 | Each system answers one primary player question and owns one production responsibility |
| 3 | System boundaries prevent overlap between puzzle, collectible, prop, and guidance assets |
| 4 | Production is family- and library-based — scalable across worlds and contributors |
| 5 | Gameplay and LLDL meaning are supported — never redefined — by AB2 specifications |
| 6 | AB0 and AB1 governance applies to every system without restatement |
| 7 | UI, marketing, AI pipeline, and lifecycle detail belong to AB3–AB6 |
| 8 | Validation requires in-context review — maze scale, not portfolio isolation |
| 9 | AI-assisted production must converge on approved families — not invent categories |
| 10 | AB2 locks after Human approval; downstream workshops inherit system boundaries |

---

## 14. Related Documents

### Locked authorities

- [Vision](../00_Project/Vision.md)
- [Gameplay](../01_Game_Design/Gameplay/Gameplay.md)
- [LLDL](../02_Design_System/LLDL/LLDL.md)

### Asset Bible

- [AB0 — Asset Philosophy](AB0_Asset_Philosophy_Production_Principles.md)
- [AB1 — Production Standards](AB1_Production_Standards.md)
- [AB3 — UI & Brand Assets](AB3_UI_Brand_Assets.md)
- [AB4 — Marketing & Store Assets](AB4_Marketing_Store_Assets.md)
- [AB5 — AI Production Pipeline](AB5_AI_Production_Pipeline.md)
- [AB6 — Review & Asset Lifecycle](AB6_Review_Asset_Lifecycle.md)
- [Asset Bible](Asset_Bible.md)
- [Asset Bible README](README.md)

### Gameplay reference

- [GP1 — Player Explorer](../01_Game_Design/Gameplay/GP1_Player_Explorer.md)
- [GP2 — Movement System](../01_Game_Design/Gameplay/GP2_Movement_System.md)
- [GP3 Series](../01_Game_Design/Gameplay/GP3/README.md)
- [GP6 — Gameplay Feedback](../01_Game_Design/Gameplay/GP6_Gameplay_Feedback.md)

### Design reference

- [WS3 — Environment Language](../02_Design_System/LLDL/WS3_Environment_Language.md)

### Governance

- [Decisions](../00_Project/Decisions.md)
- [99_Reviews](../99_Reviews/README.md)
