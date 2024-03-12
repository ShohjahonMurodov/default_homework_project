import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationSecond extends StatefulWidget {
  const AnimationSecond({super.key});

  @override
  State<AnimationSecond> createState() => _AnimationSecondState();
}

class _AnimationSecondState extends State<AnimationSecond> {
  double _fontSize = 10;
  bool _big = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          AnimatedDefaultTextStyle(
            duration: const Duration(seconds: 3),
            style: TextStyle(
              color: Colors.black,
              fontSize: _fontSize,
              fontWeight: FontWeight.w400,
            ),
            curve: Curves.bounceInOut,
            child: const Text(
              "Hello! Welcome to TutorialKart. This is a basic demonstration of animation in Flutter.",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.grey),
              onPressed: () {
                setState(() {
                  _fontSize = _big ? 50 : 10;
                  _big = !_big;
                });
              },
              child: const Text(
                "Bigger Font",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Tugagan :)