enum CellType {
  wall,
  floor,
  start,
  exit;

  bool get isWalkable => this != CellType.wall;

  static CellType fromJson(String value) {
    return CellType.values.firstWhere(
      (type) => type.name == value,
      orElse: () => CellType.floor,
    );
  }

  String toJson() => name;
}
