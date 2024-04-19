import 'package:flutter/material.dart';

Widget alphabetButton({
  required String title,
  required VoidCallback onPressed,
}) {
  return Container(
    margin: const EdgeInsets.only(right: 10, bottom: 10),
    width: 50,
    height: 60,
    child: TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: onPressed,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
  );
}
