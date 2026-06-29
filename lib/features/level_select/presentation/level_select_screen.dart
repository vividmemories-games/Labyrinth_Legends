import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:labyrinth_legends/core/constants/app_colors.dart';
import 'package:labyrinth_legends/data/providers.dart';
import 'package:labyrinth_legends/features/level_select/presentation/level_preview_sheet.dart';

class LevelSelectScreen extends ConsumerWidget {
  const LevelSelectScreen({super.key, required this.worldId});

  final String worldId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final levelsAsync = ref.watch(worldLevelsProvider(worldId));
    final progressAsync = ref.watch(playerProgressProvider);
    final world = ref.watch(worldsProvider).firstWhere((w) => w.id == worldId);

    return Scaffold(
      appBar: AppBar(title: Text(world.name)),
      body: levelsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('$e')),
        data: (levels) {
          final progress = progressAsync.value;
          final notifier = ref.read(playerProgressProvider.notifier);

          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Text(
                world.loreBlurb,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.slate,
                    ),
              ),
              const SizedBox(height: 24),
              ...List.generate(levels.length, (index) {
                final level = levels[index];
                final unlocked = progress == null
                    ? index == 0
                    : notifier.isLevelUnlocked(level.id, levels);
                final starsFuture = ref.watch(levelStarsProvider(level.id));

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _LevelPathNode(
                    levelNumber: index + 1,
                    title: level.name,
                    stars: starsFuture.value ?? 0,
                    unlocked: unlocked,
                    isLast: index == levels.length - 1,
                    onTap: unlocked
                        ? () => showModalBottomSheet<void>(
                              context: context,
                              isScrollControlled: true,
                              builder: (_) => LevelPreviewSheet(
                                level: level,
                                onPlay: () {
                                  Navigator.of(context).pop();
                                  context.push('/play/${level.id}');
                                },
                              ),
                            )
                        : null,
                  ),
                );
              }),
            ],
          );
        },
      ),
    );
  }
}

class _LevelPathNode extends StatelessWidget {
  const _LevelPathNode({
    required this.levelNumber,
    required this.title,
    required this.stars,
    required this.unlocked,
    required this.isLast,
    this.onTap,
  });

  final int levelNumber;
  final String title;
  final int stars;
  final bool unlocked;
  final bool isLast;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: onTap,
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: unlocked
                      ? AppColors.surfaceElevated
                      : AppColors.voidBlack,
                  border: Border.all(
                    color: unlocked ? AppColors.gold : AppColors.slate,
                    width: 2.5,
                  ),
                  boxShadow: unlocked
                      ? [
                          BoxShadow(
                            color: AppColors.gold.withValues(alpha: 0.25),
                            blurRadius: 8,
                          ),
                        ]
                      : null,
                ),
                child: Center(
                  child: unlocked
                      ? Text(
                          '$levelNumber',
                          style: const TextStyle(
                            color: AppColors.gold,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : const Icon(Icons.lock, size: 18, color: AppColors.slate),
                ),
              ),
            ),
            if (!isLast)
              SizedBox(
                width: 2,
                height: 36,
                child: CustomPaint(
                  painter: _DottedPathPainter(
                    color: unlocked
                        ? AppColors.cyanGlow.withValues(alpha: 0.65)
                        : AppColors.slate.withValues(alpha: 0.4),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: unlocked ? Colors.white : AppColors.slate,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (unlocked)
                    Row(
                      children: List.generate(3, (i) {
                        return Icon(
                          i < stars ? Icons.star : Icons.star_border,
                          size: 16,
                          color: AppColors.gold,
                        );
                      }),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DottedPathPainter extends CustomPainter {
  _DottedPathPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    const gap = 5.0;
    var y = 0.0;
    while (y < size.height) {
      final end = (y + gap).clamp(0.0, size.height);
      canvas.drawLine(
        Offset(size.width / 2, y),
        Offset(size.width / 2, end),
        paint,
      );
      y += gap * 2;
    }
  }

  @override
  bool shouldRepaint(covariant _DottedPathPainter oldDelegate) =>
      oldDelegate.color != color;
}
