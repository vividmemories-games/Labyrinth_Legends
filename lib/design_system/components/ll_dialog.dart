import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/components/ll_button.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

/// Temple-styled modal dialog.
class LLDialog extends StatelessWidget {
  const LLDialog({
    super.key,
    required this.title,
    required this.content,
    this.primaryLabel = 'Confirm',
    this.secondaryLabel,
    this.onPrimary,
    this.onSecondary,
    this.danger = false,
  });

  final String title;
  final Widget content;
  final String primaryLabel;
  final String? secondaryLabel;
  final VoidCallback? onPrimary;
  final VoidCallback? onSecondary;
  final bool danger;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(LLSpacing.lg),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: LLRadius.dialogBorder,
          gradient: LLGradient.stonePanel,
          border: Border.all(
            color: LLColor.ancientGold.withValues(alpha: LLColor.borderGoldAlpha),
            width: LLSize.borderWidth,
          ),
          boxShadow: LLShadow.panel,
        ),
        child: Padding(
          padding: EdgeInsets.all(LLSpacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(title, style: LLTextStyle.h2, textAlign: TextAlign.center),
              SizedBox(height: LLSpacing.md),
              content,
              SizedBox(height: LLSpacing.lg),
              LLButton(
                label: primaryLabel,
                expanded: true,
                variant: danger ? LLButtonVariant.danger : LLButtonVariant.primary,
                onPressed: onPrimary ?? () => Navigator.of(context).pop(true),
              ),
              if (secondaryLabel != null) ...[
                SizedBox(height: LLSpacing.sm),
                LLButton(
                  label: secondaryLabel!,
                  expanded: true,
                  variant: LLButtonVariant.ghost,
                  onPressed: onSecondary ?? () => Navigator.of(context).pop(false),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  /// Show a styled dialog and return the primary action result.
  static Future<bool?> show({
    required BuildContext context,
    required String title,
    required Widget content,
    String primaryLabel = 'Confirm',
    String? secondaryLabel = 'Cancel',
    bool danger = false,
  }) {
    return showDialog<bool>(
      context: context,
      barrierColor: LLColor.templeBlack.withValues(alpha: LLColor.overlayVeilAlpha),
      builder: (context) => LLDialog(
        title: title,
        content: content,
        primaryLabel: primaryLabel,
        secondaryLabel: secondaryLabel,
        danger: danger,
      ),
    );
  }
}
