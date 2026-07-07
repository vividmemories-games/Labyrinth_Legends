import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:labyrinth_legends/core/env/app_env.dart';
import 'package:labyrinth_legends/design_system/components/components.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';
import 'package:labyrinth_legends/features/home/presentation/home_mock_data.dart';

/// Static home hub — docs/03_Screens/Home.md (Phase 1 shell).
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LLScreenBackground(
        heroImageAsset: HomeMockData.heroImageAsset,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(LLSpacing.screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const LLCurrencyChip(
                      type: LLCurrencyType.coins,
                      amount: HomeMockData.coins,
                      compact: true,
                    ),
                    const SizedBox(width: LLSpacing.sm),
                    LLCurrencyChip(
                      type: LLCurrencyType.gems,
                      amount: HomeMockData.gems,
                      compact: true,
                      onTap: () => context.push('/shop'),
                    ),
                  ],
                ),
                if (AppEnv.enableDebugOverlays) ...[
                  const SizedBox(height: LLSpacing.sm),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Wrap(
                      spacing: LLSpacing.sm,
                      runSpacing: LLSpacing.sm,
                      alignment: WrapAlignment.end,
                      children: [
                        LLButton(
                          label: 'Design System',
                          variant: LLButtonVariant.ghost,
                          onPressed: () => context.push('/dev/design-system'),
                        ),
                        LLButton(
                          label: 'Engine Sandbox',
                          variant: LLButtonVariant.ghost,
                          onPressed: () => context.push('/dev/engine-sandbox'),
                        ),
                        LLButton(
                          label: 'Maze Render POC',
                          variant: LLButtonVariant.ghost,
                          onPressed: () =>
                              context.push('/dev/maze-render-poc'),
                        ),
                      ],
                    ),
                  ),
                ],
                const Spacer(flex: 2),
                Text(
                  HomeMockData.title,
                  textAlign: TextAlign.center,
                  style: LLTextStyle.h1,
                ),
                const SizedBox(height: LLSpacing.sm + LLSpacing.xs),
                Text(
                  HomeMockData.tagline,
                  textAlign: TextAlign.center,
                  style: LLTextStyle.body,
                ),
                const Spacer(),
                LLButton(
                  label: 'Play',
                  icon: Icons.play_arrow,
                  expanded: true,
                  onPressed: () => context.push('/worlds'),
                ),
                const SizedBox(height: LLSpacing.sm + LLSpacing.xs),
                LLButton(
                  label: 'Daily Challenge',
                  icon: Icons.calendar_today_outlined,
                  variant: LLButtonVariant.secondary,
                  expanded: true,
                  onPressed: () => context.push('/daily'),
                ),
                const SizedBox(height: LLSpacing.sm + LLSpacing.xs),
                Row(
                  children: [
                    Expanded(
                      child: LLButton(
                        label: 'Shop',
                        icon: Icons.storefront_outlined,
                        variant: LLButtonVariant.ghost,
                        expanded: true,
                        onPressed: () => context.push('/shop'),
                      ),
                    ),
                    const SizedBox(width: LLSpacing.sm + LLSpacing.xs),
                    Expanded(
                      child: LLButton(
                        label: 'Settings',
                        icon: Icons.settings_outlined,
                        variant: LLButtonVariant.ghost,
                        expanded: true,
                        onPressed: () => context.push('/settings'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: LLSpacing.md),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
