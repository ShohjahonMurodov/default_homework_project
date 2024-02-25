class TempModel {
  TempModel(
      {required this.day,
      required this.min,
      required this.max,
      required this.night,
      required this.eve,
      required this.morn});

  final num day;
  final num min;
  final num max;
  final num night;
  final num eve;
  final num morn;

  factory TempModel.fromJson(Map<String, dynamic> json) {
    return TempModel(
      day: json["day"] as num? ?? 0.0,
      min: json["min"] as num? ?? 0.0,
      max: json["max"] as num? ?? 0.0,
      night: json["night"] as num? ?? 0.0,
      eve: json["eve"] as num? ?? 0.0,
      morn: json["morn"] as num? ?? 0.0,
    );
  }
}
