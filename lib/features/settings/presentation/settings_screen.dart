import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:labyrinth_legends/core/env/app_env.dart';
import 'package:labyrinth_legends/data/providers.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progressAsync = ref.watch(playerProgressProvider);
    final notifier = ref.read(playerProgressProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: progressAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('$e')),
        data: (progress) => ListView(
          children: [
            SwitchListTile(
              title: const Text('Sound Effects'),
              value: progress.soundEnabled,
              onChanged: notifier.setSoundEnabled,
            ),
            SwitchListTile(
              title: const Text('Music'),
              value: progress.musicEnabled,
              onChanged: notifier.setMusicEnabled,
            ),
            SwitchListTile(
              title: const Text('Haptics'),
              value: progress.hapticsEnabled,
              onChanged: notifier.setHapticsEnabled,
            ),
            const Divider(),
            ListTile(
              title: const Text('Version'),
              subtitle: Text('0.1.0 (${AppEnv.flavor.name})'),
            ),
            ListTile(
              title: const Text('Environment'),
              subtitle: Text(AppEnv.isDev ? 'Development' : 'Production'),
            ),
          ],
        ),
      ),
    );
  }
}
