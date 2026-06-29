import 'package:flutter/material.dart';
import 'package:labyrinth_legends/core/constants/app_colors.dart';

enum RuinsButtonVariant { primary, secondary, ghost, danger }

class RuinsButton extends StatelessWidget {
  const RuinsButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.variant = RuinsButtonVariant.primary,
    this.expanded = false,
    this.enabled = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final RuinsButtonVariant variant;
  final bool expanded;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final style = _styleFor(variant);
    final child = Row(
      mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[
          Icon(icon, size: 18, color: style.foreground),
          const SizedBox(width: 8),
        ],
        Text(
          label,
          style: TextStyle(
            color: style.foreground,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.8,
          ),
        ),
      ],
    );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: enabled ? onPressed : null,
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          width: expanded ? double.infinity : null,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: style.gradient == null
                ? null
                : LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: style.gradient!,
                  ),
            color: style.gradient == null ? style.background : null,
            border: Border.all(color: style.border, width: 1.5),
            boxShadow: style.glow == null
                ? null
                : [
                    BoxShadow(
                      color: style.glow!,
                      blurRadius: 14,
                      offset: const Offset(0, 4),
                    ),
                  ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            child: child,
          ),
        ),
      ),
    );
  }

  _ButtonStyle _styleFor(RuinsButtonVariant variant) {
    return switch (variant) {
      RuinsButtonVariant.primary => _ButtonStyle(
          gradient: AppColors.goldButtonGradient,
          border: AppColors.goldLight.withValues(alpha: 0.9),
          foreground: AppColors.voidBlack,
          glow: AppColors.gold.withValues(alpha: 0.35),
        ),
      RuinsButtonVariant.secondary => _ButtonStyle(
          gradient: AppColors.secondaryButtonGradient,
          border: AppColors.cyanGlow.withValues(alpha: 0.55),
          foreground: AppColors.cyanGlow,
          glow: AppColors.cyanGlow.withValues(alpha: 0.15),
        ),
      RuinsButtonVariant.ghost => _ButtonStyle(
          background: Colors.transparent,
          border: AppColors.gold.withValues(alpha: 0.35),
          foreground: AppColors.textSecondary,
        ),
      RuinsButtonVariant.danger => _ButtonStyle(
          background: AppColors.danger.withValues(alpha: 0.15),
          border: AppColors.danger,
          foreground: AppColors.danger,
        ),
    };
  }
}

class _ButtonStyle {
  const _ButtonStyle({
    this.gradient,
    this.background,
    required this.border,
    required this.foreground,
    this.glow,
  });

  final List<Color>? gradient;
  final Color? background;
  final Color border;
  final Color foreground;
  final Color? glow;
}
