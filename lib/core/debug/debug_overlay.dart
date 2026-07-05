import 'package:flutter/material.dart';
import 'package:labyrinth_legends/core/debug/debug_config.dart';
import 'package:labyrinth_legends/design_system/theme/ll_theme_extension.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

/// Development overlay hook — FPS placeholder, engine status, grid toggle.
class DebugOverlay extends StatefulWidget {
  const DebugOverlay({
    super.key,
    required this.child,
    this.engineStatus = 'Idle',
  });

  final Widget child;
  final String engineStatus;

  @override
  State<DebugOverlay> createState() => _DebugOverlayState();
}

class _DebugOverlayState extends State<DebugOverlay> {
  @override
  Widget build(BuildContext context) {
    if (!DebugConfig.overlayEnabled) {
      return widget.child;
    }

    final theme = context.llTheme;

    return Stack(
      fit: StackFit.expand,
      children: [
        widget.child,
        Positioned(
          top: MediaQuery.paddingOf(context).top + LLSpacing.sm,
          right: LLSpacing.sm,
          child: _DebugPanel(
            theme: theme,
            engineStatus: widget.engineStatus,
            onToggleGrid: () => setState(DebugConfig.toggleGrid),
          ),
        ),
      ],
    );
  }
}

class _DebugPanel extends StatelessWidget {
  const _DebugPanel({
    required this.theme,
    required this.engineStatus,
    required this.onToggleGrid,
  });

  final LLThemeExtension theme;
  final String engineStatus;
  final VoidCallback onToggleGrid;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme.surfaceElevated.withValues(alpha: 0.92),
        borderRadius: LLRadius.smBorder,
        border: Border.all(color: theme.pathEnergy.withValues(alpha: 0.5)),
      ),
      child: Padding(
        padding: EdgeInsets.all(LLSpacing.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (DebugConfig.showFps)
              Text(
                'FPS: --',
                style: LLTextStyle.caption.copyWith(color: theme.pathEnergy),
              ),
            if (DebugConfig.showEngineStatus) ...[
              SizedBox(height: LLSpacing.xs),
              Text(
                'Engine: $engineStatus',
                style: LLTextStyle.caption.copyWith(color: theme.textSecondary),
              ),
            ],
            SizedBox(height: LLSpacing.xs),
            TextButton(
              onPressed: onToggleGrid,
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                'Grid: ${DebugConfig.showGrid ? 'ON' : 'OFF'}',
                style: LLTextStyle.caption.copyWith(color: theme.actionPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
