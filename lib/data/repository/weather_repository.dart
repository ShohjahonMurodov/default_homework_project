import 'package:homework/data/network/api_provider.dart';

import '../models/my_response.dart';

class WeatherRepository {
  Future<MyResponse> getSimpleDataInfo(String city) =>
      ApiProvider.getSimpleDataInfo(city);

  Future<MyResponse> getComplexWeatherInfo() =>
      ApiProvider.getComplexWeatherInfo();
}
