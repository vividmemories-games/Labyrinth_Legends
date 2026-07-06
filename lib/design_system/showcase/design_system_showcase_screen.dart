import 'package:flutter/material.dart';
import 'package:labyrinth_legends/design_system/assets/ll_asset_paths.dart';
import 'package:labyrinth_legends/design_system/components/components.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

/// Developer showcase — canonical visual reference for all LL components.
class DesignSystemShowcaseScreen extends StatelessWidget {
  const DesignSystemShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LLTopBar(
        title: 'Design System',
        leading: LLTopBar.backButton(context),
      ),
      backgroundColor: LLColor.templeBlack,
      body: ListView(
        padding: EdgeInsets.all(LLSpacing.screenPadding),
        children: [
          Text('LLDL Showcase', style: LLTextStyle.display),
          SizedBox(height: LLSpacing.xs),
          Text(
            'Ancient Tech + Mystical Ruins — all reusable components',
            style: LLTextStyle.body,
          ),
          SizedBox(height: LLSpacing.xl),
          _section('Typography', _typographySection()),
          _section('Color Palette', _colorSection()),
          _section('Spacing', _spacingSection()),
          _section('Buttons', _buttonsSection(context)),
          _section('Icon & Floating Buttons', _iconButtonsSection()),
          _section('Panels & Cards', _panelsSection()),
          _section('Currency', _currencySection()),
          _section('Badges', _badgesSection()),
          _section('Progress', _progressSection()),
          _section('Reward Cards', _rewardSection()),
          _section('Navigation', _navigationSection()),
          _section('Feedback', _feedbackSection(context)),
          _section('Screen Background', _backgroundSection()),
          SizedBox(height: LLSpacing.xxl),
        ],
      ),
    );
  }

  Widget _section(String title, Widget child) {
    return Padding(
      padding: EdgeInsets.only(bottom: LLSpacing.xl),
      child: LLSection(title: title, child: child),
    );
  }

  Widget _typographySection() {
    return LLPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Display', style: LLTextStyle.display),
          SizedBox(height: LLSpacing.sm),
          Text('H1 — Labyrinth Legends', style: LLTextStyle.h1),
          SizedBox(height: LLSpacing.sm),
          Text('H2 — Crumbling Temple', style: LLTextStyle.h2),
          SizedBox(height: LLSpacing.sm),
          Text('Body — Draw your fate through ancient ruins.',
              style: LLTextStyle.body),
          SizedBox(height: LLSpacing.sm),
          Text('Caption — Seeded daily challenge', style: LLTextStyle.caption),
          SizedBox(height: LLSpacing.sm),
          Text('Button Label',
              style: LLTextStyle.button.copyWith(color: LLColor.ancientGold)),
        ],
      ),
    );
  }

  Widget _colorSection() {
    return Wrap(
      spacing: LLSpacing.sm,
      runSpacing: LLSpacing.sm,
      children: [
        for (final (label, color) in LLColor.palette)
          LLCard(
            padding: EdgeInsets.all(LLSpacing.sm),
            child: Column(
              children: [
                Container(
                  width: LLSpacing.xxl,
                  height: LLSpacing.xxl,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: LLRadius.smBorder,
                    border: Border.all(color: LLColor.stoneEdge),
                    boxShadow: LLShadow.soft,
                  ),
                ),
                SizedBox(height: LLSpacing.xs),
                Text(label, style: LLTextStyle.caption),
              ],
            ),
          ),
      ],
    );
  }

  Widget _spacingSection() {
    const names = ['xs', 'sm', 'md', 'lg', 'xl', 'xxl'];
    const values = [
      LLSpacing.xs,
      LLSpacing.sm,
      LLSpacing.md,
      LLSpacing.lg,
      LLSpacing.xl,
      LLSpacing.xxl,
    ];

    return LLPanel(
      child: Column(
        children: [
          for (var i = 0; i < names.length; i++)
            Padding(
              padding: EdgeInsets.only(bottom: LLSpacing.sm),
              child: Row(
                children: [
                  SizedBox(
                    width: LLSpacing.xxl,
                    child: Text(names[i], style: LLTextStyle.caption),
                  ),
                  Container(
                    width: values[i],
                    height: LLSpacing.sm,
                    decoration: BoxDecoration(
                      color: LLColor.energyCyan,
                      borderRadius: LLRadius.smBorder,
                    ),
                  ),
                  SizedBox(width: LLSpacing.sm),
                  Text('${values[i].toInt()}', style: LLTextStyle.caption),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buttonsSection(BuildContext context) {
    return Column(
      children: [
        LLButton(
            label: 'Primary — Play',
            icon: Icons.play_arrow,
            expanded: true,
            onPressed: () {}),
        SizedBox(height: LLSpacing.sm),
        LLButton(
          label: 'Secondary — Daily',
          icon: Icons.calendar_today_outlined,
          variant: LLButtonVariant.secondary,
          expanded: true,
          onPressed: () {},
        ),
        SizedBox(height: LLSpacing.sm),
        LLButton(
            label: 'Ghost',
            variant: LLButtonVariant.ghost,
            expanded: true,
            onPressed: () {}),
        SizedBox(height: LLSpacing.sm),
        LLButton(
            label: 'Danger',
            variant: LLButtonVariant.danger,
            expanded: true,
            onPressed: () {}),
      ],
    );
  }

  Widget _iconButtonsSection() {
    return Row(
      children: [
        LLIconButton(icon: Icons.settings, onPressed: () {}),
        SizedBox(width: LLSpacing.sm),
        LLIconButton(
            icon: Icons.share,
            variant: LLIconButtonVariant.ghost,
            onPressed: () {}),
        SizedBox(width: LLSpacing.sm),
        LLIconButton(
            icon: Icons.delete_outline,
            variant: LLIconButtonVariant.danger,
            onPressed: () {}),
        const Spacer(),
        LLFloatingButton(icon: Icons.add, onPressed: () {}),
      ],
    );
  }

  Widget _panelsSection() {
    return Column(
      children: [
        const LLPanel(
          child: Text(
            'LLPanel — stone slab container',
            style: TextStyle(color: LLColor.textPrimary),
          ),
        ),
        SizedBox(height: LLSpacing.sm),
        LLCard(
          onTap: () {},
          child: Text('LLCard — tappable card', style: LLTextStyle.bodyPrimary),
        ),
      ],
    );
  }

  Widget _currencySection() {
    return Wrap(
      spacing: LLSpacing.sm,
      runSpacing: LLSpacing.sm,
      children: const [
        LLCurrencyChip(type: LLCurrencyType.coins, amount: 240),
        LLCurrencyChip(type: LLCurrencyType.gems, amount: 50),
        LLCurrencyChip(type: LLCurrencyType.stars, amount: 12),
      ],
    );
  }

  Widget _badgesSection() {
    return Wrap(
      spacing: LLSpacing.sm,
      runSpacing: LLSpacing.sm,
      children: const [
        LLBadge(
            label: 'Locked', variant: LLBadgeVariant.locked, icon: Icons.lock),
        LLBadge(
            label: 'Done',
            variant: LLBadgeVariant.completed,
            icon: Icons.check),
        LLBadge(label: 'New', variant: LLBadgeVariant.newItem),
        LLBadge(
            label: 'Perfect',
            variant: LLBadgeVariant.perfect,
            icon: Icons.star),
      ],
    );
  }

  Widget _progressSection() {
    return const LLPanel(
      child: LLProgressBar(
          value: 0.65, label: 'World Progress', showPercent: true),
    );
  }

  Widget _rewardSection() {
    return Column(
      children: [
        const LLRewardCard(
          title: 'Coin Cache',
          subtitle: 'Victory bonus',
          amount: '+120',
          icon: Icons.monetization_on_outlined,
        ),
        SizedBox(height: LLSpacing.sm),
        const LLRewardCard(
          title: 'Gem Shard',
          subtitle: 'Perfect clear',
          amount: '+3',
          icon: Icons.diamond_outlined,
          accentColor: LLColor.crystalPurple,
        ),
      ],
    );
  }

  Widget _navigationSection() {
    return LLBottomBar(
      items: [
        LLBottomBarItem(
            icon: Icons.home, label: 'Home', selected: true, onTap: () {}),
        LLBottomBarItem(icon: Icons.map, label: 'Worlds', onTap: () {}),
        LLBottomBarItem(icon: Icons.storefront, label: 'Shop', onTap: () {}),
        LLBottomBarItem(icon: Icons.settings, label: 'Settings', onTap: () {}),
      ],
    );
  }

  Widget _feedbackSection(BuildContext context) {
    return Column(
      children: [
        const LLLoadingIndicator(message: 'Channeling portal energy…'),
        SizedBox(height: LLSpacing.lg),
        LLButton(
          label: 'Show Toast',
          variant: LLButtonVariant.secondary,
          expanded: true,
          onPressed: () =>
              LLToast.show(context, message: 'Temple systems online.'),
        ),
        SizedBox(height: LLSpacing.sm),
        LLButton(
          label: 'Show Dialog',
          variant: LLButtonVariant.ghost,
          expanded: true,
          onPressed: () => LLDialog.show(
            context: context,
            title: 'Ancient Seal',
            content:
                Text('Proceed through the portal?', style: LLTextStyle.body),
          ),
        ),
      ],
    );
  }

  Widget _backgroundSection() {
    return SizedBox(
      height: LLSpacing.xxl * 4,
      child: ClipRRect(
        borderRadius: LLRadius.panelBorder,
        child: LLScreenBackground(
          heroImageAsset: LLAssetPaths.homeScreenBackground,
          child: Center(
            child: Text(
              'LLScreenBackground',
              style: TextStyle(color: LLColor.ancientGoldLight),
            ),
          ),
        ),
      ),
    );
  }
}
