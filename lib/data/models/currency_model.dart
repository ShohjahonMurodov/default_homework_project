import 'package:homework/utils/app_constants.dart';

class CurrencyModel {
  CurrencyModel(
      {required this.title,
      required this.code,
      required this.cbPrice,
      required this.nbuBuyPrice,
      required this.nbuSellPrice,
      required this.date});

  final String title;
  final String code;
  final String cbPrice;
  final String nbuBuyPrice;
  final String nbuSellPrice;
  final String date;

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      title: json['title'] as String? ?? "",
      code: json['code'] as String? ?? "",
      cbPrice: json['cb_price'] as String? ?? "",
      nbuBuyPrice: json['nbu_buy_price'] as String? ?? "",
      nbuSellPrice: json['nbu_cell_price'] as String? ?? "",
      date: json['date'] as String? ?? "",
    );
  }

  CurrencyModel copyWith({
    String? title,
    String? code,
    String? cbPrice,
    String? nbuBuyPrice,
    String? nbuSellPrice,
    String? date,
  }) {
    return CurrencyModel(
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
}
