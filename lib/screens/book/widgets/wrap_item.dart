import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/utils/size_utils.dart';
import '../../../utils/app_colors.dart';

class WrapItem extends StatelessWidget {
  const WrapItem({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: 9.w,
              vertical: 12.h,
            ),
            backgroundColor: AppColors.c_F1F1F1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.r),
            ),
          ),
          onPressed: onTap,
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.c_263238,
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        10.getH(),
      ],
    );
  }
}
