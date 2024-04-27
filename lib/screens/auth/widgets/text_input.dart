import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextInputMyWidget extends StatelessWidget {
  const TextInputMyWidget(
      {super.key, required this.hitText, required this.textEditingController});

  final String hitText;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: Colors.black, width: 2.w),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: Colors.black, width: 1.w),
          ),
          hintText: hitText,
        ),
      ),
    );
  }
}
