# Review Packages (99_Reviews)

Formal handoff artifacts for **Codex** and **Human** review — without requiring continuous access to the local project folder.

## Purpose

Review packages record what changed, why it changed, risks, dependencies, product impact, future debt, and approval status.

## Cadence (Human override — 2026-07-09)

| When | Rule |
|------|------|
| **During implementation** | Cursor does **not** scaffold a review package after every major task |
| **Weekly Codex session** | Human asks Cursor to generate **one batch package** since the last package |
| **Baseline cutoff** | Last batch: **0092** (`Releases/0092_m2_9_vertical_slice_closure.md`) — Approved |
| **Next ID** | **0093** |

The former per-task rule is **suspended** until Human reinstates it. See `AGENTS.md` §4.

## v2 Template (required for new batches)

All new review packages must use **template v2** (`docs/99_Reviews/Review_Template.md`):

- Motivation, Risk Assessment, Dependencies, Product Impact
- Future Technical Debt, Recommended Next Task
- Reviewer Notes (Codex, Human)

Scaffold with `./scripts/new_review_package.sh`.

## Workflow

```text
Cursor implements tasks (no per-task package)
    → Updates LLDS docs as needed
    → Runs test / analyze
Weekly: Human requests batch
    → Cursor diffs since last package (0091+)
    → Scaffolds 0092 (or split if very large)
    → Fills v2 sections, marks Ready For
Codex reviews in weekly session
    → Fill / confirm Reviewer Notes
Human approves batch
    → Next implementation week begins
```

## Folder Structure

```text
docs/99_Reviews/
├── README.md                 ← this file
├── Review_Template.md        ← v2 template
├── Design_System/
├── Screens/
├── Gameplay/
├── Architecture/
├── Economy/
├── Implementation/
└── Releases/
```

## Naming Convention

```text
NNNN_topic_name.md
```

**Next ID:** **0093** (or run the generator script).

## Automate Creation

```bash
./scripts/new_review_package.sh <Category> <topic_slug> [options]
```

**Options:** `--task-name`, `--phase`, `--owner`, `--update-index`, `--dry-run`

Categories: `Design_System`, `Screens`, `Gameplay`, `Architecture`, `Economy`, `Releases`, `Implementation`.

### Cursor stop hook

`.cursor/hooks/remind-review-package.sh` nudges the agent at session end when code changed but no review package was updated since the last batch — reminder text points to **weekly batch**, not per-task creation.

## Who Reviews What

| Reviewer | Focus |
|----------|-------|
| **Codex** | Architecture, maintainability, performance, tests, Flutter quality, LLDL implementation |
| **Human** | Final product/business approval |

ChatGPT is no longer part of the review workflow (`Decisions.md` — 2026-07-06). Historical packages may retain ChatGPT notes for audit.

## Superseded packages (historical)

| IDs | Superseded by | Notes |
|-----|---------------|-------|
| 0087, 0088, 0089 | **0090** | PNG autotile / edge-tile rendering — replaced by code-drawn `MazePainter` |
| 0070 | **0071**, **0090** | World 01 Phase 3 environment prototype — MVP pivoted to static mockup + `MazePainter` |

Packages remain in the index for audit; status **Approved** with superseded notes in file headers.

## Index of Reviews

All packages through **0091** are **Approved** (batch hygiene pass 2026-07-09). See individual files for detail.

| ID range | Category | Status |
|----------|----------|--------|
| 0001–0037 | Design_System, Screens, Gameplay, Releases | Approved |
| 0038–0051 | Releases (M0/M1) | Approved & Locked where noted |
| 0052–0061 | Releases, Architecture | Approved |
| 0062–0091 | Screens, Implementation, Architecture | Approved |

Full per-file index (legacy table): expand individual category folders or run:

```bash
find docs/99_Reviews -mindepth 2 -maxdepth 2 -name '*.md' ! -name 'README.md' | sort
```

**Next batch:** 0093

## Related Docs

- `AGENTS.md` — agent roles and weekly review cadence
- `.cursor/rules/labyrinth-legends.mdc`
- `docs/05_AI/Cursor/Workflow.md`
- `docs/05_AI/Codex/Review_Checklist.md`

## Full Index

| ID | File | Status |
|----|------|--------|
| 0001 | [Design_System/0001_design_system_foundation.md](Design_System/0001_design_system_foundation.md) | Approved |
| 0002 | [Screens/0002_home_screen_shell.md](Screens/0002_home_screen_shell.md) | Approved |
| 0003 | [Releases/0003_review_package_workflow.md](Releases/0003_review_package_workflow.md) | Approved |
| 0004 | [Releases/0004_review_package_stop_hook.md](Releases/0004_review_package_stop_hook.md) | Approved |
| 0005 | [Releases/0005_review_package_v2_template.md](Releases/0005_review_package_v2_template.md) | Approved |
| 0006 | [Gameplay/0006_gp4_hazards_failure.md](Gameplay/0006_gp4_hazards_failure.md) | Approved & Locked |
| 0007 | [Gameplay/0007_gp5_objectives_completion.md](Gameplay/0007_gp5_objectives_completion.md) | Approved & Locked |
| 0008 | [Gameplay/0008_gp6_gameplay_feedback.md](Gameplay/0008_gp6_gameplay_feedback.md) | Approved & Locked |
| 0009 | [Gameplay/0009_gp7_gameplay_rules.md](Gameplay/0009_gp7_gameplay_rules.md) | Approved & Locked |
| 0010 | [Gameplay/0010_gameplay_integration.md](Gameplay/0010_gameplay_integration.md) | Approved & Locked |
| 0011 | [Design_System/0011_ws0_design_philosophy.md](Design_System/0011_ws0_design_philosophy.md) | Approved |
| 0012 | [Design_System/0012_ws1_visual_identity.md](Design_System/0012_ws1_visual_identity.md) | Approved |
| 0013 | [Design_System/0013_ws2_color_language.md](Design_System/0013_ws2_color_language.md) | Approved |
| 0014 | [Design_System/0014_ws3_environment_language.md](Design_System/0014_ws3_environment_language.md) | Approved |
| 0015 | [Design_System/0015_ws4_ui_language.md](Design_System/0015_ws4_ui_language.md) | Approved |
| 0016 | [Design_System/0016_ws5_motion_language.md](Design_System/0016_ws5_motion_language.md) | Approved |
| 0017 | [Design_System/0017_ws6_audio_language.md](Design_System/0017_ws6_audio_language.md) | Approved |
| 0018 | [Design_System/0018_ws7_typography_language.md](Design_System/0018_ws7_typography_language.md) | Approved |
| 0019 | [Design_System/0019_ws8_iconography_language.md](Design_System/0019_ws8_iconography_language.md) | Approved |
| 0020 | [Design_System/0020_ws9_accessibility_language.md](Design_System/0020_ws9_accessibility_language.md) | Approved |
| 0021 | [Design_System/0021_ws10_design_tokens_language.md](Design_System/0021_ws10_design_tokens_language.md) | Approved |
| 0022 | [Design_System/0022_ws11_components_language.md](Design_System/0022_ws11_components_language.md) | Approved |
| 0023 | [Design_System/0023_lldl_architecture_integration.md](Design_System/0023_lldl_architecture_integration.md) | Approved |
| 0024 | [Design_System/0024_ws10_ws11_implementation_reconciliation.md](Design_System/0024_ws10_ws11_implementation_reconciliation.md) | Approved |
| 0025 | [Design_System/0025_tier3_downstream_accessibility_migration.md](Design_System/0025_tier3_downstream_accessibility_migration.md) | Approved |
| 0026 | [Releases/0026_llds_repository_consistency_cleanup.md](Releases/0026_llds_repository_consistency_cleanup.md) | Approved |
| 0027 | [Design_System/0027_asset_bible_structure.md](Design_System/0027_asset_bible_structure.md) | Approved |
| 0028 | [Design_System/0028_ab0_asset_philosophy.md](Design_System/0028_ab0_asset_philosophy.md) | Approved |
| 0029 | [Design_System/0029_ab1_production_standards.md](Design_System/0029_ab1_production_standards.md) | Approved |
| 0030 | [Design_System/0030_ab2_game_assets.md](Design_System/0030_ab2_game_assets.md) | Approved |
| 0031 | [Design_System/0031_ab3_ui_brand_assets.md](Design_System/0031_ab3_ui_brand_assets.md) | Approved |
| 0032 | [Design_System/0032_ab4_marketing_store_assets.md](Design_System/0032_ab4_marketing_store_assets.md) | Approved |
| 0033 | [Design_System/0033_ab5_ai_production_pipeline.md](Design_System/0033_ab5_ai_production_pipeline.md) | Approved |
| 0034 | [Design_System/0034_ab6_review_asset_lifecycle.md](Design_System/0034_ab6_review_asset_lifecycle.md) | Approved |
| 0035 | [Design_System/0035_asset_bible_integration.md](Design_System/0035_asset_bible_integration.md) | Approved |
| 0036 | [Releases/0036_docs_hygiene_audit.md](Releases/0036_docs_hygiene_audit.md) | Approved |
| 0037 | [Gameplay/0037_puzzle_elements_integration.md](Gameplay/0037_puzzle_elements_integration.md) | Approved |
| 0038 | [Releases/0038_technical_implementation_plan.md](Releases/0038_technical_implementation_plan.md) | Approved |
| 0039 | [Releases/0039_level_format.md](Releases/0039_level_format.md) | Approved & Locked |
| 0040 | [Releases/0040_coding_standards.md](Releases/0040_coding_standards.md) | Approved & Locked |
| 0041 | [Releases/0041_agents_governance_refinement.md](Releases/0041_agents_governance_refinement.md) | Approved & Locked |
| 0042 | [Releases/0042_engine_architecture.md](Releases/0042_engine_architecture.md) | Approved & Locked |
| 0043 | [Releases/0043_m1_1_level_format_validation.md](Releases/0043_m1_1_level_format_validation.md) | Approved & Locked |
| 0044 | [Releases/0044_m1_2_gameplay_session_skeleton.md](Releases/0044_m1_2_gameplay_session_skeleton.md) | Approved & Locked |
| 0045 | [Releases/0045_m1_3_path_validation.md](Releases/0045_m1_3_path_validation.md) | Approved & Locked |
| 0046 | [Releases/0046_m1_4_execution_pipeline.md](Releases/0046_m1_4_execution_pipeline.md) | Approved & Locked |
| 0047 | [Releases/0047_m1_5_objective_evaluation.md](Releases/0047_m1_5_objective_evaluation.md) | Approved & Locked |
| 0048 | [Releases/0048_m1_6_engine_integration_rewards.md](Releases/0048_m1_6_engine_integration_rewards.md) | Approved & Locked |
| 0049 | [Releases/0049_m1_7_engine_debug_sandbox.md](Releases/0049_m1_7_engine_debug_sandbox.md) | Approved & Locked |
| 0050 | [Releases/0050_m1_completion_docs_hygiene.md](Releases/0050_m1_completion_docs_hygiene.md) | Approved & Locked |
| 0051 | [Releases/0051_non_m1_review_status_hygiene.md](Releases/0051_non_m1_review_status_hygiene.md) | Approved & Locked |
| 0052 | [Releases/0052_documentation_template_standards.md](Releases/0052_documentation_template_standards.md) | Approved |
| 0053 | [Releases/0053_ui_documentation_governance_alignment.md](Releases/0053_ui_documentation_governance_alignment.md) | Approved |
| 0054 | [Architecture/0054_ui_01_ui_philosophy.md](Architecture/0054_ui_01_ui_philosophy.md) | Approved |
| 0055 | [Architecture/0055_ui_02_layout_system.md](Architecture/0055_ui_02_layout_system.md) | Approved |
| 0056 | [Architecture/0056_ui_03_gameplay_screen_specification.md](Architecture/0056_ui_03_gameplay_screen_specification.md) | Approved |
| 0057 | [Architecture/0057_ui_04_design_tokens.md](Architecture/0057_ui_04_design_tokens.md) | Approved |
| 0058 | [Architecture/0058_ui_05_component_library.md](Architecture/0058_ui_05_component_library.md) | Approved |
| 0059 | [Architecture/0059_ui_behavior_layer.md](Architecture/0059_ui_behavior_layer.md) | Approved |
| 0060 | [Releases/0060_docs_hygiene_ui_architecture_status_alignment.md](Releases/0060_docs_hygiene_ui_architecture_status_alignment.md) | Approved |
| 0061 | [Architecture/0061_ui_chapter_integration.md](Architecture/0061_ui_chapter_integration.md) | Approved |
| 0062 | [Screens/0062_m2_1_production_ui_foundation.md](Screens/0062_m2_1_production_ui_foundation.md) | Approved |
| 0063 | [Screens/0063_m2_2_gameplay_board_rendering_path_drawing.md](Screens/0063_m2_2_gameplay_board_rendering_path_drawing.md) | Approved |
| 0064 | [Screens/0064_m2_3_path_execution_explorer_movement.md](Screens/0064_m2_3_path_execution_explorer_movement.md) | Approved |
| 0065 | [Screens/0065_m2_4_world_state_objective_feedback.md](Screens/0065_m2_4_world_state_objective_feedback.md) | Approved |
| 0066 | [Screens/0066_m2_5_terminal_outcome_retry_flow.md](Screens/0066_m2_5_terminal_outcome_retry_flow.md) | Approved |
| 0067 | [Implementation/0067_m2_6_gameplay_feedback_interaction_polish.md](Implementation/0067_m2_6_gameplay_feedback_interaction_polish.md) | Approved |
| 0068 | [Implementation/0068_m2_7_premium_visual_foundation.md](Implementation/0068_m2_7_premium_visual_foundation.md) | Approved |
| 0069 | [Releases/0069_world_01_phase1_visual_language_study.md](Releases/0069_world_01_phase1_visual_language_study.md) | Approved |
| 0070 | [Screens/0070_world_01_phase3_simulator_prototype_v2.md](Screens/0070_world_01_phase3_simulator_prototype_v2.md) | Approved |
| 0071 | [Releases/0071_mvp_visual_pivot_back_to_basics.md](Releases/0071_mvp_visual_pivot_back_to_basics.md) | Approved |
| 0072 | [Screens/0072_m2_8_home_mockup_visual_pass.md](Screens/0072_m2_8_home_mockup_visual_pass.md) | Approved |
| 0073 | [Design_System/0073_weathered_button_tokens.md](Design_System/0073_weathered_button_tokens.md) | Approved |
| 0074 | [Screens/0074_m2_8_home_button_visual_polish.md](Screens/0074_m2_8_home_button_visual_polish.md) | Approved |
| 0075 | [Design_System/0075_button_typography_tokens.md](Design_System/0075_button_typography_tokens.md) | Approved |
| 0076 | [Screens/0076_m2_8_home_layout_button_polish.md](Screens/0076_m2_8_home_layout_button_polish.md) | Approved |
| 0077 | [Design_System/0077_primary_button_corner_fix.md](Design_System/0077_primary_button_corner_fix.md) | Approved |
| 0078 | [Screens/0078_home_logo_asset_restore.md](Screens/0078_home_logo_asset_restore.md) | Approved |
| 0079 | [Screens/0079_home_background_asset_swap.md](Screens/0079_home_background_asset_swap.md) | Approved |
| 0080 | [Screens/0080_home_logo_layout_pin.md](Screens/0080_home_logo_layout_pin.md) | Approved |
| 0081 | [Screens/0081_home_currency_removal_logo_top.md](Screens/0081_home_currency_removal_logo_top.md) | Approved |
| 0082 | [Screens/0082_level_select_winding_map.md](Screens/0082_level_select_winding_map.md) | Approved |
| 0083 | [Screens/0083_worlds_chapter_backgrounds.md](Screens/0083_worlds_chapter_backgrounds.md) | Approved |
| 0084 | [Releases/0084_review_hygiene_p1_p3.md](Releases/0084_review_hygiene_p1_p3.md) | Approved |
| 0085 | [Screens/0085_m2_8_gameplay_mockup_visual_pass.md](Screens/0085_m2_8_gameplay_mockup_visual_pass.md) | Approved |
| 0086 | [Screens/0086_gameplay_board_sprite_wiring.md](Screens/0086_gameplay_board_sprite_wiring.md) | Approved |
| 0087 | [Screens/0087_gameplay_wall_autotiling_procedural_assets.md](Screens/0087_gameplay_wall_autotiling_procedural_assets.md) | Approved |
| 0088 | [Screens/0088_gameplay_authored_autotile_pngs.md](Screens/0088_gameplay_authored_autotile_pngs.md) | Approved |
| 0089 | [Architecture/0089_edge_based_maze_authored_tiles.md](Architecture/0089_edge_based_maze_authored_tiles.md) | Approved |
| 0090 | [Screens/0090_gameplay_maze_poc_renderer.md](Screens/0090_gameplay_maze_poc_renderer.md) | Approved |
| 0091 | [Screens/0091_gameplay_floor_tile_variation.md](Screens/0091_gameplay_floor_tile_variation.md) | Approved |
| 0092 | [Releases/0092_m2_9_vertical_slice_closure.md](Releases/0092_m2_9_vertical_slice_closure.md) | Approved |

**Next ID:** 0093
