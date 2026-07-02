# WS6 — Audio Language

| Field | Value |
|-------|-------|
| **Project** | Labyrinth Legends |
| **Document Name** | WS6 — Audio Language |
| **Document ID** | LLDL-DOC-WS6-001 |
| **Series** | WS6 — Labyrinth Legends Design Language (LLDL) Audio Authority |
| **Version** | 1.0.0 |
| **Status** | Approved |
| **Owner** | Apoorv |
| **Prepared By** | ChatGPT (workshop) · Cursor (compiler) |
| **Last Updated** | 2026-06-30 |
| **Workshop** | WS6 — Audio Language |
| **Path** | `docs/02_Design_System/LLDL/WS6_Audio_Language.md` |
| **Dependencies** | [Vision](../../00_Project/Vision.md) · [WS0 — Design Philosophy](WS0_Design_Philosophy.md) · [WS1 — Visual Identity](WS1_Visual_Identity_Artistic_Direction.md) · [WS2 — Color Language](WS2_Color_Language.md) · [WS3 — Environment Language](WS3_Environment_Language.md) · [WS4 — UI Language](WS4_UI_Language.md) · [WS5 — Motion Language](WS5_Motion_Language.md) |
| **Related Documents** | [LLDL](LLDL.md) · [Audio](../Audio.md) · [Accessibility](../Accessibility.md) · `docs/03_Screens/*` |

## Navigation

| ← Previous | Next → | Index |
|------------|--------|-------|
| [WS5 — Motion Language](WS5_Motion_Language.md) | [WS7 — Typography Language](WS7_Typography_Language.md) | [Documentation Home](../../README.md) · [LLDL](LLDL.md) |

---

## Version History

| Version | Date | Author | Summary |
|---------|------|--------|---------|
| 1.0.0 | 2026-06-30 | ChatGPT / Cursor | WS6 — audio language authority for LLDL |

## Change Log

| Version | Change |
|---------|--------|
| 1.0.0 | Initial workshop record: supportive audio, calm exploration, ancient identity, environmental storytelling, restrained puzzle/UI/reward sound, silence as design |

---

## Document Authority

**WS6 is the audio authority within the Labyrinth Legends Design Language (LLDL).**

| Conflict type | Authority |
|---------------|-----------|
| Product intent | [Vision](../../00_Project/Vision.md) wins |
| Design philosophy | [WS0 — Design Philosophy](WS0_Design_Philosophy.md) wins |
| Artistic identity | [WS1 — Visual Identity](WS1_Visual_Identity_Artistic_Direction.md) wins |
| Color meaning | [WS2 — Color Language](WS2_Color_Language.md) wins |
| Environmental language | [WS3 — Environment Language](WS3_Environment_Language.md) wins |
| UI philosophy and interaction tone | [WS4 — UI Language](WS4_UI_Language.md) wins |
| Motion philosophy and movement communication | [WS5 — Motion Language](WS5_Motion_Language.md) wins |
| Audio philosophy, music identity, sound design temperament | **WS6 wins** |
| Sound libraries, mix specs, per-cue implementation detail | [Audio](../Audio.md) · technical audio docs — must align with WS6; WS6 does not define implementation |

WS6 extends Vision and WS0–WS5. It does not override gameplay rules, environmental construction, UI layout, or motion hierarchy. When audio intensity conflicts with WS0 readability, WS3 spatial clarity, WS4 progressive HUD restraint, or WS5 calm temperament, the higher document prevails until [Decisions](../../00_Project/Decisions.md) records an explicit, Human-approved exception.

WS5 defines *how everything moves*. **WS6 defines how the temple sounds** — music, ambience, interaction, feedback, and silence — so audio deepens exploration without demanding constant attention.

---

## Intended Audience

| Role | Use this document to… |
|------|------------------------|
| Audio Directors | Author permanent music and sound identity |
| Composers | Score within ancient-world musical vocabulary |
| Sound Designers | Design SFX that confirm logic without spectacle |
| Level Designers | Request ambient storytelling appropriate to chambers |
| UI Designers | Align interface sound with WS4 tactile elegance |
| Narrative Designers | Scope voice and lore delivery without exposition overload |
| Accessibility Reviewers | Verify audio respects multichannel and reduced-audio needs |
| Screen Spec Authors | Extend WS6 into screen and cinematic specs without redefining philosophy |
| Implementation Agents | Reject audio directions that violate WS6 locked decisions or anti-patterns |

---

## Table of Contents

1. [Purpose of the Audio Language](#1-purpose-of-the-audio-language)
2. [Audio Philosophy](#2-audio-philosophy)
3. [Emotional Role of Sound](#3-emotional-role-of-sound)
4. [Musical Identity](#4-musical-identity)
5. [Environmental Ambience](#5-environmental-ambience)
6. [Ancient Civilization Sound](#6-ancient-civilization-sound)
7. [Mystical Energy Sound](#7-mystical-energy-sound)
8. [Silence as Design](#8-silence-as-design)
9. [Puzzle Audio](#9-puzzle-audio)
10. [Gameplay Feedback Audio](#10-gameplay-feedback-audio)
11. [UI Audio](#11-ui-audio)
12. [Reward Audio](#12-reward-audio)
13. [Environmental Storytelling Through Sound](#13-environmental-storytelling-through-sound)
14. [Dynamic Emotional Pacing](#14-dynamic-emotional-pacing)
15. [Audio Readability](#15-audio-readability)
16. [Spatial Audio Philosophy](#16-spatial-audio-philosophy)
17. [Accessibility Considerations](#17-accessibility-considerations)
18. [Audio Consistency Rules](#18-audio-consistency-rules)
19. [Audio Anti-Patterns](#19-audio-anti-patterns)
20. [Design Decision Framework](#20-design-decision-framework)
21. [Summary](#21-summary)
22. [Workshop Conclusions](#22-workshop-conclusions)
23. [Related Documents](#23-related-documents)

---

## 1. Purpose of the Audio Language

Sound is how the ruin **breathes** — distant water, stone settling, mechanism awakening, path confirmation, and the quiet between decisions. Audio that constantly competes for attention breaks immersion. Audio that is absent or generic fails to anchor the ancient world.

WS6 answers:

> **How should every sound in Labyrinth Legends support mystery, exploration, discovery, and Draw Your Fate?**

Without audio authority, teams default to mobile-game conventions: looping EDM menus, jackpot reward stingers, arcade UI clicks, and ever-present intensity. Calm tension collapses. Puzzle thinking suffers. The temple feels like a casual app with a soundtrack pasted on.

WS6 establishes the **permanent audio philosophy** for music, ambience, environmental sound, puzzle feedback, UI response, reward ceremony, and deliberate silence. It does not define libraries, middleware, codecs, or mix implementation.

### What WS6 Governs

- Overall audio temperament and emotional pacing
- Musical identity and exploration scoring
- Environmental ambience and spatial storytelling
- Puzzle, gameplay, UI, and reward sound restraint
- Silence as an active design tool
- Anti-patterns and approval framework

### What WS6 Does Not Govern

- Individual sound assets or music tracks
- Technical audio implementation or mixing specs
- Voice casting and dialogue production
- Per-screen layout or gameplay rules

### Design Intent

Give every audio discipline a shared vocabulary before music briefs, SFX libraries, and technical audio docs are authored.

---

## 2. Audio Philosophy

**Locked workshop decision:** Audio should **support — not dominate**. Silence is a deliberate design tool.

### Core Audio Temperament

Labyrinth Legends audio expresses **thoughtful exploration** — curiosity over urgency, atmosphere over alarm, craftsmanship over spectacle. Sound deepens immersion when the player chooses to listen; it never hijacks attention during planning.

### Audio Pillars

| Pillar | Meaning |
|--------|---------|
| **Supportive** | Sound serves comprehension and mood — not self-display |
| **Calm** | Room to think; intensity earned, not constant |
| **Ancient** | Handcrafted, timeless, civilization-rooted identity |
| **Alive** | Environments breathe through ambient storytelling |
| **Disciplined** | Puzzle, UI, and reward sounds restrained and purposeful |
| **Silent when needed** | Quiet is composition, not absence of design |

### Audio Serves Three Masters

1. **Comprehension** — player understands state change and consequence
2. **Immersion** — the ruin feels physically and mystically credible
3. **Emotion** — wonder, tension, relief, and achievement arrive with appropriate weight

When these conflict during active puzzle play, **comprehension wins**.

### Rejected Temperament

Audio must not feel:

- Loud, relentless, or attention-demanding by default
- Arcade-like, casino-like, or mobile-loop generic
- Modern-industrial or cyberpunk sonic
- Cinematic action-score intense during routine planning
- Empty of identity — generic stock ambience without temple character

### Alignment

Audio inherits calm tension from [Vision](../../00_Project/Vision.md), player-first clarity from [WS0](WS0_Design_Philosophy.md), material and civilization identity from [WS1](WS1_Visual_Identity_Artistic_Direction.md), energy highlight discipline from [WS2](WS2_Color_Language.md), environmental life from [WS3](WS3_Environment_Language.md), tactile UI restraint from [WS4](WS4_UI_Language.md), and soft movement temperament from [WS5](WS5_Motion_Language.md).

### Design Intent

Freeze a single audio temperament before any discipline authors parallel sonic dialects.

---

## 3. Emotional Role of Sound

Sound is the **emotional undertow** of the temple — subtler than visuals, more immediate than text.

### Emotional Functions

| Function | Sound expression |
|----------|------------------|
| **Curiosity** | Inviting ambience; distant unknowns; soft musical openness |
| **Focus** | Reduced density during study and plan phases |
| **Confidence** | Clear confirmation without celebration overload |
| **Tension** | Restrained hazard proximity — fair warning, not horror |
| **Relief** | Clean resolution; breath after commitment |
| **Wonder** | Rare mystical resonance; measured, not constant sparkle |
| **Mastery** | Ceremonial reward tone — earned, not given away |

### Emotional Rhythm

Audio follows the Draw Your Fate loop:

1. **Study** — ambient life; minimal musical intrusion
2. **Plan** — quiet or low-intensity bed; path feedback only as needed
3. **Commit** — brief weighted cue; optional stillness before execution
4. **Execute** — sequential readable feedback; mechanism and traversal sound
5. **Evaluate** — outcome clarity; then sonic release
6. **Reward** — ceremonial accent; return to exploration calm

Sound should **breathe** between peaks. Constant musical intensity equals constant noise.

### Design Intent

Ensure composers and sound designers pace emotion across sessions, not only individual cues.

---

## 4. Musical Identity

**Locked workshop decision:** Music should encourage **calm exploration** — curiosity over constant intensity, with room to think.

### Musical Temperament

Labyrinth Legends music is **exploratory, ancient, and evolving** — not a chase score. Melody and texture invite the player deeper into ruins rather than pushing them faster through them.

### Preferred Musical Qualities

- Orchestral textures with restraint — space between notes
- Ethnic and ancient-world instruments — hand drums, flutes, strings, bells
- Soft percussion — pulse without aggression
- Choirs and vocal texture — distant, ceremonial, not pop-forward
- Resonant metallic tones — temple bells, struck bronze, ritual resonance
- Natural evolution — themes develop as exploration deepens

### Musical Avoidances

- EDM and electronic dance idioms
- Heavy electronic or synth-forward scores as default
- Aggressive rock or action-genre intensity
- Overly cinematic action scoring during routine puzzle play
- Repetitive mobile-game loop feel — short phrases cycling without variation
- Constant percussive drive under planning phases

### Contextual Scoring

| Context | Musical temperament |
|---------|---------------------|
| **Gameplay — study/plan** | Minimal or absent; ambience carries mood |
| **Gameplay — execution** | Subtle lift or rhythmic support — never overwhelm |
| **Meta-game navigation** | Fuller identity; still calm relative to action games |
| **Milestones** | Ceremonial swells — brief, then release |
| **Failure** | Instructional tone — not punitive sting |

### Design Intent

Give composers a clear ancient-world palette and explicit rejection of mobile-loop defaults.

---

## 5. Environmental Ambience

**Locked workshop decision:** Every environment should feel **alive** through ambient sound — telling stories without dialogue.

### Ambience Purpose

Ambience establishes **place, scale, and age**. The player should sense chamber depth, open air, buried humidity, or vaulted stone before reading any text.

### Ambient Sound Families

- **Geological** — wind through gaps, distant rumble, settling stone
- **Hydrological** — dripping water, shallow pools, distant falls
- **Biological** — birds, insects, sparse wildlife — biome-appropriate
- **Architectural** — hollow reverberation, corridor echo, chamber resonance
- **Mechanical** — distant gears, dormant apparatus hum — subordinate to nature
- **Mystical** — subtle resonance where WS2 energy highlights apply

### Ambience Discipline

- Ambience supports **WS3 spatial hierarchy** — play surface remains mentally clear
- Layers should be **sparse enough to parse** — not dense wallpaper
- Variation prevents **loop fatigue** without introducing chaos
- Gameplay-critical moments may **duck or thin** ambience for feedback clarity

### Ambience Must Not

- Mask puzzle feedback or hazard warnings
- Introduce dialogue or narration by default
- Play at uniform intensity across all biomes without identity shift
- Simulate modern urban or industrial soundscapes

### Design Intent

Make every chamber audible as a place with history.

---

## 6. Ancient Civilization Sound

**Locked workshop decision:** Audio should feel **handcrafted, timeless, mysterious, and rooted in an ancient civilization** — natural acoustics and subtle mystical elements coexisting.

### Civilization Sonic Identity

The temple sounds like **one lost culture's engineering and ritual** — not a genre mashup. Materials matter: stone, bronze, ceramic, rope, sand, carved wood. Acoustics feel **monumental** — vaulted, reflective, weighted.

### Material Sound Language

| Material | Sonic character |
|----------|-----------------|
| **Stone** | Grinding shift, impact thud, hollow knock |
| **Metal** | Engraved strike, bronze ring, restrained resonance |
| **Wood & rope** | Creak, tension, fibrous snap — aged, not fresh lumber |
| **Sand & dust** | Soft scrape, slide, particulate settle |
| **Water** | Channel flow, drip cadence, pool resonance |

### Human Presence

The civilization is **absent but implied** — no crowd noise, no modern voices. Occasional distant ritual suggestion (bell, chant fragment) may appear as environmental storytelling — never as exposition dump.

### Ancient vs Modern

Reject sounds that imply:

- Industrial machinery, hydraulics, servos
- Digital UI bleeps as world sound
- Contemporary urban ambience
- Sci-fi warp and laser vocabulary

### Design Intent

Keep sonic identity archaeologically credible and visually aligned with WS1 and WS3.

---

## 7. Mystical Energy Sound

Mystical energy sound inherits **highlight discipline** from WS2, WS4, and WS5 — energy is heard meaningfully, not constantly.

### When Energy Sound Appears

- Path commitment and active route states
- Mechanism activation and successful alignment
- Portal and threshold transitions
- Progression seals and rare relic emphasis
- Reward ceremony accents

### Energy Sound Qualities

- **Resonant** — singing metal, harmonic hum, inscribed glow
- **Directed** — follows seams, paths, glyphs, portals
- **Brief** — arrives, confirms, releases
- **Secondary to material** — stone and metal lead; energy answers

### Energy Sound Must Not

- Permeate idle ambience as constant shimmer
- Replace material feedback as primary state communicator
- Sound like sci-fi lasers, digital glitch, or cyberpunk synth
- Layer on every UI interaction

### Design Intent

Preserve mystical technology identity without electronic-game sonic clichés.

---

## 8. Silence as Design

**Locked workshop decision:** **Silence is an active design element** — moments without music create anticipation, wonder, and focus. Do not fear quiet spaces.

### Silence as Composition

Silence is not **missing audio** — it is **intentional space** where the player thinks, listens to ambience, or feels chamber scale. The temple is vast; quiet is part of its personality.

### When Silence Serves

- Study and planning phases
- Before irreversible commit
- After significant outcome — brief breath before next action
- Rare chambers where emptiness is the story
- Teaching moments where audio would answer the puzzle too soon

### Silence vs Deadness

Silence may still include **subtle ambience** — a distant drip, wind, or stone tick. True sonic emptiness is rare and purposeful.

### Silence Must Not

- Feel like broken audio or technical failure
- Extend into confusion — player should not wonder if sound failed
- Replace feedback where GP6 requires confirmation

### Design Intent

Authorize designers to remove music without removing craft.

---

## 9. Puzzle Audio

**Locked workshop decision:** Puzzle sounds should **confirm understanding, reward experimentation, and reinforce logic** — never overwhelm thinking.

### Puzzle Audio Purpose

Puzzle audio answers:

- Did my input **register**?
- Is this state **valid or invalid**?
- What **changed** in the chamber?
- Did I **discover** something worth noticing?

### Puzzle Audio Qualities

- **Clear** — distinct valid vs invalid without punitive harshness
- **Brief** — confirms and releases
- **Logical** — sound matches cause (stone door, glyph align, bridge shift)
- **Teachable** — first exposure slightly more informative; repeats may soften
- **Quiet-friendly** — comprehension possible with sound off via other channels

### Puzzle Audio Must Not

- Stack multiple stingers on single validation
- Use casino or jackpot language for routine success
- Play aggressive error sounds that punish experimentation
- Leak solution information through audio alone beyond approved feedback

### Design Intent

Make sound a thinking partner, not a noise competitor.

---

## 10. Gameplay Feedback Audio

Gameplay feedback audio confirms **execution, collection, hazard, and completion** during chamber play.

### Feedback Principles

- **Immediate** — player perceives response without perceptible lag
- **Readable** — one sonic idea per event
- **Restrained** — confirms understanding without spectacle
- **Sequenced** — multiple events unfold in parseable order

### Feedback Categories

| Category | Audio role |
|----------|------------|
| **Validation** | Path accepted or rejected — clear, non-hostile |
| **Execution** | Step, turn, traversal — subtle cadence |
| **Collection** | Pickup acknowledgment — brief, not fireworks |
| **Hazard** | Fair warning and consequence — legible, not jump-scare |
| **Completion** | Exit or objective met — weighted satisfaction |

### Alignment

Gameplay feedback audio supports [GP6 Gameplay Feedback](../../01_Game_Design/Gameplay/GP6_Gameplay_Feedback.md) — presentation layer only; does not redefine rules.

### Design Intent

Teach through sound once; avoid feedback inflation across repeats.

---

## 11. UI Audio

**Locked workshop decision:** UI sounds should be **elegant, restrained, tactile, and premium** — aligned with [WS4](WS4_UI_Language.md) interaction tone.

### UI Audio Identity

Interface sound feels like **touching temple apparatus** — stone depress, metal engage, seal turn, panel settle. Not plastic buttons. Not arcade cabinets.

### Preferred UI Qualities

- Soft tactile acknowledgment
- Material-consistent — stone, metal, inscribed plate
- Short decay — no ringing clutter
- Hierarchy-matched — primary actions slightly weightier than secondary
- Consistent families across meta-game surfaces

### UI Audio Must Not

- Use loud clicks, arcade beeps, or casino chimes
- Exaggerate routine navigation with celebration stingers
- Pulse or loop on idle elements
- Compete with puzzle feedback during gameplay phases
- Sound hyperactive relative to WS5 soft motion

### Gameplay vs Meta UI

| Context | Audio temperament |
|---------|-------------------|
| **Gameplay HUD** | Minimal; near-silent unless confirmation required |
| **Meta-game** | Tactile ceremony; panel and seal character |
| **Modals** | Weighted arrival; quiet dismiss |

### Design Intent

Extend WS4 soft elegance into sonic interface identity.

---

## 12. Reward Audio

**Locked workshop decision:** Rewards should feel **meaningful, ceremonial, and earned** — not jackpot celebrations.

### Reward Audio Identity

Rewards are **sealed outcomes** — relics claimed, stars earned, paths mastered, progression unlocked. Sound should feel like the temple acknowledging the explorer, not a slot machine paying out.

### Preferred Reward Qualities

- Ceremonial bell, seal, or inscription resonance
- Brief choral or harmonic accent — sparse
- Material weight — stone settle, relic lift
- Clean resolution into calm — no endless tail

### Reward Audio Must Not

- Use jackpot stingers, coin showers, or slot-machine vocabulary
- Layer hyperactive percussion under tally screens
- Loop celebration indefinitely without player control
- Outshine the accomplishment with louder sound than the puzzle deserved
- Apply casino sonic language to monetization surfaces

### Reward Tiering

Higher-tier rewards may carry **more ceremonial sonic weight** — still calm relative to industry celebration norms. Tiering is expressed through craft and rarity, not volume.

### Design Intent

Make rewards sound like archaeological discovery, not monetization dopamine.

---

## 13. Environmental Storytelling Through Sound

**Locked workshop decision:** Ambient sound should **tell stories without dialogue** — distant echoes, wind, water, stone, life, and subtle mystical resonance.

### Storytelling Through Absence

- A chamber too quiet suggests abandonment or sealed dread
- Distant ritual sound implies civilization without showing it
- Broken mechanism timbre implies past catastrophe
- Water ingress suggests geological shift and time passing

### Storytelling Through Presence

- Echo length communicates vault scale
- Wind directionality suggests exterior breach
- Insect and bird density implies biome and time of day
- Repeated drip cadence marks neglect or intentional design

### Storytelling Discipline

- Inference over exposition — player **deduces** history
- No mandatory narration for environmental beats
- Story sound subordinate to puzzle readability
- Biome variation within one civilization sonic grammar

### Design Intent

Align audio storytelling with WS3 environmental narrative methods.

---

## 14. Dynamic Emotional Pacing

Dynamic pacing is how **music and ambience density rise and fall** across a session — the temporal composition of the sonic experience.

### Session Pacing

- Open calm — orient before overwhelming
- Rise through teaching — sonic complexity grows with player literacy
- Peak at commitment and execution — then release
- Celebrate briefly — return to exploration calm
- Avoid sustained high intensity across back-to-back levels

### Level Pacing

Within a chamber:

- Early beats favor **clarity and space**
- Mid beats may introduce **coupled mechanism** sonic layers — sequenced
- Late beats may carry **ceremonial weight** at mastery moments
- Failure resets to **instructional**, not punitive sonic frenzy

### Meta-Game Pacing

Navigation between chambers may carry **fuller musical identity** than in-puzzle play. Store and settings remain calm — never urgency-driven sonic design.

### Musical Evolution

Themes should **develop naturally with exploration** — variation, not loop stagnation. Deeper biomes may introduce new instrumentation while preserving civilization identity.

### Design Intent

Compose audio like environmental rhythm — variation with restraint.

---

## 15. Audio Readability

Audio readability ensures the player **understands world state from sound** where sound is used — without sound being the only channel.

### Readability Requirements

- Distinct sonic identities for **success, failure, warning, and neutral**
- One primary message per sonic moment
- Critical feedback **not buried** in ambience
- Repeated exposure **softens** without losing distinction
- Hazard and reward tiers **audibly differentiable**

### Readability Tests (Conceptual)

Ask of any cue:

1. Can a player describe what happened after one hearing?
2. Does this sound draw attention to the correct priority?
3. Would it remain clear if ambience were halved?
4. Is meaning available through non-audio channels as well?

If any answer fails, simplify.

### Design Intent

Make sound a clarity tool, not a decoration tax.

---

## 16. Spatial Audio Philosophy

Spatial audio places sound **in the chamber** — reinforcing scale, direction, and immersion without disorienting the player.

### Spatial Purpose

- **Orientation** — player senses where mechanism, hazard, or exit relative sound originates
- **Scale** — reverb and echo communicate monument size
- **Focus** — important sounds feel present; ambient beds feel environmental
- **Immersion** — ruin feels three-dimensional, not flat mix

### Spatial Qualities

- Natural reverb appropriate to WS3 chamber geometry
- Directional cues for off-screen but relevant events
- Distance attenuation — far sounds feel far
- Stability — spatial shifts do not confuse puzzle state

### Spatial Must Not

- Pan aggressively during planning
- Use disorienting movement that competes with WS5 camera stability
- Require headphones for basic comprehension
- Replace visual readability with sonic-only positioning

### Design Intent

Support immersion while preserving accessibility and puzzle clarity.

---

## 17. Accessibility Considerations

Audio must remain **inclusive** — comprehension cannot depend on sound alone.

### Accessibility Principles

- **Multichannel communication** — visual, haptic, and text reinforce critical audio
- **Separate controls** — music, SFX, ambience, and UI sound independently adjustable where platform allows
- **No seizure-risk audio** — avoid rapid strobe-like pulses or painful frequencies
- **Reduced audio modes** — essential feedback preserved with simplified or static alternatives
- **No time-critical audio-only information**

### Reduced Audio Alternative

When audio is reduced or muted:

- State changes remain clear through visual and UI channels
- Rewards downgrade to **static or minimal** presentation
- Ambience may **pause** without losing puzzle functionality
- Captions or text equivalents for any narrative audio

### Alignment

Audio accessibility aligns with [Accessibility](../Accessibility.md) and WS4 multichannel clarity — WS6 does not redefine accessibility requirements.

### Design Intent

Ensure audio is enhancement, not barrier.

---

## 18. Audio Consistency Rules

Consistency makes the temple sound like **one civilization's acoustic world** across biomes, screens, and updates.

### Consistency Rules

1. **One temperament** — supportive, calm, ancient, disciplined everywhere
2. **One musical identity** — exploration scoring, not genre drift
3. **One material grammar** — stone, bronze, ritual resonance
4. **One energy discipline** — highlight only per WS2
5. **One UI sonic dialect** — tactile elegance per WS4
6. **One reward ethic** — ceremonial, not casino
7. **One silence ethic** — quiet is composed, not accidental

### Cross-Discipline Handoff

| Source | Consumer |
|--------|----------|
| WS6 philosophy | [Audio](../Audio.md) implementation guidance |
| WS6 philosophy | Music briefs and stem direction |
| WS6 philosophy | SFX style guides |
| WS6 philosophy | UI sound libraries |
| WS6 philosophy | Cinematic and onboarding audio storyboards |

Downstream documents **implement** WS6 — they do not fork parallel audio identities.

### Version Changes

New audio dialects require [Decisions](../../00_Project/Decisions.md) entry and Human approval.

### Design Intent

Prevent sonic genre drift as teams and vendors scale.

---

## 19. Audio Anti-Patterns

The following are **rejected** unless explicit Human-approved exception exists.

### Temperament Anti-Patterns

- Constant musical intensity under planning
- Ambient wallpaper so dense feedback is lost
- Cyberpunk synth, EDM loops, aggressive rock as default
- Mobile-game repetitive loop fatigue
- Fear of silence — music always on

### Feedback Anti-Patterns

- Jackpot, slot-machine, and coin-shower stingers on routine success
- Punitive error sounds that discourage experimentation
- Multiple simultaneous stingers on one event
- Hazard jump-scare audio without fair warning

### UI Anti-Patterns

- Arcade beeps and loud clicks on every tap
- Casino sonic language in store surfaces
- Celebration sounds on routine list navigation
- UI sound louder than puzzle feedback

### Environmental Anti-Patterns

- Modern urban or industrial ambience in ancient ruins
- Exposition narration replacing inference
- Identical ambience across biomes with no identity
- Sci-fi energy sounds replacing material truth

### Reward Anti-Patterns

- Endless celebration loops blocking progress
- Reward audio louder than hardest puzzle in session
- Monetization urgency through sonic pressure

### Design Intent

Give reviewers explicit rejection language.

---

## 20. Design Decision Framework

Use this framework when evaluating new audio proposals.

### Evaluation Questions

1. **Support** — Does sound deepen immersion without dominating attention?
2. **Calm exploration** — Is there room to think? Is intensity earned?
3. **Ancient identity** — Does this sound belong to the civilization?
4. **Environmental story** — Does ambience infer place and history?
5. **Musical fit** — Orchestral/ethnic restraint vs rejected genres?
6. **Puzzle clarity** — Does sound confirm logic without overwhelming?
7. **UI alignment** — Tactile, elegant, premium per WS4?
8. **Reward ethic** — Ceremonial and earned, not casino?
9. **Silence** — Is quiet used intentionally?
10. **Readability** — One clear message? Multichannel backup?
11. **Spatial** — Immersive without disorienting?
12. **Accessibility** — Comprehension without sound?
13. **Consistency** — Matches WS6 or invents new dialect?

### Outcomes

- **Approve** — proceed to music brief, SFX spec, or asset authoring
- **Revise** — adjust intensity, density, hierarchy, or material identity
- **Reject** — cite locked decision violation or anti-pattern
- **Escalate** — Human approval for new sonic dialect or narrative voice exception

### Design Intent

Make audio approval repeatable across composition, sound design, level, and review agents.

---

## 21. Summary

Labyrinth Legends audio is **calm temple acoustics** — supportive music and ambience, ancient material truth, disciplined puzzle and UI feedback, ceremonial rewards, and intentional silence.

**WS6 establishes that:**

- Sound supports exploration — it does not dominate or demand constant attention
- Music encourages curiosity with room to think — not relentless intensity
- The ancient civilization sounds handcrafted, timeless, and mysterious
- Environments tell stories through ambience without dialogue
- Musical identity favors orchestral and ethnic restraint — rejects EDM, arcade loops, and action-score defaults
- Puzzle audio confirms logic without overwhelming thinking
- UI audio is elegant, tactile, and premium — never arcade or casino
- Rewards celebrate through ceremony — not jackpot spectacle
- Silence is an active compositional tool
- Readability, spatial identity, accessibility, and consistency protect all players and disciplines

Downstream [Audio](../Audio.md), music briefs, SFX guides, and screen specs implement WS6 — they do not redefine it.

---

## 22. Workshop Conclusions

WS6 — Audio Language Workshop records the following locked conclusions:

| # | Conclusion |
|---|------------|
| 1 | WS6 is the audio authority within LLDL, subordinate only to Vision and WS0–WS5 |
| 2 | **Support, not dominate** — sound deepens immersion; silence is deliberate |
| 3 | **Calm exploration** — music encourages curiosity; room to think |
| 4 | **Ancient world identity** — handcrafted, timeless, mysterious; natural and mystical coexist |
| 5 | **Environmental storytelling** — ambience tells stories without dialogue |
| 6 | **Musical direction** — orchestral/ethnic restraint; rejects EDM, aggressive electronic, arcade loops |
| 7 | **Puzzle audio** — confirms understanding; reinforces logic; never overwhelms thinking |
| 8 | **UI audio** — elegant, restrained, tactile, premium |
| 9 | **Reward audio** — meaningful, ceremonial, earned; rejects jackpot celebration |
| 10 | Audio, music, and SFX docs must inherit WS6 without parallel sonic dialects |

### Design Intent

Freeze workshop outcomes before music briefs, SFX libraries, and technical audio guides are authored.

---

## 23. Related Documents

### Upstream

- [Vision](../../00_Project/Vision.md)
- [WS0 — Design Philosophy](WS0_Design_Philosophy.md)
- [WS1 — Visual Identity & Artistic Direction](WS1_Visual_Identity_Artistic_Direction.md)
- [WS2 — Color Language](WS2_Color_Language.md)
- [WS3 — Environment Language](WS3_Environment_Language.md)
- [WS4 — UI Language](WS4_UI_Language.md)
- [WS5 — Motion Language](WS5_Motion_Language.md)

### Downstream

- [WS6 — Audio Language](WS6_Audio_Language.md) — Audio authority
- [WS7 — Typography Language](WS7_Typography_Language.md) — Typography authority
- [LLDL](LLDL.md) — Design language specification
- [Audio](../Audio.md) — Audio implementation guidance
- [Accessibility](../Accessibility.md)
- `docs/03_Screens/*` — Per-screen specifications

### Gameplay alignment

- [Gameplay](../../01_Game_Design/Gameplay/Gameplay.md) · [GP6 Gameplay Feedback](../../01_Game_Design/Gameplay/GP6_Gameplay_Feedback.md)

### Governance

- [Decisions](../../00_Project/Decisions.md)
- [Roadmap](../../00_Project/Roadmap.md)

---

## Navigation

| ← Previous | Next → | Index |
|------------|--------|-------|
| [WS5 — Motion Language](WS5_Motion_Language.md) | [WS7 — Typography Language](WS7_Typography_Language.md) | [Documentation Home](../../README.md) · [LLDL](LLDL.md) |
