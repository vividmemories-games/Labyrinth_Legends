import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

/// Portal-styled loading indicator.
class LLLoadingIndicator extends StatefulWidget {
  const LLLoadingIndicator({
    super.key,
    this.size = LLSize.iconLg,
    this.message,
  });

  final double size;
  final String? message;

  @override
  State<LLLoadingIndicator> createState() => _LLLoadingIndicatorState();
}

class _LLLoadingIndicatorState extends State<LLLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: LLAnimation.portalPulse,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final scale = 0.85 + (_controller.value * 0.15);
            return Transform.scale(
              scale: scale,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: LLColor.portalBlue.withValues(
                    alpha: 0.2 + (_controller.value * 0.2),
                  ),
                  border: Border.all(
                    color: LLColor.energyCyan,
                    width: LLSize.borderWidth,
                  ),
                  boxShadow: LLShadow.portalGlow,
                ),
                child: SizedBox(
                  width: widget.size,
                  height: widget.size,
                  child: Center(
                    child: Icon(
                      Icons.blur_circular,
                      color: LLColor.energyCyan,
                      size: widget.size * 0.5,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        if (widget.message != null) ...[
          SizedBox(height: LLSpacing.md),
          Text(widget.message!, style: LLTextStyle.caption),
        ],
      ],
    );
  }
}
