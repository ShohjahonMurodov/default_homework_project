import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;

import '../utils/ui_utils.dart';

class WidgetSaverService {
  static Future<void> saveWidgetToGallery({
    required BuildContext context,
    required GlobalKey widgetKey,
    required String fileId,
  }) async {
    String filePath = '';

    showLoading(context: context);

    var storageStatus = await Permission.storage.status;
    if (storageStatus == PermissionStatus.denied) {
      await Permission.storage.request();
    }

    String dir = (Platform.isAndroid
            ? await getExternalStorageDirectory()
            : await getApplicationSupportDirectory())!
        .path;
    if (!context.mounted) return;
    RenderRepaintBoundary boundary =
        widgetKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData byteData =
        (await image.toByteData(format: ui.ImageByteFormat.png)) as ByteData;
    Uint8List pngBytes = byteData.buffer.asUint8List();
    File file = File('$dir/cheque-$fileId.png');
    debugPrint('$dir/cheque-$fileId.png');
    filePath = file.path;
    await file.writeAsBytes(pngBytes);

    if (!context.mounted) return;
    hideLoading(context: context);
    if (filePath.isNotEmpty) {
      //Open File
      // OpenFilex.open(filePath);
      //Save image to Gallery
      GallerySaver.saveImage(filePath).then((value) {
        showSuccessMessage(message: "Image Saved", context: context);
      });
    } else {
      showSuccessMessage(
        message: "Error",
        context: context,
      );
    }
  }

  static Future<void> openWidgetAsImage({
    required BuildContext context,
    required GlobalKey widgetKey,
    required String fileId,
  }) async {
    String filePath = '';

    showLoading(context: context);

    var storageStatus = await Permission.storage.status;
    if (storageStatus == PermissionStatus.denied) {
      await Permission.storage.request();
    }

    String dir = (Platform.isAndroid
            ? await getExternalStorageDirectory()
            : await getApplicationSupportDirectory())!
        .path;
    if (!context.mounted) return;
    RenderRepaintBoundary boundary =
        widgetKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData byteData =
        (await image.toByteData(format: ui.ImageByteFormat.png)) as ByteData;
    Uint8List pngBytes = byteData.buffer.asUint8List();
    File file = File('$dir/cheque-$fileId.png');
    debugPrint('$dir/cheque-$fileId.png');
    filePath = file.path;
    await file.writeAsBytes(pngBytes);

    if (!context.mounted) return;
    hideLoading(context: context);
    if (filePath.isNotEmpty) {
      //Open File
      OpenFilex.open(filePath);
      // Save image to Gallery
      //  GallerySaver.saveImage(filePath).then((value) {
      //    showSuccessMessage(message: "Image Saved", context: context);
      //  });
    } else {
      showSuccessMessage(
        message: "Error",
        context: context,
      );
    }
  }
}
