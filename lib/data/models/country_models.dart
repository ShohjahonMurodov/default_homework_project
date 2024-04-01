class CountryModels {
  CountryModels(
      {required this.code,
      required this.name,
      required this.phone,
      required this.capital,
      required this.currency,
      required this.emoji});

  final String code;
  final String name;
  final String phone;
  final String capital;
  final String currency;
  final String emoji;

  factory CountryModels.fromJson(Map<String, dynamic> json) {
    return CountryModels(
      code: json["code"] as String? ?? "",
      name: json["name"] as String? ?? "",
      phone: json["phone"] as String? ?? "",
      capital: json["capital"] as String? ?? "",
      currency: json["currency"] as String? ?? "",
      emoji: json["emoji"] as String? ?? "",
    );
  }
}
