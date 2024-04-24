import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework/utils/app_colors.dart';
import 'package:homework/utils/app_images.dart';
import 'package:homework/utils/size_utils.dart';

class StudyItems extends StatelessWidget {
  const StudyItems(
      {super.key,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.text4});

  final String text1;
  final String text2;
  final String text3;
  final String text4;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(AppImages.save),
              16.getW(),
              Text(
                text1,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          6.getH(),
          Row(
            children: [
              30.getW(),
              Text(
                text2,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          6.getH(),
          Row(
            children: [
              30.getW(),
              Text(
                text3,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          6.getH(),
          Row(
            children: [
              30.getW(),
              Text(
                text4,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
