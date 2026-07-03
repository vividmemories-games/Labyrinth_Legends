/// Optional tutorial metadata per [Level_Format.md] §15 — informational only.
class TutorialMetadata {
  const TutorialMetadata({
    required this.band,
    required this.sequence,
    required this.teaches,
    this.hintId,
  });

  final String band;
  final int sequence;
  final List<String> teaches;
  final String? hintId;

  factory TutorialMetadata.fromJson(Map<String, dynamic> json) {
    return TutorialMetadata(
      band: json['band'] as String,
      sequence: json['sequence'] as int,
      teaches: (json['teaches'] as List<dynamic>).cast<String>(),
      hintId: json['hintId'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'band': band,
        'sequence': sequence,
        'teaches': teaches,
        if (hintId != null) 'hintId': hintId,
      };
}
