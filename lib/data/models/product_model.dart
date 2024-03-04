class ProductModel {
  ProductModel({
    required this.description,
    required this.productName,
    required this.imageUrl,
    required this.price,
    required this.productId,
  });

  String productName;
  double price;
  String description;
  String imageUrl;
  String productId;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productName: json["name"] as String? ?? "",
      description: json["descreption"] as String? ?? "",
      imageUrl: json["image_url"] as String? ?? "",
      price: (json["price"] as num? ?? 0.0).toDouble(),
      productId: json["_uuid"] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "product_name": productName,
      "price": price,
      "description": description,
      "image_url": imageUrl,
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      "product_name": productName,
      "price": price,
      "description": description,
      "image_url": imageUrl,
      "_uuid": productId,
    };
  }
}
