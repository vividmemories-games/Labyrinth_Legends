import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/components/ll_loading_indicator.dart';
import 'package:labyrinth_legends/design_system/theme/ll_theme_extension.dart';

enum LoadingOverlayState { hidden, appearing, active, dismissing }

/// Calm transitional loading veil — UI_05 Loading Overlay.
class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    super.key,
    this.message,
    this.state = LoadingOverlayState.active,
  });

  final String? message;
  final LoadingOverlayState state;

  @override
  Widget build(BuildContext context) {
    if (state == LoadingOverlayState.hidden) {
      return const SizedBox.shrink();
    }

    final theme = context.llTheme;

    return ColoredBox(
      color: theme.overlayVeil,
      child: Center(
        child: LLLoadingIndicator(message: message),
      ),
    );
  }
}
