class TransferModels {
  final String transferDate;
  final List<TransferData> data;

  TransferModels({
    required this.transferDate,
    required this.data,
  });

  factory TransferModels.fromJson(Map<String, dynamic> json) {
    return TransferModels(
      transferDate: json['transfer_date'],
      data: List<TransferData>.from(json['data'].map((x) => TransferData.fromJson(x))),
    );
  }
}

class TransferData {
  final int transactionCode;
  final String date;
  final int incomeId;
  final int amount;
  final int cardId;
  final SenderModels sender;

  TransferData({
    required this.transactionCode,
    required this.date,
    required this.incomeId,
    required this.amount,
    required this.cardId,
    required this.sender,
  });

  factory TransferData.fromJson(Map<String, dynamic> json) {
    return TransferData(
      transactionCode: json['transaction_code'].toInt() as int? ?? 0,
      date: json['date'] as String? ?? '',
      incomeId: json['income_id'].toInt() as int? ?? 0,
      amount: json['amount'].toInt() as int? ?? 0,
      cardId: json['card_id'].toInt() as int? ?? 0,
      sender: SenderModels.fromJson(json['sender']),
    );
  }
}

class SenderModels {
  final String brandImage;
  final String name;
  final String location;

  SenderModels({
    required this.brandImage,
    required this.name,
    required this.location,
  });

  factory SenderModels.fromJson(Map<String, dynamic> json) {
    return SenderModels(
      brandImage: json['brand_image'] as String? ?? '',
      name: json['name'] as String? ?? '',
      location: json['location'] as String? ?? '',
    );
  }
}
