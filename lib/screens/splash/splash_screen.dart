import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/screens/book/book_screen.dart';
import 'package:homework/utils/app_colors.dart';
import 'package:homework/utils/app_images.dart';
import 'package:homework/utils/size_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.c_F9F9F9,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset(AppImages.splashImage)),
            52.getH(),
            Center(
              child: Text(
                "Perpustakaan Digital",
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 27.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                "E-Perpus adalah aplikasi perpustakaan digital yang menyewakan buku berbasis mobile.",
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            54.getH(),
            Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.c_29BB89,
                  padding: EdgeInsets.symmetric(
                    vertical: 15.h,
                    horizontal: 65.w,
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BookScreen(),
                    ),
                  );
                },
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
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
