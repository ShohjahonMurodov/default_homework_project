import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework/data/local/storage_repository.dart';
import 'package:homework/screens/api/api_screen.dart';

class CheckCubit extends Cubit<String> {
  CheckCubit() : super("");

  void createPassword(String pinCode) {
    StorageRepository.setString(
      key: "pin_code",
      value: pinCode,
    );
    debugPrint("Yaratilgan pin code: ${pinCode}");
  }

  void toVerifyPinCode(String againPinCode, BuildContext context) {
    if (StorageRepository.getString(key: "pin_code") == againPinCode) {
      StorageRepository.setBool(
        key: "saved",
        value: true,
      );
      debugPrint("Pin code registerdan otdi: ${againPinCode}");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ApiScreen(),
        ),
      );
    } else {
      StorageRepository.setBool(
        key: "saved",
        value: false,
      );
    }
  }

  void toCheckPinCode(String pinCode, BuildContext context) {
    if (StorageRepository.getString(key: "pin_code") == pinCode) {
      debugPrint("Login pin code: ${pinCode}");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ApiScreen(),
        ),
      );
    }
  }
}
