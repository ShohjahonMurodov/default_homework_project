import 'package:homework/data/models/coffee_constants.dart';

class CoffeeModels {
  CoffeeModels(
      {required this.image,
      required this.title,
      required this.subtitle,
      required this.price,
      this.count = -1,
      this.id});

  final String image;
  final String title;
  final String subtitle;
  final int price;
  int count;
  int? id;

  factory CoffeeModels.fromJson(Map<String, dynamic> json) {
    return CoffeeModels(
        image: json["image"] as String? ?? "",
        title: json["title"] as String? ?? "",
        subtitle: json["subtitle"] as String? ?? "",
        price: json["price"] as int? ?? 0,
        count: json["count"] as int? ?? -1);
  }

  CoffeeModels copyWith({
    int? id,
    String? title,
    String? subtitle,
    int? price,
    int? count,
    String? image,
  }) {
    return CoffeeModels(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      price: price ?? this.price,
      count: count ?? this.count,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      CoffeeConstants.image: image.toString(),
      CoffeeConstants.title: title,
      CoffeeConstants.subtitle: subtitle,
      CoffeeConstants.price: price,
      CoffeeConstants.count: count,
    };
  }
}
