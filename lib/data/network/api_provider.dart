import 'dart:convert';
import 'package:homework/data/models/country_models.dart';
import 'package:homework/data/models/people_models.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<List<PeopleModels>> getAllPeople() async {
    try {
      http.Response response = await http.get(
        Uri.parse("https://fifth-exam.free.mockoapp.net/users"),
      );

      if (response.statusCode == 200) {
        return (jsonDecode(response.body) as List?)
                ?.map((e) => PeopleModels.fromJson(e))
                .toList() ??
            [];
      }
    } catch (error) {
      return [];
    }
    return [];
  }

  Future<List<CountryModels>> getAllCountry() async {
    try {
      http.Response response = await http.get(
        Uri.parse("https://restcountries.com/v3.1/all"),
      );

      if (response.statusCode == 200) {
        return (jsonDecode(response.body) as List?)
                ?.map((e) => CountryModels.fromJson(e))
                .toList() ??
            [];
      }
    } catch (error) {
      rethrow;
    }
    return [];
  }
}
