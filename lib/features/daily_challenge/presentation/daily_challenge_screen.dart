import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:labyrinth_legends/data/daily_level_builder.dart';
import 'package:labyrinth_legends/design_system/design_system.dart';

class DailyChallengeScreen extends ConsumerWidget {
  const DailyChallengeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final today = DateTime.now();
    final seed = dailySeedForDate(today);
    final levelId = dailyLevelIdForDate(today);
    final level = buildDailyLevel(seed);

    return Scaffold(
      backgroundColor: LLColor.templeBlack,
      appBar: AppBar(
        backgroundColor: LLColor.templeBlack,
        title: Text(
          'Daily Challenge',
          style: LLTextStyle.h2.copyWith(color: LLColor.ancientGold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(LLSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: LLRadius.cardBorder,
                gradient: LinearGradient(
                  colors: [
                    LLColor.crystalPurple.withValues(alpha: 0.25),
                    LLColor.stoneDark,
                  ],
                ),
                border: Border.all(
                  color: LLColor.ancientGold.withValues(alpha: LLColor.borderGoldAlpha),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(LLSpacing.lg - LLSpacing.xs),
                child: Column(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      size: LLSize.iconLg + LLSpacing.md,
                      color: LLColor.ancientGold,
                    ),
                    SizedBox(height: LLSpacing.md - LLSpacing.xs),
                    Text(
                      _formatDate(today),
                      style: LLTextStyle.h2.copyWith(color: LLColor.ancientGold),
                    ),
                    SizedBox(height: LLSpacing.sm),
                    Text(
                      '${level.name} · ${level.grid.width}×${level.grid.height}',
                      textAlign: TextAlign.center,
                      style: LLTextStyle.body,
                    ),
                    SizedBox(height: LLSpacing.sm),
                    Text(
                      'Seed $seed — same maze for every player today',
                      textAlign: TextAlign.center,
                      style: LLTextStyle.caption
                          .copyWith(color: LLColor.textSecondary),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: LLSpacing.lg),
            Text(
              'A fresh procedural labyrinth each day. Complete it for bonus rewards.',
              textAlign: TextAlign.center,
              style: LLTextStyle.body.copyWith(color: LLColor.textPrimary),
            ),
            const Spacer(),
            LLButton(
              label: 'Begin Challenge',
              icon: Icons.play_arrow,
              expanded: true,
              onPressed: () => context.push('/play/$levelId'),
            ),
            SizedBox(height: LLSpacing.md),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}
