class CountryModel {
  CountryModel({
    required this.emoji,
    required this.name,
    required this.capital,
    required this.code,
    required this.continentName,
  });

  final String code;
  final String name;
  final String emoji;
  final String capital;
  final String continentName;

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      emoji: json["emoji"] as String? ?? "",
      name: json["name"] as String? ?? "",
      capital: json["capital"] as String? ?? "",
      code: json["code"] as String? ?? "",
      continentName: json["continent"]["name"] as String? ?? "",
    );
  }
}
