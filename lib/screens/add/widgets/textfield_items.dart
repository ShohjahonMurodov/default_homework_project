import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/utils/size_utils.dart';

class TextFieldItems extends StatelessWidget {
  const TextFieldItems(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.type});

  final TextEditingController controller;
  final TextInputType type;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          keyboardType: type,
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: Colors.white,
                width: 2.w,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: Colors.white,
                width: 2.w,
              ),
            ),
          ),
        ),
        10.getH(),
      ],
    );
  }
}
