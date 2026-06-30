# Animations

**Authority:** [WS5 — Motion Language](LLDL/WS5_Motion_Language.md)  
**Tokens:** `LLAnimation` in [Design_Tokens](Design_Tokens.md)  
**Implementation:** `lib/design_system/tokens/ll_animation.dart`

WS5 defines motion **temperament** — calm, deliberate, premium. This document maps semantic motion roles to tokens.

---

## Motion Temperament

| Quality | Rule |
|---------|------|
| Calm | No bounce or elastic overshoot on core controls |
| Deliberate | Transitions have weight — not snap-pop |
| Subordinate | Gameplay chamber leads; HUD motion minimal |
| Proportionate | Reward moments brief — then settle |

---

## Duration Roles

| Semantic role | Token | Duration | Use |
|---------------|-------|----------|-----|
| Instant acknowledgment | `fast` | 150ms | Press feedback, micro state |
| Calm transition | `normal` | 300ms | Default UI transition |
| Deliberate reveal | `slow` | 500ms | Panel / phase change |
| Path activation | `pathGlow` | 280ms | Gameplay path pulse |
| Fade entrance | `fadeIn` | 350ms | Content appear |
| Ceremonial reward | `rewardPop` | 600ms | Victory / reward moment |
| Portal / loader loop | `portalPulse`, `glowLoop` | 2000ms | `LLLoadingIndicator`, maze exit |

**Curves:** `standard` (`easeOutCubic`), `portalPulseCurve`, `fadeInCurve` — avoid elastic on HUD/buttons.

**Legacy aliases:** `panelReveal` → `fadeIn` · `rewardBurst` → `rewardPop`

---

## Reduced Motion

When `MediaQuery.disableAnimationsOf(context)` is true:

| Default animation | Fallback |
|-------------------|----------|
| `normal` / `slow` transitions | `fast` or instant |
| `portalPulse` loop | Static icon + optional opacity |
| `rewardPop` | Fade or static confirmation |
| Path glow pulse | Static path stroke |

Essential state must remain comprehensible without motion.

---

## Component Motion

| Component | Motion | WS5 rule |
|-----------|--------|----------|
| `LLButton` | Ink splash only | No bounce |
| `LLDialog` | Fade + slight scale | Weighted enter |
| `LLToast` | Slide/fade in | Non-blocking |
| `LLLoadingIndicator` | Calm portal pulse | Not frantic spin |
| Gameplay HUD | Phase transitions only | No idle pulse |
| Maze execution | Character path follow | Subordinate to readability |

---

## Anti-Patterns

- Bounce/elastic on undo, hint, settings, or store buttons
- Persistent HUD pulsing unrelated to phase
- Motion-only hazard or success communication
- Competing simultaneous motion layers without hierarchy

---

## Related Documents

- [WS5 — Motion Language](LLDL/WS5_Motion_Language.md)
- [Accessibility](Accessibility.md) — reduced motion requirements
- [Design_Tokens](Design_Tokens.md)
