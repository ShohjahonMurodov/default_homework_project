import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homework/utils/size_utils.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({super.key});

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.c_FDFDFD,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppImages.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppImages.pdf),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            36.getH(),
            Text(
              "Languages",
              style: TextStyle(
                color: AppColors.black,
                fontSize: 30.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            36.getH(),
            ...List.generate(
              titles.length,
              (index) => ListTile(
                onTap: () {},
                leading: SvgPicture.asset(images[index]),
                title: Text(
                  titles[index],
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                subtitle: Text(
                  subtitles[index],
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> titles = ["Galician", "Spanish", "English", "Japanese", "French"];
List<String> subtitles = [
  "native speaker",
  "native speaker",
  "Upper intermediate",
  "Intermediate",
  "Basic"
];
List<String> images = [
  AppImages.galician,
  AppImages.spain,
  AppImages.english,
  AppImages.japan,
  AppImages.france
];
