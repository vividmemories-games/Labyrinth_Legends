import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

/// Stone slab container — see docs/02_Design_System/Components.md
class LLPanel extends StatelessWidget {
  const LLPanel({
    super.key,
    required this.child,
    this.padding,
    this.compact = false,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final resolvedPadding = padding ??
        EdgeInsets.all(compact ? LLSpacing.sm + LLSpacing.xs : LLSpacing.md);

    return DecoratedBox(
      decoration: LLSurface.panel(),
      child: Padding(padding: resolvedPadding, child: child),
    );
  }
}
