import 'package:flutter/material.dart';
import 'package:homework/data/local/storage_repository.dart';
import 'package:homework/screens/enter/enter_screen.dart';
import 'package:homework/screens/pin/pin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _init() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        if (StorageRepository.getBool(key: "saved")) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const EnterScreen(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const PinScreen(),
            ),
          );
        }
      },
    );
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Icon(
          Icons.lock,
          color: Colors.white,
          size: 200,
        ),
      ),
    );
  }
}
