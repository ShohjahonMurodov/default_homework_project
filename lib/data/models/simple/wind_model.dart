class WindModel {
  WindModel({required this.speed, required this.deg});

  final double speed;
  final int deg;

  factory WindModel.fromJson(Map<String, dynamic> json) {
    return WindModel(
      speed: json["speed"] as double? ?? 0,
      deg: json["deg"] as int? ?? 0,
    );
  }
}
