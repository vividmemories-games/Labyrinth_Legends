import 'dart:ui';

/// Normalized anchor layout for the winding ruin path on [level_select.png].
abstract final class LevelPathLayout {
  static const double nodeSpacing = 108;
  static const double topPadding = 96;
  static const double bottomPadding = 128;

  /// X fractions tuned to overlay the stone path plate (mockup S-curve).
  static const List<double> xPattern = [
    0.50,
    0.34,
    0.66,
    0.40,
    0.60,
    0.46,
    0.58,
    0.36,
  ];

  static double canvasHeight(int levelCount) {
    if (levelCount <= 1) {
      return topPadding + bottomPadding + nodeSpacing;
    }
    return topPadding + bottomPadding + (levelCount - 1) * nodeSpacing;
  }

  /// Level index 0 (level 1) sits at the bottom of the scroll canvas.
  static Offset nodeCenter(int index, double width, int levelCount) {
    final x = xPattern[index % xPattern.length] * width;
    final height = canvasHeight(levelCount);
    final y = height - bottomPadding - index * nodeSpacing;
    return Offset(x, y);
  }

  static List<Offset> allCenters(double width, int levelCount) {
    return List.generate(
      levelCount,
      (index) => nodeCenter(index, width, levelCount),
    );
  }
}
