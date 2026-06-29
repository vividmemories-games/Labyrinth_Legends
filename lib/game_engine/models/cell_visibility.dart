enum CellVisibility {
  hidden,
  fogged,
  visible;

  static CellVisibility fromJson(String value) {
    return CellVisibility.values.firstWhere(
      (visibility) => visibility.name == value,
      orElse: () => CellVisibility.visible,
    );
  }

  String toJson() => name;
}
