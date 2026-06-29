import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:labyrinth_legends/core/constants/app_colors.dart';
import 'package:labyrinth_legends/data/providers.dart';

class WorldsScreen extends ConsumerWidget {
  const WorldsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final worlds = ref.watch(worldsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Worlds')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: worlds.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final world = worlds[index];
          return ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                color: Color(world.themeColor).withValues(alpha: 0.4),
              ),
            ),
            tileColor: AppColors.surfaceElevated,
            leading: Icon(
              world.unlocked ? Icons.landscape_outlined : Icons.lock,
              color: Color(world.themeColor),
            ),
            title: Text(world.name),
            subtitle: Text(world.loreBlurb),
            trailing: world.unlocked
                ? const Icon(Icons.chevron_right)
                : null,
            enabled: world.unlocked,
            onTap: world.unlocked
                ? () => context.push('/worlds/${world.id}/levels')
                : null,
          );
        },
      ),
    );
  }
}
