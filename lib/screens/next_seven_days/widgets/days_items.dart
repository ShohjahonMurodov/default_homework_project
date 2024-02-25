import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/utils/size/size_utils.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/images/app_images.dart';

class DaysItems extends StatelessWidget {
  const DaysItems(
      {super.key,
      required this.text1,
      required this.text2,
      required this.image});

  final String text1;
  final String text2;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
                side: BorderSide(
                    color: AppColors.white.withOpacity(.4), width: 1.w),
              ),
              backgroundColor: AppColors.white.withOpacity(.36),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 11.h),
            ),
            onPressed: () {},
            child: Row(
              children: [
                Text(
                  text1,
                  style: TextStyle(
                    color: AppColors.c_303345,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Text(
                  "$text2 c",
                  style: TextStyle(
                    color: AppColors.c_303345,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                5.getW(),
                Image.network(
                  alignment: Alignment.bottomCenter,
                  image,
                  width: 24.w,
                  height: 24.h,
                ),
              ],
            ),
          ),
        ),
        5.getH(),
      ],
    );
  }
}

List<String> texts = [
  "Thursday",
  "Friday",
  "Saturday",
  "Sunday",
  "Monday",
  "Tuesday"
];
List<String> texts2 = ["21 c", "24 c", "18 c", "12 c", "16 c", "18 c"];
List<String> images = [
  AppImages.sun,
  AppImages.sun,
  AppImages.icon,
  AppImages.cludy,
  AppImages.rain,
  AppImages.rain
];
List<VoidCallback> onTaps = [
  () {},
  () {},
  () {},
  () {},
  () {},
  () {},
];
