# Audio

**Authority:** [WS6 — Audio Language](LLDL/WS6_Audio_Language.md)  
**Implementation:** `lib/core/services/` audio interfaces (future)

WS6 defines audio **philosophy** — atmospheric identity, restraint, and multichannel feedback boundaries. This document defines implementation-facing categories and hooks.

---

## Audio Channels

| Channel | Purpose | Temperament |
|---------|---------|-------------|
| Music | World identity, emotional framing | Atmospheric, non-intrusive during planning |
| Ambience | Temple ruin presence | Continuous but subtle |
| UI feedback | Press, toggle, navigation | Brief, crafted — not arcade blips |
| Gameplay feedback | Path, collect, hazard, resolve | Instructive, proportionate |
| Reward | Victory, unlock, relic | Ceremonial brief accent — not casino |
| Silence | Intentional negative space | Premium restraint |

---

## Cue Categories (Implementation)

| Category | Examples | When |
|----------|----------|------|
| `ui.press` | button tap, chip select | Immediate acknowledgment |
| `ui.navigate` | screen transition, tab change | Calm |
| `gameplay.path` | draw extend, confirm | Subtle energy |
| `gameplay.collect` | gem, key pickup | Distinct but brief |
| `gameplay.hazard` | trap trigger, invalid path | Clear — not punitive alarm |
| `gameplay.resolve` | exit reach, level complete | Warm confirmation |
| `reward.seal` | stars, mastery | Ceremonial tier — brief |
| `ambient.loop` | chamber tone | Low intensity |

---

## Gameplay vs Meta-Game

| Context | Audio posture |
|---------|---------------|
| Gameplay chamber | Minimal — protect concentration |
| Planning / drawing | Low ambience; no staccato UI spam |
| Execution | Consequence cues only |
| Meta-game | Richer ambience; navigation UI feedback allowed |
| Victory / reward | Elevated brief celebration — then settle |

---

## Accessibility & Settings

| Requirement | Implementation hook |
|-------------|---------------------|
| Independent channel mutes | Music, SFX, ambience toggles in Settings |
| No critical info audio-only | Pair with visual + text per WS9 |
| Reduced sensory load | Shorter / softer reward cues when comfort mode on |
| Respect device silent mode | Platform audio session policy |

---

## Technical Notes (Future)

- Abstract behind `AudioService` in `lib/core/services/`
- No direct coupling from `game_engine/` to audio middleware
- Cue IDs documented here map to asset files under `assets/audio/`
- Loudness normalization across cue categories

---

## Related Documents

- [WS6 — Audio Language](LLDL/WS6_Audio_Language.md)
- [Accessibility](Accessibility.md)
- [GP6 — Gameplay Feedback](../01_Game_Design/Gameplay/GP6_Gameplay_Feedback.md)
