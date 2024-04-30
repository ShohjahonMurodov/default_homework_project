import 'dart:convert';
import 'dart:io';
import 'package:homework/data/local/local_database.dart';
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
        List<CurrencyModel> currencies = (jsonDecode(response.body) as List?)
                ?.map((e) => CurrencyModel.fromJson(e))
                .toList() ??
            [];
        NetworkResponse currency = await LocalDatabase.getAllCurrencies();

        if (areListsEqual(currencies, currency.data)) {
          return await LocalDatabase.getAllCurrencies();
        }

        for (int i = 0; i < currencies.length; i++) {
          await LocalDatabase.insertCurrency(currencies[i]);
          i++;
        }
        return NetworkResponse(data: currencies);
      }
      return NetworkResponse(
        errorText: getErrorMessage(response.statusCode),
        statusCode: response.statusCode,
      );
    } on SocketException {
      return await LocalDatabase.getAllCurrencies();
    } on FormatException {
      return NetworkResponse(errorText: "FILE FORMATI XATO");
    } catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }
}

bool areListsEqual(List<CurrencyModel> list1, List<CurrencyModel> list2) {
  if (list1.length != list2.length) {
    return false;
  }

  for (int i = 0; i < list1.length; i++) {
    if (list1[i] != list2[i]) {
      return false;
    }
  }

  return true;
}
