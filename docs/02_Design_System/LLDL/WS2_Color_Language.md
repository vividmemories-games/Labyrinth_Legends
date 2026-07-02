# WS2 — Color Language

| Field | Value |
|-------|-------|
| **Project** | Labyrinth Legends |
| **Document Name** | WS2 — Color Language |
| **Document ID** | LLDL-DOC-WS2-001 |
| **Series** | WS2 — Labyrinth Legends Design Language (LLDL) Color Authority |
| **Version** | 1.0.0 |
| **Status** | Approved |
| **Owner** | Apoorv |
| **Prepared By** | ChatGPT (workshop) · Cursor (compiler) |
| **Last Updated** | 2026-06-30 |
| **Workshop** | WS2 — Color Language |
| **Path** | `docs/02_Design_System/LLDL/WS2_Color_Language.md` |
| **Dependencies** | [Vision](../../00_Project/Vision.md) · [WS0 — Design Philosophy](WS0_Design_Philosophy.md) · [WS1 — Visual Identity](WS1_Visual_Identity_Artistic_Direction.md) |
| **Related Documents** | [LLDL](LLDL.md) · [Colors](../Colors.md) · [Accessibility](../Accessibility.md) · [Game Bible](../../01_Game_Design/Game_Bible.md) |

## Navigation

| ← Previous | Next → | Index |
|------------|--------|-------|
| [WS2 — Color Language](WS2_Color_Language.md) | [WS3 — Environment Language](WS3_Environment_Language.md) | [Documentation Home](../../README.md) · [LLDL](LLDL.md) |

---

## Version History

| Version | Date | Author | Summary |
|---------|------|--------|---------|
| 1.0.0 | 2026-06-30 | ChatGPT / Cursor | WS2 — Color language authority for LLDL |

## Change Log

| Version | Change |
|---------|--------|
| 1.0.0 | Initial workshop record: color philosophy, semantic roles, gameplay communication, palettes, accessibility, consistency, decision framework |

---

## Document Authority

**WS2 is the color authority within the Labyrinth Legends Design Language (LLDL).**

| Conflict type | Authority |
|---------------|-----------|
| Product intent | [Vision](../../00_Project/Vision.md) wins |
| Design philosophy | [WS0 — Design Philosophy](WS0_Design_Philosophy.md) wins |
| Artistic identity (form, material, silhouette) | [WS1 — Visual Identity](WS1_Visual_Identity_Artistic_Direction.md) wins |
| Color meaning, application, and communication | **WS2 wins** |
| Numerical color values and token implementation | [Design_Tokens](../Design_Tokens.md) · [Colors](../Colors.md) — must align with WS2 semantic roles |
| Component styling | [Components](../Components.md) · [LLDL](LLDL.md) — must implement WS2 roles without redefining them |

WS2 extends Vision, WS0, and WS1. It does not override their non-color authority. When color communication conflicts with WS0 readability or WS1 material identity, the higher document prevails until [Decisions](../../00_Project/Decisions.md) records an explicit, Human-approved exception.

WS0 defines *why* color carries meaning. WS1 defines *how materials and light express identity*. **WS2 defines what colors mean and where they belong** across every surface of the product.

---

## Intended Audience

| Role | Use this document to… |
|------|------------------------|
| Art Directors | Approve palette direction and semantic color usage across disciplines |
| Environment Artists | Apply environmental palettes without breaking gameplay readability |
| Lighting Artists | Coordinate motivated light color with identity and hierarchy |
| UI/UX Designers | Assign color roles that communicate without inventing parallel semantics |
| VFX Artists | Keep energy and particle color within mystical technology language |
| Illustrators & Marketing | Extend brand color logic into promotional materials |
| Level Designers | Understand how color supports puzzle communication at authoring time |
| Accessibility Reviewers | Verify critical distinctions exceed color-only encoding |
| Implementation Agents | Reject color usage that violates WS2 roles, hierarchy, or anti-patterns |

---

## Table of Contents

1. [Purpose of the Color Language](#1-purpose-of-the-color-language)
2. [Color Philosophy](#2-color-philosophy)
3. [Emotional Language of Color](#3-emotional-language-of-color)
4. [Gameplay Communication Through Color](#4-gameplay-communication-through-color)
5. [Visual Hierarchy](#5-visual-hierarchy)
6. [Environmental Palette Philosophy](#6-environmental-palette-philosophy)
7. [Ancient Civilization Palette](#7-ancient-civilization-palette)
8. [Mystical Technology Palette](#8-mystical-technology-palette)
9. [Natural World Palette](#9-natural-world-palette)
10. [Architectural Color Language](#10-architectural-color-language)
11. [Warm vs Cool Balance](#11-warm-vs-cool-balance)
12. [Saturation Philosophy](#12-saturation-philosophy)
13. [Value & Contrast Philosophy](#13-value--contrast-philosophy)
14. [Lighting & Color Relationship](#14-lighting--color-relationship)
15. [Progression Through Color](#15-progression-through-color)
16. [Puzzle Readability Through Color](#16-puzzle-readability-through-color)
17. [Collectible Color Language](#17-collectible-color-language)
18. [Hazard Color Language](#18-hazard-color-language)
19. [Reward Color Language](#19-reward-color-language)
20. [Atmosphere & Mood](#20-atmosphere--mood)
21. [Accessibility Considerations](#21-accessibility-considerations)
22. [Color Consistency Rules](#22-color-consistency-rules)
23. [Color Anti-Patterns](#23-color-anti-patterns)
24. [Design Decision Framework](#24-design-decision-framework)
25. [Summary](#25-summary)
26. [Workshop Conclusions](#26-workshop-conclusions)
27. [Related Documents](#27-related-documents)

---

## 1. Purpose of the Color Language

Color in Labyrinth Legends is not decoration. It is **communication** — emotional, spatial, and gameplay-critical.

The color language exists to answer:

> **What should this hue mean when a player sees it anywhere in the product?**

Without color authority, teams assign accent colors for aesthetic variety. Accents accumulate. Meaning dissolves. Hazards become indistinguishable from rewards. Energy reads as generic sci-fi. Premium identity collapses into mobile template palettes.

WS2 establishes a **finite semantic vocabulary** of color roles inherited from [WS0](WS0_Design_Philosophy.md) and [WS1](WS1_Visual_Identity_Artistic_Direction.md), then extends them into complete application rules for environments, objects, effects, illustration, and brand.

### Scope

WS2 governs color **meaning**, **hierarchy**, **relationship**, and **restriction**. Numerical values belong in [Colors](../Colors.md) and [Design_Tokens](../Design_Tokens.md) after WS2 approval.

### Design Intent

Ensure every color choice is defensible as communication — not as personal preference or trend.

---

## 2. Color Philosophy

The color philosophy of Labyrinth Legends rests on three principles.

### Principle 1 — Semantic Restraint

Few colors carry meaning. Many colors carry **noise**. Identity palette is intentionally narrow. Novelty saturation is excluded from core communication.

### Principle 2 — Material Truth

Color emerges from **material and light** — warm metal, cool inscribed energy, deep stone shadow, crystalline transmission. Color does not float disconnected from the artistic identity established in WS1.

### Principle 3 — Readability Precedence

When beauty and comprehension conflict, **comprehension wins** unless Human approval documents a deliberate, learnable exception aligned with WS0 fairness philosophy.

### Core Color Thesis

> Temple darkness holds the frame. Warm metal marks authority and reward. Cool energy marks active systems and paths. Rare violet marks discovery. Color earns attention; it does not demand it.

### Design Intent

Give all disciplines a shared philosophical basis before any palette discussion begins.

---

## 3. Emotional Language of Color

Color participates directly in the emotional journey defined in [Vision](../../00_Project/Vision.md) and WS0.

### Emotional Color Roles

**Temple darkness** — mystery, focus, reverence, calm tension. Not emptiness; **containment**.

**Warm metallics** — significance, commitment, earned success, ceremonial weight.

**Cool luminous energy** — active intelligence in the ruin; paths, connections, responsive systems.

**Portal cool light** — threshold, transition, dimensional depth; anticipation of change.

**Violet crystal** — rarity, relic gravity, optional discovery; never common filler.

**Muted stone neutrals** — stability, age, visual rest; the baseline against which meaning reads.

### Emotional Guardrails

Color must not manufacture arcade euphoria, panic alarm, or infantile playfulness. Emotional peaks are **earned** through player intelligence, reflected in restrained celebratory warmth — not explosive rainbow saturation.

### Design Intent

Bind palette choices to targeted emotion rather than to genre convention.

---

## 4. Gameplay Communication Through Color

Color supports the Draw Your Fate contract: study, plan, commit, witness consequence. It **informs**; it does not **solve**.

### Communication Domains

- **Traversable space** — what can be included in a plan
- **Commitment weight** — when a decision locks
- **Active systems** — what responds during execution
- **Danger** — what threatens a committed route
- **Objectives** — what must be satisfied for completion
- **Optional reward** — what enriches without gating
- **State change** — what has altered since observation began

### Color Must Not

- Reveal puzzle solutions not obtainable through fair observation
- Encode lethal outcomes through color alone
- Contradict deterministic feedback with ambiguous hue shifts
- Punish color-vision deficiency with sole-channel encoding

### Color Must

- Reinforce hierarchy between plan, risk, and reward
- Distinguish dormant from active mystical systems
- Support learnable hazard language across chambers
- Remain consistent across world skins and difficulty escalations

Mechanical precedence and feedback boundaries remain in [Gameplay](../../01_Game_Design/Gameplay/Gameplay.md) and WS0. WS2 owns **how color participates** in that contract.

### Design Intent

Prevent color from becoming a shadow gameplay system or a substitute for fair design.

---

## 5. Visual Hierarchy

Color organizes attention within the frame.

### Hierarchy Stack (Highest to Lowest)

1. **Committed path and immediate player consequence**
2. **Lethal or blocking hazard communication**
3. **Required interactive systems and objectives**
4. **Optional collectibles and mastery signals**
5. **Architectural focal frames (exits, sanctuaries)**
6. **Atmospheric depth and non-interactive grandeur**

Lower layers must not compete chromatically with layers 1–3.

### Hierarchy Tools

- Saturation emphasis on active meaning
- Value contrast against temple darkness
- Warm vs cool separation between authority and energy
- Localized emissive color vs globally tinted scenes

### Design Intent

Give artists and designers a priority order when multiple elements demand attention simultaneously.

---

## 6. Environmental Palette Philosophy

Environments are the **primary field** on which color meaning is read. Palette philosophy favors **cohesive chambers** over global uniformity.

### Environmental Principles

- Each chamber has a **dominant neutral stone family** and **one active accent system**
- Accent color appears where civilization let energy or metal enter the built world
- Environmental variety expresses **geology and history**, not random hue rotation per level
- Biome shifts modulate temperature and mineral presence — not core semantic roles
- Sky and distant depth remain subordinate to playable floor readability

### Palette Layering

**Base layer** — stone value range and material temperature.

**Identity layer** — civilization metal and inscription presence.

**Active layer** — mystical energy in channels and mechanisms.

**Atmosphere layer** — dust, haze, and motivated light tint — never replaces base readability.

### Design Intent

Allow world diversity without fragmenting color semantics across the product.

---

## 7. Ancient Civilization Palette

The ancient civilization palette expresses **enduring human craft** within the ruin.

### Dominant Qualities

- **Mineral stone neutrals** — grey, umber, warm sediment, cool granite character without rainbow scatter
- **Engraved warm metal** — authority accents on frames, seals, binding elements
- **Oxidized and tarnished metal variation** — age in recesses; restrained highlight on relief
- **Pigment decay** — optional faint residual color in murals or inlays; never primary communication

### Civilization Color Restraint

The civilization did not paint every surface saturated hue. Most of the ruin is **stone and shadow**. Color marks **intention** — where builders invested meaning.

### Design Intent

Ground environmental palettes in archaeological credibility — avoiding candy-colored dungeon kits.

---

## 8. Mystical Technology Palette

Mystical technology color expresses **inscribed energy** — cool, contained, geometrically placed.

### Energy Color Family

**Primary energy** — cool luminous tones associated with runic activation, path expression, and live conduits. This is the project's **interactive cool** family — not generic sci-fi cyan for decoration.

**Portal light** — deeper cool with volumetric presence; thresholds and transitions.

**Crystal core** — violet-leaning transmission; rare focal discovery.

### Energy Placement Rules

- Energy color appears **in channels, frames, cores, and portals** — not as ambient fog replacing the whole scene
- Dormant systems read muted; active systems read luminous — **state must be chromatically perceptible**
- Energy never overpowers warm reward language or hazard language

### Design Intent

Separate mystical systems from both ancient masonry neutrals and warm ceremonial metals.

---

## 9. Natural World Palette

Natural elements appear with **minimalist restraint** — the ruin is architecture first.

### Permitted Natural Color

- Subdued moss and mineral staining on stone
- Water as value and reflection, not tropical turquoise dominance
- Root and organic shadow in recesses
- Dust as warm neutral particulate in light

### Natural Color Limits

Nature does not introduce a parallel saturated palette. Jungle carnival, toxic green sludge, and lava-orange generic fantasy tropes are out of identity.

Natural color **ages** the architecture; it does not replace it.

### Design Intent

Prevent environmental biomes from hijacking core semantic colors.

---

## 10. Architectural Color Language

Architecture distributes color through **structural roles**.

### Structural Color Roles

- **Floors and primary traversal** — lowest chroma; value readability first
- **Walls and mass** — neutral stone with localized inscription
- **Frames and thresholds** — warm metal or energy trim marking passage
- **Mechanism housings** — combined stone recess plus active energy interior
- **Sanctuary and exit focal architecture** — highest permissible ceremonial warmth
- **Collapsed and damaged zones** — desaturated fracture; reduced active color until restored states

Architecture tells the player where color **belongs** before props or effects are placed.

### Design Intent

Make color placement systematic — reducing arbitrary accent scattering on ledges and props.

---

## 11. Warm vs Cool Balance

Warm and cool are the **primary temperature dialect** of Labyrinth Legends color identity.

### Warm Family

Associated with **metal, reward, commitment, ceremonial success**, and selective architectural emphasis. Warmth signals **human significance** and **earned outcome**.

### Cool Family

Associated with **energy, paths, portals, active systems**, and atmospheric depth. Coolness signals **responsive mysticism** and **spatial mystery**.

### Balance Rule

Scenes require **both temperatures** to feel complete: cool depth establishes mystery; warm accents mark meaning. A scene entirely cool reads sterile sci-fi. A scene entirely warm reads loot-room chaos.

Default balance favors **cool environmental depth** with **sparse warm focal points** and **localized cool activation**.

### Design Intent

Give directors a temperature model that scales across chambers without palette reinvention.

---

## 12. Saturation Philosophy

Saturation is a **scarce resource**.

### Saturation Hierarchy

- **Highest saturation** — active energy, critical interactables at activation, key reward moments
- **Moderate saturation** — warm metal highlights, collectibles, mastery signals
- **Low saturation** — stone mass, background architecture, atmospheric distance
- **Near-neutral** — non-interactive rubble and rest zones

### Saturation Restraint

Full-scene saturation spikes are prohibited. If everything is vivid, nothing is meaningful. Mobile puzzle titles often fail here; Labyrinth Legends does not.

Saturation may increase **locally** at commitment and resolution — not globally without narrative motivation.

### Design Intent

Protect premium restraint and semantic clarity from gradient-button syndrome.

---

## 13. Value & Contrast Philosophy

Value (light/dark structure) does more communicative work than hue.

### Value Principles

- **Temple darkness** is the default canvas — not pure void; **rich dark**
- Playable floors maintain **separation from walls** through value before hue
- Critical elements maintain **minimum perceptual separation** under mobile brightness conditions
- High-value accents are few — exits, active cores, key rewards

### Contrast Types

- **Figure-ground** — explorer and interactables against floor
- **Plane separation** — floor, wall, ceiling, pit depth
- **State contrast** — dormant vs active mechanisms
- **Risk contrast** — hazard zones readable without neon aggression

### Contrast Restraint

Harsh binary flashing contrast is an anti-pattern. Contrast serves **continuous readability**, not alarm.

### Design Intent

Prioritize value discipline — the foundation of color accessibility and premium atmosphere.

---

## 14. Lighting & Color Relationship

Light **reveals** color identity; it does not replace semantic assignment.

### Motivated Color Light

- Portal and shaft light introduces cool directional color
- Emissive channels localize energy hue at source
- Warm bounce from metal provides secondary fill — subtle, not dominant
- Dust and atmosphere shift perceived temperature without changing material identity

### Lighting State Changes

Activation may increase **local luminance and saturation** of permitted hues. Lighting must not introduce **new semantic hues** absent from WS2 roles without approval.

### Design Intent

Align color and lighting direction without specifying technical implementation.

---

## 15. Progression Through Color

Color supports progression **without becoming a power fantasy**.

### Progression Expression

- **Early worlds** — narrower accent range; teaching semantic roles
- **Mid worlds** — combined warm and cool systems in single chambers
- **Late worlds** — denser state complexity; same core roles, not new rainbow vocabulary
- **Mastery and replay** — warm ceremonial emphasis on seals and optional discovery — not rank-based chromatic inflation

### What Progression Is Not

Progression is not player avatar glowing rainbow. It is not escalating UI chrome saturation. It is not world five introducing unrelated neon dialects.

Knowledge progression may be reflected through **player confidence reading familiar colors** — not through louder colors.

### Design Intent

Tie long-term color use to teaching and mastery of meaning — not to stat inflation aesthetics.

---

## 16. Puzzle Readability Through Color

Puzzle readability is the **primary functional test** of color application in chambers.

### Readability Requirements

- Traversable graph remains legible at rest
- Doors, keys, switches, and plates maintain distinct semantic families
- State changes produce **perceptible** color or value shifts — not subtle boutique shifts mobile displays erase
- Multiple simultaneous systems remain separable through hue **and** non-color channels

### Readability vs Atmosphere

Atmosphere darkens edges — not the puzzle floor. Murals and background relief stay subordinate. If atmospheric grade removes hierarchy, atmosphere yields.

### Design Intent

Ensure color language serves puzzle-adventure clarity — the product's core skill.

---

## 17. Collectible Color Language

Collectibles express **optional discovery** within reward hierarchy.

### Collectible Roles

- **Standard treasure** — warm metallic emphasis; subordinate to exit framing
- **Relic and rare discovery** — violet crystal family; scarce; never spammed across floors
- **Keys and access objects** — distinct from treasure and energy; readable at small scale
- **Mastery markers** — warm seal language; ceremonial, not arcade star yellow

### Collectible Restraint

Collectible glow must not blanket chambers. Optional rewards **invite**; they do not **shout** over hazard communication.

### Design Intent

Preserve exploration reward without turning chambers into loot shimmer noise.

---

## 18. Hazard Color Language

Hazard color communicates **danger as puzzle consequence** — fair, learnable, not reflex bait.

### Hazard Principles

- Hazard hues occupy a **distinct family** from reward warm metals and path energy cool
- Warning states increase clarity — not panic strobe
- Corrective vs lethal severity may shift value and saturation — not unrelated hue chaos
- Hazards remain readable in planning phase where fairness requires

### Hazard Fairness

Color supports hazard identity; it does not **become** the only hazard signal. Shape, motion, and spatial context remain mandatory companions per WS0 accessibility philosophy.

### Prohibited Hazard Color

- Alarm red flooding unrelated systems
- Identical color language for safe and lethal tiles
- Pulsing saturation unrelated to gameplay phase

### Design Intent

Align visual danger with GP4 fairness intent without defining mechanical hazard taxonomy here.

---

## 19. Reward Color Language

Reward color celebrates **earned intelligence** — escape, discovery, mastery.

### Reward Hierarchy

- **Primary escape success** — warm ceremonial emphasis; restrained glow
- **Treasure recognition** — warm metallic accent; secondary to escape
- **Relic discovery** — violet crystal rarity language
- **Mastery seal** — highest warm ceremonial treatment; thematic marks — not generic rainbow confetti

### Reward Restraint

Victory color is **brief and intentional**. Extended reward screens may sustain warmth; they must not become slot-machine spectacles.

### Design Intent

Support GP5 seal philosophy through color — thematic completion, not score-chasing neon.

---

## 20. Atmosphere & Mood

Atmospheric color modulates **mood phase** without redefining semantic roles.

### Mood Color Temperature

**Arrival** — cool depth dominant; distant warm pinpoints.

**Observation** — balanced neutrality on play surface; atmosphere at periphery.

**Planning** — path cool activation clarifies; warm commit elements approach decision.

**Execution** — sequential local lighting shifts follow consequence locus.

**Resolution** — warm lift for success; subdued cool desaturation for instructive failure — never punitive grey mockery.

**Return** — familiar palette reinforces learning; not jarring reset.

### Atmospheric Particulate

Dust and haze lean **warm neutral** in light beams — time and air, not colored fog effects.

### Design Intent

Synchronize color mood with player journey phases across the session.

---

## 21. Accessibility Considerations

Accessibility is part of color identity — not an afterthought patch.

### Requirements

- Critical distinctions use **hue + value + shape + motion + labeling** as appropriate
- Color-vision deficiency must not make hazards, paths, or objectives indistinguishable
- Text and iconography maintain separation from busy backgrounds through value and framing — not hue alone
- Optional high-contrast or alternate presentation modes must preserve semantic roles — not invent new meanings

### Accessible Does Not Mean Ugly

Accessibility adjustments increase **clarity of separation** — they do not require abandoning temple darkness or identity temperature balance.

Detailed requirements extend in [Accessibility](../Accessibility.md). WS2 owns **semantic commitment** to multichannel communication.

### Design Intent

Ensure color language is inclusive by design — consistent with WS0 pillar on accessibility as identity.

---

## 22. Color Consistency Rules

### Inheritance Model

```text
Vision
    ↓
WS0 (color meaning in philosophy)
    ↓
WS1 (material & light identity)
    ↓
WS2 (color language)  ← this document
    ↓
Colors.md · Design_Tokens.md · LLDL · Components · Screens · Brand
```

### Fixed Semantic Roles

These roles are **stable across worlds, screens, and marketing**:

- Warm metal — authority, reward, primary positive action framing
- Cool energy — paths, active systems, interactive activation
- Portal cool — thresholds and transitions
- Violet crystal — rare relic and discovery
- Temple darkness — focus canvas
- Hazard family — danger distinct from reward and path energy

### Change Control

Introducing a new semantic hue family requires WS2 alignment review, Human approval, and [Decisions](../../00_Project/Decisions.md) entry.

### Design Intent

Prevent slow semantic drift across production years and vendor teams.

---

## 23. Color Anti-Patterns

### Identity Anti-Patterns

- Rainbow gradient primary actions
- Cyberpunk neon dominance
- Cartoon saturated props in ancient chambers
- Generic mobile blue for all interactables regardless of role
- Purple used for both relics and random decorative lights without hierarchy

### Gameplay Anti-Patterns

- Color-only lethal encoding
- Reward and hazard sharing indistinguishable hues
- Path color solving puzzles beyond fair rules
- Saturation arms race per world tier

### Craft Anti-Patterns

- Flat untextured color panels without material logic
- Global color grade destroying floor/wall separation
- Trend palette replacing temple identity for seasonal events without approval

### Design Intent

Give reviewers explicit rejection vocabulary for color reviews.

---

## 24. Design Decision Framework

### Evaluation Sequence

1. **Vision & WS0 alignment** — Does color support calm tension and planning mastery?
2. **WS1 alignment** — Does color emerge from material and light identity?
3. **Semantic role** — Is this hue assigned to an approved WS2 family?
4. **Hierarchy** — Does color respect the five-layer stack?
5. **Gameplay communication** — Does color inform without solving or deceiving?
6. **Accessibility** — Is distinction multichannel?
7. **Saturation & value discipline** — Is chroma earned?
8. **Consistency** — Would this read as Labyrinth Legends in a greyscale thumbnail plus role check?
9. **Timelessness** — Will this remain defensible after trend cycles?

### Outcomes

- **Approve** — proceed; document in downstream specs if new application
- **Revise** — adjust role, placement, or intensity
- **Reject** — cite anti-pattern or hierarchy violation
- **Escalate** — Human approval for material new semantic families

### Design Intent

Make color approval procedural across art, UI, and brand teams.

---

## 25. Summary

Labyrinth Legends uses color as **restrained semantic communication** inside a temple-dark, warm-significance, cool-energy identity.

**WS2 establishes that:**

- Color philosophy prioritizes semantic restraint, material truth, and readability
- Emotional, gameplay, and hierarchical roles are explicitly assigned
- Ancient civilization, mystical technology, and natural palettes coexist under one rule set
- Warm vs cool balance, saturation scarcity, and value discipline organize the frame
- Lighting reveals color; progression teaches color; puzzles are tested against color
- Collectibles, hazards, and rewards occupy distinct families
- Accessibility requires multichannel encoding — color alone is never sufficient
- Consistency and anti-patterns protect identity from mobile template drift

Numerical values and component application follow in [Colors](../Colors.md), [Design_Tokens](../Design_Tokens.md), and [LLDL](LLDL.md) — inheriting WS2 roles without redefining them.

---

## 26. Workshop Conclusions

WS2 — Color Language Workshop records the following locked conclusions:

| # | Conclusion |
|---|------------|
| 1 | WS2 is the color authority within LLDL, subordinate only to Vision, WS0, and WS1 |
| 2 | Color is communication — emotional, spatial, and gameplay-critical |
| 3 | Semantic palette is intentionally narrow; novelty saturation excluded |
| 4 | Warm metal, cool energy, portal cool, violet crystal, and temple darkness are fixed role families |
| 5 | Value and contrast do more work than hue; temple darkness is the default canvas |
| 6 | Saturation is scarce; local emphasis beats global vividness |
| 7 | Hazards, rewards, paths, and collectibles occupy distinct color families |
| 8 | Color supports puzzles; it does not solve them or encode lethality alone |
| 9 | Accessibility requires multichannel distinction — aligned with WS0 |
| 10 | Design_Tokens and Colors.md implement WS2 — they do not redefine semantic roles |

### Design Intent

Freeze workshop outcomes before numerical token authoring begins.

---

## 27. Related Documents

### Upstream

- [Vision](../../00_Project/Vision.md)
- [WS0 — Design Philosophy](WS0_Design_Philosophy.md)
- [WS1 — Visual Identity & Artistic Direction](WS1_Visual_Identity_Artistic_Direction.md)

### Downstream

- [Colors](../Colors.md) — Extended color guidance and values (sync with WS2)
- [Design_Tokens](../Design_Tokens.md) — Canonical token implementation
- [WS3 — Environment Language](WS3_Environment_Language.md) — Environment authority
- [LLDL](LLDL.md) — Design language specification
- [Accessibility](../Accessibility.md) — Accessibility requirements
- [Components](../Components.md) — Component color application

### Narrative

- [Game Bible](../../01_Game_Design/Game_Bible.md)

### Governance

- [Decisions](../../00_Project/Decisions.md)
- [Roadmap](../../00_Project/Roadmap.md)

---

## Navigation

| ← Previous | Next → | Index |
|------------|--------|-------|
| [WS2 — Color Language](WS2_Color_Language.md) | [WS3 — Environment Language](WS3_Environment_Language.md) | [Documentation Home](../../README.md) · [LLDL](LLDL.md) |
