import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:labyrinth_legends/app/router.dart';
import 'package:labyrinth_legends/design_system/theme/app_theme.dart';
import 'package:labyrinth_legends/core/env/app_env.dart';

class LabyrinthLegendsApp extends ConsumerWidget {
  const LabyrinthLegendsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: AppEnv.appName,
      debugShowCheckedModeBanner: AppEnv.isDev,
      theme: buildLLAppTheme(),
      routerConfig: appRouter,
    );
  }
}
