import 'package:homework/data/models/currency_model.dart';

class CurrencySingleState {
  CurrencySingleState(
      {required this.currencies,
      required this.myStatus,
      required this.errorText});

  List<CurrencyModel> currencies;
  MyStatus myStatus;
  String errorText;

  CurrencySingleState copyWith({
    List<CurrencyModel>? currencies,
    MyStatus? myStatus,
    String? errorText,
  }) {
    return CurrencySingleState(
      currencies: currencies ?? this.currencies,
      myStatus: myStatus ?? this.myStatus,
      errorText: errorText ?? this.errorText,
    );
  }
}

enum MyStatus {
  loading,
  error,
  ok,
}
