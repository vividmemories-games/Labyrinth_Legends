import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/data/daily_level_builder.dart';

void main() {
  test('daily level is deterministic for a seed', () {
    final a = buildDailyLevel(20260628);
    final b = buildDailyLevel(20260628);
    expect(a.id, 'daily_20260628');
    expect(a.grid.width, 11);
    expect(a.grid.cells.length, b.grid.cells.length);
    expect(
      a.grid.cellAt(a.grid.findStart()!).type,
      b.grid.cellAt(b.grid.findStart()!).type,
    );
  });

  test('daily level id matches date helper', () {
    final date = DateTime(2026, 6, 28);
    expect(dailyLevelIdForDate(date), 'daily_20260628');
    expect(dailySeedForDate(date), 20260628);
  });
}
