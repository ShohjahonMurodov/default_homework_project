import 'package:homework/data/models/currency_model.dart';

abstract class CurrenciesMultiState {}

class CurrenciesInitialMultiState extends CurrenciesMultiState {}

class CurrenciesLoadingMultiState extends CurrenciesMultiState {}

class CurrenciesSuccessMultiState extends CurrenciesMultiState {
  CurrenciesSuccessMultiState({required this.currencies});

  final List<CurrencyModel> currencies;
}

class CurrenciesErrorMultiState extends CurrenciesMultiState {
  CurrenciesErrorMultiState({required this.errorText});

  final String errorText;
}
