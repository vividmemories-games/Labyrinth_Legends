enum DiscoveryMode {
  full,
  fog,
  relicGated;

  static DiscoveryMode fromJson(String value) {
    return DiscoveryMode.values.firstWhere(
      (mode) => mode.name == value,
      orElse: () => DiscoveryMode.full,
    );
  }

  String toJson() => name;
}
