class FeelsLikeModels {
  FeelsLikeModels(
      {required this.day,
      required this.night,
      required this.eve,
      required this.morn});

  final num day;
  final num night;
  final num eve;
  final num morn;

  factory FeelsLikeModels.fromJson(Map<String, dynamic> json) {
    return FeelsLikeModels(
      day: json["day"] as num? ?? 0.0,
      night: json["night"] as num? ?? 0.0,
      eve: json["eve"] as num? ?? 0.0,
      morn: json["morn"] as num? ?? 0.0,
    );
  }
}
