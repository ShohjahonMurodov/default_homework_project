import 'package:homework/utils/app_constants.dart';

class ScannerModel {
  ScannerModel({this.id, required this.name, required this.qrCode});

  int? id;
  final String name;
  final String qrCode;

  factory ScannerModel.fromJson(Map<String, dynamic> json) {
    return ScannerModel(
      id: json["_id"],
      name: json["name"] as String? ?? "",
      qrCode: json["qr_code"] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      AppConstants.name: name,
      AppConstants.qrCode: qrCode,
    };
  }

  ScannerModel copyWith({
    int? id,
    String? name,
    String? qrCode,
  }) =>
      ScannerModel(
        id: id ?? this.id,
        name: name ?? this.name,
        qrCode: qrCode ?? this.qrCode,
      );
}
