import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:labyrinth_legends/core/constants/app_colors.dart';
import 'package:labyrinth_legends/core/widgets/ruins_button.dart';
import 'package:labyrinth_legends/data/providers.dart';

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
        body: Center(child: CircularProgressIndicator()),
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
                colors: [AppColors.surfaceElevated, AppColors.voidBlack],
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Spacer(),
                    Text(
                      'Level Complete',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: AppColors.gold,
                          ),
                    ),
                    if (level != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        level.name,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (i) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Icon(
                            i < stars ? Icons.star : Icons.star_border,
                            size: 40,
                            color: AppColors.gold,
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 24),
                    if (progress != null)
                      _ResultRow(
                        label: 'Coins',
                        value: '${progress.coins}',
                      ),
                    const Spacer(),
                    if (nextId != null)
                      RuinsButton(
                        label: 'Next Level',
                        icon: Icons.arrow_forward,
                        expanded: true,
                        onPressed: () => context.go('/play/$nextId'),
                      ),
                    const SizedBox(height: 12),
                    RuinsButton(
                      label: 'Retry',
                      variant: RuinsButtonVariant.secondary,
                      expanded: true,
                      onPressed: () => context.go('/play/$levelId'),
                    ),
                    const SizedBox(height: 12),
                    RuinsButton(
                      label: 'Level Select',
                      variant: RuinsButtonVariant.ghost,
                      expanded: true,
                      onPressed: () => context.go('/worlds/world_1/levels'),
                    ),
                    const SizedBox(height: 12),
                    RuinsButton(
                      label: 'Home',
                      variant: RuinsButtonVariant.ghost,
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
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.gold,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
