/// A cell coordinate on the maze grid.
class GridPosition {
  const GridPosition({required this.row, required this.col});

  final int row;
  final int col;

  int manhattanDistanceTo(GridPosition other) {
    return (row - other.row).abs() + (col - other.col).abs();
  }

  bool isAdjacentTo(GridPosition other) {
    return manhattanDistanceTo(other) == 1;
  }

  GridPosition? neighborInDirection(int deltaRow, int deltaCol) {
    return GridPosition(row: row + deltaRow, col: col + deltaCol);
  }

  static const orthogonalDeltas = <({int row, int col})>[
    (row: -1, col: 0),
    (row: 1, col: 0),
    (row: 0, col: -1),
    (row: 0, col: 1),
  ];

  Iterable<GridPosition> orthogonalNeighbors() sync* {
    for (final delta in orthogonalDeltas) {
      yield GridPosition(row: row + delta.row, col: col + delta.col);
    }
  }

  Map<String, dynamic> toJson() => {'row': row, 'col': col};

  factory GridPosition.fromJson(Map<String, dynamic> json) {
    return GridPosition(
      row: json['row'] as int,
      col: json['col'] as int,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GridPosition && other.row == row && other.col == col;
  }

  @override
  int get hashCode => Object.hash(row, col);

  @override
  String toString() => 'GridPosition($row, $col)';
}
