import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:labyrinth_legends/app/routes.dart';
import 'package:labyrinth_legends/design_system/components/ll_loading_indicator.dart';
import 'package:labyrinth_legends/design_system/components/ll_screen_background.dart';
import 'package:labyrinth_legends/design_system/tokens/tokens.dart';

/// Branded splash — transitions into the home shell.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future<void>.delayed(const Duration(milliseconds: 1200), _enterHome);
  }

  void _enterHome() {
    if (!mounted) return;
    context.go(AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    return LLScreenBackground(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Labyrinth Legends',
              style: LLTextStyle.display,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: LLSpacing.lg),
            const LLLoadingIndicator(message: 'Awakening the temple…'),
          ],
        ),
      ),
    );
  }
}
