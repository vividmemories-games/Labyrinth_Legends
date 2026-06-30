import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:labyrinth_legends/core/services/purchase_service.dart';
import 'package:labyrinth_legends/core/services/service_providers.dart';
import 'package:labyrinth_legends/data/providers.dart';
import 'package:labyrinth_legends/design_system/design_system.dart';

class ShopScreen extends ConsumerWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progressAsync = ref.watch(playerProgressProvider);
    final notifier = ref.read(playerProgressProvider.notifier);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: LLColor.templeBlack,
        appBar: AppBar(
          backgroundColor: LLColor.templeBlack,
          title: Text('Ruins Market', style: LLTextStyle.h2),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Skins'),
              Tab(text: 'Themes'),
              Tab(text: 'Boosters'),
            ],
          ),
          actions: [
            progressAsync.when(
              loading: () => SizedBox(width: LLSize.touchTarget),
              error: (_, __) => SizedBox(width: LLSize.touchTarget),
              data: (progress) => Padding(
                padding: EdgeInsets.only(right: LLSpacing.md - LLSpacing.xs),
                child: LLCurrencyChip(
                  type: LLCurrencyType.gems,
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
        padding: EdgeInsets.all(LLSpacing.lg),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: LLTextStyle.body,
        ),
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
      padding: EdgeInsets.all(LLSpacing.md),
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
        SizedBox(height: LLSpacing.md),
        LLButton(
          label: 'Restore Purchases',
          variant: LLButtonVariant.ghost,
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
    return Padding(
      padding: EdgeInsets.only(bottom: LLSpacing.md - LLSpacing.xs),
      child: LLCard(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              width: LLSize.touchTarget,
              height: LLSize.touchTarget,
              decoration: BoxDecoration(
                color: LLColor.portalBlue.withValues(alpha: 0.15),
                borderRadius: LLRadius.cardBorder,
                border: Border.all(
                  color: LLColor.energyCyan.withValues(alpha: 0.3),
                ),
              ),
              child: Icon(icon, color: LLColor.energyCyan),
            ),
            SizedBox(width: LLSpacing.md - LLSpacing.xs),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: LLTextStyle.h2.copyWith(fontSize: 18)),
                  Text(subtitle, style: LLTextStyle.caption),
                ],
              ),
            ),
            Text(
              price,
              style: LLTextStyle.currencyValue.copyWith(color: LLColor.ancientGold),
            ),
          ],
        ),
      ),
    );
  }
}
