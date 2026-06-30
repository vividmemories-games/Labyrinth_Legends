import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:labyrinth_legends/data/providers.dart';
import 'package:labyrinth_legends/design_system/design_system.dart';
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
      backgroundColor: LLColor.templeBlack,
      appBar: AppBar(
        backgroundColor: LLColor.templeBlack,
        title: Text(world.name, style: LLTextStyle.h2),
      ),
      body: levelsAsync.when(
        loading: () => const Center(child: LLLoadingIndicator()),
        error: (e, _) => Center(child: Text('$e')),
        data: (levels) {
          final progress = progressAsync.value;
          final notifier = ref.read(playerProgressProvider.notifier);

          return ListView(
            padding: EdgeInsets.all(LLSpacing.lg - LLSpacing.xs),
            children: [
              Text(
                world.loreBlurb,
                style: LLTextStyle.body.copyWith(color: LLColor.stoneEdge),
              ),
              SizedBox(height: LLSpacing.lg),
              ...List.generate(levels.length, (index) {
                final level = levels[index];
                final unlocked = progress == null
                    ? index == 0
                    : notifier.isLevelUnlocked(level.id, levels);
                final starsFuture = ref.watch(levelStarsProvider(level.id));

                return Padding(
                  padding: EdgeInsets.only(bottom: LLSpacing.md - LLSpacing.xs),
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
                              backgroundColor: LLColor.stoneDark,
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
                width: LLSize.touchTarget,
                height: LLSize.touchTarget,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: unlocked ? LLColor.stoneMid : LLColor.templeBlack,
                  border: Border.all(
                    color: unlocked ? LLColor.ancientGold : LLColor.stoneEdge,
                    width: 2.5,
                  ),
                  boxShadow: unlocked ? LLShadow.goldGlow : null,
                ),
                child: Center(
                  child: unlocked
                      ? Text(
                          '$levelNumber',
                          style: LLTextStyle.button
                              .copyWith(color: LLColor.ancientGold),
                        )
                      : Icon(
                          Icons.lock,
                          size: LLSize.iconSm,
                          color: LLColor.stoneEdge,
                        ),
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
                        ? LLColor.energyCyan.withValues(alpha: 0.65)
                        : LLColor.stoneEdge.withValues(alpha: 0.4),
                  ),
                ),
              ),
          ],
        ),
        SizedBox(width: LLSpacing.md),
        Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.only(top: LLSpacing.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: LLTextStyle.body.copyWith(
                      color: unlocked ? LLColor.textPrimary : LLColor.stoneEdge,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (unlocked)
                    Row(
                      children: List.generate(3, (i) {
                        return Icon(
                          i < stars ? Icons.star : Icons.star_border,
                          size: LLSize.iconSm,
                          color: LLColor.ancientGold,
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
