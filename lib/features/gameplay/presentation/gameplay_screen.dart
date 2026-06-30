import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:labyrinth_legends/core/constants/game_constants.dart';
import 'package:labyrinth_legends/data/models/reward_result.dart';
import 'package:labyrinth_legends/data/providers.dart';
import 'package:labyrinth_legends/design_system/design_system.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/gameplay_provider.dart';
import 'package:labyrinth_legends/features/gameplay/presentation/maze_board.dart';

class GameplayScreen extends ConsumerWidget {
  const GameplayScreen({super.key, required this.levelId});

  final String levelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final levelAsync = ref.watch(levelByIdProvider(levelId));

    return levelAsync.when(
      loading: () => const Scaffold(
        body: Center(child: LLLoadingIndicator()),
      ),
      error: (e, _) => Scaffold(
        body: Center(child: Text('Failed to load level: $e')),
      ),
      data: (level) {
        if (level == null) {
          return Scaffold(
            appBar: AppBar(title: const Text('Level Not Found')),
            body: Center(
              child: LLButton(
                label: 'Back',
                onPressed: () => context.pop(),
              ),
            ),
          );
        }

        final state = ref.watch(gameplayControllerProvider(level));
        final controller = ref.read(gameplayControllerProvider(level).notifier);
        final isDrawing = state.uiPhase == GameplayUiPhase.drawing;

        ref.listen(gameplayControllerProvider(level), (prev, next) async {
          if (next.uiPhase == GameplayUiPhase.won &&
              prev?.uiPhase != GameplayUiPhase.won) {
            final rewardCalc = next.lastReward;
            if (rewardCalc == null) return;

            final relicId = next.session.context.collectedRelics.isNotEmpty
                ? next.session.context.collectedRelics.first
                : null;

            await ref.read(playerProgressProvider.notifier).recordCompletion(
                  levelId: levelId,
                  reward: RewardResult(
                    stars: rewardCalc.stars,
                    coinsEarned: GameConstants.baseCoinsPerLevel +
                        rewardCalc.stars * 10,
                    gemsCollected: rewardCalc.gemsCollected,
                    pathLength: rewardCalc.pathLength,
                    relicId: relicId,
                    gemBonusApplied: rewardCalc.gemBonusApplied,
                  ),
                );
            if (context.mounted) {
              context.go('/complete/$levelId');
            }
          }
        });

        final totalGems = level.grid.countGems();
        final keysHeld = state.session.context.collectedKeys.length;
        final showGemChip =
            totalGems > 0 || level.objectives.collectAllGems;
        final showKeyChip = level.grid.cells
            .expand((row) => row)
            .any((cell) => cell.keyId != null || cell.lockId != null);

        return Scaffold(
          backgroundColor: LLColor.templeBlack,
          appBar: AppBar(
            backgroundColor: LLColor.templeBlack,
            foregroundColor: LLColor.textPrimary,
            leading: LLIconButton(
              icon: Icons.arrow_back,
              tooltip: 'Back',
              variant: LLIconButtonVariant.ghost,
              onPressed: () => context.pop(),
            ),
            title: Text(
              level.name,
              style: LLTextStyle.h2.copyWith(color: LLColor.ancientGold),
            ),
            actions: [
              LLIconButton(
                icon: Icons.pause,
                tooltip: 'Pause',
                onPressed: controller.pause,
              ),
            ],
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  if (isDrawing && (showGemChip || showKeyChip))
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: LLSpacing.md,
                        vertical: LLSpacing.sm,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (showGemChip) ...[
                            _StatChip(
                              icon: Icons.diamond_outlined,
                              label:
                                  'Gems ${state.session.context.gemsCollected}/$totalGems',
                            ),
                            SizedBox(width: LLSpacing.sm),
                          ],
                          if (showKeyChip)
                            _StatChip(
                              icon: Icons.vpn_key_outlined,
                              label: 'Key ${keysHeld > 0 ? 1 : 0}',
                            ),
                        ],
                      ),
                    ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(LLSpacing.md - LLSpacing.xs),
                      child: LLPanel(
                        child: MazeBoard(
                          state: state,
                          onCellTap: controller.addPathPoint,
                        ),
                      ),
                    ),
                  ),
                  if (isDrawing && state.message != null)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: LLSpacing.md),
                      child: Text(
                        state.message!,
                        style: LLTextStyle.caption
                            .copyWith(color: LLColor.emberRed),
                      ),
                    ),
                  if (isDrawing)
                    _ControlBar(
                      onUndo: controller.undo,
                      onErase: controller.erase,
                      onHint: controller.useHint,
                      onGo: controller.go,
                    ),
                  SizedBox(height: LLSpacing.md - LLSpacing.xs),
                ],
              ),
              if (state.uiPhase == GameplayUiPhase.paused)
                _PauseOverlay(
                  onResume: controller.resume,
                  onQuit: () => context.pop(),
                ),
              if (state.uiPhase == GameplayUiPhase.lost)
                _OverlayMessage(
                  title: 'Path Failed',
                  message: state.message ?? 'Try again.',
                  actionLabel: 'Retry',
                  onAction: controller.reset,
                ),
            ],
          ),
        );
      },
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: LLSurface.pill(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: LLSpacing.sm + LLSpacing.xs,
          vertical: LLSpacing.xs + LLSpacing.xs,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: LLSize.iconSm, color: LLColor.ancientGold),
            SizedBox(width: LLSpacing.xs),
            Text(
              label,
              style: LLTextStyle.caption.copyWith(color: LLColor.textPrimary),
            ),
          ],
        ),
      ),
    );
  }
}

class _ControlBar extends StatelessWidget {
  const _ControlBar({
    required this.onUndo,
    required this.onErase,
    required this.onHint,
    required this.onGo,
  });

  final VoidCallback onUndo;
  final VoidCallback onErase;
  final Future<void> Function() onHint;
  final VoidCallback onGo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        LLSpacing.md - LLSpacing.xs,
        LLSpacing.sm,
        LLSpacing.md - LLSpacing.xs,
        0,
      ),
      child: Row(
        children: [
          Expanded(
            child: LLButton(
              label: 'Undo',
              icon: Icons.undo,
              variant: LLButtonVariant.ghost,
              onPressed: onUndo,
            ),
          ),
          SizedBox(width: LLSpacing.sm),
          Expanded(
            child: LLButton(
              label: 'Erase',
              icon: Icons.delete_outline,
              variant: LLButtonVariant.ghost,
              onPressed: onErase,
            ),
          ),
          SizedBox(width: LLSpacing.sm),
          Expanded(
            child: LLButton(
              label: 'Hint',
              icon: Icons.lightbulb_outline,
              variant: LLButtonVariant.secondary,
              onPressed: () => onHint(),
            ),
          ),
          SizedBox(width: LLSpacing.sm),
          Expanded(
            child: LLButton(
              label: 'Go',
              icon: Icons.play_arrow,
              onPressed: onGo,
            ),
          ),
        ],
      ),
    );
  }
}

class _PauseOverlay extends StatelessWidget {
  const _PauseOverlay({required this.onResume, required this.onQuit});

  final VoidCallback onResume;
  final VoidCallback onQuit;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: LLColor.templeBlack.withValues(alpha: LLColor.overlayVeilAlpha),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Paused',
              style: LLTextStyle.h1.copyWith(color: LLColor.ancientGold),
            ),
            SizedBox(height: LLSpacing.lg),
            LLButton(label: 'Resume', onPressed: onResume),
            SizedBox(height: LLSpacing.md - LLSpacing.xs),
            LLButton(
              label: 'Quit',
              variant: LLButtonVariant.ghost,
              onPressed: onQuit,
            ),
          ],
        ),
      ),
    );
  }
}

class _OverlayMessage extends StatelessWidget {
  const _OverlayMessage({
    required this.title,
    required this.message,
    required this.actionLabel,
    required this.onAction,
  });

  final String title;
  final String message;
  final String actionLabel;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: LLColor.templeBlack.withValues(alpha: 0.88),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(LLSpacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: LLTextStyle.h1.copyWith(color: LLColor.ancientGold),
              ),
              SizedBox(height: LLSpacing.sm),
              Text(
                message,
                textAlign: TextAlign.center,
                style: LLTextStyle.body.copyWith(color: LLColor.textPrimary),
              ),
              SizedBox(height: LLSpacing.lg),
              LLButton(label: actionLabel, onPressed: onAction),
            ],
          ),
        ),
      ),
    );
  }
}
