import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/utils/app_colors.dart';

class RowItems extends StatelessWidget {
  const RowItems({super.key, required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              color: AppColors.c_3C3014,
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
            onPressed: onTap,
            child: Text(
              "Show all",
              style: TextStyle(
                color: AppColors.c_3C3014,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
