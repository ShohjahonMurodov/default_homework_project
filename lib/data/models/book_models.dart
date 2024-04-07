class BookModels {
  BookModels(
      {this.uuid,
      required this.name,
      required this.description,
      required this.author,
      required this.rate,
      required this.price});

  final String? uuid;
  final String name;
  final String description;
  final String author;
  final double rate;
  final double price;

  factory BookModels.fromJson(Map<String, dynamic> json) {
    return BookModels(
      name: json["name"] as String? ?? "",
      description: json["description"] as String? ?? "",
      price: (json["price"] as num? ?? 0.0).toDouble(),
      uuid: json["_uuid"] as String? ?? "",
      rate: json["rate"] as double? ?? 0.0,
      author: json["author"] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "price": price,
      "description": description,
      "rate": rate,
      "author": author,
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      "_uuid": uuid,
      "name": name,
      "price": price,
      "description": description,
      "rate": rate,
      "author": author,
    };
  }
}
