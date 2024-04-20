import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework/bloc/scanner_event.dart';
import 'package:homework/bloc/scanner_state.dart';
import 'package:homework/data/local/local_database.dart';
import 'package:homework/data/models/form_status.dart';

class ScannerBloc extends Bloc<ScannerEvent, ScannerState> {
  ScannerBloc()
      : super(
          const ScannerState(
            status: FormStatus.pure,
            products: [],
            statusText: "",
          ),
        ) {
    on<LoadScannerEvent>(loadScanners);
    on<AddScannerEvent>(insertScanners);
    on<RemoveScannerEvent>(deleteScanner);
  }

  Future<void> loadScanners(LoadScannerEvent event, emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    emit(
      state.copyWith(
          status: FormStatus.success,
          products: await LocalDatabase.getAllScanners()),
    );
  }

  Future<void> insertScanners(AddScannerEvent event, emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    emit(
      state.copyWith(status: FormStatus.success, products: [
        ...state.products,
        await LocalDatabase.insertScanner(event.scannerModel)
      ]),
    );
  }

  Future<void> deleteScanner(RemoveScannerEvent event, emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    await LocalDatabase.deleteScannerId(event.scannerId);
    emit(state.copyWith(
        status: FormStatus.success,
        products: await LocalDatabase.getAllScanners()));
  }
}
