import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework/bloc/scanner_bloc.dart';
import 'package:homework/bloc/scanner_event.dart';
import 'package:homework/bloc/scanner_state.dart';
import 'package:homework/data/models/form_status.dart';
import 'package:homework/data/models/scaner_model.dart';
import 'package:homework/screens/qr_scaner/qr_scaner_screen.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../services/widget_save_sirvice.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        leading: IconButton(
          onPressed: () {
            context.read<ScannerBloc>().add(
                  AddScannerEvent(
                    scannerModel: ScannerModel(name: "dfsdfs", qrCode: "ddc"),
                  ),
                );
          },
          icon: const Icon(Icons.add),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return QrScannerScreen(
                      barcode: (barcode) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(barcode.code.toString()),
                          ),
                        );
                        context.read<ScannerBloc>().add(
                              AddScannerEvent(
                                scannerModel: ScannerModel(
                                  name: "Data",
                                  id: DateTime.now().second,
                                  qrCode: barcode.code.toString(),
                                ),
                              ),
                            );
                      },
                    );
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.qr_code_scanner,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: BlocBuilder<ScannerBloc, ScannerState>(
        builder: (context, state) {
          if (state.status == FormStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status == FormStatus.error) {
            return Center(
              child: Text(state.statusText),
            );
          }
          return ListView.builder(
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              print("-------------${state.products}");
              return RepaintBoundary(
                key: Key(state.products[index].qrCode),
                child: InkWell(
                  onLongPress: () {
                    context.read<ScannerBloc>().add(
                          RemoveScannerEvent(
                              scannerId: state.products[index].id!),
                        );
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(state.products[index].name),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            QrImageView(
                              data: state.products[index].qrCode,
                              version: QrVersions.auto,
                              size: 200.0,
                            ),
                          ],
                        ),
                        Text("QR-Code: ${state.products[index].qrCode}"),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                WidgetSaverService.openWidgetAsImage(
                                  context: context,
                                  widgetKey: _globalKey,
                                  fileId: state.products[index].qrCode,
                                );
                              },
                              child: const Icon(Icons.share),
                            ),
                            TextButton(
                              onPressed: () {
                                WidgetSaverService.saveWidgetToGallery(
                                  context: context,
                                  widgetKey: _globalKey,
                                  fileId: state.products[index].qrCode,
                                );
                              },
                              child: const Icon(Icons.download),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
