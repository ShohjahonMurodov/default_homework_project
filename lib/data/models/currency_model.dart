import 'package:homework/utils/app_constants.dart';

class CurrencyModel {
  CurrencyModel(
      {this.id,
      required this.title,
      required this.code,
      required this.cbPrice,
      required this.nbuBuyPrice,
      required this.nbuSellPrice,
      required this.date});

  int? id;
  final String title;
  final String code;
  final String cbPrice;
  final String nbuBuyPrice;
  final String nbuSellPrice;
  final String date;

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      id: json['_id'] as int? ?? 0,
      title: json['title'] as String? ?? "",
      code: json['code'] as String? ?? "",
      cbPrice: json['cb_price'] as String? ?? "",
      nbuBuyPrice: json['nbu_buy_price'] as String? ?? "",
      nbuSellPrice: json['nbu_cell_price'] as String? ?? "",
      date: json['date'] as String? ?? "",
    );
  }

  CurrencyModel copyWith({
    int? id,
    String? title,
    String? code,
    String? cbPrice,
    String? nbuBuyPrice,
    String? nbuSellPrice,
    String? date,
  }) {
    return CurrencyModel(
      id: id ?? this.id,
      title: title ?? this.title,
      code: code ?? this.code,
      cbPrice: cbPrice ?? this.cbPrice,
      nbuBuyPrice: nbuBuyPrice ?? this.nbuBuyPrice,
      nbuSellPrice: nbuSellPrice ?? this.nbuSellPrice,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      AppConstants.title: title,
      AppConstants.code: code,
      AppConstants.cbPrice: cbPrice,
      AppConstants.nbuBuyPrice: nbuBuyPrice,
      AppConstants.nbuCellPrice: nbuSellPrice,
      AppConstants.date: date,
    };
  }

  Map<String, dynamic> toUpdateJson() {
    return {
      AppConstants.id: id,
      AppConstants.title: title,
      AppConstants.code: code,
      AppConstants.cbPrice: cbPrice,
      AppConstants.nbuBuyPrice: nbuBuyPrice,
      AppConstants.nbuCellPrice: nbuSellPrice,
      AppConstants.date: date,
    };
  }
}
