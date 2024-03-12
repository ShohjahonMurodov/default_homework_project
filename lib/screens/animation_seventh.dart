import 'package:flutter/material.dart';

class AnimationSeventh extends StatefulWidget {
  const AnimationSeventh({super.key});

  @override
  State<AnimationSeventh> createState() => _AnimationSeventhState();
}

class _AnimationSeventhState extends State<AnimationSeventh> {
  bool isTrue = true;
  double fontSize = 20;
  Color color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedDefaultTextStyle(
              duration: const Duration(seconds: 1),
              curve: Curves.linear,
              style: TextStyle(
                color: color,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
              child: const Text(
                "Hello Flutter World!",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    isTrue = true;
                    fontSize = isTrue ? 70 : 20;
                    color = isTrue ? Colors.red : Colors.blue;
                  });
                },
                child: const Icon(Icons.play_arrow),
              ),
              const SizedBox(
                width: 20,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    isTrue = false;
                    fontSize = isTrue ? 70 : 20;
                    color = isTrue ? Colors.red : Colors.blue;
                  });
                },
                child: const Icon(Icons.replay_30),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Tugagan :)