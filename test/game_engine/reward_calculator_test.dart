import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/game_engine/models/cell_type.dart';
import 'package:labyrinth_legends/game_engine/models/discovery_mode.dart';
import 'package:labyrinth_legends/game_engine/models/gameplay_phase.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/level_definition.dart';
import 'package:labyrinth_legends/game_engine/models/maze_cell.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';
import 'package:labyrinth_legends/game_engine/rewards/reward_calculator.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_attempt_context.dart';
import 'package:labyrinth_legends/game_engine/session/gameplay_session_state.dart';

void main() {
  final level = LevelDefinition(
    schemaVersion: 1,
    id: 'test_level',
    name: 'Test',
    worldId: 'world_1',
    grid: MazeGrid(
      width: 1,
      height: 1,
      cells: [
        [MazeCell(type: CellType.floor)],
      ],
    ),
    objectives: const LevelObjectives(
      reachExit: true,
      collectAllGems: false,
      minGems: 0,
    ),
    discoveryMode: DiscoveryMode.full,
    starThresholds: StarThresholds(
      threeStars: 10,
      twoStars: 15,
      oneStar: 20,
    ),
  );

  const calculator = RewardCalculator();

  GameplaySessionState wonState({
    required List<GridPosition> path,
    int gemsCollected = 0,
  }) {
    return GameplaySessionState(
      level: level,
      phase: GameplayPhase.won,
      draftPath: const [],
      confirmedPath: path,
      attemptContext: GameplayAttemptContext(
        reachedExit: true,
        collectedGemPositions: List.generate(
          gemsCollected,
          (i) => GridPosition(row: 0, col: i),
        ).toSet(),
      ),
      executionComplete: true,
    );
  }

  test('awards three stars for short efficient paths', () {
    final result = calculator.calculateFromTerminalSession(
      wonState(path: List.generate(8, (i) => GridPosition(row: 0, col: i))),
    );

    expect(result.stars, 3);
    expect(result.pathNodeCount, 8);
  });

  test('awards fewer stars for longer paths', () {
    final result = calculator.calculateFromTerminalSession(
      wonState(path: List.generate(17, (i) => GridPosition(row: 0, col: i))),
    );

    expect(result.stars, 1);
  });

  test('does not modify stars when all gems collected (path-only rule)', () {
    final gemLevel = LevelDefinition(
      schemaVersion: 1,
      id: 'gem_level',
      name: 'Gem',
      worldId: 'world_1',
      grid: MazeGrid(
        width: 3,
        height: 1,
        cells: [
          [
            const MazeCell(type: CellType.floor, hasGem: true),
            const MazeCell(type: CellType.floor, hasGem: true),
            const MazeCell(type: CellType.floor, hasGem: true),
          ],
        ],
      ),
      objectives: const LevelObjectives(
        reachExit: true,
        collectAllGems: false,
        minGems: 0,
      ),
      discoveryMode: DiscoveryMode.full,
      starThresholds: StarThresholds(
        threeStars: 10,
        twoStars: 15,
        oneStar: 20,
      ),
    );

    final result = calculator.calculateFromTerminalSession(
      GameplaySessionState(
        level: gemLevel,
        phase: GameplayPhase.won,
        draftPath: const [],
        confirmedPath: List.generate(17, (i) => GridPosition(row: 0, col: i)),
        attemptContext: GameplayAttemptContext(
          reachedExit: true,
          collectedGemPositions: {
            const GridPosition(row: 0, col: 0),
            const GridPosition(row: 0, col: 1),
            const GridPosition(row: 0, col: 2),
          },
        ),
        executionComplete: true,
      ),
    );

    expect(result.stars, 1);
    expect(result.gemsCollected, 3);
  });

  test('rejects non-won session state', () {
    expect(
      () => calculator.calculateFromTerminalSession(
        GameplaySessionState(
          level: level,
          phase: GameplayPhase.executing,
          draftPath: const [],
          confirmedPath: [const GridPosition(row: 0, col: 0)],
        ),
      ),
      throwsArgumentError,
    );
  });
}
