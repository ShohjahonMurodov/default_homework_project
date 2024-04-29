import 'package:homework/data/network/api_provider.dart';
import '../models/network_response.dart';

class AppRepository {
  Future<NetworkResponse> getAllCurrency() async {
    return ApiProvider().getAllCurrency();
  }
}
