import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:labyrinth_legends/data/providers.dart';
import 'package:labyrinth_legends/data/world_catalog.dart';
import 'package:labyrinth_legends/design_system/design_system.dart';

class WorldsScreen extends ConsumerWidget {
  const WorldsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final worlds = ref.watch(worldsProvider);

    return Scaffold(
      body: LLScreenBackground(
        heroImageAsset: LLAssetPaths.levelSelectBackground,
        heroAlignment: const Alignment(0, 0.2),
        veilStrength: 0.55,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: LLSpacing.sm,
                  vertical: LLSpacing.xs,
                ),
                child: Row(
                  children: [
                    LLTopBar.backButton(context,
                        onPressed: () => context.pop()),
                    Expanded(
                      child: Text(
                        'CHAPTERS',
                        textAlign: TextAlign.center,
                        style: LLTextStyle.h2.copyWith(
                          color: LLColor.ancientGoldLight,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    const SizedBox(width: LLSize.touchTarget),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(
                    LLSpacing.md,
                    LLSpacing.sm,
                    LLSpacing.md,
                    LLSpacing.lg,
                  ),
                  itemCount: worlds.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(height: LLSpacing.md),
                  itemBuilder: (context, index) {
                    final world = worlds[index];
                    return _WorldChapterCard(
                      world: world,
                      chapterNumber: index + 1,
                      onTap: world.unlocked
                          ? () => context.push('/worlds/${world.id}/levels')
                          : null,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WorldChapterCard extends StatelessWidget {
  const _WorldChapterCard({
    required this.world,
    required this.chapterNumber,
    this.onTap,
  });

  final WorldDefinition world;
  final int chapterNumber;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final accent = Color(world.themeColor);

    return Semantics(
      button: onTap != null,
      enabled: onTap != null,
      label: world.name,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: LLRadius.cardBorder,
          child: ClipRRect(
            borderRadius: LLRadius.cardBorder,
            child: Ink(
              height: 132,
              decoration: BoxDecoration(
                borderRadius: LLRadius.cardBorder,
                border: Border.all(
                  color: world.unlocked
                      ? LLColor.ancientGold.withValues(
                          alpha: LLColor.borderWeatheredGoldAlpha,
                        )
                      : LLColor.stoneEdge.withValues(alpha: 0.5),
                ),
                boxShadow:
                    world.unlocked ? LLShadow.weatheredPlate : LLShadow.soft,
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    world.backgroundAsset,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    color: world.unlocked
                        ? null
                        : Colors.black.withValues(alpha: 0.45),
                    colorBlendMode: world.unlocked ? null : BlendMode.darken,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          LLColor.templeBlack.withValues(alpha: 0.88),
                          LLColor.templeBlack.withValues(alpha: 0.55),
                          LLColor.templeBlack.withValues(alpha: 0.2),
                        ],
                        stops: const [0.0, 0.45, 1.0],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(LLSpacing.md),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'WORLD $chapterNumber',
                                style: LLTextStyle.caption.copyWith(
                                  color: accent,
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: LLSpacing.xs),
                              Text(
                                world.name.toUpperCase(),
                                style: LLTextStyle.h2.copyWith(
                                  fontSize: 18,
                                  color: LLColor.textPrimary,
                                ),
                              ),
                              const SizedBox(height: LLSpacing.xs),
                              Text(
                                world.loreBlurb,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: LLTextStyle.caption.copyWith(
                                  color: LLColor.textSecondary,
                                ),
                              ),
                              const SizedBox(height: LLSpacing.sm),
                              Text(
                                '${world.levelCount} levels',
                                style: LLTextStyle.caption.copyWith(
                                  color: LLColor.ancientGold
                                      .withValues(alpha: 0.9),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: LLSpacing.sm),
                        if (world.unlocked)
                          Icon(
                            Icons.chevron_right,
                            color: LLColor.ancientGold,
                            size: LLSize.iconLg,
                          )
                        else
                          Container(
                            padding: const EdgeInsets.all(LLSpacing.sm),
                            decoration: BoxDecoration(
                              color: LLColor.templeBlack.withValues(alpha: 0.6),
                              shape: BoxShape.circle,
                              border: Border.all(color: LLColor.stoneEdge),
                            ),
                            child: Icon(
                              Icons.lock,
                              color: LLColor.stoneEdge,
                              size: LLSize.iconMd,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
