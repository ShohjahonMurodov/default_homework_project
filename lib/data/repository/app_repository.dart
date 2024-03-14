import 'package:homework/data/models/country_models.dart';
import 'package:homework/data/models/people_models.dart';
import 'package:homework/data/network/api_provider.dart';

class AppRepository {
  AppRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<List<PeopleModels>> getPeople() => apiProvider.getAllPeople();

  Future<List<CountryModels>> getCountry() => apiProvider.getAllCountry();
}
