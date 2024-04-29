import 'dart:convert';
import 'package:homework/data/models/currency_model.dart';
import 'package:homework/data/models/network_response.dart';
import 'package:homework/data/my_custom_exception.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<NetworkResponse> getAllCurrency() async {
    try {
      http.Response response =
          await http.get(Uri.parse('https://nbu.uz/en/exchange-rates/json/'));

      if (response.statusCode == 200) {
        return NetworkResponse(
          data: (jsonDecode(response.body) as List?)
                  ?.map((e) => CurrencyModel.fromJson(e))
                  .toList() ??
              [],
        );
      }
      return NetworkResponse(
        errorText: getErrorMessage(response.statusCode),
        statusCode: response.statusCode,
      );
    } catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }
}
