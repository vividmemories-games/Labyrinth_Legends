import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

class LLBottomBarItem {
  const LLBottomBarItem({
    required this.icon,
    required this.label,
    this.onTap,
    this.selected = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final bool selected;
}

/// Bottom navigation bar with stone slab styling.
class LLBottomBar extends StatelessWidget {
  const LLBottomBar({super.key, required this.items});

  final List<LLBottomBarItem> items;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LLGradient.stonePanel,
        border: Border(
          top: BorderSide(
            color: LLColor.ancientGold.withValues(alpha: LLColor.borderGoldAlpha),
          ),
        ),
        boxShadow: LLShadow.panel,
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: LLSpacing.sm,
            horizontal: LLSpacing.md,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (final item in items) _BottomItem(item: item),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomItem extends StatelessWidget {
  const _BottomItem({required this.item});

  final LLBottomBarItem item;

  @override
  Widget build(BuildContext context) {
    final isInteractive = item.onTap != null;
    final color =
        item.selected ? LLColor.ancientGold : LLColor.textSecondary;

    return Semantics(
      button: true,
      enabled: isInteractive,
      selected: item.selected,
      label: item.label,
      excludeSemantics: true,
      child: Opacity(
        opacity: isInteractive ? 1 : 0.55,
        child: InkWell(
          onTap: item.onTap,
          borderRadius: LLRadius.mdBorder,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: LLSpacing.sm,
              vertical: LLSpacing.xs,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(item.icon, color: color, size: LLSize.iconMd),
                SizedBox(height: LLSpacing.xs),
                Text(
                  item.label,
                  style: LLTextStyle.caption.copyWith(
                    color: color,
                    fontWeight:
                        item.selected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
