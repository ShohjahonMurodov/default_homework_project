import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/utils/app_colors.dart';
import 'package:homework/utils/size_utils.dart';

class SizeTextButton extends StatelessWidget {
  const SizeTextButton(
      {super.key,
      required this.size,
      required this.onTap,
      required this.isSelected});

  final String size;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 8.h),
            backgroundColor: isSelected
                ? AppColors.c_0C0F14
                : AppColors.white.withOpacity(.05),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
              side: BorderSide(
                  color: isSelected
                      ? AppColors.c_D17842
                      : AppColors.white.withOpacity(.05),
                  width: 1.w),
            ),
          ),
          onPressed: onTap,
          child: Text(
            size,
            style: TextStyle(
              color: isSelected ? AppColors.c_D17842 : AppColors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        16.getW(),
      ],
    );
  }
}

List<String> sizes = ["S", "M", "L"];
