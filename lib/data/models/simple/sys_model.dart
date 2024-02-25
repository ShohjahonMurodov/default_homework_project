class SysModel {
  SysModel(
      {required this.type,
      required this.id,
      required this.country,
      required this.sunrise,
      required this.sunset});

  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

  factory SysModel.fromJson(Map<String, dynamic> json) {
    return SysModel(
      type: json["type"] as int? ?? 0,
      id: json["id"] as int? ?? 0,
      country: json["country"] as String? ?? "",
      sunrise: json["sunrise"] as int? ?? 0,
      sunset: json["sunset"] as int? ?? 0,
    );
  }
}
