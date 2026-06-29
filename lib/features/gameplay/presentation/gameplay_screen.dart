import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:labyrinth_legends/core/constants/app_colors.dart';
import 'package:labyrinth_legends/core/constants/game_constants.dart';
import 'package:labyrinth_legends/core/widgets/ruins_button.dart';
import 'package:labyrinth_legends/data/models/reward_result.dart';
import 'package:labyrinth_legends/data/providers.dart';
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
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => Scaffold(
        body: Center(child: Text('Failed to load level: $e')),
      ),
      data: (level) {
        if (level == null) {
          return Scaffold(
            appBar: AppBar(title: const Text('Level Not Found')),
            body: Center(
              child: RuinsButton(
                label: 'Back',
                onPressed: () => context.pop(),
              ),
            ),
          );
        }

        final state = ref.watch(gameplayControllerProvider(level));
        final controller = ref.read(gameplayControllerProvider(level).notifier);

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

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.pop(),
            ),
            title: Text(level.name),
            actions: [
              IconButton(
                icon: const Icon(Icons.pause),
                onPressed: controller.pause,
              ),
            ],
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _StatChip(
                          icon: Icons.route,
                          label: 'Moves ${state.path.length}',
                        ),
                        _StatChip(
                          icon: Icons.diamond_outlined,
                          label:
                              'Gems ${state.session.context.gemsCollected}/$totalGems',
                        ),
                        _StatChip(
                          icon: Icons.vpn_key_outlined,
                          label: 'Key ${keysHeld > 0 ? 1 : 0}',
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppColors.gold.withValues(alpha: 0.25),
                          ),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [AppColors.surface, AppColors.voidBlack],
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: MazeBoard(
                            state: state,
                            onCellTap: controller.addPathPoint,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (state.message != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        state.message!,
                        style: const TextStyle(color: AppColors.danger),
                      ),
                    ),
                  _ControlBar(
                    onUndo: controller.undo,
                    onErase: controller.erase,
                    onHint: controller.useHint,
                    onGo: controller.go,
                    canAct: state.uiPhase == GameplayUiPhase.drawing,
                  ),
                  const SizedBox(height: 12),
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.slate),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppColors.gold),
          const SizedBox(width: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
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
    required this.canAct,
  });

  final VoidCallback onUndo;
  final VoidCallback onErase;
  final Future<void> Function() onHint;
  final VoidCallback onGo;
  final bool canAct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
      child: Row(
        children: [
          Expanded(
            child: RuinsButton(
              label: 'Undo',
              icon: Icons.undo,
              variant: RuinsButtonVariant.ghost,
              onPressed: canAct ? onUndo : null,
              enabled: canAct,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: RuinsButton(
              label: 'Erase',
              icon: Icons.delete_outline,
              variant: RuinsButtonVariant.ghost,
              onPressed: canAct ? onErase : null,
              enabled: canAct,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: RuinsButton(
              label: 'Hint',
              icon: Icons.lightbulb_outline,
              variant: RuinsButtonVariant.secondary,
              onPressed: canAct ? () => onHint() : null,
              enabled: canAct,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: RuinsButton(
              label: 'Go',
              icon: Icons.play_arrow,
              onPressed: canAct ? onGo : null,
              enabled: canAct,
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
    return Container(
      color: AppColors.voidBlack.withValues(alpha: 0.85),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Paused', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 24),
            RuinsButton(label: 'Resume', onPressed: onResume, expanded: false),
            const SizedBox(height: 12),
            RuinsButton(
              label: 'Quit',
              variant: RuinsButtonVariant.ghost,
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
    return Container(
      color: AppColors.voidBlack.withValues(alpha: 0.88),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 8),
              Text(message, textAlign: TextAlign.center),
              const SizedBox(height: 24),
              RuinsButton(label: actionLabel, onPressed: onAction),
            ],
          ),
        ),
      ),
    );
  }
}
