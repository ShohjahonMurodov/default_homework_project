import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageCubit extends Cubit<bool> {
  ImageCubit() : super(false);

  Future<String> addImageInFireBase(
      {required File file, required String fileName}) async {
    String imageUrl = "";

    final storageRef = FirebaseStorage.instance.ref();

    final imagesRef = storageRef.child(fileName);
    emit(true);

    try {
      await imagesRef.putFile(file);
    } catch (_) {
      debugPrint("Error: Bo'ldi :(");
    }
    imageUrl = await imagesRef.getDownloadURL();
    emit(false);

    return imageUrl;
  }

  Future<String> deleteImage({required String path}) async {
    final storageRef = FirebaseStorage.instance.ref();
    var desertRef = storageRef.child(path);

    try {
      await desertRef.delete();
    } catch (_) {
      debugPrint(_.toString());
    }
    return "";
  }
}
