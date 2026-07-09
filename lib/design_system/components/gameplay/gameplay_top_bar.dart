import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/assets/ll_gameplay_assets.dart';
import 'package:labyrinth_legends/design_system/components/gameplay/gameplay_header_icon_button.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

/// Gameplay header — back, level title + stars, settings/pause per MVP mockup.
class GameplayTopBar extends StatelessWidget {
  const GameplayTopBar({
    super.key,
    required this.levelLabel,
    required this.starCount,
    this.onBack,
    this.onSettings,
    this.settingsEnabled = true,
  });

  final String levelLabel;
  final int starCount;
  final VoidCallback? onBack;
  final VoidCallback? onSettings;
  final bool settingsEnabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: LLSpacing.sm),
      child: Row(
        children: [
          GameplayHeaderIconButton(
            iconKind: GameplayHudIconKind.back,
            tooltip: 'Back',
            onPressed: onBack,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  levelLabel,
                  textAlign: TextAlign.center,
                  style: LLTextStyle.buttonSecondary.copyWith(
                    color: LLColor.ancientGold,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: LLSpacing.xs),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var i = 0; i < 3; i++)
                      Icon(
                        i < starCount ? Icons.star : Icons.star_border,
                        size: LLSize.iconSm,
                        color: LLColor.ancientGold,
                      ),
                  ],
                ),
              ],
            ),
          ),
          GameplayHeaderIconButton(
            iconKind: GameplayHudIconKind.settings,
            tooltip: 'Pause',
            enabled: settingsEnabled,
            onPressed: settingsEnabled ? onSettings : null,
          ),
        ],
      ),
    );
  }
}
