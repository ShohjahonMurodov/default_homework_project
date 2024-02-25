import 'dart:convert';

import 'package:homework/data/models/my_response.dart';
import 'package:homework/data/models/one_call/one_call_models/one_call_data_models.dart';
import 'package:homework/data/models/simple/weather_model/weather_model.dart';
import 'package:homework/utils/constants/app_constants.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  static Future<MyResponse> getSimpleDataInfo(String city) async {
    Map<String, String> queryParams = {
      "appid": AppConstants.complexApiKey1,
      "q": city,
    };

    Uri uri = Uri.https(
      AppConstants.baseUrl,
      "/data/2.5/weather",
      queryParams,
    );

    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return MyResponse(
          data: WeatherModel.fromJson(
            jsonDecode(response.body),
          ),
        );
      } else {
        return MyResponse(errorText: "Other error: ${response.statusCode}");
      }
    } catch (error) {
      return MyResponse(
        errorText: error.toString(),
      );
    }
  }

  static Future<MyResponse> getComplexWeatherInfo() async {
    Map<String, String> queryParams = {
      "lat": "41.2646",
      "lon": "69.12",
      "units": "metric",
      "exclude": "minutely,current",
      "appid": AppConstants.complexApiKey3,
    };

    Uri uri = Uri.https(
      AppConstants.baseUrl,
      "/data/2.5/onecall",
      queryParams,
    );

    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        return MyResponse(
          data: OneCallDataModels.fromJson(
            jsonDecode(response.body),
          ),
        );
      } else {
        return MyResponse(errorText: "Other error: ${response.statusCode}");
      }
    } catch (error) {
      return MyResponse(
        errorText: error.toString(),
      );
    }
  }
}
