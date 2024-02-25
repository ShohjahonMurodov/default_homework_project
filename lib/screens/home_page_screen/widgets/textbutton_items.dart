import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework/utils/colors/app_colors.dart';
import 'package:homework/utils/images/app_images.dart';
import 'package:homework/utils/size/size_utils.dart';

class TextButtonItems extends StatelessWidget {
  const TextButtonItems(
      {super.key,
      required this.text,
      required this.onTap,
      required this.isActive,
      required this.isIcon});

  final String text;
  final VoidCallback onTap;
  final bool isActive;
  final bool isIcon;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      onPressed: onTap,
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              color: isActive ? AppColors.c_313341 : AppColors.c_D6996B,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          isIcon
              ? Row(
                  children: [
                    6.getW(),
                    SvgPicture.asset(
                      AppImages.arrowRight,
                      width: 15.w,
                      height: 15.h,
                      colorFilter: ColorFilter.mode(
                          isActive ? AppColors.c_313341 : AppColors.c_D6996B,
                          BlendMode.srcIn),
                    ),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
