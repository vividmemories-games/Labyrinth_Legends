import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:labyrinth_legends/design_system/design_system.dart';
import 'package:labyrinth_legends/features/engine_debug_sandbox/presentation/engine_debug_sandbox_controller.dart';
import 'package:labyrinth_legends/game_engine/models/cell_type.dart';
import 'package:labyrinth_legends/game_engine/models/gameplay_phase.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/maze_cell.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_session.dart';

class EngineDebugSandboxScreen extends ConsumerWidget {
  const EngineDebugSandboxScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(engineDebugSandboxControllerProvider);
    final controller = ref.read(engineDebugSandboxControllerProvider.notifier);
    final session = state.session;
    final reward = state.reward;

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
          'Engine Debug Sandbox',
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
                  title: 'Engine Controls',
                  subtitle:
                      'Temporary engineering screen. Flutter drives only public engine APIs.',
                  child: LLPanel(
                    child: Wrap(
                      spacing: LLSpacing.sm,
                      runSpacing: LLSpacing.sm,
                      children: [
                        LLButton(
                          key: const Key('engineSandboxLoadLevel001'),
                          label: 'Load Level 001',
                          onPressed: state.isLoadingLevel
                              ? null
                              : controller.loadLevel001,
                        ),
                        LLButton(
                          key: const Key('engineSandboxDrawPath'),
                          label: 'Draw Path',
                          variant: LLButtonVariant.secondary,
                          enabled: session != null &&
                              session.phase == GameplayPhase.drawing,
                          onPressed: controller.seedDraftPath,
                        ),
                        LLButton(
                          key: const Key('engineSandboxConfirmPath'),
                          label: 'Confirm Path',
                          enabled: session != null &&
                              session.phase == GameplayPhase.drawing &&
                              session.path.isNotEmpty,
                          onPressed: controller.confirmPath,
                        ),
                        LLButton(
                          key: const Key('engineSandboxExecuteNextStep'),
                          label: 'Execute Next Step',
                          variant: LLButtonVariant.secondary,
                          enabled: session?.phase == GameplayPhase.executing,
                          onPressed: controller.executeNextStep,
                        ),
                        LLButton(
                          key: const Key('engineSandboxRunToCompletion'),
                          label: 'Run To Completion',
                          enabled: session?.phase == GameplayPhase.executing,
                          onPressed: controller.runToCompletion,
                        ),
                        LLButton(
                          key: const Key('engineSandboxResetSession'),
                          label: 'Reset Session',
                          variant: LLButtonVariant.ghost,
                          enabled: session != null,
                          onPressed: controller.resetSession,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: LLSpacing.md),
                if (state.isLoadingLevel)
                  const Center(child: LLLoadingIndicator())
                else
                  LLSection(
                    title: 'Board',
                    subtitle:
                        'Tap cells while drawing to append path nodes. Confirm to let the engine validate it.',
                    child: LLPanel(
                      child: _SandboxBoard(
                        session: session,
                        playerPosition: state.playerPosition,
                        onCellTap: controller.appendDraftPoint,
                      ),
                    ),
                  ),
                const SizedBox(height: LLSpacing.md),
                LLSection(
                  title: 'Runtime Inspection',
                  child: LLPanel(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _InfoRow(
                          label: 'Current Gameplay Phase',
                          value: session?.phase.name ?? 'not loaded',
                        ),
                        _InfoRow(
                          label: 'Current Player Position',
                          value: _formatPosition(state.playerPosition),
                        ),
                        _InfoRow(
                          label: 'Current Path Index',
                          value: session == null
                              ? '-'
                              : '${session.executionPathIndex}',
                        ),
                        _InfoRow(
                          label: 'Total Path Length',
                          value: session == null ? '-' : '${session.path.length}',
                        ),
                        _InfoRow(
                          label: 'Gems Collected',
                          value: session == null
                              ? '-'
                              : '${session.context.gemsCollected}',
                        ),
                        _InfoRow(
                          label: 'Session Result',
                          value: state.sessionResult,
                        ),
                        _InfoRow(
                          label: 'Reward Result',
                          value: reward == null
                              ? '-'
                              : '${reward.stars} star(s), nodes ${reward.pathNodeCount}, gems ${reward.gemsCollected}',
                        ),
                        _InfoRow(
                          label: 'Status',
                          value: state.loadError ??
                              state.message ??
                              session?.statusMessage ??
                              '-',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatPosition(GridPosition? position) {
    if (position == null) {
      return '-';
    }
    return '(${position.row}, ${position.col})';
  }
}

class _SandboxBoard extends StatelessWidget {
  const _SandboxBoard({
    required this.session,
    required this.playerPosition,
    required this.onCellTap,
  });

  final GameplaySession? session;
  final GridPosition? playerPosition;
  final ValueChanged<GridPosition> onCellTap;

  @override
  Widget build(BuildContext context) {
    final currentSession = session;
    if (currentSession == null) {
      return SizedBox(
        height: 240,
        child: Center(
          child: Text(
            'Load Level 001 to begin.',
            style: LLTextStyle.body,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    final grid = currentSession.grid;
    final path = currentSession.path;
    final pathIndices = <GridPosition, int>{
      for (var i = 0; i < path.length; i++) path[i]: i,
    };

    return AspectRatio(
      aspectRatio: grid.width / grid.height,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: grid.width * grid.height,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: grid.width,
          crossAxisSpacing: LLSpacing.xs,
          mainAxisSpacing: LLSpacing.xs,
        ),
        itemBuilder: (context, index) {
          final row = index ~/ grid.width;
          final col = index % grid.width;
          final position = GridPosition(row: row, col: col);
          final cell = grid.cellAt(position);
          final isPlayer = playerPosition == position;
          final pathIndex = pathIndices[position];

          return _BoardCell(
            key: Key('engineSandboxCell-$row-$col'),
            position: position,
            cell: cell,
            isPlayer: isPlayer,
            pathIndex: pathIndex,
            sessionPhase: currentSession.phase,
            onTap: () => onCellTap(position),
          );
        },
      ),
    );
  }
}

class _BoardCell extends StatelessWidget {
  const _BoardCell({
    required super.key,
    required this.position,
    required this.cell,
    required this.isPlayer,
    required this.pathIndex,
    required this.sessionPhase,
    required this.onTap,
  });

  final GridPosition position;
  final MazeCell cell;
  final bool isPlayer;
  final int? pathIndex;
  final GameplayPhase sessionPhase;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final borderColor = switch (sessionPhase) {
      GameplayPhase.won when isPlayer => LLColor.successGreen,
      GameplayPhase.lost when isPlayer => LLColor.emberRed,
      _ when isPlayer => LLColor.ancientGold,
      _ when pathIndex != null => LLColor.energyCyan,
      _ => LLColor.stoneEdge,
    };

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            color: _backgroundColor(cell, pathIndex != null),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: borderColor, width: isPlayer ? 2 : 1),
          ),
          child: Stack(
            children: [
              Center(
                child: Text(
                  _symbolForCell(cell, isPlayer),
                  style: LLTextStyle.bodyPrimary.copyWith(
                    color: isPlayer ? LLColor.ancientGoldLight : LLColor.textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              if (pathIndex != null)
                Positioned(
                  top: LLSpacing.xs,
                  left: LLSpacing.xs,
                  child: Text(
                    '$pathIndex',
                    style: LLTextStyle.caption.copyWith(
                      color: LLColor.energyCyan,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Color _backgroundColor(MazeCell cell, bool inPath) {
    if (cell.type == CellType.wall) {
      return LLColor.stoneDark;
    }
    if (inPath) {
      return LLColor.energyCyan.withValues(alpha: 0.14);
    }
    return switch (cell.type) {
      CellType.start => LLColor.stoneMid,
      CellType.exit => LLColor.ancientGoldDark.withValues(alpha: 0.3),
      CellType.floor => LLColor.stoneMid,
      CellType.wall => LLColor.stoneDark,
    };
  }

  String _symbolForCell(MazeCell cell, bool isPlayer) {
    if (isPlayer) {
      return 'P';
    }
    if (cell.hasGem) {
      return 'G';
    }
    if (cell.keyId != null) {
      return 'K';
    }
    if (cell.lockId != null) {
      return 'L';
    }
    return switch (cell.type) {
      CellType.start => 'S',
      CellType.exit => 'E',
      CellType.wall => '',
      CellType.floor => '',
    };
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: LLSpacing.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 170,
            child: Text(
              '$label:',
              style: LLTextStyle.bodyPrimary.copyWith(
                color: LLColor.ancientGoldLight,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: LLTextStyle.body.copyWith(color: LLColor.textPrimary),
            ),
          ),
        ],
      ),
    );
  }
}
