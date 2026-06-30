import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

/// Elevated stone card — lighter shadow than LLPanel.
class LLCard extends StatelessWidget {
  const LLCard({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
    this.semanticsLabel,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final content = DecoratedBox(
      decoration: LLSurface.card(),
      child: Padding(
        padding: padding ?? EdgeInsets.all(LLSpacing.md),
        child: child,
      ),
    );

    if (onTap == null) return content;

    return Semantics(
      button: true,
      enabled: true,
      label: semanticsLabel,
      excludeSemantics: semanticsLabel != null,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: LLRadius.cardBorder,
          child: content,
        ),
      ),
    );
  }
}
