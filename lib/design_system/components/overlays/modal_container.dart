import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/theme/ll_theme_extension.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

enum ModalContainerState { hidden, opening, active, closing }

/// Overlay modal shell — UI_05 Modal Dialog structural container.
class ModalContainer extends StatelessWidget {
  const ModalContainer({
    super.key,
    required this.title,
    required this.child,
    this.actions,
    this.state = ModalContainerState.active,
  });

  final String title;
  final Widget child;
  final Widget? actions;
  final ModalContainerState state;

  @override
  Widget build(BuildContext context) {
    if (state == ModalContainerState.hidden) {
      return const SizedBox.shrink();
    }

    final theme = context.llTheme;

    return ColoredBox(
      color: theme.overlayVeil,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(theme.spacingScreenPadding),
          child: Material(
            color: Colors.transparent,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: LLRadius.dialogBorder,
                gradient: LLGradient.stonePanel,
                border: Border.all(
                  color: theme.borderSubtle,
                  width: LLSize.borderWidth,
                ),
                boxShadow: LLShadow.panel,
              ),
              child: Padding(
                padding: EdgeInsets.all(theme.spacingScreenPadding),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      title,
                      style: LLTextStyle.h2.copyWith(color: theme.actionPrimary),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: theme.spacingZoneGap),
                    child,
                    if (actions != null) ...[
                      SizedBox(height: theme.spacingZoneGap),
                      actions!,
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
