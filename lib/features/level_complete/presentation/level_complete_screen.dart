import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:labyrinth_legends/data/providers.dart';
import 'package:labyrinth_legends/design_system/design_system.dart';

class LevelCompleteScreen extends ConsumerWidget {
  const LevelCompleteScreen({super.key, required this.levelId});

  final String levelId;

  String? _nextLevelId(String currentId) {
    final match = RegExp(r'level_(\d+)').firstMatch(currentId);
    if (match == null) return null;
    final num = int.parse(match.group(1)!);
    if (num >= 20) return null;
    return 'level_${(num + 1).toString().padLeft(3, '0')}';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final levelAsync = ref.watch(levelByIdProvider(levelId));
    final starsAsync = ref.watch(levelStarsProvider(levelId));
    final progress = ref.watch(playerProgressProvider).value;

    return levelAsync.when(
      loading: () => const Scaffold(
        body: Center(child: LLLoadingIndicator()),
      ),
      error: (e, _) => Scaffold(body: Center(child: Text('$e'))),
      data: (level) {
        final stars = starsAsync.value ?? 0;
        final nextId = _nextLevelId(levelId);

        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [LLColor.stoneMid, LLColor.templeBlack],
              ),
            ),
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
                      style: LLTextStyle.h1.copyWith(color: LLColor.ancientGold),
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
                          padding: EdgeInsets.symmetric(horizontal: LLSpacing.xs + LLSpacing.xs),
                          child: Icon(
                            i < stars ? Icons.star : Icons.star_border,
                            size: LLSize.iconLg + LLSpacing.sm,
                            color: LLColor.ancientGold,
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: LLSpacing.lg),
                    if (progress != null)
                      _ResultRow(
                        label: 'Coins',
                        value: '${progress.coins}',
                      ),
                    const Spacer(),
                    if (nextId != null)
                      LLButton(
                        label: 'Next Level',
                        icon: Icons.arrow_forward,
                        expanded: true,
                        onPressed: () => context.go('/play/$nextId'),
                      ),
                    SizedBox(height: LLSpacing.md - LLSpacing.xs),
                    LLButton(
                      label: 'Retry',
                      variant: LLButtonVariant.secondary,
                      expanded: true,
                      onPressed: () => context.go('/play/$levelId'),
                    ),
                    SizedBox(height: LLSpacing.md - LLSpacing.xs),
                    LLButton(
                      label: 'Level Select',
                      variant: LLButtonVariant.ghost,
                      expanded: true,
                      onPressed: () => context.go('/worlds/world_1/levels'),
                    ),
                    SizedBox(height: LLSpacing.md - LLSpacing.xs),
                    LLButton(
                      label: 'Home',
                      variant: LLButtonVariant.ghost,
                      onPressed: () => context.go('/'),
                    ),
                  ],
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
