import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework/data/models/network_response.dart';
import 'package:homework/data/network/api_provider.dart';

import 'currency_single_state.dart';

class CurrencySingleCubit extends Cubit<CurrencySingleState> {
  CurrencySingleCubit()
      : super(CurrencySingleState(
            currencies: [], myStatus: MyStatus.loading, errorText: ''));

  Future<void> callCountry() async {
    NetworkResponse networkResponse = await ApiProvider().getAllCurrency();
    if (networkResponse.errorText.isEmpty) {
      emit(state.copyWith(
          currencies: networkResponse.data, myStatus: MyStatus.ok));
    } else {
      emit(state.copyWith(
          myStatus: MyStatus.error, errorText: networkResponse.errorText));
    }
  }
}
