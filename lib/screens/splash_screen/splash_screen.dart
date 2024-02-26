import 'package:flutter/material.dart';
import 'package:homework/screens/home_page_screen/home_page.dart';
import 'package:homework/utils/colors/app_colors.dart';
import 'package:homework/utils/images/app_images.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _init() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    });
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_FEE3BC,
      body: Center(
        child: Lottie.asset(AppImages.lotties),
      ),
    );
  }
}
