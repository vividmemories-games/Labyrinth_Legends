enum CellVisibility {
  hidden,
  fogged,
  visible;

  static CellVisibility fromJson(String value) {
    return CellVisibility.values.firstWhere(
      (visibility) => visibility.name == value,
      orElse: () => throw FormatException('Unknown cell visibility: $value'),
    );
  }

  String toJson() => name;
}
