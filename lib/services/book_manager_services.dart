import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:homework/data/model/book_model.dart';
import 'package:homework/data/model/book_status_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class FileManagerService {
  static Directory? directory;

  static List<String> allFilePaths = [];

  static Future<void> init() async {
    bool hasPermission = await requestWritePermission();
    if (!hasPermission) return;

    debugPrint("STORAGE PERMISSION GRANTED");

    directory = await getDownloadPath();

    allFilePaths = await getDirectoryPaths(directory);
  }

  static Future<bool> requestWritePermission() async {
    final info = await DeviceInfoPlugin().androidInfo;
    if (Platform.isAndroid && info.version.sdkInt > 29) {
      await Permission.manageExternalStorage.request();
    } else {
      await Permission.storage.request();
    }

    await Permission.storage.request();
    return await Permission.storage.request().isGranted;
  }

  static Future<Directory?> getDownloadPath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory('/storage/emulated/0/Download');
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        }
      }
    } catch (err) {
      debugPrint("Cannot get download folder path");
    }
    return directory;
  }

  static Future<BookStatusModel> checkFile(BookModel fileDataModel) async {
    BookStatusModel fileStatusModel = BookStatusModel(
      isExist: false,
      newFileLocation: "",
    );

    String savedLocation = '';

    List<String> pattern = fileDataModel.bookUrl.split(".");
    if (pattern.length > 1) {
      savedLocation =
          "${directory != null ? directory!.path : "/storage/emulated/0/Download"}/${fileDataModel.bookName}.${pattern.last}";
    }
    fileStatusModel = fileStatusModel.copyWith(newFileLocation: savedLocation);

    List<String> filePaths = await getDirectoryPaths(directory);

    if (filePaths.contains(savedLocation)) {
      fileStatusModel = fileStatusModel.copyWith(isExist: true);
    }
    return fileStatusModel;
  }

  static String isExist(
    String fileUrl,
    String fileName,
  ) {
    String filePath = '';
    List<String> pattern = fileUrl.split(".");
    if (pattern.length > 1) {
      filePath =
          "${directory != null ? directory!.path : "/storage/emulated/0/Download"}/$fileName.${pattern.last}";
    }
    if (allFilePaths.contains(filePath)) {
      return filePath;
    }
    return "";
  }

  static Future<List<String>> getDirectoryPaths(Directory? directory) async {
    List<String> filePaths = [];
    if (directory == null) return filePaths;
    var allFiles = directory.list();
    await allFiles.forEach((element) {
      debugPrint("FILES IN DOWNLOAD FOLDER:${element.path}");
      filePaths.add(element.path.toString());
    });
    return filePaths;
  }
}
