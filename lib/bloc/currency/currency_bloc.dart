import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework/bloc/currency/currency_event.dart';
import 'package:homework/bloc/currency/currency_state.dart';
import 'package:homework/data/network/api_provider.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrencyBloc() : super(CurrencyInitialState()) {
    on<GetCurrencyEvent>(getCurrencies);
  }

  Future<void> getCurrencies(GetCurrencyEvent event, emit) async {
    emit(CurrencyLoadingState());
    var response = await ApiProvider().getAllCurrency();
    if (response.errorText.isNotEmpty) {
      emit(CurrencyErrorState(errorText: response.errorText));
    } else {
      emit(CurrencySuccessState(currencies: response.data));
    }
  }
}
