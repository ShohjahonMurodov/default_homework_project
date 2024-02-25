import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/utils/size/size_utils.dart';

import '../../../utils/colors/app_colors.dart';

class HourlyItems extends StatelessWidget {
  const HourlyItems({
    super.key,
    required this.onTap,
    required this.hour,
    required this.icon,
    required this.temp,
    required this.isActive,
  });

  final VoidCallback onTap;
  final String hour;
  final String icon;
  final String temp;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        10.getW(),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 16.h,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.r),
            ),
            backgroundColor: isActive
                ? AppColors.white.withOpacity(.7)
                : AppColors.white.withOpacity(.3),
          ),
          onPressed: onTap,
          child: Column(
            children: [
              Text(
                hour,
                style: TextStyle(
                  color: isActive ? AppColors.c_303345 : AppColors.c_9C9EAA,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Image.network(
                icon,
                width: 24.w,
                height: 24.h,
              ),
              Text(
                "$temp c",
                style: TextStyle(
                  color: AppColors.c_303345,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
