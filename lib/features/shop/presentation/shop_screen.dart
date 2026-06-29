import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:labyrinth_legends/core/constants/app_colors.dart';
import 'package:labyrinth_legends/core/services/purchase_service.dart';
import 'package:labyrinth_legends/core/services/service_providers.dart';
import 'package:labyrinth_legends/core/widgets/currency_pill.dart';
import 'package:labyrinth_legends/core/widgets/ruins_button.dart';
import 'package:labyrinth_legends/data/providers.dart';

class ShopScreen extends ConsumerWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progressAsync = ref.watch(playerProgressProvider);
    final notifier = ref.read(playerProgressProvider.notifier);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Ruins Market'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Skins'),
              Tab(text: 'Themes'),
              Tab(text: 'Boosters'),
            ],
          ),
          actions: [
            progressAsync.when(
              loading: () => const SizedBox(width: 48),
              error: (_, __) => const SizedBox(width: 48),
              data: (progress) => Padding(
                padding: const EdgeInsets.only(right: 12),
                child: CurrencyPill(
                  icon: Icons.diamond_outlined,
                  amount: progress.gems,
                  compact: true,
                ),
              ),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            const _PlaceholderTab(
              message: 'Explorer skin equipped. More skins coming soon.',
            ),
            const _PlaceholderTab(
              message: 'Ancient Tech theme active. Premium themes later.',
            ),
            _BoostersTab(
              onGems: notifier.addGems,
              onHints: notifier.addHints,
              purchaseService: ref.watch(purchaseServiceProvider),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlaceholderTab extends StatelessWidget {
  const _PlaceholderTab({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(message, textAlign: TextAlign.center),
      ),
    );
  }
}

class _BoostersTab extends StatelessWidget {
  const _BoostersTab({
    required this.onGems,
    required this.onHints,
    required this.purchaseService,
  });

  final Future<void> Function(int amount) onGems;
  final Future<void> Function(int amount) onHints;
  final PurchaseService purchaseService;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _ShopCard(
          title: 'Gem Cache',
          subtitle: '50 gems (mock)',
          price: 'Soon',
          icon: Icons.diamond_outlined,
          onTap: () => onGems(50),
        ),
        _ShopCard(
          title: 'Hint Pack',
          subtitle: '3 hints (mock)',
          price: 'Soon',
          icon: Icons.lightbulb_outline,
          onTap: () => onHints(3),
        ),
        _ShopCard(
          title: 'Remove Ads',
          subtitle: 'Placeholder',
          price: 'Soon',
          icon: Icons.block,
          onTap: () => purchaseService.purchase(PurchaseProduct.removeAds),
        ),
        const SizedBox(height: 16),
        RuinsButton(
          label: 'Restore Purchases',
          variant: RuinsButtonVariant.ghost,
          expanded: true,
          onPressed: purchaseService.restorePurchases,
        ),
      ],
    );
  }
}

class _ShopCard extends StatelessWidget {
  const _ShopCard({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final String price;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.cyanDeep.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.cyanGlow.withValues(alpha: 0.3),
                  ),
                ),
                child: Icon(icon, color: AppColors.cyanGlow),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.titleLarge),
                    Text(subtitle),
                  ],
                ),
              ),
              Text(
                price,
                style: const TextStyle(
                  color: AppColors.gold,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
