import 'package:go_router/go_router.dart';
import 'package:labyrinth_legends/app/routes.dart';
import 'package:labyrinth_legends/core/env/app_env.dart';
import 'package:labyrinth_legends/design_system/showcase/design_system_showcase_screen.dart';
import 'package:labyrinth_legends/features/daily_challenge/presentation/daily_challenge_screen.dart';
import 'package:labyrinth_legends/features/engine_debug_sandbox/presentation/engine_debug_sandbox_screen.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_screen.dart';
import 'package:labyrinth_legends/features/home/presentation/home_screen.dart';
import 'package:labyrinth_legends/features/level_complete/presentation/level_complete_screen.dart';
import 'package:labyrinth_legends/features/level_select/presentation/level_select_screen.dart';
import 'package:labyrinth_legends/features/settings/presentation/settings_screen.dart';
import 'package:labyrinth_legends/features/shop/presentation/shop_screen.dart';
import 'package:labyrinth_legends/features/splash/presentation/splash_screen.dart';
import 'package:labyrinth_legends/features/worlds/presentation/worlds_screen.dart';

final appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.home,
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    if (AppEnv.enableDebugOverlays)
      GoRoute(
        path: AppRoutes.designSystemShowcase,
        name: 'designSystemShowcase',
        builder: (context, state) => const DesignSystemShowcaseScreen(),
      ),
    if (AppEnv.enableDebugOverlays)
      GoRoute(
        path: AppRoutes.engineDebugSandbox,
        name: 'engineDebugSandbox',
        builder: (context, state) => const EngineDebugSandboxScreen(),
      ),
    GoRoute(
      path: AppRoutes.worlds,
      name: 'worlds',
      builder: (context, state) => const WorldsScreen(),
    ),
    GoRoute(
      path: AppRoutes.levelSelect,
      name: 'levelSelect',
      builder: (context, state) {
        final worldId = state.pathParameters['worldId']!;
        return LevelSelectScreen(worldId: worldId);
      },
    ),
    GoRoute(
      path: AppRoutes.gameplay,
      name: 'play',
      pageBuilder: (context, state) {
        final levelId = state.pathParameters['levelId']!;
        return NoTransitionPage<void>(
          key: state.pageKey,
          child: GameplayScreen(levelId: levelId),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.complete,
      name: 'complete',
      pageBuilder: (context, state) {
        final levelId = state.pathParameters['levelId']!;
        return NoTransitionPage<void>(
          key: state.pageKey,
          child: LevelCompleteScreen(levelId: levelId),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.shop,
      name: 'shop',
      builder: (context, state) => const ShopScreen(),
    ),
    GoRoute(
      path: AppRoutes.settings,
      name: 'settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: AppRoutes.daily,
      name: 'daily',
      builder: (context, state) => const DailyChallengeScreen(),
    ),
  ],
);
