import 'package:flutter/material.dart';

class AnimationThird extends StatefulWidget {
  const AnimationThird({super.key});

  @override
  State<AnimationThird> createState() => _AnimationThirdState();
}

class _AnimationThirdState extends State<AnimationThird> {
  Color borderColor = Colors.black;
  Color backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder<Color?>(
              tween: ColorTween(
                begin: Colors.black,
                end: backgroundColor,
              ),
              duration: const Duration(seconds: 1),
              builder: (context, Color? color, Widget? child) {
                return Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: borderColor, width: 2),
                  ),
                  child: const FlutterLogo(),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                setState(() {
                  backgroundColor = backgroundColor == Colors.white
                      ? Colors.black
                      : Colors.white;
                  borderColor =
                      borderColor == Colors.black ? Colors.white : Colors.black;
                });
              },
              child: const Text(
                "Click me!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Buni faqat soyasi va border qolgan :)