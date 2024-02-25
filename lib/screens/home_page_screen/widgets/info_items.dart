import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/utils/colors/app_colors.dart';
import 'package:homework/utils/size/size_utils.dart';

class InfoItems extends StatelessWidget {
  const InfoItems(
      {super.key,
      required this.text1,
      required this.text2,
      required this.icon});

  final String text1;
  final String text2;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 11.w,
        top: 8.h,
        bottom: 8.h,
        right: 28.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(.36),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
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
          8.getW(),
          Text(
            text1,
            style: TextStyle(
              color: AppColors.c_303345,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          Text(
            text2,
            style: TextStyle(
              color: AppColors.c_303345,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
