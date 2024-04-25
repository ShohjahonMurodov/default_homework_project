import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/utils/app_colors.dart';
import 'package:homework/utils/size_utils.dart';

class ButtonItems extends StatelessWidget {
  const ButtonItems({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15.h),
          backgroundColor: Colors.greenAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
        onPressed: onTap,
        child: Text(
          title,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 22.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
