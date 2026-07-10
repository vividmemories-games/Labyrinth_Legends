import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:labyrinth_legends/core/constants/game_constants.dart';
import 'package:labyrinth_legends/core/services/completion_sync_service.dart';
import 'package:labyrinth_legends/data/daily_level_builder.dart';
import 'package:labyrinth_legends/data/local/local_progress_store.dart';
import 'package:labyrinth_legends/data/models/level_completion_snapshot.dart';
import 'package:labyrinth_legends/data/models/player_progress.dart';
import 'package:labyrinth_legends/data/models/reward_result.dart';
import 'package:labyrinth_legends/data/repositories/level_repository.dart';
import 'package:labyrinth_legends/data/repositories/local_progress_repository.dart';
import 'package:labyrinth_legends/data/repositories/progress_repository.dart';
import 'package:labyrinth_legends/data/world_catalog.dart';
import 'package:labyrinth_legends/game_engine/models/level_definition.dart';

final localProgressStoreProvider = FutureProvider<LocalProgressStore>((ref) {
  return LocalProgressStore.create();
});

final progressRepositoryProvider = Provider<ProgressRepository>((ref) {
  final store = ref.watch(localProgressStoreProvider).value;
  if (store == null) {
    throw StateError('Progress store not ready');
  }
  return LocalProgressRepository(store);
});

final levelRepositoryProvider = Provider<LevelRepository>((ref) {
  return LevelRepository();
});

final worldsProvider = Provider<List<WorldDefinition>>((ref) => kWorlds);

final worldLevelsProvider =
    FutureProvider.family<List<LevelDefinition>, String>((ref, worldId) {
  return ref.watch(levelRepositoryProvider).loadWorld(worldId);
});

final levelByIdProvider =
    FutureProvider.family<LevelDefinition?, String>((ref, levelId) async {
  if (levelId.startsWith('daily_')) {
    final seed = int.tryParse(levelId.replaceFirst('daily_', ''));
    if (seed != null) return buildDailyLevel(seed);
  }
  final levels = await ref.watch(worldLevelsProvider('world_1').future);
  for (final level in levels) {
    if (level.id == levelId) return level;
  }
  return null;
});

final levelStarsProvider =
    FutureProvider.family<int, String>((ref, levelId) async {
  final repo = ref.watch(progressRepositoryProvider);
  final progress = await repo.getLevelProgress(levelId);
  return progress?.bestStars ?? 0;
});

class PlayerProgressNotifier extends AsyncNotifier<PlayerProgress> {
  @override
  Future<PlayerProgress> build() async {
    await ref.watch(localProgressStoreProvider.future);
    return ref.read(progressRepositoryProvider).getPlayerProgress();
  }

  ProgressRepository get _repo => ref.read(progressRepositoryProvider);

  Future<void> _persist(PlayerProgress progress) async {
    state = AsyncData(progress);
    await _repo.savePlayerProgress(progress);
  }

  Future<void> reload() async {
    state = const AsyncLoading();
    state = AsyncData(await _repo.getPlayerProgress());
  }

  Future<bool> spendCoins(int amount) async {
    final current = state.value ?? const PlayerProgress();
    if (current.coins < amount) return false;
    await _persist(current.copyWith(coins: current.coins - amount));
    return true;
  }

  Future<bool> spendGems(int amount) async {
    final current = state.value ?? const PlayerProgress();
    if (current.gems < amount) return false;
    await _persist(current.copyWith(gems: current.gems - amount));
    return true;
  }

  Future<bool> useHint() async {
    final current = state.value ?? const PlayerProgress();
    if (current.hintsRemaining > 0) {
      await _persist(
        current.copyWith(hintsRemaining: current.hintsRemaining - 1),
      );
      return true;
    }
    return spendCoins(GameConstants.hintCostCoins);
  }

  bool isLevelUnlocked(String levelId, List<LevelDefinition> levels) {
    final index = levels.indexWhere((l) => l.id == levelId);
    if (index <= 0) return true;
    final prevId = levels[index - 1].id;
    final completed = state.value?.completedLevelIds ?? {};
    return completed.contains(prevId);
  }

  Future<void> recordCompletion({
    required String levelId,
    required RewardResult reward,
  }) async {
    await _repo.recordLevelCompletion(levelId: levelId, reward: reward);
    await reload();
    ref.invalidate(levelStarsProvider(levelId));
  }

  Future<void> setSoundEnabled(bool value) async {
    final current = state.value ?? const PlayerProgress();
    await _persist(current.copyWith(soundEnabled: value));
  }

  Future<void> setMusicEnabled(bool value) async {
    final current = state.value ?? const PlayerProgress();
    await _persist(current.copyWith(musicEnabled: value));
  }

  Future<void> setHapticsEnabled(bool value) async {
    final current = state.value ?? const PlayerProgress();
    await _persist(current.copyWith(hapticsEnabled: value));
  }

  Future<void> addGems(int amount) async {
    final current = state.value ?? const PlayerProgress();
    await _persist(current.copyWith(gems: current.gems + amount));
  }

  Future<void> addHints(int amount) async {
    final current = state.value ?? const PlayerProgress();
    await _persist(
      current.copyWith(hintsRemaining: current.hintsRemaining + amount),
    );
  }
}

final playerProgressProvider =
    AsyncNotifierProvider<PlayerProgressNotifier, PlayerProgress>(
  PlayerProgressNotifier.new,
);

final completionSyncServiceProvider = Provider<CompletionSyncService>((ref) {
  return LocalCompletionSyncService(
    recordCompletion: ({required String levelId, required RewardResult reward}) =>
        ref
            .read(playerProgressProvider.notifier)
            .recordCompletion(levelId: levelId, reward: reward),
  );
});

/// Set when gameplay win flow finishes sync; read on Victory screen then clear.
final pendingLevelCompletionProvider =
    StateProvider<LevelCompletionSnapshot?>((ref) => null);
