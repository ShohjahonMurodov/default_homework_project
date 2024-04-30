import 'dart:convert';
import 'dart:io';
import 'package:homework/data/local/local_database.dart';
import 'package:homework/data/models/currency_model.dart';
import 'package:homework/data/models/network_response.dart';
import 'package:homework/data/my_custom_exception.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  bool updateInfo = true;

  Future<void> solish({required List<CurrencyModel> currencies}) async {
    for (int i = 0; i < currencies.length; i++) {
      await LocalDatabase.insertCurrency(currencies[i]);
    }
  }

  Future<void> updateData(
      {required List<CurrencyModel> currencies,
      required List<CurrencyModel> localCurrencies}) async {
    if (updateInfo) {
      for (CurrencyModel currencyModelLocal in localCurrencies) {
        for (CurrencyModel currencyModel in currencies) {
          if (currencyModelLocal.spotTheDifference(
              currencyModel: currencyModel)) {
            await LocalDatabase.updateCurrency(currencyModel: currencyModel);
            break;
          }
        }
      }
      updateInfo = false;
    }
  }

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
        List<CurrencyModel> c = currency.data;

        if (c.isNotEmpty) {
          if (areListsEqual(currencies, c)) {
            return currency;
          } else {
            updateData(currencies: currencies, localCurrencies: c);
            return NetworkResponse(data: currencies);
          }
        } else {
          solish(currencies: currencies);
          return NetworkResponse(data: currencies);
        }
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
