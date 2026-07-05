import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/components/ll_toast.dart';

/// Screen-level transient feedback host — UI_05 Toast Notification container.
///
/// Delegates display to [LLToast] while providing a structural anchor for
/// gameplay-screen feedback layers.
class ToastContainer extends StatelessWidget {
  const ToastContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  static void showInfo(BuildContext context, String message) {
    LLToast.show(context, message: message);
  }

  static void showSuccess(BuildContext context, String message) {
    LLToast.show(
      context,
      message: message,
      variant: LLToastVariant.success,
    );
  }

  static void showWarning(BuildContext context, String message) {
    LLToast.show(
      context,
      message: message,
      variant: LLToastVariant.warning,
    );
  }

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
