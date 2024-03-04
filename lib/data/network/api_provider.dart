import 'dart:convert';
import 'package:homework/data/models/my_response.dart';
import 'package:homework/data/models/product_model.dart';
import 'package:homework/utils/app_constants.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  static Future<MyResponse> getAllProducts() async {
    Uri uri = Uri.https(AppConstants.baseUrl, "/api/v1/product");
    try {
      http.Response response = await http.get(
        uri,
        headers: {
          "Authorization": "Bearer ${AppConstants.token}",
          "Content-Type": "application/json",
        },
      );
      print(response.body);

      if (response.statusCode == 200) {
        return MyResponse(
          data: (jsonDecode(response.body)["items"] as List?)
              ?.map(
                (e) => ProductModel.fromJson(e),
              ).toList(),

        );
      } else {
        return MyResponse(
          errorText: response.statusCode.toString(),
        );
      }
    } catch (error) {
      return MyResponse(
        errorText: error.toString(),
      );
    }
  }

  static Future<MyResponse> addProduct(ProductModel productModel) async {
    Uri uri = Uri.https(AppConstants.baseUrl, "/api/v1/product");
    try {
      http.Response response = await http.put(
        uri,
        headers: {
          "Authorization": "Bearer ${AppConstants.token}",
          "Content-Type": "application/json",
        },
        body: jsonEncode([productModel.toJson()]),
      );

      if (response.statusCode == 201) {
        return MyResponse(data: "Product added successfully!");
      } else {
        return MyResponse(
          errorText: response.statusCode.toString(),
        );
      }
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }

  static Future<MyResponse> deleteProduct(String productUUID) async {
    Uri uri = Uri.https(AppConstants.baseUrl, "/api/v1/product");
    try {
      http.Response response = await http.delete(
        uri,
        headers: {
          "Authorization": "Bearer ${AppConstants.token}",
          "Content-Type": "application/json",
        },
        body: jsonEncode([
          {"_uuid": productUUID}
        ]),
      );
      if (response.statusCode == 200) {
        return MyResponse(data: "Product deleted successfully!");
      }
      return MyResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }

  static Future<MyResponse> updateProduct(ProductModel productModel) async {
    Uri uri = Uri.https(AppConstants.baseUrl, "/api/v1/product");
    try {
      http.Response response = await http.put(
        uri,
        headers: {
          "Authorization": "Bearer ${AppConstants.token}",
          "Content-Type": "application/json",
        },
        body: jsonEncode([productModel.toJsonForUpdate()]),
      );

      if (response.statusCode == 200) {
        return MyResponse(data: "Product updated successfully!");
      } else {
        return MyResponse(
          errorText: response.statusCode.toString(),
        );
      }
    } catch (error) {
      return MyResponse(
        errorText: error.toString(),
      );
    }
  }
}
