import 'package:flutter/material.dart';
import 'package:homework/screens/set_time/set_time_screen.dart';
import 'package:lottie/lottie.dart';

import '../../data/local/local_variable.dart';

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
        isTrue = false;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SetTimeScreen(),
          ),
        );
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Lottie.asset("assets/lotties/great.json"),
      ),
    );
  }
}
