import 'package:homework/data/models/country_model.dart';

abstract class CountriesState {}

class CountriesInitialState extends CountriesState {}

class CountriesLoadingState extends CountriesState {}

class CountriesErrorState extends CountriesState {
  CountriesErrorState({required this.errorText});

  final String errorText;
}

class CountriesSuccessState extends CountriesState {
  CountriesSuccessState({required this.countries});

  final List<CountryModel> countries;
}
