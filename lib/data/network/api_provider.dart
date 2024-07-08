import 'package:dio/dio.dart';
import 'package:homework/data/models/currency_model.dart';
import 'package:homework/data/network/api_client.dart';
import 'package:homework/data/network/network_response.dart';

class ApiProvider extends ApiClient {
  Future<NetworkResponse> getCurrencies() async {
    try {
      Response response = await dio.get("/uz/arkhiv-kursov-valyut/json/");

      if (response.statusCode == 200) {
        return NetworkResponse(
            data: (response.data as List?)
                    ?.map((e) => CurrencyModel.fromJson(e))
                    .toList() ??
                []);
      } else {
        return NetworkResponse(
            errorText: "Status code: ${response.statusCode}");
      }
    } catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }
}
