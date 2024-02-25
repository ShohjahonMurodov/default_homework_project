class InWeather {
  InWeather(
      {required this.id,
      required this.main,
      required this.description,
      required this.icon});

  final num id;
  final String main;
  final String description;
  final String icon;

  factory InWeather.fromJson(Map<String, dynamic> json) {
    return InWeather(
      id: json["id"] as num? ?? 0,
      main: json["main"] as String? ?? "",
      description: json["description"] as String? ?? "",
      icon: json["icon"] as String? ?? "",
    );
  }
}
