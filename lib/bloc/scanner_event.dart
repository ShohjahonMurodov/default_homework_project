import 'package:equatable/equatable.dart';
import 'package:homework/data/models/scaner_model.dart';

abstract class ScannerEvent extends Equatable {}

class AddScannerEvent extends ScannerEvent {
  final ScannerModel scannerModel;

  AddScannerEvent({required this.scannerModel});

  @override
  List<Object?> get props => [scannerModel];
}

class RemoveScannerEvent extends ScannerEvent {
  final int scannerId;

  RemoveScannerEvent({required this.scannerId});

  @override
  List<Object?> get props => [scannerId];
}

class UpdateScannerEvent extends ScannerEvent {
  final ScannerModel scannerModel;

  UpdateScannerEvent({required this.scannerModel});

  @override
  List<Object?> get props => [scannerModel];
}

class DeleteAllScannerEvent extends ScannerEvent {
  @override
  List<Object?> get props => [];
}

class LoadScannerEvent extends ScannerEvent {
  @override
  List<Object?> get props => [];
}
