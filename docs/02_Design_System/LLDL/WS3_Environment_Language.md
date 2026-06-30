# WS3 — Environment Language

| Field | Value |
|-------|-------|
| **Project** | Labyrinth Legends |
| **Document Name** | WS3 — Environment Language |
| **Document ID** | LLDL-DOC-WS3-001 |
| **Series** | WS3 — Labyrinth Legends Design Language (LLDL) Environment Authority |
| **Version** | 1.0.0 |
| **Status** | Approved |
| **Owner** | Apoorv |
| **Prepared By** | ChatGPT (workshop) · Cursor (compiler) |
| **Last Updated** | 2026-06-30 |
| **Workshop** | WS3 — Environment Language |
| **Path** | `docs/02_Design_System/LLDL/WS3_Environment_Language.md` |
| **Dependencies** | [Vision](../../00_Project/Vision.md) · [WS0 — Design Philosophy](WS0_Design_Philosophy.md) · [WS1 — Visual Identity](WS1_Visual_Identity_Artistic_Direction.md) · [WS2 — Color Language](WS2_Color_Language.md) |
| **Related Documents** | [LLDL](../LLDL.md) · [Worlds](../../01_Game_Design/Worlds.md) · [Level Design](../../01_Game_Design/Level_Design.md) · [Game Bible](../../01_Game_Design/Game_Bible.md) |

## Navigation

| ← Previous | Next → | Index |
|------------|--------|-------|
| [WS3 — Environment Language](WS3_Environment_Language.md) | [WS4 — UI Language](WS4_UI_Language.md) | [Documentation Home](../../README.md) · [LLDL](../LLDL.md) |

---

## Version History

| Version | Date | Author | Summary |
|---------|------|--------|---------|
| 1.0.0 | 2026-06-30 | ChatGPT / Cursor | WS3 — Environment language authority for LLDL |

## Change Log

| Version | Change |
|---------|--------|
| 1.0.0 | Initial workshop record: environmental philosophy, architecture, spatial hierarchy, storytelling, readability, biome consistency, decision framework |

---

## Document Authority

**WS3 is the environment authority within the Labyrinth Legends Design Language (LLDL).**

| Conflict type | Authority |
|---------------|-----------|
| Product intent | [Vision](../../00_Project/Vision.md) wins |
| Design philosophy | [WS0 — Design Philosophy](WS0_Design_Philosophy.md) wins |
| Artistic identity (form, material, silhouette) | [WS1 — Visual Identity](WS1_Visual_Identity_Artistic_Direction.md) wins |
| Color meaning and application | [WS2 — Color Language](WS2_Color_Language.md) wins |
| Environmental construction, spatial language, world-building | **WS3 wins** |
| Biome data, level authoring, puzzle placement | [Worlds](../../01_Game_Design/Worlds.md) · [Level Design](../../01_Game_Design/Level_Design.md) — must align with WS3; WS3 does not define layouts |

WS3 extends Vision, WS0, WS1, and WS2. It does not override their authority domains. When environmental drama conflicts with WS0 readability or WS2 color hierarchy, the higher document prevails until [Decisions](../../00_Project/Decisions.md) records an explicit, Human-approved exception.

WS1 defines *what the world looks like*. WS2 defines *how color communicates within it*. **WS3 defines how spaces are built, layered, and read** as a coherent ruin across every biome and chamber.

---

## Intended Audience

| Role | Use this document to… |
|------|------------------------|
| Art Directors | Approve environmental direction before biome or chamber production |
| Environment Artists | Build ruins with shared architectural and spatial vocabulary |
| Level Designers | Author spaces that inherit environment language without redefining it |
| Concept Artists | Explore biomes within civilization identity constraints |
| Lighting Artists | Motivate light within environmental hierarchy — not as separate dialect |
| Prop Artists | Place objects with consistent scale, rhythm, and storytelling discipline |
| Illustrators & Marketing | Extend world identity into promotional environments |
| World Designers | Frame narrative geography without breaking architectural ancestry |
| Implementation Agents | Reject environmental directions that violate WS3 pillars or anti-patterns |

---

## Table of Contents

1. [Purpose of the Environment Language](#1-purpose-of-the-environment-language)
2. [Environmental Philosophy](#2-environmental-philosophy)
3. [World Identity](#3-world-identity)
4. [Ancient Civilization Language](#4-ancient-civilization-language)
5. [Architectural Principles](#5-architectural-principles)
6. [Environmental Storytelling](#6-environmental-storytelling)
7. [Spatial Hierarchy](#7-spatial-hierarchy)
8. [Chamber Identity](#8-chamber-identity)
9. [Traversal Readability](#9-traversal-readability)
10. [Environmental Composition](#10-environmental-composition)
11. [Environmental Layering](#11-environmental-layering)
12. [Structural Language](#12-structural-language)
13. [Material Placement Philosophy](#13-material-placement-philosophy)
14. [Environmental Scale & Proportion](#14-environmental-scale--proportion)
15. [Prop Philosophy](#15-prop-philosophy)
16. [Environmental Focal Points](#16-environmental-focal-points)
17. [Environmental Rhythm](#17-environmental-rhythm)
18. [Biome Consistency](#18-biome-consistency)
19. [Environmental Mood](#19-environmental-mood)
20. [Environmental Variety](#20-environmental-variety)
21. [Environmental Continuity](#21-environmental-continuity)
22. [Environmental Readability](#22-environmental-readability)
23. [Environmental Anti-Patterns](#23-environmental-anti-patterns)
24. [Design Decision Framework](#24-design-decision-framework)
25. [Summary](#25-summary)
26. [Workshop Conclusions](#26-workshop-conclusions)
27. [Related Documents](#27-related-documents)

---

## 1. Purpose of the Environment Language

Labyrinth Legends is experienced **inside ruins** — not above abstract puzzle grids. The environment language ensures every playable space reads as part of one forgotten civilization, regardless of biome skin or production phase.

WS3 answers:

> **How should a chamber feel, compose, and communicate before any specific puzzle or asset list is assigned?**

Without environmental authority, teams produce competent modular kits that fail to cohere. Chambers become interchangeable grey rooms. Biomes become hue swaps. Story dissolves into prop clutter. Premium identity collapses.

WS3 establishes the **permanent spatial and architectural contract** for world-building — inherited from [WS0](WS0_Design_Philosophy.md), [WS1](WS1_Visual_Identity_Artistic_Direction.md), and [WS2](WS2_Color_Language.md), then extended into environment-specific rules.

### Scope

WS3 governs environmental **philosophy**, **composition**, **hierarchy**, **storytelling**, and **consistency**. Individual level layouts, puzzle placement, and asset catalogues belong in downstream game design and production documents.

### Design Intent

Ensure every space feels excavated from the same world — not assembled from unrelated kits.

---

## 2. Environmental Philosophy

The environmental philosophy of Labyrinth Legends rests on four beliefs.

### Belief 1 — The Ruin Is the Game

Players do not navigate abstract boards. They navigate **temple space**. Environment is not backdrop; it is the primary frame of experience.

### Belief 2 — Architecture Carries Meaning

Walls, thresholds, and focal structures communicate **purpose, history, and hierarchy** before any object is placed. Space itself teaches.

### Belief 3 — Clarity Is Sacred

Atmospheric mystery must not erase **spatial readability**. WS0 readability philosophy applies to every floor plane, wall plane, and focal frame.

### Belief 4 — One Civilization, Many Expressions

Biomes express **geology, climate, and decay** — not parallel fantasy genres. Variety serves identity; it does not replace it.

### Environmental Thesis

> Every chamber is a room the civilization built for a reason — later broken by time, still legible to those who study before acting.

### Design Intent

Anchor all environment work in ruin intelligence — consistent with Draw Your Fate exploration fantasy in [Vision](../../00_Project/Vision.md).

---

## 3. World Identity

The world of Labyrinth Legends is the **aftermath of ritual architecture fused with mystical systems** — temples that functioned as instruments, now dormant until disturbed.

### World Qualities

- **Forgotten** — no living civilization maintains the spaces
- **Intentional** — layouts feel designed, not natural caverns with props
- **Layered** — history visible through wear, collapse, and reactivation
- **Accessible mystery** — challenging without hostile chaos
- **Premium** — craft visible in composition and restraint

### Player Relationship to Space

The player is an **observer-planner** inside the ruin — not a conqueror reshaping it. Environments reward study. Scale emphasizes the civilization's ambition relative to human presence.

### World Identity Statement

> Vast temple complexes where stone memory and inscribed energy still respond to those who read the chamber correctly.

### Design Intent

Give world builders a single identity anchor independent of biome naming or level numbering.

---

## 4. Ancient Civilization Language

The civilization expressed power through **geometry, inscription, and permanent construction** — not through industrial machinery or modern infrastructure aesthetics.

### Civilizational Signatures

- Processional axes and threshold sequences
- Orthogonal chamber logic compatible with deliberate traversal study
- Radial focal sanctuaries and mechanism hubs
- Engraved metal integrated into stone — binding, sealing, framing
- Mystical conduits channeled through architecture — not floating holograms

### Cultural Restraint

Environments evoke archaeological gravity without copying a single real-world culture as costume. Motifs feel **ancient-original** — temple logic, sacred framing, worn grandeur.

### Decay as Character

Collapse is **structured** — fallen lintels, filled shafts, cracked but readable plans. Random rubble piles without architectural logic are out of identity.

### Design Intent

Ensure all biomes remain descendants of one builder culture — not genre mashups per world.

---

## 5. Architectural Principles

Architecture is the **primary environmental system**.

### Core Principles

- **Chamber as unit** — each playable space reads as a room with identity
- **Threshold discipline** — entrances and exits are framed events
- **Orthogonal clarity** — grid-aligned structure supports spatial study
- **Vertical depth** — pits, galleries, and shafts communicate scale
- **Focal framing** — mechanisms and sanctuaries sit within intentional architecture
- **Modular ancestry** — repeated stone vocabulary; unique chamber composition

### Architectural Typology (Environmental)

Environmental roles expressed through structure:

- **Compression** — narrow approaches heightening anticipation
- **Release** — expanded study floors for observation
- **Ceremony** — elevated framing for culmination spaces
- **Collapse** — time made structural; readable damage
- **Reactivation** — dormant architecture returning to luminous state

Specific level taxonomy belongs in level design documents. WS3 owns the **vocabulary**.

### Design Intent

Give environment artists structural rules that survive biome reskins.

---

## 6. Environmental Storytelling

Story lives in **placement, wear, and state** — not in exposition volumes.

### Storytelling Vectors

- **Wear paths** — polished steps, repeated touch on sacred edges
- **Incomplete restoration** — conflicting eras of repair optional and subtle
- **Dormant vs active zones** — energy state as historical present
- **Absence** — empty sockets, darkened conduits, sealed arches
- **Material transition** — where builders shifted stone type or method

### Storytelling Restraint

Environmental narrative **supports** curiosity; it does not obscure traversal hierarchy. Murals and relief remain subordinate to floor readability per WS0.

### Inference Over Display

The player should infer function from space — "this was a gate," "this was a vault" — without mandatory text.

### Design Intent

Align world art with explorer fantasy: intelligence through observation.

---

## 7. Spatial Hierarchy

Spatial hierarchy organizes **where attention belongs** in three dimensions.

### Hierarchy Layers

1. **Play surface** — primary floor plane where traversal is read
2. **Interactive structure** — mechanisms, gates, and state-bearing architecture
3. **Perimeter mass** — walls, columns, enclosing geometry
4. **Atmospheric depth** — background vaults, pits, distant arches
5. **Sky and void** — upper darkness or distant ceiling — subordinate framing

Lower-priority layers must not chromatically or structurally overpower layer 1–2. Color hierarchy from [WS2](WS2_Color_Language.md) applies within this spatial stack.

### Vertical Hierarchy

- Floor = comprehension
- Mid-height = mechanism and frame
- Upper volume = atmosphere and scale

### Design Intent

Prevent beautiful ceiling detail from destroying floor legibility — a common environment art failure mode.

---

## 8. Chamber Identity

Every chamber requires **distinct identity** within shared vocabulary.

### Identity Components

- **Silhouette** — recognizable shape at thumbnail
- **Focal anchor** — one primary architectural event
- **Material accent** — controlled metal or energy presence
- **Atmospheric signature** — dust, depth, or moisture character
- **Rhythmic motif** — repeating module with one unique break

### Identity Without Chaos

Distinct chambers do not require new architectural dialects. Identity emerges from **composition and focal choice** — not from random prop genre shifts.

### Teaching Chambers

Early chambers simplify identity components for learning. Later chambers combine them — still readable through hierarchy.

### Design Intent

Support variety across hundreds of spaces without fragmenting civilization identity.

---

## 9. Traversal Readability

Traversal readability is the environmental obligation to make **where movement is possible** spatially comprehensible.

### Readability Principles

- Floor plane remains visually distinct from walls at rest
- Traversable graph area avoids decorative noise competing with path expression
- Height changes — steps, pits, bridges — read clearly through value and edge
- Blocked vs open passage distinguishable without relying on color alone
- Vertical discontinuities framed — player understands drop or rise before commitment

### Environmental Support

WS3 defines the **spatial conditions** traversal requires. Movement rules belong in gameplay documents. Environment must not work against them through ambiguous geometry.

### Design Intent

Bridge environment art and Draw Your Fate planning fantasy without defining mechanics.

---

## 10. Environmental Composition

Composition arranges architectural masses within the chamber frame.

### Compositional Principles

- **Clear play field** — central or gridded floor with intentional margin
- **Asymmetric balance** — focal weight offset by atmospheric mass
- **Leading architecture** — arches, aisles, and conduits direct gaze
- **Negative space** — premium craft allows breathing room; clutter is not richness
- **Edge restraint** — periphery darker and simpler; center carries function

### Framing Events

Thresholds, exits, and mechanism housings sit at **compositional anchors** — not accidental wall placements.

### Design Intent

Give environment leads a shared compositional method for blockouts and paint-overs.

---

## 11. Environmental Layering

Environments read in **layers** — spatial, material, and atmospheric.

### Layer Model

**Structure layer** — immutable architecture: walls, floors, primary frames.

**Inscription layer** — metal, carved relief, sigils, conduit channels.

**Activation layer** — emissive energy states tied to mystical systems per WS1 and WS2.

**Story layer** — wear, breakage, optional mural, sediment.

**Atmosphere layer** — dust, haze, distant depth — never replaces structure.

Layers stack predictably across biomes. Skipping structure for atmosphere fails identity.

### Design Intent

Standardize how artists phase detail without losing hierarchy.

---

## 12. Structural Language

Structural language is the **repeatable grammar** of built forms.

### Primary Elements

- Lintels and arch frames
- Stepped platforms and plinths
- Column and pier rhythm
- Recessed panels and niches
- Conduit channels and portal rings
- Balustrades and low barriers readable as edges

### Joint Logic

Stone meets stone with **construction credibility** — seams, caps, and courses suggest build order. Floating slabs without support read as errors unless explicitly mystical and framed.

### Design Intent

Enable modular kits that still feel architecturally authored.

---

## 13. Material Placement Philosophy

Materials follow **role**, not random distribution — aligned with [WS1](WS1_Visual_Identity_Artistic_Direction.md) and [WS2](WS2_Color_Language.md).

### Placement Rules

- **Stone** — dominant mass; local geology may shift temperature, not identity
- **Engraved metal** — thresholds, seals, mechanism frames, reward niches
- **Crystal** — rare focal inserts; never scattered as confetti
- **Energy** — channel interiors, cores, portals — localized per WS2
- **Organic staining** — accent only; subordinate to masonry

### Material Hierarchy

If every surface is metal or glowing, nothing is significant. Material escalation marks **importance**.

### Design Intent

Prevent environment teams from over-accenting treasure-chamber aesthetics in every room.

---

## 14. Environmental Scale & Proportion

Scale communicates **civilizational ambition** and **player vulnerability**.

### Scale Principles

- Explorer remains human-scale against monumental architecture
- Doorframes, steps, and mechanism housings maintain readable proportions
- Monumental scale appears in **volume and height** — not by shrinking interactables below readability
- Pit depth and vault height express awe without breaking camera comprehension
- Repetition of module sizes creates rhythm; variation marks special chambers

### Compression and Release

Low ceilings create intimacy before expansive sanctuaries. Scale shifts are **emotional punctuation** — not arbitrary per room.

### Design Intent

Maintain WS1 scale philosophy in environmental production terms.

---

## 15. Prop Philosophy

Props extend architecture — they do not replace it.

### Prop Roles

- **Structural echo** — broken column, fallen statue fragment reinforcing civilization
- **Mechanism support** — housings, levers, plates integrated into masonry
- **Story residue** — abandoned tools, empty braziers, ceremonial objects
- **Atmospheric accent** — chains, roots, sediment — minimal

### Prop Discipline

- Props inherit architectural scale and material language
- Props cluster with **intent** — not uniform scatter
- Hero props are few; generic clutter is forbidden
- Props must not destroy traversal silhouette on the play floor

### Design Intent

Keep chambers temple spaces — not prop warehouses.

---

## 16. Environmental Focal Points

Every chamber requires a **primary focal point** — architectural, not decorative noise.

### Focal Types

- Exit sanctuary frame
- Central mechanism hub
- Portal or shaft threshold
- Collapse event marking time
- Optional discovery niche — subordinate focal

### Focal Hierarchy

One primary focal per chamber. Secondary focal points support — they do not compete at equal visual weight.

### Focal and Color

Warm ceremonial emphasis and cool activation per WS2 appear at focal architecture — not uniformly across all walls.

### Design Intent

Give directors a clear approval criterion: "What is this room about?"

---

## 17. Environmental Rhythm

Rhythm is the **paced repetition** of architectural elements across space and progression.

### Rhythmic Tools

- Column spacing and panel repetition
- Step module cadence
- Conduit line continuity
- Light beam interval in dust
- Chamber-to-chamber alternation of compression and release

### Rhythm Guardrails

Monotonous identical chambers fatigue. Chaotic unrelated chambers fracture identity. Rhythm is **variation within module** — familiar stone grammar, distinct composition.

### Macro Rhythm

Across worlds, environmental rhythm may intensify vertical depth, inscription density, or atmospheric weight — without abandoning core structural language.

### Design Intent

Support long-session play without visual monotony or identity drift.

---

## 18. Biome Consistency

Biomes modulate **geology, climate residue, and decay character** — not civilization ancestry.

### Biome May Change

- Stone color temperature and grain
- Moisture, roots, and mineral staining intensity
- Atmospheric density and particulate character
- Frequency of collapse and sediment

### Biome May Not Change

- Core architectural grammar and threshold logic
- Material role hierarchy from WS1 and WS2
- Orthogonal chamber readability standards
- Mystical technology placement philosophy — inscribed, channeled, restrained

### Biome as Skin on Structure

A desert ruin and a sunken ruin share **lintels, frames, and conduit logic**. They differ in weathering — not in genre.

### Design Intent

Enable world variety without parallel art directions per biome.

---

## 19. Environmental Mood

Environmental mood expresses **calm tension** through space — aligned with WS0 emotional targets.

### Mood Qualities

- **Stillness** — ruins hold breath before player commitment
- **Weight** — stone mass visible in light and shadow
- **Anticipation** — thresholds and depth imply consequence
- **Reverence** — grandeur without oppressive horror
- **Clarity** — mood never dissolves spatial comprehension

### Mood Anti-Targets

- Frantic strobe atmosphere
- Comedy scale distortion
- Oppressive horror gore environments
- Arcade carnival lighting in world space

### Design Intent

Ensure atmosphere supports puzzle-adventure tone — not action or horror genres.

---

## 20. Environmental Variety

Variety prevents fatigue; consistency prevents identity loss. WS3 holds both.

### Variety Dimensions

- Chamber silhouette and focal type
- Vertical section — sunken, level, raised
- Inscription density and mechanism presence
- Atmospheric character — dry dust vs cool moisture
- Collapse vs intact preservation state

### Variety Ceiling

New variety must map to existing **structural and material vocabulary**. If a proposal requires a new architectural dialect, escalate per change control.

### Design Intent

Give producers a vocabulary for scoped variety without open-ended art exploration.

---

## 21. Environmental Continuity

Continuity connects chambers into **believable complexes** — even when abstracted for play.

### Continuity Signals

- Repeated motif families across adjacent spaces
- Consistent module scale and stone type within a complex
- Logical threshold directionality — compression leading to release
- Energy conduit continuity where fiction implies connection
- Wear and damage patterns that suggest shared history

### Continuity vs Abstraction

Play may abstract connection between chambers. Visual language still implies **one ruin**, not disconnected arenas.

### Design Intent

Support world map fantasy and marketing wide shots showing coherent complexes.

---

## 22. Environmental Readability

Environmental readability is the **functional test** of every chamber art pass.

### Readability Checklist (Environmental)

- Play floor separable from walls at glance
- Primary focal identifiable at thumbnail
- Traversal area free of camouflaging ornament on the floor plane
- Structural hazards and edges perceptible without alarm aesthetics
- State change visible in architecture or localized energy per WS2
- Atmospheric effects do not flatten value hierarchy

### Readability Precedence

When cinematic atmosphere and readability conflict, **readability wins** unless Human-approved learnable exception is documented.

### Design Intent

Operationalize WS0 readability for environment review gates.

---

## 23. Environmental Anti-Patterns

### Identity Anti-Patterns

- Natural cave kits with token stone props — no architectural intention
- Sci-fi corridor modules in temple chambers
- Generic fantasy dungeon grey without material hierarchy
- Biome reskin that replaces all masonry with organic overgrowth
- Floating platforms without architectural motivation

### Spatial Anti-Patterns

- Flat featureless boxes with wallpaper detail
- Ceiling-heavy detail destroying floor read
- Uniform prop scatter without clusters or purpose
- Multiple competing focal points at equal weight
- Scale chaos — tiny doors, giant steps, arbitrary monument inserts

### Craft Anti-Patterns

- Photoreal grit without compositional hierarchy
- Overgrown ivy hiding all readable edges
- Lava rivers and neon waterfalls as default hazard decoration
- Marketing key art architecture absent from actual chamber vocabulary

### Design Intent

Give environment reviews explicit rejection language.

---

## 24. Design Decision Framework

### Evaluation Sequence

1. **Vision alignment** — Does space support explorer fantasy and premium craft?
2. **WS0 alignment** — Does environment respect readability and calm tension?
3. **WS1 alignment** — Does architecture inherit artistic identity and pillars?
4. **WS2 alignment** — Does color placement follow environmental hierarchy?
5. **Civilization identity** — Does this read as the same builders?
6. **Spatial hierarchy** — Is play surface primary?
7. **Chamber identity** — Is focal point clear and unique within module vocabulary?
8. **Traversal readability** — Is movement space comprehensible?
9. **Restraint** — Are props, detail, and atmosphere earned?
10. **Timelessness** — Will this remain defensible after production trends change?

### Outcomes

- **Approve** — proceed to biome or level authoring
- **Revise** — adjust composition, hierarchy, or material placement
- **Reject** — cite anti-pattern or pillar violation
- **Escalate** — Human approval for new structural dialects

### Design Intent

Make environment approval repeatable across directors and vendors.

---

## 25. Summary

Labyrinth Legends environments are **intentional temple chambers** — monumental, readable, and archaeologically credible — expressing one ancient civilization across varied biomes.

**WS3 establishes that:**

- Environment is the primary frame of play, not backdrop
- Architecture carries meaning before props or effects
- Spatial hierarchy privileges the play surface and focal structure
- Environmental storytelling uses wear, state, and absence — not exposition
- Traversal readability is an environmental obligation
- Layering, rhythm, and composition create premium restraint
- Biomes vary weathering and atmosphere — not civilization grammar
- Continuity and variety coexist through modular ancestry
- Anti-patterns protect against dungeon kits and spatial chaos

Downstream biome definitions, level themes, and asset libraries inherit WS3 — they do not redefine it.

---

## 26. Workshop Conclusions

WS3 — Environment Language Workshop records the following locked conclusions:

| # | Conclusion |
|---|------------|
| 1 | WS3 is the environment authority within LLDL, subordinate only to Vision, WS0, WS1, and WS2 |
| 2 | The ruin is the game — environment is primary frame, not wallpaper |
| 3 | Architecture is the primary identity carrier; props extend, not replace |
| 4 | Spatial hierarchy privileges play surface, then interactive structure, then atmosphere |
| 5 | Chambers require distinct identity within shared structural vocabulary |
| 6 | Traversal readability is mandatory at environmental authoring time |
| 7 | Material and color placement follow WS1 and WS2 role hierarchy |
| 8 | Biomes modulate geology and decay — not civilization grammar |
| 9 | Environmental storytelling is inference through wear and state |
| 10 | Future biome, prop, and level theme docs must inherit WS3 without parallel dialects |

### Design Intent

Freeze workshop outcomes before biome catalogues and environment production guides are authored.

---

## 27. Related Documents

### Upstream

- [Vision](../../00_Project/Vision.md)
- [WS0 — Design Philosophy](WS0_Design_Philosophy.md)
- [WS1 — Visual Identity & Artistic Direction](WS1_Visual_Identity_Artistic_Direction.md)
- [WS2 — Color Language](WS2_Color_Language.md)

### Downstream

- [WS4 — UI Language](WS4_UI_Language.md) — UI authority
- [LLDL](../LLDL.md) — Design language specification
- [Worlds](../../01_Game_Design/Worlds.md) — World structure and biome framing
- [Level Design](../../01_Game_Design/Level_Design.md) — Chamber authoring conventions
- [Game Bible](../../01_Game_Design/Game_Bible.md) — Narrative world tone

### Governance

- [Decisions](../../00_Project/Decisions.md)
- [Roadmap](../../00_Project/Roadmap.md)

---

## Navigation

| ← Previous | Next → | Index |
|------------|--------|-------|
| [WS3 — Environment Language](WS3_Environment_Language.md) | [WS4 — UI Language](WS4_UI_Language.md) | [Documentation Home](../../README.md) · [LLDL](../LLDL.md) |
