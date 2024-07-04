import 'package:flutter/material.dart';
import 'package:homework/data/local/storage_repository.dart';
import 'package:homework/screens/auth/login/login_screen.dart';
import 'package:homework/screens/contacts/contact_screen.dart';
import 'package:homework/utils/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (StorageRepository.getString(key: "registered").isNotEmpty) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ContactScreen(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B202D),
      body: Center(
        child: Image.asset(AppImages.chatPicture),
      ),
    );
  }
}
