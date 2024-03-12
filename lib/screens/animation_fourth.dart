import 'package:flutter/material.dart';

class AnimationFourth extends StatefulWidget {
  const AnimationFourth({Key? key}) : super(key: key);

  @override
  State<AnimationFourth> createState() => _AnimationFourthState();
}

class _AnimationFourthState extends State<AnimationFourth>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Color?> colorAnimation;
  late Animation<String> textAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    colorAnimation = ColorTween(begin: Colors.orange, end: Colors.green)
        .animate(animationController);

    textAnimation = Tween<String>(
        begin: "This is first Widget", end: "This is second Widget")
        .animate(animationController);

    animationController.addListener(() {
      setState(() {});
    });

    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              color: colorAnimation.value,
              width: 200,
              height: 200,
              child: AnimatedBuilder(
                animation: textAnimation,
                builder: (context, child) {
                  return Text(
                    textAnimation.value,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.grey,
            ),
            onPressed: () {},
            child: const Text(
              "Click here",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
