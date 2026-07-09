class WorldDefinition {
  const WorldDefinition({
    required this.id,
    required this.name,
    required this.loreBlurb,
    required this.levelCount,
    required this.backgroundAsset,
    this.unlocked = true,
    this.themeColor = 0xFF00D9FF,
  });

  final String id;
  final String name;
  final String loreBlurb;
  final int levelCount;
  final String backgroundAsset;
  final bool unlocked;
  final int themeColor;
}

const kWorlds = [
  WorldDefinition(
    id: 'world_1',
    name: 'Crumbling Temple',
    loreBlurb: 'First ruins uncovered by modern explorers.',
    levelCount: 20,
    backgroundAsset:
        'assets/images/backgrounds/world_01_crumbling_temple_card.png',
  ),
  WorldDefinition(
    id: 'world_2',
    name: 'Forgotten Ruins',
    loreBlurb: 'Deeper chambers hide early Architect mechanisms.',
    levelCount: 20,
    backgroundAsset:
        'assets/images/backgrounds/world_02_forgotten_ruins_card.png',
    unlocked: false,
    themeColor: 0xFF8A5CFF,
  ),
  WorldDefinition(
    id: 'world_3',
    name: 'Lost Mechanisms',
    loreBlurb: 'Rotating bridges and pressure systems awaken.',
    levelCount: 20,
    backgroundAsset:
        'assets/images/backgrounds/world_03_lost_mechanisms_card.png',
    unlocked: false,
    themeColor: 0xFF00AEEF,
  ),
];
