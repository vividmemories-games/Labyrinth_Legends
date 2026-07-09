import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:labyrinth_legends/data/providers.dart';
import 'package:labyrinth_legends/data/world_catalog.dart';
import 'package:labyrinth_legends/design_system/design_system.dart';
import 'package:labyrinth_legends/features/level_select/presentation/level_path_layout.dart';
import 'package:labyrinth_legends/features/level_select/presentation/level_preview_sheet.dart';
import 'package:labyrinth_legends/game_engine/models/level_definition.dart';

class LevelSelectScreen extends ConsumerStatefulWidget {
  const LevelSelectScreen({super.key, required this.worldId});

  final String worldId;

  @override
  ConsumerState<LevelSelectScreen> createState() => _LevelSelectScreenState();
}

class _LevelSelectScreenState extends ConsumerState<LevelSelectScreen> {
  final _scrollController = ScrollController();
  bool _didInitialScroll = false;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToCurrentLevel(int currentIndex, double width, int levelCount) {
    if (_didInitialScroll || !_scrollController.hasClients) return;
    _didInitialScroll = true;
    final nodeY =
        LevelPathLayout.nodeCenter(currentIndex, width, levelCount).dy;
    final viewport = _scrollController.position.viewportDimension;
    final target = (nodeY - viewport * 0.45).clamp(
      0.0,
      _scrollController.position.maxScrollExtent,
    );
    _scrollController.jumpTo(target);
  }

  @override
  Widget build(BuildContext context) {
    final levelsAsync = ref.watch(worldLevelsProvider(widget.worldId));
    final progressAsync = ref.watch(playerProgressProvider);
    final world = ref.watch(worldsProvider).firstWhere(
          (w) => w.id == widget.worldId,
        );

    return Scaffold(
      body: LLScreenBackground(
        heroImageAsset: LLAssetPaths.levelSelectBackground,
        heroAlignment: const Alignment(0, 0.15),
        heroScale: 1.0,
        veilStrength: 0.22,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _LevelSelectHeader(
              world: world,
              onBack: () => context.pop(),
            ),
            Expanded(
              child: levelsAsync.when(
                loading: () => const Center(child: LLLoadingIndicator()),
                error: (e, _) => Center(
                  child: Text('$e', style: LLTextStyle.body),
                ),
                data: (levels) {
                  return progressAsync.when(
                    loading: () => const Center(child: LLLoadingIndicator()),
                    error: (e, _) => Center(
                      child: Text('$e', style: LLTextStyle.body),
                    ),
                    data: (_) {
                      final notifier =
                          ref.read(playerProgressProvider.notifier);
                      final nodeStates = _buildNodeStates(
                        levels: levels,
                        notifier: notifier,
                        ref: ref,
                      );
                      final currentIndex = _currentLevelIndex(nodeStates);
                      final totalStars = nodeStates.fold<int>(
                        0,
                        (sum, node) => sum + node.stars,
                      );
                      final maxStars = levels.length * 3;

                      return LayoutBuilder(
                        builder: (context, constraints) {
                          final width = constraints.maxWidth;
                          final canvasHeight =
                              LevelPathLayout.canvasHeight(levels.length);
                          final centers = LevelPathLayout.allCenters(
                            width,
                            levels.length,
                          );

                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            if (!_didInitialScroll) {
                              _scrollToCurrentLevel(
                                currentIndex,
                                width,
                                levels.length,
                              );
                            }
                          });

                          return Column(
                            children: [
                              Expanded(
                                child: SingleChildScrollView(
                                  controller: _scrollController,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: LLSpacing.sm,
                                  ),
                                  child: SizedBox(
                                    height: canvasHeight,
                                    width: width,
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Positioned.fill(
                                          child: CustomPaint(
                                            painter: _WindingPathPainter(
                                              centers: centers,
                                              segmentActive: List.generate(
                                                centers.length - 1,
                                                (i) => nodeStates[i].unlocked,
                                              ),
                                            ),
                                          ),
                                        ),
                                        ...List.generate(levels.length,
                                            (index) {
                                          final center = centers[index];
                                          final state = nodeStates[index];
                                          final isCurrent =
                                              index == currentIndex;

                                          return Positioned(
                                            left: center.dx,
                                            top: center.dy,
                                            child: _MapLevelNode(
                                              levelNumber: index + 1,
                                              stars: state.stars,
                                              unlocked: state.unlocked,
                                              isCurrent: isCurrent,
                                              onTap: state.unlocked
                                                  ? () => _openPreview(
                                                        context,
                                                        levels[index],
                                                      )
                                                  : null,
                                            ),
                                          );
                                        }),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              _LevelSelectFooter(
                                totalStars: totalStars,
                                maxStars: maxStars,
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openPreview(BuildContext context, LevelDefinition level) {
    showModalBottomSheet<void>(
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
    );
  }

  List<_NodeState> _buildNodeStates({
    required List<LevelDefinition> levels,
    required PlayerProgressNotifier notifier,
    required WidgetRef ref,
  }) {
    return List.generate(levels.length, (index) {
      final level = levels[index];
      final unlocked = notifier.isLevelUnlocked(level.id, levels);
      final stars = ref.watch(levelStarsProvider(level.id)).value ?? 0;
      return _NodeState(unlocked: unlocked, stars: stars);
    });
  }

  int _currentLevelIndex(List<_NodeState> nodes) {
    var lastUnlocked = 0;
    for (var i = 0; i < nodes.length; i++) {
      if (!nodes[i].unlocked) break;
      lastUnlocked = i;
      if (nodes[i].stars == 0) return i;
    }
    return lastUnlocked;
  }
}

class _NodeState {
  const _NodeState({required this.unlocked, required this.stars});

  final bool unlocked;
  final int stars;
}

class _LevelSelectHeader extends StatelessWidget {
  const _LevelSelectHeader({
    required this.world,
    required this.onBack,
  });

  final WorldDefinition world;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final worldNum = world.id.replaceAll(RegExp(r'[^0-9]'), '');

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: LLSpacing.sm,
          vertical: LLSpacing.xs,
        ),
        child: Row(
          children: [
            LLTopBar.backButton(context, onPressed: onBack),
            Expanded(
              child: Column(
                children: [
                  Text(
                    'WORLD $worldNum',
                    textAlign: TextAlign.center,
                    style: LLTextStyle.caption.copyWith(
                      color: LLColor.energyCyan,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    world.name.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: LLTextStyle.h2.copyWith(
                      color: LLColor.ancientGoldLight,
                      letterSpacing: 1.2,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: LLSize.touchTarget),
          ],
        ),
      ),
    );
  }
}

class _LevelSelectFooter extends StatelessWidget {
  const _LevelSelectFooter({
    required this.totalStars,
    required this.maxStars,
  });

  final int totalStars;
  final int maxStars;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          LLSpacing.lg,
          LLSpacing.sm,
          LLSpacing.lg,
          LLSpacing.sm,
        ),
        child: Row(
          children: [
            Icon(Icons.star, color: LLColor.ancientGold, size: LLSize.iconLg),
            const SizedBox(width: LLSpacing.sm),
            Text(
              '$totalStars / $maxStars',
              style: LLTextStyle.body.copyWith(
                color: LLColor.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.inventory_2_outlined,
              color: LLColor.ancientGold.withValues(alpha: 0.85),
              size: LLSize.iconLg,
            ),
          ],
        ),
      ),
    );
  }
}

class _MapLevelNode extends StatelessWidget {
  const _MapLevelNode({
    required this.levelNumber,
    required this.stars,
    required this.unlocked,
    required this.isCurrent,
    this.onTap,
  });

  final int levelNumber;
  final int stars;
  final bool unlocked;
  final bool isCurrent;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final size = isCurrent ? 56.0 : LLSize.touchTarget.toDouble();
    final borderColor = isCurrent ? LLColor.energyCyan : LLColor.ancientGold;
    final glow = isCurrent ? LLShadow.portalGlow : LLShadow.goldGlow;

    return Transform.translate(
      offset: Offset(-size / 2, -size / 2),
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (unlocked && stars > 0)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(3, (i) {
                  return Icon(
                    i < stars ? Icons.star : Icons.star_border,
                    size: 12,
                    color: LLColor.ancientGold,
                  );
                }),
              )
            else
              const SizedBox(height: 12),
            const SizedBox(height: LLSpacing.xs),
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: unlocked
                    ? LLColor.stoneDark.withValues(alpha: 0.88)
                    : LLColor.templeBlack.withValues(alpha: 0.75),
                border: Border.all(
                  color: unlocked ? borderColor : LLColor.stoneEdge,
                  width: isCurrent ? 3 : 2.5,
                ),
                boxShadow: unlocked ? glow : null,
              ),
              child: Center(
                child: unlocked
                    ? Text(
                        '$levelNumber',
                        style: LLTextStyle.buttonPrimary.copyWith(
                          color: isCurrent
                              ? LLColor.energyCyan
                              : LLColor.ancientGold,
                          fontSize: isCurrent ? 18 : 15,
                        ),
                      )
                    : Icon(
                        Icons.lock,
                        size: LLSize.iconSm,
                        color: LLColor.stoneEdge,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WindingPathPainter extends CustomPainter {
  _WindingPathPainter({
    required this.centers,
    required this.segmentActive,
  });

  final List<Offset> centers;
  final List<bool> segmentActive;

  @override
  void paint(Canvas canvas, Size size) {
    if (centers.length < 2) return;

    for (var i = 0; i < centers.length - 1; i++) {
      final active = i < segmentActive.length && segmentActive[i];
      final from = _connectorPoint(centers[i], isStart: true);
      final to = _connectorPoint(centers[i + 1], isStart: false);

      if (active) {
        final glow = Paint()
          ..color = LLColor.energyCyan.withValues(alpha: 0.22)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 8
          ..strokeCap = StrokeCap.round
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);
        canvas.drawPath(_curveBetween(from, to), glow);
      }

      final paint = Paint()
        ..color = active
            ? LLColor.energyCyan.withValues(alpha: 0.92)
            : LLColor.stoneEdge.withValues(alpha: 0.55)
        ..style = PaintingStyle.stroke
        ..strokeWidth = active ? 3.5 : 2.5
        ..strokeCap = StrokeCap.round;

      _drawDashedPath(canvas, _curveBetween(from, to), paint);
    }
  }

  /// Anchor at circle edge — path progresses bottom → top (decreasing y).
  Offset _connectorPoint(Offset center, {required bool isStart}) {
    final verticalInset = isStart ? -24.0 : 20.0;
    return Offset(center.dx, center.dy + verticalInset);
  }

  Path _curveBetween(Offset from, Offset to) {
    final midY = (from.dy + to.dy) / 2;
    return Path()
      ..moveTo(from.dx, from.dy)
      ..cubicTo(from.dx, midY, to.dx, midY, to.dx, to.dy);
  }

  void _drawDashedPath(Canvas canvas, Path path, Paint paint) {
    const dashLength = 10.0;
    const gapLength = 6.0;

    for (final metric in path.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        final end = math.min(distance + dashLength, metric.length);
        canvas.drawPath(metric.extractPath(distance, end), paint);
        distance += dashLength + gapLength;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _WindingPathPainter oldDelegate) {
    return oldDelegate.centers != centers ||
        oldDelegate.segmentActive != segmentActive;
  }
}
