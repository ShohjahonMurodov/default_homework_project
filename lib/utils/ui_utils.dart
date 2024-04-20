import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showLoading({required BuildContext context}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          alignment: AlignmentDirectional.center,
          decoration: const BoxDecoration(),
          child: const Center(
            child: SizedBox(
              height: 40.0,
              width: 40.0,
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      );
    },
  );
}

void hideLoading({required BuildContext context}) {
  Navigator.pop(context);
}

void showSuccessMessage({
  required String message,
  required BuildContext context,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text(
        "MESSAGE",
        style: TextStyle(fontWeight: FontWeight.w800),
      ),
      content: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          message,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          isDefaultAction: true,
          child: const Text("Ok"),
        )
      ],
    ),
  );
}
