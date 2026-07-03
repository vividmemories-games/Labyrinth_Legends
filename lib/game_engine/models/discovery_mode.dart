enum DiscoveryMode {
  full,
  fog,
  relicGated;

  static DiscoveryMode fromJson(String value) {
    return switch (value) {
      'full' => DiscoveryMode.full,
      'fog' => DiscoveryMode.fog,
      'relicGated' => DiscoveryMode.relicGated,
      _ => throw FormatException('Unknown discovery mode: $value'),
    };
  }

  String toJson() => name;
}
