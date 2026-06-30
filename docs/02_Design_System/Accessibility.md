# Accessibility

**Authority:** [WS9 — Accessibility Language](LLDL/WS9_Accessibility_Language.md)  
**Tokens:** [Design_Tokens](Design_Tokens.md) · `LLSize.touchTarget`  
**Components:** [Components](Components.md) — WS11 accessibility defaults

WS9 defines accessibility **philosophy**. This document defines **measurable implementation requirements** for Labyrinth Legends.

---

## Core Principles

| Principle | Requirement |
|-----------|-------------|
| Multichannel communication | No critical state conveyed by color alone |
| Comfort before spectacle | Reduced motion and sensory load are first-class |
| Player-first clarity | Functional tier defaults on gameplay paths |
| Dignified settings | Comfort controls framed as premium respect |

---

## Touch Targets

| Requirement | Value | Token / API |
|-------------|-------|-------------|
| Minimum interactive target | **44×44 logical px** | `LLSize.touchTarget` |
| FAB diameter | 56 logical px | `LLSize.fab` |
| Path drawing tolerance | Finger-scale hit regions on maze board | Gameplay hit testing per `Architecture.md` |
| Spacing between adjacent targets | ≥ `LLSpacing.sm` (8px) where controls cluster | `LLSpacing` |

**Rules:**
- All `LLButton`, `LLIconButton`, and tappable chips must meet minimum touch target
- Decorative frames must not trap controls in non-safe areas
- No reflex-only interactions incompatible with thoughtful puzzle play

---

## Color & Contrast

| Pair | Requirement | Tokens |
|------|-------------|--------|
| Body text on dark surfaces | WCAG **AA** minimum (4.5:1 normal text) | `textPrimary` on `templeBlack` / `stoneDark` |
| Large titles / headings | WCAG **AA** large text (3:1) | `ancientGold` on dark surfaces |
| Secondary / caption text | Readable but subordinate | `textSecondary` on dark surfaces |
| Primary CTA label | Sufficient contrast on gold fill | `templeBlack` on `ancientGold` gradient |
| Danger / error | Distinct from success and energy | `emberRed` + label/icon support |
| Energy / path | Distinct from primary action gold | `energyCyan` — never sole hazard cue |

**Color-blind-safe cues:**
- Hazards: icon + label + shape change — not red hue alone
- Success: icon + brief copy — not green hue alone
- Selected list/tab: border, icon, or label weight — not hue alone
- Collectibles: shape (gem silhouette) + optional purple accent

---

## Motion & Reduced Motion

| Requirement | Implementation |
|-------------|----------------|
| Honor system reduced-motion preference | Check `MediaQuery.disableAnimationsOf(context)` |
| Core control transitions | Use `LLAnimation.fast` or instant when reduced motion active |
| Ceremonial reward motion | May simplify to fade when reduced motion active |
| No bounce on core controls | WS5 — no elastic overshoot on buttons, HUD, settings |
| No sustained idle pulsing | HUD and meta-game chrome at rest |
| Essential information never motion-only | Pair motion with static icon, label, or shape change |

**Token mapping:**

| Role | Default | Reduced-motion fallback |
|------|---------|-------------------------|
| Press acknowledgment | `LLAnimation.fast` | Instant / opacity step |
| Calm transition | `LLAnimation.normal` | `LLAnimation.fast` or instant |
| Portal loader | `LLAnimation.portalPulse` | Static portal icon + optional slow opacity |

---

## Screen Reader & Semantics

| Component / surface | Semantics requirement |
|---------------------|----------------------|
| `LLButton` | `Semantics(button: true, label: …, enabled: …)` |
| `LLIconButton` | `Semantics(button: true, label: tooltip or inferred action)` |
| `LLCurrencyChip` | `Semantics(label: "{amount} {type}")` |
| Gameplay maze | Custom semantics deferred until `LLMazeTile` — document phase in status text |
| Toasts | Announce via `SnackBar` / live region pattern |
| Dialogs | Title exposed as dialog label; actions as buttons |

**Rules:**
- Icon-only controls require `tooltip` or explicit `semanticsLabel`
- Critical gameplay objectives must have readable text — not glyph-only
- Error messages must be readable text — not color flash alone

---

## Typography & Readability

| Requirement | Implementation |
|-------------|----------------|
| No system default font in features | `LLTextStyle` via theme |
| Functional gameplay labels | Exo 2 (`body`, `button`, `caption`) |
| Ceremonial titles | Cinzel (`h1`, `h2`) — not on live HUD labels |
| Minimum caption size | 12px (`LLTextStyle.caption`) — avoid smaller in production UI |
| Text expansion | Layouts tolerate **+30%** string length for localization |
| Line length | Prefer readable column width on meta-game screens |

---

## Localization

| Requirement | Guidance |
|-------------|----------|
| String externalization | All player-facing copy in ARB / localization files (when i18n enabled) |
| Layout tolerance | Avoid fixed-width buttons that truncate translated labels |
| RTL readiness | Prefer symmetric layouts; audit mirroring before RTL launch |
| Number formatting | Use locale-aware formatting for currency and stats |
| Onboarding | Teach symbols with labels first; one concept per beat |

---

## Gameplay Accessibility

| Requirement | Source |
|-------------|--------|
| Progressive HUD | [WS4](LLDL/WS4_UI_Language.md) — current-decision information only |
| Fairness visibility | Hazards and objectives perceptible without single-channel cue |
| Assistance boundaries | Clarify state — never solve puzzle without approved assist tier |
| Feedback multichannel | Align with [GP6](../01_Game_Design/Gameplay/GP6_Gameplay_Feedback.md) |

---

## Settings (Implementation Targets)

When Settings screen is built, include dignified controls for:

| Setting | Purpose |
|---------|---------|
| Reduce motion | Maps to platform + in-app animation policy |
| Sound / music / haptics | Per WS6 channel independence |
| Text size | Where platform supports dynamic type |
| High contrast | Optional emphasis mode — must remain temple-authentic per WS9 |

---

## Verification Checklist

Use before shipping UI features:

- [ ] Touch targets ≥ 44px on all interactive components
- [ ] Critical states use icon, label, or shape — not color alone
- [ ] Reduced motion path tested on device/simulator
- [ ] Semantics labels on icon-only controls
- [ ] Gameplay HUD progressive — not persistent dashboard clutter
- [ ] No cyan primary CTAs
- [ ] Error states include readable instruction text

---

## Related Documents

- [WS9 — Accessibility Language](LLDL/WS9_Accessibility_Language.md)
- [WS4 — UI Language](LLDL/WS4_UI_Language.md) — progressive HUD
- [Components](Components.md) — component state requirements
- [Design_Tokens](Design_Tokens.md) — `LLSize.touchTarget`
