import 'package:flutter/widgets.dart';
import 'package:homework/data/models/country_models.dart';
import 'package:homework/data/repository/app_repository.dart';

class CountryViewModel extends ChangeNotifier {
  CountryViewModel({required this.appRepository});

  final AppRepository appRepository;

  bool isLoading = false;
  List<CountryModels> allCountry = [];

  fetchAllCountry() async {
    isLoading = true;
    var country = await appRepository.getCountry();
    isLoading = false;
    notifyListeners();
    if (country.isEmpty) {
    } else {
      allCountry = country;
      notifyListeners();
    }
  }
}
