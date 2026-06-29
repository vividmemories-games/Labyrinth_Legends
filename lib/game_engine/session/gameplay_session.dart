import 'package:labyrinth_legends/game_engine/discovery/discovery_engine.dart';
import 'package:labyrinth_legends/game_engine/mechanics/mechanic_context.dart';
import 'package:labyrinth_legends/game_engine/models/gameplay_phase.dart';
import 'package:labyrinth_legends/game_engine/models/grid_position.dart';
import 'package:labyrinth_legends/game_engine/models/level_definition.dart';
import 'package:labyrinth_legends/game_engine/models/maze_grid.dart';
import 'package:labyrinth_legends/game_engine/path/path_executor.dart';
import 'package:labyrinth_legends/game_engine/path/path_validation_result.dart';
import 'package:labyrinth_legends/game_engine/path/path_validator.dart';

class GameplaySession {
  GameplaySession({
    required LevelDefinition level,
    PathValidator? pathValidator,
    PathExecutor? pathExecutor,
    DiscoveryEngine? discoveryEngine,
  })  : level = level,
        _pathValidator = pathValidator ?? PathValidator(),
        _pathExecutor = pathExecutor ?? PathExecutor(),
        _discoveryEngine = discoveryEngine ??
            DiscoveryEngine(discoveryMode: level.discoveryMode),
        _grid = (discoveryEngine ??
                DiscoveryEngine(discoveryMode: level.discoveryMode))
            .applyInitialVisibility(level.grid),
        _phase = GameplayPhase.planning,
        _path = [],
        _context = MechanicContext();

  final LevelDefinition level;
  final PathValidator _pathValidator;
  final PathExecutor _pathExecutor;
  final DiscoveryEngine _discoveryEngine;

  MazeGrid _grid;
  GameplayPhase _phase;
  List<GridPosition> _path;
  MechanicContext _context;
  String? _statusMessage;

  MazeGrid get grid => _grid;
  GameplayPhase get phase => _phase;
  List<GridPosition> get path => List<GridPosition>.unmodifiable(_path);
  MechanicContext get context => _context;
  String? get statusMessage => _statusMessage;

  bool get canDraw => _phase == GameplayPhase.planning;
  bool get canUndo => canDraw && _path.isNotEmpty;
  bool get canErase => canDraw && _path.isNotEmpty;
  bool get canGo => canDraw && _path.isNotEmpty;

  PathValidationResult validatePath({bool requireExit = false}) {
    return _pathValidator.validate(
      grid: _grid,
      path: _path,
      requireExit: requireExit,
    );
  }

  bool tryAddToPath(GridPosition position) {
    if (!canDraw) {
      return false;
    }

    if (_path.isEmpty) {
      final start = _grid.findStart();
      if (start == null || position != start) {
        _statusMessage = 'Path must begin at the start tile';
        return false;
      }
      _path = [position];
      _refreshDiscovery();
      _statusMessage = null;
      return true;
    }

    final last = _path.last;
    if (!last.isAdjacentTo(position)) {
      _statusMessage = 'Next cell must be adjacent';
      return false;
    }

    if (_path.contains(position)) {
      _statusMessage = 'Cannot revisit a cell';
      return false;
    }

    final cell = _grid.cellAtOrNull(position);
    if (cell == null || !cell.isWalkable) {
      _statusMessage = 'Cannot move through walls';
      return false;
    }

    final tentativePath = [..._path, position];
    final validation = _pathValidator.validate(grid: _grid, path: tentativePath);
    if (!validation.isValid) {
      _statusMessage = validation.message;
      return false;
    }

    _path = tentativePath;
    _refreshDiscovery();
    _statusMessage = null;
    return true;
  }

  void undo() {
    if (!canUndo) {
      return;
    }
    _path = _path.sublist(0, _path.length - 1);
    _refreshDiscovery();
    _statusMessage = null;
  }

  void erase() {
    if (!canErase) {
      return;
    }
    _path = [];
    _refreshDiscovery();
    _statusMessage = null;
  }

  bool go() {
    if (!canGo) {
      return false;
    }

    final validation = validatePath(requireExit: level.objectives.reachExit);
    if (!validation.isValid) {
      _statusMessage = validation.message;
      return false;
    }

    if (level.moveLimit != null && _path.length > level.moveLimit!) {
      _phase = GameplayPhase.lost;
      _statusMessage = 'Exceeded move limit';
      return false;
    }

    _phase = GameplayPhase.executing;

    final result = _pathExecutor.execute(
      grid: _grid,
      path: _path,
      onStep: (_, context) {
        _context = context;
        _grid = _discoveryEngine.revealAfterRelicCollection(
          _grid,
          context.collectedRelics,
        );
      },
    );

    _context = result.context;
    _grid = result.finalGrid;

    if (_context.failed) {
      _phase = GameplayPhase.lost;
      _statusMessage = _context.failureReason;
      return false;
    }

    final won = _evaluateWin();
    _phase = won ? GameplayPhase.won : GameplayPhase.lost;
    if (!won) {
      _statusMessage ??= 'Level objectives not met';
    } else {
      _statusMessage = null;
    }
    return won;
  }

  void reset() {
    _grid = _discoveryEngine.applyInitialVisibility(level.grid);
    _phase = GameplayPhase.planning;
    _path = [];
    _context = MechanicContext();
    _statusMessage = null;
  }

  void _refreshDiscovery() {
    _grid = _discoveryEngine.revealFromPath(_grid, _path);
  }

  bool _evaluateWin() {
    final objectives = level.objectives;

    if (objectives.reachExit && !_context.reachedExit) {
      return false;
    }

    if (objectives.collectAllGems) {
      final totalGems = level.grid.countGems();
      if (_context.gemsCollected < totalGems) {
        return false;
      }
    }

    if (_context.gemsCollected < objectives.minGems) {
      return false;
    }

    return true;
  }
}
