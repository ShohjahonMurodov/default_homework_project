import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/utils/size/size_utils.dart';

import '../../../utils/colors/app_colors.dart';

class TomorrowItems extends StatelessWidget {
  const TomorrowItems({super.key, required this.icon, required this.text});

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 22.w,
          height: 22.h,
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(.9),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Center(
            child: Image.asset(icon),
          ),
        ),
        8.getH(),
        Text(
          text,
          style: TextStyle(
            color: AppColors.c_303345,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
