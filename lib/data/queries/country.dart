const String countriesQuery = '''query {
  countries {
    code
    name
    emoji
    capital
    phone
    continent{
      name
    }
  }
}''';

String getCountryQueryByContinent(String query) {
  return '''query CountriesByContinent {
  countries(filter: { continent: { in: ["$query"] } }) {
    code
    name
    capital
    emoji
    phone
    continent{
      name
    }
  }
}''';
}

String getCountryQueryBySearch(String query) {
  return '''query CountriesByContinent {
  countries(filter: { name: { in: ["$query"] } }) {
    code
    name
    capital
    emoji
    phone
    continent{
      name
    }
  }
}''';
}