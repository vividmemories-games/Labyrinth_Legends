# Review Packages (99_Reviews)

Formal handoff artifacts for **ChatGPT**, **Codex**, and **Human** review — without requiring continuous access to the local project folder.

## Purpose

After every major Cursor task, a review package is created here. It is the **official handoff artifact** recording what changed, why it changed, risks, dependencies, product impact, future debt, and whether it is ready for external review.

**Every major task requires a review package.** Cursor must **not** mark a major task complete until the review package exists and is filled in using the **v2 template** (`docs/99_Reviews/Review_Template.md`).

## v2 Template (required)

All new review packages must use **template v2**, which includes:

- **Motivation** — why the work was undertaken and why this approach
- **Risk Assessment** — level, affected areas, rollback, migration, user impact
- **Dependencies** — depends on, enables, blocks
- **Product Impact** — player, visual, UX, performance, developer experience
- **Future Technical Debt** — shortcuts, temporary implementations, cleanup tasks
- **Recommended Next Task** — suggested follow-up for the next milestone
- **Reviewer Notes** — standardized Codex, ChatGPT, and Human sections with verdict, score, and recommendations

Scaffold with `./scripts/new_review_package.sh` — it always uses the current v2 template.

## Workflow

```text
Cursor implements task
    → Updates LLDS docs as needed
    → Runs test / analyze
    → Scaffolds review package (scripts/new_review_package.sh — v2 template)
    → Fills all v2 sections (motivation, risk, dependencies, product impact, debt, next task)
    → Marks Ready For: Codex + ChatGPT + Human
Codex / ChatGPT review the package (+ selected files if repo access available)
    → Fill Reviewer Notes section
Human approves
    → Next phase may begin
```

**Do not start the next major phase until the review package is approved** (or explicitly waived by Human).

## Folder Structure

```text
docs/99_Reviews/
├── README.md                 ← this file
├── Review_Template.md        ← v2 template for every new review
├── Design_System/            ← tokens, components, showcase
├── Screens/                  ← screen shells and UI flows
├── Gameplay/                 ← engine, mechanics, levels
├── Architecture/             ← structure, services, state
├── Economy/                  ← monetization, currencies, shop
└── Releases/                 ← milestones, LLDS governance, releases
```

## Naming Convention

Sequential global IDs with snake_case topic:

```text
NNNN_topic_name.md
```

Examples:

- `Design_System/0001_design_system_foundation.md`
- `Screens/0002_home_screen_shell.md`
- `Architecture/0003_folder_structure_review.md`

**Next ID:** Check all category folders for highest number; increment by 1 — or run the generator script (below).

## Automate Creation

Use `scripts/new_review_package.sh` instead of copying the template manually:

```bash
./scripts/new_review_package.sh <Category> <topic_slug> [options]
```

Examples:

```bash
# Level select screen shell (next ID assigned automatically)
./scripts/new_review_package.sh Screens level_select_shell

# Custom title and phase; also append to index table
./scripts/new_review_package.sh Design_System token_refresh \
  --task-name "Token Refresh" \
  --phase "Phase 2 — Design System" \
  --update-index

# Preview without writing files
./scripts/new_review_package.sh Screens level_select_shell --dry-run
```

**Options:** `--task-name`, `--phase`, `--owner`, `--update-index`, `--dry-run`

Categories: `Design_System`, `Screens`, `Gameplay`, `Architecture`, `Economy`, `Releases` (case-insensitive; `-` also works).

Cursor should run this at the **start** of filling in a review package (scaffold), then complete the sections after implementation.

### Cursor stop hook

A project-level **stop hook** (`.cursor/hooks.json`) reminds the agent at session end when `lib/` or `test/` Dart files are newer than the latest review package:

```text
.cursor/hooks.json
.cursor/hooks/remind-review-package.sh
```

Reload Cursor (or save `hooks.json`) after changes. Check the **Hooks** output channel if debugging.

## Who Reviews What

| Reviewer | Focus |
|----------|-------|
| **Codex** | Architecture, maintainability, performance, tests, Flutter quality |
| **ChatGPT** | UX, LLDL compliance, gameplay feel, monetization, player experience, polish |
| **Human** | Final product/business approval |

## Sharing Without Repo Access

Share with reviewers:

1. The review package markdown file (copy/paste or export)
2. Screenshots listed in **Screenshots / Visual Evidence**
3. Selected file excerpts if needed
4. Test/analyze output from **Commands Run**

The in-app showcase (`/dev/design-system`) is the live visual reference when running the dev build locally.

## Index of Completed Reviews

| ID | File | Status |
|----|------|--------|
| 0001 | [Design_System/0001_design_system_foundation.md](Design_System/0001_design_system_foundation.md) | Ready for Review |
| 0002 | [Screens/0002_home_screen_shell.md](Screens/0002_home_screen_shell.md) | Ready for Review |
| 0003 | [Releases/0003_review_package_workflow.md](Releases/0003_review_package_workflow.md) | Ready for Review |
| 0004 | [Releases/0004_review_package_stop_hook.md](Releases/0004_review_package_stop_hook.md) | Ready for Review |
| 0005 | [Releases/0005_review_package_v2_template.md](Releases/0005_review_package_v2_template.md) | Ready for Review |
| 0006 | [Gameplay/0006_gp4_hazards_failure.md](Gameplay/0006_gp4_hazards_failure.md) | Ready for Review |
| 0007 | [Gameplay/0007_gp5_objectives_completion.md](Gameplay/0007_gp5_objectives_completion.md) | Ready for Review |
| 0008 | [Gameplay/0008_gp6_gameplay_feedback.md](Gameplay/0008_gp6_gameplay_feedback.md) | Ready for Review |
| 0009 | [Gameplay/0009_gp7_gameplay_rules.md](Gameplay/0009_gp7_gameplay_rules.md) | Ready for Review |
| 0010 | [Gameplay/0010_gameplay_integration.md](Gameplay/0010_gameplay_integration.md) | Ready for Review |
| 0011 | [Design_System/0011_ws0_design_philosophy.md](Design_System/0011_ws0_design_philosophy.md) | Approved |
| 0012 | [Design_System/0012_ws1_visual_identity.md](Design_System/0012_ws1_visual_identity.md) | Draft |
| 0013 | [Design_System/0013_ws2_color_language.md](Design_System/0013_ws2_color_language.md) | Draft |
| 0014 | [Design_System/0014_ws3_environment_language.md](Design_System/0014_ws3_environment_language.md) | Draft |
| 0015 | [Design_System/0015_ws4_ui_language.md](Design_System/0015_ws4_ui_language.md) | Draft |
| 0016 | [Design_System/0016_ws5_motion_language.md](Design_System/0016_ws5_motion_language.md) | Draft |
| 0017 | [Design_System/0017_ws6_audio_language.md](Design_System/0017_ws6_audio_language.md) | Draft |
| 0018 | [Design_System/0018_ws7_typography_language.md](Design_System/0018_ws7_typography_language.md) | Draft |
| 0019 | [Design_System/0019_ws8_iconography_language.md](Design_System/0019_ws8_iconography_language.md) | Draft |
| 0020 | [Design_System/0020_ws9_accessibility_language.md](Design_System/0020_ws9_accessibility_language.md) | Draft |
| 0021 | [Design_System/0021_ws10_design_tokens_language.md](Design_System/0021_ws10_design_tokens_language.md) | Draft |
| 0022 | [Design_System/0022_ws11_components_language.md](Design_System/0022_ws11_components_language.md) | Draft |
| 0023 | [Design_System/0023_lldl_architecture_integration.md](Design_System/0023_lldl_architecture_integration.md) | Approved |
| 0024 | [Design_System/0024_ws10_ws11_implementation_reconciliation.md](Design_System/0024_ws10_ws11_implementation_reconciliation.md) | Approved |
| 0025 | [Design_System/0025_tier3_downstream_accessibility_migration.md](Design_System/0025_tier3_downstream_accessibility_migration.md) | Approved |
| 0026 | [Releases/0026_llds_repository_consistency_cleanup.md](Releases/0026_llds_repository_consistency_cleanup.md) | Ready for Review |
| 0027 | [Design_System/0027_asset_bible_structure.md](Design_System/0027_asset_bible_structure.md) | Draft |
| 0028 | [Design_System/0028_ab0_asset_philosophy.md](Design_System/0028_ab0_asset_philosophy.md) | Approved |
| 0029 | [Design_System/0029_ab1_production_standards.md](Design_System/0029_ab1_production_standards.md) | Approved |
| 0030 | [Design_System/0030_ab2_game_assets.md](Design_System/0030_ab2_game_assets.md) | Approved |
| 0031 | [Design_System/0031_ab3_ui_brand_assets.md](Design_System/0031_ab3_ui_brand_assets.md) | Approved |
| 0032 | [Design_System/0032_ab4_marketing_store_assets.md](Design_System/0032_ab4_marketing_store_assets.md) | Approved |
| 0033 | [Design_System/0033_ab5_ai_production_pipeline.md](Design_System/0033_ab5_ai_production_pipeline.md) | Approved |
| 0034 | [Design_System/0034_ab6_review_asset_lifecycle.md](Design_System/0034_ab6_review_asset_lifecycle.md) | Approved |
| 0035 | [Design_System/0035_asset_bible_integration.md](Design_System/0035_asset_bible_integration.md) | Approved |
| 0036 | [Releases/0036_docs_hygiene_audit.md](Releases/0036_docs_hygiene_audit.md) | Approved |
| 0037 | [Gameplay/0037_puzzle_elements_integration.md](Gameplay/0037_puzzle_elements_integration.md) | Ready for Review |
| 0038 | [Releases/0038_technical_implementation_plan.md](Releases/0038_technical_implementation_plan.md) | Approved |
| 0039 | [Releases/0039_level_format.md](Releases/0039_level_format.md) | Ready for Review |
| 0040 | [Releases/0040_coding_standards.md](Releases/0040_coding_standards.md) | Ready for Review |
| 0041 | [Releases/0041_agents_governance_refinement.md](Releases/0041_agents_governance_refinement.md) | Draft |
| 0042 | [Releases/0042_engine_architecture.md](Releases/0042_engine_architecture.md) | Draft |
| 0043 | [Releases/0043_m1_1_level_format_validation.md](Releases/0043_m1_1_level_format_validation.md) | Draft |
| 0044 | [Releases/0044_m1_2_gameplay_session_skeleton.md](Releases/0044_m1_2_gameplay_session_skeleton.md) | Draft |
| 0045 | [Releases/0045_m1_3_path_validation.md](Releases/0045_m1_3_path_validation.md) | Draft |
| 0046 | [Releases/0046_m1_4_execution_pipeline.md](Releases/0046_m1_4_execution_pipeline.md) | Draft |
| 0047 | [Releases/0047_m1_5_objective_evaluation.md](Releases/0047_m1_5_objective_evaluation.md) | Draft |
| 0048 | [Releases/0048_m1_6_engine_integration_rewards.md](Releases/0048_m1_6_engine_integration_rewards.md) | Draft |
| 0049 | [Releases/0049_m1_7_engine_debug_sandbox.md](Releases/0049_m1_7_engine_debug_sandbox.md) | Draft |

**Next ID:** 0050

## Related Docs

- `AGENTS.md` — agent roles and mandatory review rule
- `.cursor/rules/labyrinth-legends.mdc` — Cursor mandatory review package
- `docs/05_AI/Cursor/Workflow.md`
- `docs/05_AI/Codex/Review_Checklist.md`
