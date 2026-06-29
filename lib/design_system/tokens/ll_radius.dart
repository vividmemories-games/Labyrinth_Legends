import 'package:flutter/material.dart';

/// Radius tokens — see docs/02_Design_System/Design_Tokens.md
abstract final class LLRadius {
  static const double sm = 6;
  static const double md = 10;
  static const double button = 10;
  static const double card = 12;
  static const double panel = 16;
  static const double dialog = 20;
  static const double pill = 24;

  static BorderRadius get smBorder => BorderRadius.circular(sm);
  static BorderRadius get mdBorder => BorderRadius.circular(md);
  static BorderRadius get buttonBorder => BorderRadius.circular(button);
  static BorderRadius get cardBorder => BorderRadius.circular(card);
  static BorderRadius get panelBorder => BorderRadius.circular(panel);
  static BorderRadius get dialogBorder => BorderRadius.circular(dialog);
  static BorderRadius get pillBorder => BorderRadius.circular(pill);
}
