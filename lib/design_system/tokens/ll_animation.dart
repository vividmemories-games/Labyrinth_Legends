import 'package:flutter/animation.dart';

/// Motion tokens — WS10 semantic duration roles (WS5 temperament).
/// See docs/02_Design_System/Design_Tokens.md
abstract final class LLAnimation {
  // Semantic durations
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration portalPulse = Duration(milliseconds: 2000);
  static const Duration fadeIn = Duration(milliseconds: 350);
  static const Duration rewardPop = Duration(milliseconds: 600);
  static const Duration glowLoop = Duration(milliseconds: 2000);
  static const Duration pathGlow = Duration(milliseconds: 280);

  // Legacy aliases
  static const Duration panelReveal = fadeIn;
  static const Duration rewardBurst = rewardPop;

  // Curves
  static const Curve standard = Curves.easeOutCubic;
  static const Curve portalPulseCurve = Curves.easeInOut;
  static const Curve fadeInCurve = Curves.easeOutCubic;
  static const Curve rewardPopCurve = Curves.elasticOut;
  static const Curve glowLoopCurve = Curves.easeInOut;
  static const Curve pathGlowCurve = Curves.linear;
}
