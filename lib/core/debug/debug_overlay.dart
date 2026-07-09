import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:labyrinth_legends/app/routes.dart';
import 'package:labyrinth_legends/core/debug/debug_config.dart';
import 'package:labyrinth_legends/design_system/theme/ll_theme_extension.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

/// Development overlay hook — FPS placeholder, engine status, grid toggle.
class DebugOverlay extends StatefulWidget {
  const DebugOverlay({
    super.key,
    required this.child,
    this.engineStatus = 'Idle',
    this.debugDetails,
    this.showDebugGrid = false,
    this.onToggleDebugGrid,
  });

  final Widget child;
  final String engineStatus;
  final String? debugDetails;
  final bool showDebugGrid;
  final ValueChanged<bool>? onToggleDebugGrid;

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
            debugDetails: widget.debugDetails,
            showDebugGrid: widget.showDebugGrid,
            onToggleGrid: () {
              final next = !widget.showDebugGrid;
              DebugConfig.showGrid = next;
              widget.onToggleDebugGrid?.call(next);
            },
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
    required this.showDebugGrid,
    required this.onToggleGrid,
    this.debugDetails,
  });

  final LLThemeExtension theme;
  final String engineStatus;
  final String? debugDetails;
  final bool showDebugGrid;
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
        padding: const EdgeInsets.all(LLSpacing.sm),
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
              const SizedBox(height: LLSpacing.xs),
              Text(
                'Engine: $engineStatus',
                style: LLTextStyle.caption.copyWith(color: theme.textSecondary),
              ),
            ],
            if (debugDetails != null) ...[
              const SizedBox(height: LLSpacing.xs),
              Text(
                debugDetails!,
                style: LLTextStyle.caption.copyWith(color: theme.textSecondary),
              ),
            ],
            const SizedBox(height: LLSpacing.xs),
            TextButton(
              onPressed: onToggleGrid,
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                'Grid: ${showDebugGrid ? 'ON' : 'OFF'}',
                style: LLTextStyle.caption.copyWith(color: theme.actionPrimary),
              ),
            ),
            const SizedBox(height: LLSpacing.xs),
            TextButton(
              onPressed: () => context.push(AppRoutes.mazeRenderPoc),
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                'Maze POC',
                style: LLTextStyle.caption.copyWith(color: theme.actionPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
