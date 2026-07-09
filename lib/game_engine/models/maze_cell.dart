import 'package:labyrinth_legends/game_engine/models/cell_type.dart';
import 'package:labyrinth_legends/game_engine/models/cell_edges.dart';
import 'package:labyrinth_legends/game_engine/models/cell_visibility.dart';

class MazeCell {
  const MazeCell({
    required this.type,
    this.hasGem = false,
    this.keyId,
    this.lockId,
    this.hasRelic = false,
    this.relicId,
    this.hiddenUntilRelicId,
    this.visibility = CellVisibility.visible,
    this.blockedEdges = CellEdges.none,
  });

  final CellType type;
  final bool hasGem;
  final String? keyId;
  final String? lockId;
  final bool hasRelic;
  final String? relicId;
  final String? hiddenUntilRelicId;
  final CellVisibility visibility;
  final CellEdges blockedEdges;

  bool get isWalkable => type.isWalkable;

  bool get isLocked => lockId != null;

  bool get isHiddenByRelic => hiddenUntilRelicId != null;

  MazeCell copyWith({
    CellType? type,
    bool? hasGem,
    String? keyId,
    String? lockId,
    bool? hasRelic,
    String? relicId,
    String? hiddenUntilRelicId,
    CellVisibility? visibility,
    CellEdges? blockedEdges,
    bool clearKeyId = false,
    bool clearLockId = false,
    bool clearRelicId = false,
    bool clearHiddenUntilRelicId = false,
  }) {
    return MazeCell(
      type: type ?? this.type,
      hasGem: hasGem ?? this.hasGem,
      keyId: clearKeyId ? null : (keyId ?? this.keyId),
      lockId: clearLockId ? null : (lockId ?? this.lockId),
      hasRelic: hasRelic ?? this.hasRelic,
      relicId: clearRelicId ? null : (relicId ?? this.relicId),
      hiddenUntilRelicId: clearHiddenUntilRelicId
          ? null
          : (hiddenUntilRelicId ?? this.hiddenUntilRelicId),
      visibility: visibility ?? this.visibility,
      blockedEdges: blockedEdges ?? this.blockedEdges,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      if (hasGem) 'hasGem': hasGem,
      if (keyId != null) 'keyId': keyId,
      if (lockId != null) 'lockId': lockId,
      if (hasRelic) 'hasRelic': hasRelic,
      if (relicId != null) 'relicId': relicId,
      if (hiddenUntilRelicId != null) 'hiddenUntilRelicId': hiddenUntilRelicId,
      if (visibility != CellVisibility.visible)
        'visibility': visibility.toJson(),
      if (blockedEdges != CellEdges.none) 'edges': blockedEdges.toJson(),
    };
  }

  factory MazeCell.fromJson(Map<String, dynamic> json) {
    return MazeCell(
      type: CellType.fromJson(json['type'] as String? ?? 'floor'),
      hasGem: json['hasGem'] as bool? ?? false,
      keyId: json['keyId'] as String?,
      lockId: json['lockId'] as String?,
      hasRelic: json['hasRelic'] as bool? ?? false,
      relicId: json['relicId'] as String?,
      hiddenUntilRelicId: json['hiddenUntilRelicId'] as String?,
      visibility: CellVisibility.fromJson(
        json['visibility'] as String? ?? 'visible',
      ),
      blockedEdges: CellEdges.fromJson(json['edges'] as Map<String, dynamic>?),
    );
  }
}
