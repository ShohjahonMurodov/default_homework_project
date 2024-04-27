import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/screens/auth/widgets/dialog_button.dart';
import 'package:homework/utils/size_utils.dart';
import 'package:image_picker/image_picker.dart';

showImageDialog(BuildContext context,
    {required ValueChanged<ChangeImage> onChaneXFile}) async {
  XFile? xFile;
  Uint8List? _ui8;
  ChangeImage changeImage = ChangeImage();

  Future<void> _pickerImageFromGallery() async {
    xFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 1024,
      maxWidth: 1024,
    );
    if (xFile != null) {
      changeImage.xFile = xFile;
      changeImage.uint8list = File(xFile!.path).readAsBytesSync();
    }
    onChaneXFile.call(changeImage);
  }

  Future<void> _pickerImageFromCamera() async {
    xFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 1024,
      maxWidth: 1024,
    );
    if (xFile != null) {
      changeImage.xFile = xFile;
      changeImage.uint8list = File(xFile!.path).readAsBytesSync();
    }
    onChaneXFile.call(changeImage);
  }

  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(bottom: 40.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10.h, bottom: 20.h),
              width: 90.w,
              height: 7.h,
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(10.r)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DialogButtons(
                    onTab: () {
                      _pickerImageFromGallery();
                      Navigator.pop(context);
                    },
                    iconData: Icons.image),
                50.getW(),
                DialogButtons(
                    onTab: () {
                      _pickerImageFromCamera();
                      Navigator.pop(context);
                    },
                    iconData: Icons.camera_alt),
              ],
            ),
          ],
        ),
      );
    },
  );
}

class ChangeImage {
  XFile? xFile;
  Uint8List? uint8list;

  ChangeImage({this.uint8list, this.xFile});
}