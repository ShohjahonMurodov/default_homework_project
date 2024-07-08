class CurrencyModel {
  final int id;
  final String code;
  final String ccy;
  final String ccyNmRu;
  final String ccyNmUz;
  final String ccyNmUzc;
  final String ccyNmEn;
  final String nominal;
  final String rate;
  final String diff;
  final String date;

  CurrencyModel({
    required this.id,
    required this.code,
    required this.ccy,
    required this.ccyNmRu,
    required this.ccyNmUz,
    required this.ccyNmUzc,
    required this.ccyNmEn,
    required this.nominal,
    required this.rate,
    required this.diff,
    required this.date,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      id: json['id'] as int? ?? 0,
      code: json['Code'] as String? ?? '',
      ccy: json['Ccy'] as String? ?? '',
      ccyNmRu: json['CcyNm_RU'] as String? ?? '',
      ccyNmUz: json['CcyNm_UZ'] as String? ?? '',
      ccyNmUzc: json['CcyNm_UZC'] as String? ?? '',
      ccyNmEn: json['CcyNm_EN'] as String? ?? '',
      nominal: json['Nominal'] as String? ?? '',
      rate: json['Rate'] as String? ?? '',
      diff: json['Diff'] as String? ?? '',
      date: json['Date'] as String? ?? '',
    );
  }
}
