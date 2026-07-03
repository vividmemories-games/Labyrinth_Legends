enum CellType {
  wall,
  floor,
  start,
  exit;

  bool get isWalkable => this != CellType.wall;

  static CellType fromJson(String value) {
    return CellType.values.firstWhere(
      (type) => type.name == value,
      orElse: () => throw FormatException('Unknown cell type: $value'),
    );
  }

  String toJson() => name;
}
