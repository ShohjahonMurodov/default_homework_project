import 'package:flutter/cupertino.dart';

class AutoViewModel extends ChangeNotifier {
  int count = 0;

  AutoViewModel() {
    increment();
  }

  increment() async {
    while (true) {
      await Future.delayed(
        const Duration(seconds: 1),
      );
      count++;
      notifyListeners();
    }
  }
}
