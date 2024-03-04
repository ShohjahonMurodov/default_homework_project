import 'package:homework/data/models/my_response.dart';
import 'package:homework/data/models/product_model.dart';
import 'package:homework/data/network/api_provider.dart';

class AppRepositories {
  Future<MyResponse> getAllProducts() => ApiProvider.getAllProducts();

  Future<MyResponse> addProducts(ProductModel productModel) =>
      ApiProvider.addProduct(productModel);

  Future<MyResponse> deleteProduct(String productUUID) =>
      ApiProvider.deleteProduct(productUUID);

  Future<MyResponse> updateProduct(ProductModel productModel) =>
      ApiProvider.updateProduct(productModel);
}
