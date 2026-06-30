import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/design_system.dart';
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
      padding: EdgeInsets.fromLTRB(
        LLSpacing.lg,
        LLSpacing.lg,
        LLSpacing.lg,
        LLSpacing.xl,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(level.name, style: LLTextStyle.h2),
          SizedBox(height: LLSpacing.md - LLSpacing.xs),
          Text(
            'Objectives',
            style: LLTextStyle.h2.copyWith(
              color: LLColor.ancientGold,
              fontSize: 16,
            ),
          ),
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
          SizedBox(height: LLSpacing.md),
          LLButton(label: 'Play', onPressed: onPlay, expanded: true),
        ],
      ),
    );
  }
}
