import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:labyrinth_legends/app/app.dart';
import 'package:labyrinth_legends/core/services/service_providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer();
  await container.read(adsServiceProvider).initialize();
  await container.read(purchaseServiceProvider).initialize();
  await container.read(analyticsServiceProvider).initialize();
  await container.read(remoteConfigServiceProvider).initialize();

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const LabyrinthLegendsApp(),
    ),
  );
}
