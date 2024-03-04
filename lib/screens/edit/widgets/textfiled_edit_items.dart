import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldEditItems extends StatelessWidget {
  const TextFieldEditItems(
      {super.key,
        required this.controller,
        required this.type,
        required this.hintText});

  final TextEditingController controller;
  final TextInputType type;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: type,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 20.sp,
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(width: 3.w, color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(width: 3.w, color: Colors.black),
        ),
      ),
    );
  }
}
