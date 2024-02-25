class CoordModel {
  final double lon;
  final double lat;

  CoordModel({
    required this.lat,
    required this.lon,
  });

  factory CoordModel.fromJson(Map<String, Object?> json) {
    return CoordModel(
      lat: json["lat"] as double? ?? 0.0,
      lon: json["lon"] as double? ?? 0.0,
    );
  }
}
