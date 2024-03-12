import 'package:flutter/material.dart';

class AnimationFifth extends StatefulWidget {
  const AnimationFifth({super.key});

  @override
  State<AnimationFifth> createState() => _AnimationFifthState();
}

class _AnimationFifthState extends State<AnimationFifth> {
  bool isTrue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: InkWell(
          onTap: () {
            setState(() {
              isTrue = !isTrue;
            });
          },
          child: AnimatedContainer(
            height: 200,
            duration: const Duration(seconds: 3),
            color: Colors.blue,
            width: isTrue ? 400 : 100,
          ),
        ),
      ),
    );
  }
}


/// Tugagan :)