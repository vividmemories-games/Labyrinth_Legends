import 'package:go_router/go_router.dart';
import 'package:labyrinth_legends/core/env/app_env.dart';
import 'package:labyrinth_legends/design_system/showcase/design_system_showcase_screen.dart';
import 'package:labyrinth_legends/features/daily_challenge/presentation/daily_challenge_screen.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_screen.dart';
import 'package:labyrinth_legends/features/home/presentation/home_screen.dart';
import 'package:labyrinth_legends/features/level_complete/presentation/level_complete_screen.dart';
import 'package:labyrinth_legends/features/level_select/presentation/level_select_screen.dart';
import 'package:labyrinth_legends/features/settings/presentation/settings_screen.dart';
import 'package:labyrinth_legends/features/shop/presentation/shop_screen.dart';
import 'package:labyrinth_legends/features/worlds/presentation/worlds_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    if (AppEnv.enableDebugOverlays)
      GoRoute(
        path: '/dev/design-system',
        name: 'designSystemShowcase',
        builder: (context, state) => const DesignSystemShowcaseScreen(),
      ),
    GoRoute(
      path: '/worlds',
      name: 'worlds',
      builder: (context, state) => const WorldsScreen(),
    ),
    GoRoute(
      path: '/worlds/:worldId/levels',
      name: 'levelSelect',
      builder: (context, state) {
        final worldId = state.pathParameters['worldId']!;
        return LevelSelectScreen(worldId: worldId);
      },
    ),
    GoRoute(
      path: '/play/:levelId',
      name: 'play',
      builder: (context, state) {
        final levelId = state.pathParameters['levelId']!;
        return GameplayScreen(levelId: levelId);
      },
    ),
    GoRoute(
      path: '/complete/:levelId',
      name: 'complete',
      builder: (context, state) {
        final levelId = state.pathParameters['levelId']!;
        return LevelCompleteScreen(levelId: levelId);
      },
    ),
    GoRoute(
      path: '/shop',
      name: 'shop',
      builder: (context, state) => const ShopScreen(),
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/daily',
      name: 'daily',
      builder: (context, state) => const DailyChallengeScreen(),
    ),
  ],
);
