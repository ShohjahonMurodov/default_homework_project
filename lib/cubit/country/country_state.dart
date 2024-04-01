import 'package:homework/data/models/country_models.dart';
import 'package:homework/data/models/form_status.dart';

class CountryState {
  CountryState({
    required this.formsStatus,
    required this.countries,
    required this.statusText,
  });

  final FormsStatus formsStatus;
  final List<CountryModels> countries;
  final String statusText;

  CountryState copyWith({
    FormsStatus? formsStatus,
    List<CountryModels>? countries,
    String? statusText,
  }) {
    return CountryState(
      formsStatus: formsStatus ?? this.formsStatus,
      countries: countries ?? this.countries,
      statusText: statusText ?? this.statusText,
    );
  }
}
