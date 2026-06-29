import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:labyrinth_legends/core/constants/app_colors.dart';
import 'package:labyrinth_legends/core/widgets/ruins_button.dart';
import 'package:labyrinth_legends/data/daily_level_builder.dart';

class DailyChallengeScreen extends ConsumerWidget {
  const DailyChallengeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final today = DateTime.now();
    final seed = dailySeedForDate(today);
    final levelId = dailyLevelIdForDate(today);
    final level = buildDailyLevel(seed);

    return Scaffold(
      appBar: AppBar(title: const Text('Daily Challenge')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [
                    AppColors.mysticPurple.withValues(alpha: 0.25),
                    AppColors.surface,
                  ],
                ),
                border: Border.all(
                  color: AppColors.gold.withValues(alpha: 0.35),
                ),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.calendar_month,
                    size: 48,
                    color: AppColors.gold,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _formatDate(today),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.gold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${level.name} · ${level.grid.width}×${level.grid.height}',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Seed $seed — same maze for every player today',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'A fresh procedural labyrinth each day. Complete it for bonus rewards.',
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            RuinsButton(
              label: 'Begin Challenge',
              icon: Icons.play_arrow,
              expanded: true,
              onPressed: () => context.push('/play/$levelId'),
            ),
            const SizedBox(height: 16),
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
