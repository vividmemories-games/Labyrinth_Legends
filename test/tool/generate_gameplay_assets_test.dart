import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:labyrinth_legends/design_system/components/gameplay/painting/png_canvas_export.dart';

/// Manual asset generation — not run in CI.
///
/// ```bash
/// GENERATE_GAMEPLAY_ASSETS=1 fvm flutter test test/tool/generate_gameplay_assets_test.dart
/// ```
void main() {
  final shouldGenerate = Platform.environment['GENERATE_GAMEPLAY_ASSETS'] == '1';

  test(
    'generate procedural gameplay PNG assets',
    () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      final repoRoot = Directory.current.path;
      await generateAllGameplayAssets(repoRoot: repoRoot);
    },
    skip: shouldGenerate ? false : 'Set GENERATE_GAMEPLAY_ASSETS=1 to regenerate PNGs',
  );
}
