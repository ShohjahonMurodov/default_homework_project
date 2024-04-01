import 'dart:convert';
import 'package:homework/data/models/country_models.dart';
import 'package:homework/data/models/network_response.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  static Future<NetworkResponse> getCountries() async {
    try {
      http.Response response = await http
          .get(Uri.parse("https://all-countries.free.mockoapp.net/countries"));

      if (response.statusCode == 200) {
        print("Keldi ${response.body}");
        return NetworkResponse(
          data: (jsonDecode(response.body)["data"]["countries"] as List?)?.map(
            (e) => CountryModels.fromJson(e),
          ).toList() ?? [],
        );
      }

      return NetworkResponse(errorText: "Nomalum xatolik");
    } catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }
}
