/// Tuning values shared across UI and gameplay.
abstract final class GameConstants {
  static const int hintCostGems = 15;
  static const int hintCostCoins = 25;
  static const int baseCoinsPerLevel = 40;
  static const int fogRevealRadius = 2;
  static const int maxStarsPerLevel = 3;
  static const int startingGems = 50;
  static const int startingHints = 3;

  static const Duration pathStepDuration = Duration(milliseconds: 280);
  static const Duration levelCompleteDelay = Duration(milliseconds: 600);

  static const double mazeSkewRadians = 0.35;
  static const double mazeScale = 0.92;
  static const double tileAspectRatio = 0.72;

  static const String defaultWorldId = 'world_1';
}
