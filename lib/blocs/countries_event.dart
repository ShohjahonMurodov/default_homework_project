abstract class CountriesEvent {}

class FetchCountries extends CountriesEvent {}

class FetchCountriesByContinent extends CountriesEvent {
  FetchCountriesByContinent({required this.query});

  final String query;
}
