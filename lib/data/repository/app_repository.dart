import 'package:homework/data/network/api_provider.dart';
import 'package:homework/data/network/network_response.dart';

class AppRepository {
  AppRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<NetworkResponse> getCurrencies() => apiProvider.getCurrencies();
}
