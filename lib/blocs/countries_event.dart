abstract class CountriesEvent {}

class FetchCountries extends CountriesEvent {}

class FetchCountriesByContinent extends CountriesEvent {
  FetchCountriesByContinent({required this.query});

  final String query;
}

class FetchCountriesBySearch extends CountriesEvent {
  FetchCountriesBySearch({required this.name});

  final String name;
}