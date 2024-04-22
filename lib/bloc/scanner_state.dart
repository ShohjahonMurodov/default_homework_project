import 'package:equatable/equatable.dart';
import 'package:homework/data/models/form_status.dart';
import 'package:homework/data/models/scaner_model.dart';

class ScannerState extends Equatable {
  final FormStatus status;
  final String statusText;
  final List<ScannerModel> products;

  const ScannerState({
    required this.status,
    required this.products,
    required this.statusText,
  });

  ScannerState copyWith({
    FormStatus? status,
    String? statusText,
    List<ScannerModel>? products,
  }) =>
      ScannerState(
        status: status ?? this.status,
        products: products ?? this.products,
        statusText: statusText ?? this.statusText,
      );

  @override
  List<Object?> get props => [
        status,
        products,
        statusText,
      ];
}
