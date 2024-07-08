import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework/blocs/currency_event.dart';
import 'package:homework/blocs/currency_state.dart';
import 'package:homework/data/network/network_response.dart';
import 'package:homework/data/repository/app_repository.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrencyBloc({required this.appRepository}) : super(CurrencyInitialState()) {
    on<CurrencyGetEvent>(getCurrencies);
  }

  final AppRepository appRepository;

  Future<void> getCurrencies(CurrencyGetEvent event, emit) async {
    emit(CurrencyLoadingState());

    NetworkResponse networkResponse = await appRepository.getCurrencies();

    if (networkResponse.errorText.isEmpty) {
      emit(CurrencySuccessState(currencies: networkResponse.data));
    } else {
      emit(CurrencyErrorState(errorText: networkResponse.errorText));
    }
  }
}
