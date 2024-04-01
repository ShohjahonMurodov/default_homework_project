import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework/cubit/country/country_state.dart';
import 'package:homework/data/models/form_status.dart';
import 'package:homework/data/models/network_response.dart';
import 'package:homework/data/provider/api_provider.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryCubit()
      : super(
          CountryState(
            formsStatus: FormsStatus.pure,
            countries: [],
            statusText: "",
          ),
        );

  Future<void> fetchCountries() async {
    emit(state.copyWith(formsStatus: FormsStatus.loading));

    NetworkResponse networkResponse = await ApiProvider.getCountries();

    if (networkResponse.errorText.isEmpty) {
      debugPrint("Kelfi ${networkResponse.data}");
      emit(
        state.copyWith(
            countries: networkResponse.data,
            formsStatus: FormsStatus.success),
      );
    } else {
      emit(state.copyWith(
          statusText: networkResponse.errorText,
          formsStatus: FormsStatus.error));
    }
  }
}
