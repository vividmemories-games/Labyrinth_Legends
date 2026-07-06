import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:labyrinth_legends/core/env/app_env.dart';
import 'package:labyrinth_legends/design_system/components/components.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';
import 'package:labyrinth_legends/features/home/presentation/home_mock_data.dart';

/// Home hub — docs/03_Screens/Home.md · MVP mockup panel 1 (Splash/Home).
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LLScreenBackground(
        heroImageAsset: HomeMockData.heroImageAsset,
        heroAlignment: const Alignment(0, 0.02),
        heroScale: 1.04,
        veilStrength: 0.38,
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Transform.translate(
                    offset: const Offset(0, -LLSpacing.xxl),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: LLSpacing.sm),
                      child: _HomeTitle(),
                    ),
                  ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: LLSpacing.screenPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      LLButton(
                        label: 'PLAY',
                        expanded: true,
                        onPressed: () => context.push('/worlds'),
                      ),
                      const SizedBox(height: LLSpacing.sm + LLSpacing.xs),
                      LLButton(
                        label: 'DAILY CHALLENGE',
                        variant: LLButtonVariant.secondary,
                        expanded: true,
                        onPressed: () => context.push('/daily'),
                      ),
                      const SizedBox(height: LLSpacing.sm + LLSpacing.xs),
                      LLButton(
                        label: 'SHOP',
                        variant: LLButtonVariant.secondary,
                        expanded: true,
                        onPressed: () => context.push('/shop'),
                      ),
                      const SizedBox(height: LLSpacing.xxl),
                      _HomeDock(
                        onSettings: () => context.push('/settings'),
                      ),
                      const SizedBox(height: LLSpacing.sm),
                    ],
                  ),
                ),
              ],
            ),
            if (AppEnv.enableDebugOverlays)
              const Positioned(
                top: 0,
                right: LLSpacing.screenPadding,
                child: _DevToolsMenu(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeTitle extends StatelessWidget {
  const _HomeTitle();

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Labyrinth Legends',
      child: Image.asset(
        HomeMockData.logoImageAsset,
        width: double.infinity,
        fit: BoxFit.contain,
      ),
    );
  }
}

class _DevToolsMenu extends StatelessWidget {
  const _DevToolsMenu();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<_DevRoute>(
      tooltip: 'Developer tools',
      icon: Icon(
        Icons.code_outlined,
        color: LLColor.textSecondary.withValues(alpha: 0.7),
        size: LLSize.iconMd,
      ),
      color: LLColor.stoneDark,
      shape: RoundedRectangleBorder(
        borderRadius: LLRadius.mdBorder,
        side: BorderSide(
          color: LLColor.ancientGold.withValues(alpha: LLColor.borderGoldAlpha),
        ),
      ),
      onSelected: (route) => context.push(route.path),
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: _DevRoute.designSystem,
          child: Text('Design System'),
        ),
        const PopupMenuItem(
          value: _DevRoute.engineSandbox,
          child: Text('Engine Sandbox'),
        ),
      ],
    );
  }
}

enum _DevRoute {
  designSystem('/dev/design-system'),
  engineSandbox('/dev/engine-sandbox');

  const _DevRoute(this.path);
  final String path;
}

class _HomeDock extends StatelessWidget {
  const _HomeDock({required this.onSettings});

  final VoidCallback onSettings;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LLIconButton(
          icon: Icons.settings_outlined,
          tooltip: 'Settings',
          onPressed: onSettings,
        ),
        const SizedBox(width: LLSpacing.lg),
        const LLIconButton(
          icon: Icons.emoji_events_outlined,
          tooltip: 'Leaderboards',
          enabled: false,
        ),
        const SizedBox(width: LLSpacing.lg),
        const LLIconButton(
          icon: Icons.lock_outline,
          tooltip: 'Coming soon',
          enabled: false,
        ),
      ],
    );
  }
}
