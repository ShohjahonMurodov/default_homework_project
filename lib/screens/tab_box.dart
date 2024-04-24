import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework/screens/arrow/arrow_screen.dart';
import 'package:homework/screens/contact/contact_screen.dart';
import 'package:homework/screens/languages/languages_screen.dart';
import 'package:homework/screens/settings/settings_screen.dart';
import 'package:homework/screens/study/study_screen.dart';
import 'package:homework/services/book_manager_services.dart';
import 'package:homework/utils/app_colors.dart';
import 'package:homework/utils/app_images.dart';

import 'home/home_screen.dart';

class TabBox1 extends StatefulWidget {
  const TabBox1({super.key});

  @override
  State<TabBox1> createState() => _TabBox1State();
}

class _TabBox1State extends State<TabBox1> {
  List<Widget> _screens = [];
  int _activeIndex = 0;

  @override
  void initState() {
    _screens = [
      HomeScreen(),
      StudyScreen(),
      ArrowScreen(),
      FileManagerScreen(),
      LanguagesScreen(),
      ContactScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_activeIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newActiveIndex) {
          _activeIndex = newActiveIndex;
          setState(() {});
        },
        currentIndex: _activeIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        backgroundColor: AppColors.c_000072,
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppImages.fast),
            icon: SvgPicture.asset(AppImages.fast),
            label: "",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppImages.study),
            icon: SvgPicture.asset(AppImages.study),
            label: "",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppImages.arrow),
            icon: SvgPicture.asset(AppImages.arrow),
            label: "",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppImages.settings),
            icon: SvgPicture.asset(AppImages.settings),
            label: "",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.language,
              size: 25.sp,
              color: AppColors.white,
            ),
            icon: Icon(
              Icons.language,
              size: 25.sp,
              color: AppColors.white,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppImages.contact),
            icon: SvgPicture.asset(AppImages.contact),
            label: "",
          ),
        ],
      ),
    );
  }
}
