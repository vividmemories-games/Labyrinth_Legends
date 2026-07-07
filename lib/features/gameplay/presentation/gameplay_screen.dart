import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:labyrinth_legends/data/providers.dart';
import 'package:labyrinth_legends/design_system/assets/ll_asset_paths.dart';
import 'package:labyrinth_legends/design_system/components/overlays/loading_overlay.dart';
import 'package:labyrinth_legends/design_system/components/overlays/toast_container.dart';
import 'package:labyrinth_legends/features/gameplay/level_navigator.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_controller.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_feedback.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_layout.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_shell_state.dart';
import 'package:labyrinth_legends/game_engine/models/level_definition.dart';

/// Production gameplay screen — MVP mockup visual pass (M2.8).
class GameplayScreen extends ConsumerWidget {
  const GameplayScreen({super.key, required this.levelId});

  final String levelId;

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

          return _GameplayLoadedView(level: level);
        },
      ),
    );
  }
}

class _GameplayLoadedView extends ConsumerWidget {
  const _GameplayLoadedView({required this.level});

  final LevelDefinition level;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shellState = ref.watch(gameplayControllerProvider(level));
    final controller = ref.read(gameplayControllerProvider(level).notifier);
    final showGems = shellState.initialGemCount > 0 ||
        level.objectives.minGems > 0 ||
        level.objectives.collectAllGems;
    final showKeys = shellState.initialKeyCount > 0;
    final hasNextLevel = controller.hasNextLevel;
    final isExecuting = shellState.phase == GameplayShellPhase.executing;
    final progressStoreReady = ref.watch(localProgressStoreProvider).hasValue;
    final stars = progressStoreReady
        ? (ref.watch(levelStarsProvider(level.id)).value ?? 0)
        : 0;
    final hintsRemaining =
        ref.watch(playerProgressProvider).value?.hintsRemaining ?? 3;

    return GameplayLayout(
      levelLabel: formatGameplayLevelLabel(level.id),
      starCount: stars,
      backgroundAsset: LLAssetPaths.gameplayScreenBackground,
      grid: shellState.session.grid,
      visualPath: shellState.visualPath,
      explorerPosition: shellState.explorerPosition,
      selectedTile: shellState.selectedTile,
      planningExtensionHints: shellState.planningExtensionHints,
      traversedPathPositions: shellState.traversedPathPositions,
      isExecuting: isExecuting,
      shellPhase: shellState.phase,
      canConfirmDraft: shellState.canConfirmDraft,
      hasNextLevel: hasNextLevel,
      showGems: showGems,
      gemsValue:
          '${shellState.collectedGemCount}/${shellState.initialGemCount}',
      showKeys: showKeys,
      keysValue: showKeys
          ? '${shellState.effectiveKeyIds.length}/${shellState.initialKeyCount}'
          : null,
      hintBadge: hintsRemaining > 0 ? '$hintsRemaining' : null,
      completionStatusCue:
          shellState.completionStatusCue(hasNextLevel: hasNextLevel),
      draftPathValidationMessage: shellState.draftPathValidationMessage,
      draftPathValidationIcon: shellState.draftPathValidationIcon,
      onTileInteraction: controller.handleTileInteraction,
      onUndo: controller.undoDraftPath,
      onErase: controller.clearDraftPath,
      onHint: () {
        // Hint solver wiring is post-MVP; surface affordance per mockup.
      },
      onPrimaryAction: controller.onPrimaryAction,
      onBack: () => context.pop(),
      onTryAgain: controller.tryAgain,
      onNextLevel: hasNextLevel
          ? () {
              final nextId = LevelNavigator.nextLevelIdAfter(level.id);
              if (nextId != null) context.go('/play/$nextId');
            }
          : null,
      onPause: controller.pause,
      onResume: controller.resume,
      isPausedOverlayVisible: shellState.isPausedOverlayVisible,
      showDebugGrid: false,
      invalidTarget: shellState.invalidTarget,
      feedbackMessage: shellState.invalidInputMessage,
      primaryStatusMessage: shellState.primaryStatusMessage,
      inputEnabled: shellState.phase != GameplayShellPhase.paused,
      isInteractionLocked: shellState.isInteractionLocked,
      effectiveKeyIds: shellState.effectiveKeyIds,
    );
  }
}
