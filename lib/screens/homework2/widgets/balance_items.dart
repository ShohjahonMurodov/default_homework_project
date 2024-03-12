import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework/utils/app_colors.dart';
import 'package:homework/utils/size_utils.dart';

class BalanceItems extends StatelessWidget {
  const BalanceItems(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle});

  final String icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 13.w),
      padding: EdgeInsets.symmetric(
        horizontal: 19.w,
        vertical: 17.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 13.w,
              vertical: 10.h,
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.c_8A959E.withOpacity(.25),
                  blurRadius: 40,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: SvgPicture.asset(icon),
          ),
          16.getH(),
          Text(
            title,
            style: TextStyle(
              color: AppColors.c_151940,
              fontSize: 19.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              Text(
                subtitle,
                style: TextStyle(
                  color: AppColors.c_898A8D,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              18.getW(),
            ],
          ),
        ],
      ),
    );
  }
}
