import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:labyrinth_legends/core/debug/debug_overlay.dart';
import 'package:labyrinth_legends/data/providers.dart';
import 'package:labyrinth_legends/design_system/components/overlays/loading_overlay.dart';
import 'package:labyrinth_legends/design_system/components/overlays/toast_container.dart';
import 'package:labyrinth_legends/features/gameplay/level_navigator.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_controller.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_feedback.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_layout.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_shell_state.dart';
import 'package:labyrinth_legends/game_engine/models/level_definition.dart';

/// Production gameplay screen — feedback-polished gameplay loop (M2.6).
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

class _GameplayLoadedView extends ConsumerStatefulWidget {
  const _GameplayLoadedView({required this.level});

  final LevelDefinition level;

  @override
  ConsumerState<_GameplayLoadedView> createState() =>
      _GameplayLoadedViewState();
}

class _GameplayLoadedViewState extends ConsumerState<_GameplayLoadedView> {
  var _showDebugGrid = false;

  void _goToNextLevel() {
    final nextId = LevelNavigator.nextLevelIdAfter(widget.level.id);
    if (nextId == null) return;
    context.go('/play/$nextId');
  }

  @override
  Widget build(BuildContext context) {
    final shellState = ref.watch(gameplayControllerProvider(widget.level));
    final controller =
        ref.read(gameplayControllerProvider(widget.level).notifier);
    final objectives = widget.level.objectives;
    final showResourceDisplay = shellState.initialGemCount > 0 ||
        objectives.minGems > 0 ||
        objectives.collectAllGems;
    final showKeyDisplay = shellState.initialKeyCount > 0;
    final hasNextLevel = controller.hasNextLevel;
    final isExecuting = shellState.phase == GameplayShellPhase.executing;

    return DebugOverlay(
      engineStatus: controller.engineStatusLabel,
      debugDetails: controller.debugDetailsLabel,
      showDebugGrid: _showDebugGrid,
      onToggleDebugGrid: (value) => setState(() => _showDebugGrid = value),
      child: GameplayLayout(
        levelName: widget.level.name,
        objectiveTitle: objectiveLabelForLevel(widget.level),
        objectiveProgress: shellState.objectiveProgressLabel,
        objectiveCardState: shellState.objectiveCardState,
        resourceDisplayState: shellState.resourceDisplayState,
        completionStatusCue:
            shellState.completionStatusCue(hasNextLevel: hasNextLevel),
        showResourceDisplay: showResourceDisplay,
        resourceValue:
            '${shellState.collectedGemCount} / ${shellState.initialGemCount}',
        showKeyDisplay: showKeyDisplay,
        keyResourceValue: showKeyDisplay
            ? '${shellState.effectiveKeyIds.length} / ${shellState.initialKeyCount}'
            : null,
        draftPathValidationMessage: shellState.draftPathValidationMessage,
        draftPathValidationIcon: shellState.draftPathValidationIcon,
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
        onTileInteraction: controller.handleTileInteraction,
        onClearDraft: controller.clearDraftPath,
        onPrimaryAction: controller.onPrimaryAction,
        onTryAgain: controller.tryAgain,
        onNextLevel: hasNextLevel ? _goToNextLevel : null,
        onPause: controller.pause,
        onResume: controller.resume,
        isPausedOverlayVisible: shellState.isPausedOverlayVisible,
        showDebugGrid: _showDebugGrid,
        invalidTarget: shellState.invalidTarget,
        feedbackMessage: shellState.invalidInputMessage,
        primaryStatusMessage: shellState.primaryStatusMessage,
        inputEnabled: shellState.phase != GameplayShellPhase.paused,
        isInteractionLocked: shellState.isInteractionLocked,
        effectiveKeyIds: shellState.effectiveKeyIds,
      ),
    );
  }
}
