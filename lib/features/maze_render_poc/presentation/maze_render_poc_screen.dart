import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:labyrinth_legends/design_system/design_system.dart';
import 'package:labyrinth_legends/features/maze_render_poc/data/poc_level_provider.dart';
import 'package:labyrinth_legends/features/maze_render_poc/rendering/maze_painter.dart';
import 'package:labyrinth_legends/features/maze_render_poc/rendering/maze_texture_loader.dart';
import 'package:labyrinth_legends/features/maze_render_poc/rendering/maze_theme.dart';
import 'package:labyrinth_legends/game_engine/models/level_definition.dart';

/// Dev-only proof of concept: renders existing levels through [MazePainter]
/// — one merged vector wall shape skinned by a swappable [MazeTheme] —
/// instead of per-cell tile images. Demonstrates that re-theming a world
/// (Ancient Ruins → Amazon Jungle) requires no tileset PNGs.
class MazeRenderPocScreen extends ConsumerStatefulWidget {
  const MazeRenderPocScreen({super.key});

  @override
  ConsumerState<MazeRenderPocScreen> createState() =>
      _MazeRenderPocScreenState();
}

class _MazeRenderPocScreenState extends ConsumerState<MazeRenderPocScreen> {
  static const List<String> _levelIds = [
    'level_001',
    'level_005',
    'level_010',
    'level_015',
    'level_020',
  ];

  MazeTheme _theme = MazeTheme.ancientRuins;
  MazeThemeTextures _textures = MazeThemeTextures.none;
  bool _showTextures = true;
  String _levelId = _levelIds.first;

  @override
  void initState() {
    super.initState();
    _loadTextures(_theme);
  }

  Future<void> _loadTextures(MazeTheme theme) async {
    final textures = await MazeTextureLoader.load(theme);
    if (!mounted || _theme.id != theme.id) {
      return;
    }
    setState(() => _textures = textures);
  }

  void _selectTheme(MazeTheme theme) {
    setState(() {
      _theme = theme;
      _textures = MazeThemeTextures.none;
    });
    _loadTextures(theme);
  }

  @override
  Widget build(BuildContext context) {
    final levelAsync = ref.watch(pocLevelProvider(_levelId));

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
          'Maze Render POC',
          style: LLTextStyle.h2.copyWith(color: LLColor.ancientGold),
        ),
      ),
      body: LLScreenBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(LLSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LLSection(
                  title: 'World Theme',
                  subtitle:
                      'Same maze geometry, different skin — swapping themes '
                      'swaps colors and textures only, no tileset PNGs.',
                  child: LLPanel(
                    child: Wrap(
                      spacing: LLSpacing.sm,
                      runSpacing: LLSpacing.sm,
                      children: [
                        for (final theme in MazeTheme.all)
                          LLButton(
                            key: Key('mazePocTheme-${theme.id}'),
                            label: theme.name,
                            variant: _theme.id == theme.id
                                ? LLButtonVariant.primary
                                : LLButtonVariant.secondary,
                            onPressed: () => _selectTheme(theme),
                          ),
                        LLButton(
                          key: const Key('mazePocTextureToggle'),
                          label: _showTextures
                              ? 'Textures: ON'
                              : 'Textures: OFF',
                          variant: LLButtonVariant.ghost,
                          onPressed: () =>
                              setState(() => _showTextures = !_showTextures),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: LLSpacing.md),
                LLSection(
                  title: 'Level',
                  child: LLPanel(
                    child: Wrap(
                      spacing: LLSpacing.sm,
                      runSpacing: LLSpacing.sm,
                      children: [
                        for (final id in _levelIds)
                          LLButton(
                            key: Key('mazePocLevel-$id'),
                            label: id.replaceFirst('level_', 'L'),
                            variant: _levelId == id
                                ? LLButtonVariant.primary
                                : LLButtonVariant.ghost,
                            onPressed: () => setState(() => _levelId = id),
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: LLSpacing.md),
                LLSection(
                  title: 'Rendered Maze',
                  subtitle:
                      'Walls are one merged vector path with neighbor-aware '
                      'corners — pixel-perfect at any size, no seams.',
                  child: LLPanel(
                    child: switch (levelAsync) {
                      AsyncData(:final value) => _Board(
                          level: value,
                          theme: _theme,
                          textures: _textures,
                          showTextures: _showTextures,
                        ),
                      AsyncError(:final error) => Padding(
                          padding: const EdgeInsets.all(LLSpacing.md),
                          child: Text(
                            'Failed to load $_levelId: $error',
                            style: LLTextStyle.body
                                .copyWith(color: LLColor.emberRed),
                          ),
                        ),
                      _ => const SizedBox(
                          height: 240,
                          child: Center(child: LLLoadingIndicator()),
                        ),
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Board extends StatelessWidget {
  const _Board({
    required this.level,
    required this.theme,
    required this.textures,
    required this.showTextures,
  });

  final LevelDefinition level;
  final MazeTheme theme;
  final MazeThemeTextures textures;
  final bool showTextures;

  @override
  Widget build(BuildContext context) {
    final grid = level.grid;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: AspectRatio(
        aspectRatio: grid.width / grid.height,
        child: CustomPaint(
          key: const Key('mazePocBoard'),
          painter: MazePainter(
            grid: grid,
            theme: theme,
            textures: textures,
            showTextures: showTextures,
          ),
        ),
      ),
    );
  }
}
