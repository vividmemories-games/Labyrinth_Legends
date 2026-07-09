/// Blocked edges on a walkable cell — raised wall sides (schema v2).
class CellEdges {
  const CellEdges({
    this.north = false,
    this.east = false,
    this.south = false,
    this.west = false,
  });

  final bool north;
  final bool east;
  final bool south;
  final bool west;

  static const none = CellEdges();

  int get blockedCount =>
      [north, east, south, west].where((blocked) => blocked).length;

  CellEdges merge(CellEdges other) {
    return CellEdges(
      north: north || other.north,
      east: east || other.east,
      south: south || other.south,
      west: west || other.west,
    );
  }

  CellEdges copyWith({
    bool? north,
    bool? east,
    bool? south,
    bool? west,
  }) {
    return CellEdges(
      north: north ?? this.north,
      east: east ?? this.east,
      south: south ?? this.south,
      west: west ?? this.west,
    );
  }

  Map<String, dynamic> toJson() => {
        if (north) 'north': true,
        if (east) 'east': true,
        if (south) 'south': true,
        if (west) 'west': true,
      };

  factory CellEdges.fromJson(Map<String, dynamic>? json) {
    if (json == null || json.isEmpty) {
      return CellEdges.none;
    }
    return CellEdges(
      north: json['north'] as bool? ?? false,
      east: json['east'] as bool? ?? false,
      south: json['south'] as bool? ?? false,
      west: json['west'] as bool? ?? false,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CellEdges &&
        other.north == north &&
        other.east == east &&
        other.south == south &&
        other.west == west;
  }

  @override
  int get hashCode => Object.hash(north, east, south, west);
}
