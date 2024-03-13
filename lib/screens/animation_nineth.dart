import 'package:flutter/material.dart';

class AnimationNineth extends StatefulWidget {
  const AnimationNineth({super.key});

  @override
  State<AnimationNineth> createState() => _AnimationNinethState();
}

class _AnimationNinethState extends State<AnimationNineth> {
  double top = 200;
  double right = 100;
  double left = 100;
  double bottom = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: left,
              top: top,
              bottom: bottom,
              right: right,
            ),
            child: AnimatedContainer(
              duration: const Duration(seconds: 2),
              width: 200,
              height: 200,
              curve: Curves.linear,
              color: Colors.red,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              setState(() {
                top = 150;
                right = 100;
                left = 100;
                bottom = 250;
              });
            },
            child: const Text("Top"),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 85,
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    top = 2;
                    right = 100;
                    left = 100;
                    bottom = 250;
                  });
                },
                child: const Text("Left"),
              ),
              const SizedBox(
                width: 100,
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    right -= 25;
                  });
                },
                child: const Text("Left"),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              setState(() {
                bottom -= 25;
              });
            },
            child: const Text("Bottom"),
          ),
        ],
      ),
    );
  }
}
