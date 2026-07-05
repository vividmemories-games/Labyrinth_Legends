import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:labyrinth_legends/core/debug/debug_config.dart';
import 'package:labyrinth_legends/core/debug/debug_overlay.dart';
import 'package:labyrinth_legends/data/providers.dart';
import 'package:labyrinth_legends/design_system/components/overlays/loading_overlay.dart';
import 'package:labyrinth_legends/design_system/components/overlays/toast_container.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_controller.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_layout.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_shell_state.dart';

/// Production gameplay screen shell — UI_03 structural implementation (M2.1).
class GameplayScreen extends ConsumerWidget {
  const GameplayScreen({super.key, required this.levelId});

  final String levelId;

  static const String defaultPrimaryActionLabel = 'Draw';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final levelAsync = ref.watch(levelByIdProvider(levelId));

    return ToastContainer(
      child: levelAsync.when(
        loading: () => const Scaffold(
          body: LoadingOverlay(message: 'Entering chamber…'),
        ),
        error: (error, _) => Scaffold(
          body: Center(child: Text('Failed to load level: $error')),
        ),
        data: (level) {
          if (level == null) {
            return const Scaffold(
              body: Center(child: Text('Level not found')),
            );
          }

          final shellState = ref.watch(gameplayControllerProvider(level));
          final controller = ref.read(gameplayControllerProvider(level).notifier);
          final totalGems = level.grid.countGems();

          return DebugOverlay(
            engineStatus: controller.engineStatusLabel,
            child: GameplayLayout(
              levelName: level.name,
              objectiveTitle: objectiveLabelForLevel(level),
              objectiveProgress: level.objectives.reachExit ? 'In progress' : null,
              showResourceDisplay: totalGems > 0,
              resourceValue: '0 / $totalGems',
              primaryActionLabel: defaultPrimaryActionLabel,
              shellPhase: shellState.phase,
              onPause: controller.pause,
              onResume: controller.resume,
              isPausedOverlayVisible: shellState.isPausedOverlayVisible,
              showDebugGrid: DebugConfig.showGrid,
            ),
          );
        },
      ),
    );
  }
}
