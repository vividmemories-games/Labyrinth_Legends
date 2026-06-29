import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

enum LLToastVariant { info, success, warning, danger }

/// Non-blocking feedback toast using ScaffoldMessenger.
abstract final class LLToast {
  static void show(
    BuildContext context, {
    required String message,
    LLToastVariant variant = LLToastVariant.info,
  }) {
    final colors = _colorsFor(variant);

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: LLTextStyle.bodyPrimary.copyWith(fontSize: 14),
          ),
          backgroundColor: colors.background,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: LLRadius.mdBorder,
            side: BorderSide(color: colors.border, width: LLSize.borderWidth),
          ),
          margin: EdgeInsets.all(LLSpacing.md),
          duration: LLAnimation.normal,
        ),
      );
  }

  static _ToastColors _colorsFor(LLToastVariant variant) {
    return switch (variant) {
      LLToastVariant.info => _ToastColors(
          background: LLColor.stoneMid,
          border: LLColor.energyCyan.withValues(alpha: 0.5),
        ),
      LLToastVariant.success => _ToastColors(
          background: LLColor.stoneMid,
          border: LLColor.successGreen,
        ),
      LLToastVariant.warning => _ToastColors(
          background: LLColor.stoneMid,
          border: LLColor.ancientGold,
        ),
      LLToastVariant.danger => _ToastColors(
          background: LLColor.stoneMid,
          border: LLColor.emberRed,
        ),
    };
  }
}

class _ToastColors {
  const _ToastColors({required this.background, required this.border});

  final Color background;
  final Color border;
}
