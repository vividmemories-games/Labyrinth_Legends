import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:labyrinth_legends/data/providers.dart';
import 'package:labyrinth_legends/design_system/assets/ll_asset_paths.dart';
import 'package:labyrinth_legends/design_system/components/overlays/loading_overlay.dart';
import 'package:labyrinth_legends/design_system/components/overlays/toast_container.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_completion_flow.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_controller.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_feedback.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_layout.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_shell_state.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/rendering/floor_tile_layout.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/widgets/victory_celebration_overlay.dart';
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

class _GameplayLoadedView extends ConsumerStatefulWidget {
  const _GameplayLoadedView({required this.level});

  final LevelDefinition level;

  @override
  ConsumerState<_GameplayLoadedView> createState() => _GameplayLoadedViewState();
}

class _GameplayLoadedViewState extends ConsumerState<_GameplayLoadedView> {
  var _completionFlowStarted = false;
  var _showVictoryCelebration = false;
  var _completionSyncFailed = false;

  @override
  Widget build(BuildContext context) {
    final level = widget.level;
    final shellState = ref.watch(gameplayControllerProvider(level));
    final controller = ref.read(gameplayControllerProvider(level).notifier);

    ref.listen<GameplayShellState>(
      gameplayControllerProvider(level),
      (previous, next) {
        if (next.phase == GameplayShellPhase.terminalWon &&
            previous?.phase != GameplayShellPhase.terminalWon) {
          _startCompletionFlow(next);
        }
      },
    );

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
    final winReward = shellState.session.reward;
    final celebrationStars = winReward?.stars ?? stars;

    return Stack(
      children: [
        GameplayLayout(
          levelLabel: formatGameplayLevelLabel(level.id),
          starCount: stars,
          backgroundAsset: LLAssetPaths.gameplayScreenBackground,
          grid: shellState.session.grid,
          visualPath: shellState.visualPath,
          explorerPosition: shellState.explorerPosition,
          selectedTile: shellState.selectedTile,
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
          completionStatusCue: _completionSyncFailed
              ? 'Progress not saved — tap Retry Save'
              : _showVictoryCelebration
                  ? 'Recording your progress…'
                  : shellState.completionStatusCue(hasNextLevel: hasNextLevel),
          draftPathValidationMessage: shellState.draftPathValidationMessage,
          draftPathValidationIcon: shellState.draftPathValidationIcon,
          onTileInteraction: controller.handleTileInteraction,
          onUndo: controller.undoDraftPath,
          onErase: controller.clearDraftPath,
          onHint: () {},
          onPrimaryAction: controller.onPrimaryAction,
          onBack: _showVictoryCelebration ? null : () => context.pop(),
          onTryAgain: controller.tryAgain,
          onNextLevel: null,
          onRetryCompletionSync: _completionSyncFailed
              ? () => _startCompletionFlow(shellState)
              : null,
          onPause: controller.pause,
          onResume: controller.resume,
          isPausedOverlayVisible: shellState.isPausedOverlayVisible,
          showDebugGrid: false,
          invalidTarget: shellState.invalidTarget,
          feedbackMessage: shellState.invalidInputMessage,
          primaryStatusMessage: shellState.primaryStatusMessage,
          inputEnabled:
              shellState.phase != GameplayShellPhase.paused &&
              !_showVictoryCelebration,
          isInteractionLocked:
              shellState.isInteractionLocked || _showVictoryCelebration,
          effectiveKeyIds: shellState.effectiveKeyIds,
          floorLayoutSeed: floorLayoutSeedFor(
            levelId: level.id,
            retryCount: shellState.retryCount,
          ),
        ),
        if (_showVictoryCelebration)
          VictoryCelebrationOverlay(stars: celebrationStars),
      ],
    );
  }

  Future<void> _startCompletionFlow(GameplayShellState shellState) async {
    if (_completionFlowStarted) {
      return;
    }
    _completionFlowStarted = true;
    _completionSyncFailed = false;

    final engineReward = shellState.session.reward;
    if (engineReward == null) {
      return;
    }

    setState(() => _showVictoryCelebration = true);

    final flow = GameplayCompletionFlow(
      syncService: ref.read(completionSyncServiceProvider),
    );

    try {
      final snapshot = await flow.run(
        levelId: widget.level.id,
        engineReward: engineReward,
      );

      ref.read(pendingLevelCompletionProvider.notifier).state = snapshot;

      if (!mounted) {
        return;
      }
      context.goNamed(
        'complete',
        pathParameters: {'levelId': widget.level.id},
      );
    } catch (error, stackTrace) {
      debugPrint('Completion flow failed: $error\n$stackTrace');
      if (mounted) {
        setState(() {
          _showVictoryCelebration = false;
          _completionSyncFailed = true;
        });
        _completionFlowStarted = false;
      }
    }
  }
}
