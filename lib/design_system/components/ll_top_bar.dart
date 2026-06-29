import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/components/ll_icon_button.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

/// App bar styled for temple UI.
class LLTopBar extends StatelessWidget implements PreferredSizeWidget {
  const LLTopBar({
    super.key,
    required this.title,
    this.leading,
    this.actions = const [],
  });

  final String title;
  final Widget? leading;
  final List<Widget> actions;

  @override
  Size get preferredSize => Size.fromHeight(LLSize.touchTarget + LLSpacing.sm);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: LLColor.templeBlack.withValues(alpha: 0.92),
        border: Border(
          bottom: BorderSide(
            color: LLColor.ancientGold.withValues(alpha: LLColor.borderGoldAlpha),
          ),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: LLSize.touchTarget,
          child: Row(
            children: [
              if (leading != null)
                leading!
              else
                SizedBox(width: LLSpacing.sm),
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: LLTextStyle.h2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: actions.isEmpty
                    ? [SizedBox(width: LLSpacing.sm)]
                    : [
                        ...actions,
                        SizedBox(width: LLSpacing.xs),
                      ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Convenience back button for top bar leading slot.
  static Widget backButton(BuildContext context, {VoidCallback? onPressed}) {
    return LLIconButton(
      icon: Icons.arrow_back,
      tooltip: 'Back',
      onPressed: onPressed ?? () => Navigator.of(context).maybePop(),
    );
  }
}
