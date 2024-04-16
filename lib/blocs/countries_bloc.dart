import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework/blocs/countries_event.dart';
import 'package:homework/blocs/countries_state.dart';
import 'package:homework/data/api/api_client.dart';
import 'package:homework/data/models/country_model.dart';
import 'package:homework/data/models/network_response.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  CountriesBloc({required this.apiClient}) : super(CountriesInitialState()) {
    on<FetchCountries>((FetchCountries event, emit) async {
      emit(CountriesLoadingState());

      NetworkResponse networkResponse = await apiClient.getCountries();

      if (networkResponse.errorText.isEmpty) {
        emit(CountriesSuccessState(
            countries: networkResponse.data as List<CountryModel>));
      } else {
        emit(CountriesErrorState(errorText: networkResponse.errorText));
      }
    });

    on<FetchCountriesByContinent>(
        (FetchCountriesByContinent event, emit) async {
      emit(CountriesLoadingState());

      NetworkResponse networkResponse =
          await apiClient.getCountriesByContinents(event.query);

      if (networkResponse.errorText.isEmpty) {
        emit(CountriesSuccessState(
            countries: networkResponse.data as List<CountryModel>));
      } else {
        emit(CountriesErrorState(errorText: networkResponse.errorText));
      }
    });

    on<FetchCountriesBySearch>(
      (FetchCountriesBySearch event, emit) async {
        emit(CountriesLoadingState());

        NetworkResponse networkResponse =
            await apiClient.getCountriesBySearch(event.name);

        if (networkResponse.errorText.isEmpty) {
          emit(CountriesSuccessState(
              countries: networkResponse.data as List<CountryModel>));
        } else {
          emit(CountriesErrorState(errorText: networkResponse.errorText));
        }
      },
    );
  }

  final ApiClient apiClient;
}
