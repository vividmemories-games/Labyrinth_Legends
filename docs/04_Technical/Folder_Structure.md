# Folder Structure

```text
lib/
  main.dart
  app/
    app.dart                 # MaterialApp, theme from design_system
    router.dart              # go_router routes
  design_system/             # LLDL implementation (NEW — not in prototype)
    tokens/
      ll_color.dart
      ll_spacing.dart
      ll_radius.dart
      ll_shadow.dart
      ll_text_style.dart
      ll_animation.dart
    components/
      ll_button.dart
      ll_panel.dart
      ll_screen_background.dart
      ...
    theme/
      app_theme.dart
  core/
    env/
    services/                # Ads, Purchase, Analytics, RemoteConfig, CloudSave
    utils/
  game_engine/
    models/
    session/
    path/
    discovery/
    mechanics/
    rewards/
    hints/
    generation/
  data/
    models/
    repositories/
    local/
    providers.dart
  features/
    home/
    worlds/
    level_select/
    gameplay/
    level_complete/
    shop/
    settings/
    daily_challenge/
    profile/                 # future

assets/
  levels/{worldId}/          # level JSON (runtime)
  images/                    # bundled art

docs/                        # LLDS — source of truth
docs/assets/                 # mockups, references (not Flutter assets)

test/
  game_engine/
  design_system/
  data/
  integration/
```

## Rules

| Layer | May import |
|-------|------------|
| `features/` | `design_system`, `data`, `game_engine` models for display only |
| `game_engine/` | Nothing from Flutter UI |
| `data/` | `game_engine`, `core` |
| `design_system/` | Flutter only — no game rules |

## Prototype Note

Current repo has `lib/core/widgets/ruins_*` and `lib/app/theme.dart` — **replace** with `design_system/` per `docs/00_Project/Prototype_Status.md`.
