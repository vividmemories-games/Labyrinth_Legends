import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:labyrinth_legends/app/routes.dart';
import 'package:labyrinth_legends/data/providers.dart';
import 'package:labyrinth_legends/design_system/design_system.dart';
import 'package:labyrinth_legends/features/gameplay/level_navigator.dart';

class LevelCompleteScreen extends ConsumerWidget {
  const LevelCompleteScreen({super.key, required this.levelId});

  final String levelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final levelAsync = ref.watch(levelByIdProvider(levelId));
    final levelsAsync = ref.watch(worldLevelsProvider('world_1'));
    final starsAsync = ref.watch(levelStarsProvider(levelId));
    final progress = ref.watch(playerProgressProvider).value;
    final completionSnapshot = ref.watch(pendingLevelCompletionProvider);
    final sessionReward = completionSnapshot?.levelId == levelId
        ? completionSnapshot!.reward
        : null;

    return levelAsync.when(
      loading: () => const Scaffold(
        body: Center(child: LLLoadingIndicator()),
      ),
      error: (e, _) => Scaffold(body: Center(child: Text('$e'))),
      data: (level) {
        final stars = sessionReward?.stars ?? starsAsync.value ?? 0;
        final nextId = LevelNavigator.nextLevelIdAfter(levelId);
        final nextLevel = nextId == null
            ? null
            : LevelNavigator.findLevel(levelsAsync.value ?? const [], nextId);
        final coinsEarned = sessionReward?.coinsEarned;
        final gemsCollected = sessionReward?.gemsCollected;

        return PopScope(
          canPop: false,
          child: Scaffold(
            body: SizedBox.expand(
              child: ColoredBox(
                color: LLColor.templeBlack,
                child: LLScreenBackground(
                  veilStrength: 0.68,
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(LLSpacing.lg),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Spacer(),
                          Text(
                            'Level Complete',
                            textAlign: TextAlign.center,
                            style: LLTextStyle.h1.copyWith(
                              color: LLColor.ancientGold,
                            ),
                          ),
                          if (level != null) ...[
                            SizedBox(height: LLSpacing.sm),
                            Text(
                              level.name,
                              textAlign: TextAlign.center,
                              style: LLTextStyle.h2,
                            ),
                          ],
                          SizedBox(height: LLSpacing.lg),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(3, (i) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: LLSpacing.xs + LLSpacing.xs,
                                ),
                                child: Icon(
                                  i < stars ? Icons.star : Icons.star_border,
                                  size: LLSize.iconLg + LLSpacing.sm,
                                  color: LLColor.ancientGold,
                                ),
                              );
                            }),
                          ),
                          SizedBox(height: LLSpacing.lg),
                          if (coinsEarned != null)
                            _ResultRow(
                              label: 'Coins earned',
                              value: '+$coinsEarned',
                            ),
                          if (gemsCollected != null && gemsCollected > 0)
                            _ResultRow(
                              label: 'Gems collected',
                              value: '+$gemsCollected',
                            ),
                          if (progress != null)
                            _ResultRow(
                              label: 'Total coins',
                              value: '${progress.coins}',
                            ),
                          if (nextId == null) ...[
                            SizedBox(height: LLSpacing.md),
                            Text(
                              'World 1 chambers complete for now.',
                              textAlign: TextAlign.center,
                              style: LLTextStyle.body.copyWith(
                                color: LLColor.stoneEdge,
                              ),
                            ),
                          ],
                          const Spacer(),
                          if (nextId != null) ...[
                            LLButton(
                              label: 'Next Level',
                              icon: Icons.arrow_forward,
                              expanded: true,
                              onPressed: () {
                                ref
                                    .read(
                                      pendingLevelCompletionProvider.notifier,
                                    )
                                    .state = null;
                                context.goNamed(
                                  'play',
                                  pathParameters: {'levelId': nextId},
                                );
                              },
                            ),
                            if (nextLevel != null) ...[
                              SizedBox(height: LLSpacing.xs),
                              Text(
                                nextLevel.name,
                                textAlign: TextAlign.center,
                                style: LLTextStyle.caption.copyWith(
                                  color: LLColor.stoneEdge,
                                ),
                              ),
                            ],
                          ],
                          SizedBox(height: LLSpacing.md - LLSpacing.xs),
                          LLButton(
                            label: 'Retry',
                            variant: LLButtonVariant.secondary,
                            expanded: true,
                            onPressed: () {
                              ref
                                  .read(pendingLevelCompletionProvider.notifier)
                                  .state = null;
                              context.goNamed(
                                'play',
                                pathParameters: {'levelId': levelId},
                              );
                            },
                          ),
                          SizedBox(height: LLSpacing.md - LLSpacing.xs),
                          LLButton(
                            label: 'Level Select',
                            variant: LLButtonVariant.ghost,
                            expanded: true,
                            onPressed: () {
                              ref
                                  .read(pendingLevelCompletionProvider.notifier)
                                  .state = null;
                              context.go(
                                AppRoutes.levelSelect.replaceFirst(
                                  ':worldId',
                                  'world_1',
                                ),
                              );
                            },
                          ),
                          SizedBox(height: LLSpacing.md - LLSpacing.xs),
                          LLButton(
                            label: 'Home',
                            variant: LLButtonVariant.ghost,
                            onPressed: () {
                              ref
                                  .read(pendingLevelCompletionProvider.notifier)
                                  .state = null;
                              context.go(AppRoutes.home);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ResultRow extends StatelessWidget {
  const _ResultRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: LLSpacing.xs + LLSpacing.xs),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: LLTextStyle.body),
          Text(
            value,
            style: LLTextStyle.currencyValue.copyWith(color: LLColor.ancientGold),
          ),
        ],
      ),
    );
  }
}
