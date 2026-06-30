import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:labyrinth_legends/data/providers.dart';
import 'package:labyrinth_legends/design_system/design_system.dart';

class WorldsScreen extends ConsumerWidget {
  const WorldsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final worlds = ref.watch(worldsProvider);

    return Scaffold(
      backgroundColor: LLColor.templeBlack,
      appBar: AppBar(
        backgroundColor: LLColor.templeBlack,
        title: Text('Worlds', style: LLTextStyle.h2),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(LLSpacing.md),
        itemCount: worlds.length,
        separatorBuilder: (_, __) => SizedBox(height: LLSpacing.md - LLSpacing.xs),
        itemBuilder: (context, index) {
          final world = worlds[index];
          return LLCard(
            onTap: world.unlocked
                ? () => context.push('/worlds/${world.id}/levels')
                : null,
            child: Row(
              children: [
                Icon(
                  world.unlocked ? Icons.landscape_outlined : Icons.lock,
                  color: Color(world.themeColor),
                ),
                SizedBox(width: LLSpacing.md - LLSpacing.xs),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(world.name, style: LLTextStyle.h2.copyWith(fontSize: 18)),
                      SizedBox(height: LLSpacing.xs),
                      Text(
                        world.loreBlurb,
                        style: LLTextStyle.caption,
                      ),
                    ],
                  ),
                ),
                if (world.unlocked)
                  Icon(Icons.chevron_right, color: LLColor.textSecondary),
              ],
            ),
          );
        },
      ),
    );
  }
}
