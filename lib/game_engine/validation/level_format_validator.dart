import 'package:labyrinth_legends/game_engine/models/level_definition.dart';
import 'package:labyrinth_legends/game_engine/validation/level_format_validation_error.dart';
import 'package:labyrinth_legends/game_engine/validation/level_format_validation_result.dart';

/// Structural validator for hand-authored level JSON per [Level_Format.md] §16.
class LevelFormatValidator {
  const LevelFormatValidator();

  static const _levelIdPattern = r'^level_\d{3}$';

  static const _topLevelKeys = {
    'schemaVersion',
    'id',
    'name',
    'worldId',
    'discoveryMode',
    'objectives',
    'starThresholds',
    'grid',
    'moveLimit',
    'tutorial',
    'author',
    'tags',
    '_meta',
  };

  static const _gridKeys = {'width', 'height', 'cells'};

  static const _objectiveKeys = {'reachExit', 'collectAllGems', 'minGems'};

  static const _starThresholdKeys = {'threeStars', 'twoStars', 'oneStar'};

  static const _tutorialKeys = {'band', 'sequence', 'teaches', 'hintId'};

  static const _cellKeys = {
    'type',
    'hasGem',
    'keyId',
    'lockId',
    'hasRelic',
    'relicId',
    'hiddenUntilRelicId',
    'visibility',
  };

  static const _cellTypes = {'floor', 'wall', 'start', 'exit'};

  static const _discoveryModes = {'full', 'fog', 'relicGated'};

  static const _cellVisibilityValues = {'hidden', 'fogged', 'visible'};

  /// Validates [json] against schema version 1 structural rules (LV-01–LV-15).
  ///
  /// [expectedLevelId] and [expectedWorldId] enable LV-02 and LV-03 when loading
  /// from a known asset path (e.g. `level_001` in `world_1`).
  LevelFormatValidationResult validate(
    Map<String, dynamic> json, {
    String? expectedLevelId,
    String? expectedWorldId,
  }) {
    final errors = <LevelFormatValidationError>[];
    final warnings = <LevelFormatValidationWarning>[];

    _rejectUnknownKeys(json, _topLevelKeys, '', errors);

    _validateSchemaVersion(json, errors);
    _validateLevelId(json, expectedLevelId, errors);
    _validateName(json, errors);
    _validateWorldId(json, expectedWorldId, errors);
    _validateDiscoveryMode(json, errors);
    _validateMoveLimit(json, errors);
    _validateObjectives(json, errors);
    _validateStarThresholds(json, errors);
    _validateTutorial(json, errors);
    _validateGrid(json, errors, warnings);

    return LevelFormatValidationResult(errors: errors, warnings: warnings);
  }

  /// Validates then parses into an immutable [LevelDefinition].
  ///
  /// Throws [LevelFormatValidationException] when structural validation fails.
  LevelDefinition parse(
    Map<String, dynamic> json, {
    String? expectedLevelId,
    String? expectedWorldId,
  }) {
    final result = validate(
      json,
      expectedLevelId: expectedLevelId,
      expectedWorldId: expectedWorldId,
    );
    if (!result.isValid) {
      throw LevelFormatValidationException(result.errors);
    }
    return LevelDefinition.fromJson(json);
  }

  void _validateSchemaVersion(
    Map<String, dynamic> json,
    List<LevelFormatValidationError> errors,
  ) {
    final value = json['schemaVersion'];
    if (value == null) {
      errors.add(
        const LevelFormatValidationError(
          ruleId: 'LV-01',
          message: 'schemaVersion is required and must be 1',
          path: 'schemaVersion',
        ),
      );
      return;
    }
    if (value is! int || value != 1) {
      errors.add(
        LevelFormatValidationError(
          ruleId: 'LV-01',
          message: 'schemaVersion must be integer 1',
          path: 'schemaVersion',
        ),
      );
    }
  }

  void _validateLevelId(
    Map<String, dynamic> json,
    String? expectedLevelId,
    List<LevelFormatValidationError> errors,
  ) {
    final id = json['id'];
    if (id is! String) {
      errors.add(
        const LevelFormatValidationError(
          ruleId: 'LV-02',
          message: 'id must be a string',
          path: 'id',
        ),
      );
      return;
    }
    if (!RegExp(_levelIdPattern).hasMatch(id)) {
      errors.add(
        LevelFormatValidationError(
          ruleId: 'LV-02',
          message: 'id must match level_{NNN} pattern',
          path: 'id',
        ),
      );
    }
    if (expectedLevelId != null && id != expectedLevelId) {
      errors.add(
        LevelFormatValidationError(
          ruleId: 'LV-02',
          message: 'id "$id" does not match expected "$expectedLevelId"',
          path: 'id',
        ),
      );
    }
  }

  void _validateName(
    Map<String, dynamic> json,
    List<LevelFormatValidationError> errors,
  ) {
    final name = json['name'];
    if (name is! String || name.isEmpty) {
      errors.add(
        const LevelFormatValidationError(
          ruleId: 'LV-15',
          message: 'name must be a non-empty string',
          path: 'name',
        ),
      );
    }
  }

  void _validateWorldId(
    Map<String, dynamic> json,
    String? expectedWorldId,
    List<LevelFormatValidationError> errors,
  ) {
    final worldId = json['worldId'];
    if (worldId is! String || worldId.isEmpty) {
      errors.add(
        const LevelFormatValidationError(
          ruleId: 'LV-03',
          message: 'worldId must be a non-empty string',
          path: 'worldId',
        ),
      );
      return;
    }
    if (expectedWorldId != null && worldId != expectedWorldId) {
      errors.add(
        LevelFormatValidationError(
          ruleId: 'LV-03',
          message: 'worldId "$worldId" does not match expected "$expectedWorldId"',
          path: 'worldId',
        ),
      );
    }
  }

  void _validateDiscoveryMode(
    Map<String, dynamic> json,
    List<LevelFormatValidationError> errors,
  ) {
    final mode = json['discoveryMode'];
    if (mode is! String || !_discoveryModes.contains(mode)) {
      errors.add(
        const LevelFormatValidationError(
          ruleId: 'LV-15',
          message: 'discoveryMode must be full, fog, or relicGated',
          path: 'discoveryMode',
        ),
      );
    }
  }

  void _validateMoveLimit(
    Map<String, dynamic> json,
    List<LevelFormatValidationError> errors,
  ) {
    if (!json.containsKey('moveLimit')) {
      return;
    }
    final moveLimit = json['moveLimit'];
    if (moveLimit != null) {
      errors.add(
        const LevelFormatValidationError(
          ruleId: 'LV-14',
          message: 'moveLimit must be null in schema version 1',
          path: 'moveLimit',
        ),
      );
    }
  }

  void _validateObjectives(
    Map<String, dynamic> json,
    List<LevelFormatValidationError> errors,
  ) {
    final objectives = json['objectives'];
    if (objectives is! Map) {
      errors.add(
        const LevelFormatValidationError(
          ruleId: 'LV-15',
          message: 'objectives must be an object',
          path: 'objectives',
        ),
      );
      return;
    }
    final map = Map<String, dynamic>.from(objectives);
    _rejectUnknownKeys(map, _objectiveKeys, 'objectives', errors);

    final reachExit = map['reachExit'];
    if (reachExit is! bool) {
      errors.add(
        const LevelFormatValidationError(
          ruleId: 'LV-15',
          message: 'objectives.reachExit must be a boolean',
          path: 'objectives.reachExit',
        ),
      );
    } else if (reachExit != true) {
      errors.add(
        const LevelFormatValidationError(
          ruleId: 'LV-10',
          message: 'objectives.reachExit must be true for schema version 1',
          path: 'objectives.reachExit',
        ),
      );
    }

    if (map['collectAllGems'] is! bool) {
      errors.add(
        const LevelFormatValidationError(
          ruleId: 'LV-15',
          message: 'objectives.collectAllGems must be a boolean',
          path: 'objectives.collectAllGems',
        ),
      );
    }
    if (map['minGems'] is! int) {
      errors.add(
        const LevelFormatValidationError(
          ruleId: 'LV-15',
          message: 'objectives.minGems must be an integer',
          path: 'objectives.minGems',
        ),
      );
    }
  }

  void _validateStarThresholds(
    Map<String, dynamic> json,
    List<LevelFormatValidationError> errors,
  ) {
    final thresholds = json['starThresholds'];
    if (thresholds is! Map) {
      errors.add(
        const LevelFormatValidationError(
          ruleId: 'LV-15',
          message: 'starThresholds must be an object',
          path: 'starThresholds',
        ),
      );
      return;
    }
    final map = Map<String, dynamic>.from(thresholds);
    _rejectUnknownKeys(map, _starThresholdKeys, 'starThresholds', errors);

    final three = map['threeStars'];
    final two = map['twoStars'];
    final one = map['oneStar'];
    if (three is! int || two is! int || one is! int) {
      errors.add(
        const LevelFormatValidationError(
          ruleId: 'LV-15',
          message: 'starThresholds values must be integers',
          path: 'starThresholds',
        ),
      );
      return;
    }
    if (three > two || two > one) {
      errors.add(
        const LevelFormatValidationError(
          ruleId: 'LV-09',
          message: 'starThresholds must satisfy threeStars ≤ twoStars ≤ oneStar',
          path: 'starThresholds',
        ),
      );
    }
  }

  void _validateTutorial(
    Map<String, dynamic> json,
    List<LevelFormatValidationError> errors,
  ) {
    final tutorial = json['tutorial'];
    if (tutorial == null) {
      return;
    }
    if (tutorial is! Map) {
      errors.add(
        const LevelFormatValidationError(
          ruleId: 'LV-15',
          message: 'tutorial must be an object',
          path: 'tutorial',
        ),
      );
      return;
    }
    final map = Map<String, dynamic>.from(tutorial);
    _rejectUnknownKeys(map, _tutorialKeys, 'tutorial', errors);

    final band = map['band'];
    if (band is! String || band.isEmpty) {
      errors.add(
        const LevelFormatValidationError(
          ruleId: 'LV-15',
          message: 'tutorial.band must be a non-empty string',
          path: 'tutorial.band',
        ),
      );
    }

    final sequence = map['sequence'];
    if (sequence is! int) {
      errors.add(
        const LevelFormatValidationError(
          ruleId: 'LV-15',
          message: 'tutorial.sequence must be an integer',
          path: 'tutorial.sequence',
        ),
      );
    }

    final teaches = map['teaches'];
    if (teaches is! List) {
      errors.add(
        const LevelFormatValidationError(
          ruleId: 'LV-15',
          message: 'tutorial.teaches must be an array of strings',
          path: 'tutorial.teaches',
        ),
      );
    } else {
      for (var i = 0; i < teaches.length; i++) {
        if (teaches[i] is! String) {
          errors.add(
            LevelFormatValidationError(
              ruleId: 'LV-15',
              message: 'tutorial.teaches[$i] must be a string',
              path: 'tutorial.teaches[$i]',
            ),
          );
        }
      }
    }

    if (map.containsKey('hintId')) {
      final hintId = map['hintId'];
      if (hintId != null && hintId is! String) {
        errors.add(
          const LevelFormatValidationError(
            ruleId: 'LV-15',
            message: 'tutorial.hintId must be a string or null',
            path: 'tutorial.hintId',
          ),
        );
      }
    }
  }

  void _validateGrid(
    Map<String, dynamic> json,
    List<LevelFormatValidationError> errors,
    List<LevelFormatValidationWarning> warnings,
  ) {
    final grid = json['grid'];
    if (grid is! Map) {
      errors.add(
        const LevelFormatValidationError(
          ruleId: 'LV-15',
          message: 'grid must be an object',
          path: 'grid',
        ),
      );
      return;
    }
    final map = Map<String, dynamic>.from(grid);
    _rejectUnknownKeys(map, _gridKeys, 'grid', errors);

    final width = map['width'];
    final height = map['height'];
    if (width is! int || height is! int) {
      errors.add(
        const LevelFormatValidationError(
          ruleId: 'LV-15',
          message: 'grid.width and grid.height must be integers',
          path: 'grid',
        ),
      );
      return;
    }
    if (width < 3 || height < 3) {
      errors.add(
        const LevelFormatValidationError(
          ruleId: 'LV-04',
          message: 'grid.width and grid.height must be at least 3',
          path: 'grid',
        ),
      );
    }

    final cells = map['cells'];
    if (cells is! List) {
      errors.add(
        const LevelFormatValidationError(
          ruleId: 'LV-15',
          message: 'grid.cells must be a 2D array',
          path: 'grid.cells',
        ),
      );
      return;
    }
    if (cells.length != height) {
      errors.add(
        const LevelFormatValidationError(
          ruleId: 'LV-05',
          message: 'grid.cells row count must equal grid.height',
          path: 'grid.cells',
        ),
      );
    }

    var startCount = 0;
    var exitCount = 0;
    var gemCount = 0;
    final keyIds = <String>{};
    final lockIds = <String>{};
    final collectAllGems = json['objectives'] is Map &&
        (json['objectives'] as Map)['collectAllGems'] == true;

    for (var row = 0; row < cells.length; row++) {
      final rowData = cells[row];
      if (rowData is! List) {
        errors.add(
          LevelFormatValidationError(
            ruleId: 'LV-05',
            message: 'grid.cells[$row] must be an array',
            path: 'grid.cells[$row]',
          ),
        );
        continue;
      }
      if (row < height && rowData.length != width) {
        errors.add(
          LevelFormatValidationError(
            ruleId: 'LV-05',
            message: 'grid.cells[$row] length must equal grid.width',
            path: 'grid.cells[$row]',
          ),
        );
      }

      for (var col = 0; col < rowData.length; col++) {
        final path = 'grid.cells[$row][$col]';
        final cell = rowData[col];
        if (cell is! Map) {
          errors.add(
            LevelFormatValidationError(
              ruleId: 'LV-06',
              message: 'cell must be an object',
              path: path,
            ),
          );
          continue;
        }
        final cellMap = Map<String, dynamic>.from(cell);
        _rejectUnknownKeys(cellMap, _cellKeys, path, errors);

        final type = cellMap['type'];
        if (type is! String || !_cellTypes.contains(type)) {
          errors.add(
            LevelFormatValidationError(
              ruleId: 'LV-06',
              message: 'cell type must be floor, wall, start, or exit',
              path: '$path.type',
            ),
          );
        } else {
          if (type == 'start') startCount++;
          if (type == 'exit') exitCount++;
        }

        _validateCellModifiers(cellMap, path, errors);

        if (cellMap['hasGem'] == true) {
          gemCount++;
        }
        final keyId = cellMap['keyId'];
        if (keyId is String) {
          keyIds.add(keyId);
        }
        final lockId = cellMap['lockId'];
        if (lockId is String) {
          lockIds.add(lockId);
        }

        final onPerimeter = row == 0 ||
            row == height - 1 ||
            col == 0 ||
            col == width - 1;
        if (onPerimeter && type != 'wall') {
          errors.add(
            LevelFormatValidationError(
              ruleId: 'LV-13',
              message: 'perimeter cells must be type wall',
              path: '$path.type',
            ),
          );
        }
      }
    }

    if (startCount != 1) {
      errors.add(
        LevelFormatValidationError(
          ruleId: 'LV-07',
          message: 'level must contain exactly one start cell (found $startCount)',
          path: 'grid.cells',
        ),
      );
    }
    if (exitCount != 1) {
      errors.add(
        LevelFormatValidationError(
          ruleId: 'LV-08',
          message: 'level must contain exactly one exit cell (found $exitCount)',
          path: 'grid.cells',
        ),
      );
    }
    if (collectAllGems && gemCount == 0) {
      errors.add(
        const LevelFormatValidationError(
          ruleId: 'LV-11',
          message:
              'collectAllGems requires at least one cell with hasGem: true',
          path: 'grid.cells',
        ),
      );
    }

    for (final keyId in keyIds) {
      if (!lockIds.contains(keyId)) {
        warnings.add(
          LevelFormatValidationWarning(
            ruleId: 'LV-12',
            message: 'keyId "$keyId" has no matching lockId in this level',
            path: 'grid.cells',
          ),
        );
      }
    }
  }

  void _validateCellModifiers(
    Map<String, dynamic> cellMap,
    String path,
    List<LevelFormatValidationError> errors,
  ) {
    if (cellMap.containsKey('hasGem') && cellMap['hasGem'] is! bool) {
      errors.add(
        LevelFormatValidationError(
          ruleId: 'LV-15',
          message: 'hasGem must be a boolean',
          path: '$path.hasGem',
        ),
      );
    }
    if (cellMap.containsKey('hasRelic') && cellMap['hasRelic'] is! bool) {
      errors.add(
        LevelFormatValidationError(
          ruleId: 'LV-15',
          message: 'hasRelic must be a boolean',
          path: '$path.hasRelic',
        ),
      );
    }

    for (final key in ['keyId', 'lockId', 'relicId', 'hiddenUntilRelicId']) {
      if (!cellMap.containsKey(key)) {
        continue;
      }
      final value = cellMap[key];
      if (value is! String || value.isEmpty) {
        errors.add(
          LevelFormatValidationError(
            ruleId: 'LV-15',
            message: '$key must be a non-empty string',
            path: '$path.$key',
          ),
        );
      }
    }

    if (cellMap.containsKey('visibility')) {
      final visibility = cellMap['visibility'];
      if (visibility is! String || !_cellVisibilityValues.contains(visibility)) {
        errors.add(
          LevelFormatValidationError(
            ruleId: 'LV-15',
            message: 'visibility must be hidden, fogged, or visible',
            path: '$path.visibility',
          ),
        );
      }
    }
  }

  void _rejectUnknownKeys(
    Map<String, dynamic> json,
    Set<String> allowed,
    String pathPrefix,
    List<LevelFormatValidationError> errors,
  ) {
    for (final key in json.keys) {
      if (!allowed.contains(key)) {
        final path = pathPrefix.isEmpty ? key : '$pathPrefix.$key';
        errors.add(
          LevelFormatValidationError(
            ruleId: 'LV-15',
            message: 'unknown key "$key"',
            path: path,
          ),
        );
      }
    }
  }
}
