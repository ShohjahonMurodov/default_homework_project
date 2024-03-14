class CountryModels {
  CountryModels(
      {required this.population,
      required this.flag,
      required this.region,
      required this.capital,
      required this.name});

  final int population;
  final String flag;
  final String region;
  final String capital;
  final String name;

  factory CountryModels.fromJson(Map<String, dynamic> json) {
    return CountryModels(
      population: json["population"] as int? ?? 0,
      flag: json["flags"]["png"] as String? ?? "",
      region: json["region"] as String? ?? "",
      capital: json["capital"][0] as String? ?? "",
      name: json["name"]["common"] as String? ?? "",
    );
  }
}
