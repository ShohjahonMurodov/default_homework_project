import 'package:flutter/material.dart';
import 'package:homework/utils/colors/app_colors.dart';

class HelloScreen extends StatefulWidget {
  const HelloScreen({super.key});

  @override
  State<HelloScreen> createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("Deafult"),
      ),
      body: const Center(
        child: Text("HEllO"),
      ),
    );
  }
}
