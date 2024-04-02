import 'dart:convert';
import 'package:homework/data/models/bank_models.dart';
import 'package:homework/data/models/network_response.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  static Future<NetworkResponse> getTransactions() async {
    const apiUrl = "https://banking-api.free.mockoapp.net/transactions-incomes";
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        List<TransferModels> transactions = jsonResponse
            .map(
              (data) => TransferModels.fromJson(
                data,
              ),
            )
            .toList();
        return NetworkResponse(data: transactions);
      } else {
        return NetworkResponse(errorText: "Nomalum xatolik");
      }
    } catch (error) {
      return NetworkResponse(errorText: 'Error: $error');
    }
  }
}
