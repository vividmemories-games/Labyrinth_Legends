import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:labyrinth_legends/core/env/app_env.dart';
import 'package:labyrinth_legends/data/providers.dart';
import 'package:labyrinth_legends/design_system/design_system.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progressAsync = ref.watch(playerProgressProvider);
    final notifier = ref.read(playerProgressProvider.notifier);

    return Scaffold(
      backgroundColor: LLColor.templeBlack,
      appBar: AppBar(
        backgroundColor: LLColor.templeBlack,
        foregroundColor: LLColor.textPrimary,
        title: Text(
          'Settings',
          style: LLTextStyle.h2.copyWith(color: LLColor.ancientGold),
        ),
      ),
      body: progressAsync.when(
        loading: () => const Center(child: LLLoadingIndicator()),
        error: (e, _) => Center(
          child: Text(e.toString(), style: LLTextStyle.body),
        ),
        data: (progress) => ListView(
          padding: EdgeInsets.all(LLSpacing.screenPadding),
          children: [
            LLSection(
              title: 'Comfort & Feedback',
              subtitle: 'Adjust sound and haptics per WS9',
              child: Column(
                children: [
                  _SettingsToggle(
                    label: 'Sound Effects',
                    value: progress.soundEnabled,
                    onChanged: notifier.setSoundEnabled,
                  ),
                  _SettingsToggle(
                    label: 'Music',
                    value: progress.musicEnabled,
                    onChanged: notifier.setMusicEnabled,
                  ),
                  _SettingsToggle(
                    label: 'Haptics',
                    value: progress.hapticsEnabled,
                    onChanged: notifier.setHapticsEnabled,
                  ),
                ],
              ),
            ),
            SizedBox(height: LLSpacing.lg),
            LLSection(
              title: 'About',
              child: LLPanel(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Version', style: LLTextStyle.caption),
                    Text(
                      '0.1.0 (${AppEnv.flavor.name})',
                      style: LLTextStyle.bodyPrimary,
                    ),
                    SizedBox(height: LLSpacing.md),
                    Text('Environment', style: LLTextStyle.caption),
                    Text(
                      AppEnv.isDev ? 'Development' : 'Production',
                      style: LLTextStyle.bodyPrimary,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsToggle extends StatelessWidget {
  const _SettingsToggle({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: label,
      toggled: value,
      child: SwitchListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(label, style: LLTextStyle.bodyPrimary),
        value: value,
        activeThumbColor: LLColor.ancientGold,
        activeTrackColor: LLColor.ancientGold.withValues(alpha: 0.35),
        onChanged: onChanged,
      ),
    );
  }
}
