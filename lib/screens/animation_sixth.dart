import 'package:flutter/material.dart';

class AnimationSixth extends StatefulWidget {
  const AnimationSixth({super.key});

  @override
  State<AnimationSixth> createState() => _AnimationSixthState();
}

class _AnimationSixthState extends State<AnimationSixth> {
  double opacityLevel = 1.0;

  void changeOpacity() {
    setState(() {
      opacityLevel = opacityLevel == 0 ? 1.0 : 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: AnimatedOpacity(
          opacity: opacityLevel,
          duration: const Duration(seconds: 2),
          curve: Curves.decelerate,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.green,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeOpacity,
        child: const Icon(Icons.qr_code_scanner_outlined),
      ),
    );
  }
}

/// Tugagan :)