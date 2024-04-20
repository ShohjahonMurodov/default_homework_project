import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/data/models/scaner_model.dart';
import 'package:homework/screens/result/result_screen.dart';
import 'package:homework/utils/app_colors.dart';
import 'package:homework/utils/size_utils.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({Key? key, required this.barcode}) : super(key: key);
  final ValueChanged<Barcode> barcode;

  @override
  State<StatefulWidget> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: QRView(
                key: qrKey,
                onQRViewCreated: (controller) {
                  setState(
                    () {
                      this.controller = controller;
                    },
                  );
                  controller.scannedDataStream.listen(
                    (scanData) {
                      controller.pauseCamera();
                      widget.barcode.call(scanData);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(
                            scannerModel: ScannerModel(
                              id: 0,
                              name: "Data",
                              qrCode: scanData.code!,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                overlay: QrScannerOverlayShape(
                  borderColor: AppColors.c_FDB623,
                  borderRadius: 16,
                  borderLength: 50,
                  borderWidth: 40,
                  cutOutSize: MediaQuery.of(context).size.width - 32,
                ),
                onPermissionSet: (ctrl, p) {
                  log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
                  if (!p) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('no Permission')),
                    );
                  }
                },
              ),
            ),
            Positioned(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 10.h),
                margin: EdgeInsets.symmetric(horizontal: 46.w),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.c_333333.withOpacity(.79),
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(.6),
                      blurRadius: 30,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () async {
                        await controller?.toggleFlash();
                        setState(() {});
                      },
                      icon: FutureBuilder(
                        future: controller?.getFlashStatus(),
                        builder: (context, snapshot) {
                          return const Icon(Icons.flash_on);
                        },
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        await controller?.flipCamera();
                        setState(() {});
                      },
                      icon: FutureBuilder(
                        future: controller?.getCameraInfo(),
                        builder: (context, snapshot) {
                          if (snapshot.data != null) {
                            return const Icon(Icons.camera_alt);
                          } else {
                            return const Icon(Icons.camera_alt);
                          }
                        },
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.image),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
