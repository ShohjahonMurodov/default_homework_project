import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework/cubit/multi_state/currencies_multi_state.dart';
import 'package:homework/data/models/network_response.dart';
import 'package:homework/data/network/api_provider.dart';

class CurrenciesMultiStateCubit extends Cubit<CurrenciesMultiState> {
  CurrenciesMultiStateCubit() : super(CurrenciesInitialMultiState()) {}

  Future<void> getAllCurrencies() async {
    emit(CurrenciesLoadingMultiState());
    NetworkResponse networkResponse = await ApiProvider().getAllCurrency();
    if (networkResponse.errorText.isEmpty) {
      emit(CurrenciesSuccessMultiState(currencies: networkResponse.data));
    } else {
      emit(CurrenciesErrorMultiState(errorText: networkResponse.errorText));
    }
  }
}
