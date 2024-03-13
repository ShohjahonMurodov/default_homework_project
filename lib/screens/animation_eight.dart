import 'dart:math';
import 'package:flutter/material.dart';

class AnimationEight extends StatefulWidget {
  const AnimationEight({super.key});

  @override
  State<AnimationEight> createState() => _AnimationEightState();
}

class _AnimationEightState extends State<AnimationEight>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> circleAnimation;
  late Animation<double> sizeAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    sizeAnimation = Tween<double>(begin: 20.0, end: 100.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.linear,
        reverseCurve: Curves.linear,
      ),
    );

    circleAnimation = Tween<double>(begin: 0, end: 2 * pi).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.linear,
        reverseCurve: Curves.linear,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {});
    animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Transform.rotate(
          angle: circleAnimation.value,
          child: SizedBox(
            width: sizeAnimation.value * 2,
            height: sizeAnimation.value * 2,
            child: Column(
              children: [
                Row(
                  children: [
                    AnimatedSize(
                      curve: Curves.linear,
                      reverseDuration: const Duration(seconds: 2),
                      duration: const Duration(seconds: 2),
                      child: Icon(
                        Icons.circle,
                        color: Colors.blue,
                        size: sizeAnimation.value,
                      ),
                    ),
                    AnimatedSize(
                      curve: Curves.linear,
                      duration: const Duration(seconds: 3),
                      child: Icon(
                        Icons.circle,
                        color: Colors.red,
                        size: sizeAnimation.value,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    AnimatedSize(
                      curve: Curves.linear,
                      duration: const Duration(seconds: 3),
                      child: Icon(
                        Icons.circle,
                        color: Colors.green,
                        size: sizeAnimation.value,
                      ),
                    ),
                    AnimatedSize(
                      curve: Curves.linear,
                      duration: const Duration(seconds: 3),
                      child: Icon(
                        Icons.circle,
                        color: Colors.yellow,
                        size: sizeAnimation.value,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Tugagan :)
