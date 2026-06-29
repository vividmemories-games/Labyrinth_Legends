import 'package:flutter/material.dart';
import 'package:labyrinth_legends/core/constants/app_colors.dart';
import 'package:labyrinth_legends/game_engine/models/level_definition.dart';

class LevelPreviewSheet extends StatelessWidget {
  const LevelPreviewSheet({
    super.key,
    required this.level,
    required this.onPlay,
  });

  final LevelDefinition level;
  final VoidCallback onPlay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            level.name,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 12),
          const Text('Objectives', style: TextStyle(color: AppColors.gold)),
          if (level.objectives.reachExit)
            const ListTile(
              dense: true,
              leading: Icon(Icons.flag_outlined, size: 20),
              title: Text('Reach the exit'),
            ),
          if (level.objectives.collectAllGems)
            const ListTile(
              dense: true,
              leading: Icon(Icons.diamond_outlined, size: 20),
              title: Text('Collect all gems'),
            ),
          const SizedBox(height: 16),
          FilledButton(onPressed: onPlay, child: const Text('Play')),
        ],
      ),
    );
  }
}
