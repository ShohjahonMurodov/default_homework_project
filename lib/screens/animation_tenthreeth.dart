import 'package:flutter/material.dart';

class AnimationTenThreeth extends StatefulWidget {
  const AnimationTenThreeth({super.key});

  @override
  State<AnimationTenThreeth> createState() => _AnimationTenThreethState();
}

class _AnimationTenThreethState extends State<AnimationTenThreeth>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> borderAnimation;
  late Animation<double> radiusAnimation;
  late Animation colorAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    borderAnimation = Tween<double>(begin: 1.0, end: 10.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.linear,
        reverseCurve: Curves.linear,
      ),
    );

    radiusAnimation = Tween<double>(begin: 100.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn,
        reverseCurve: Curves.linearToEaseOut,
      ),
    );

    colorAnimation = ColorTween(begin: Colors.yellow, end: Colors.blue).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.linear,
        reverseCurve: Curves.linear,
      ),
    );

    animationController.addListener(() {
      setState(() {});
    });

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
        child: AnimatedContainer(
          curve: Curves.linear,
          width: 200,
          height: 200,
          duration: const Duration(seconds: 1),
          decoration: BoxDecoration(
            color: colorAnimation.value,
            borderRadius: BorderRadius.circular(
              radiusAnimation.value,
            ),
            border: Border.all(
              color: Colors.red,
              width: borderAnimation.value,
            ),
          ),
        ),
      ),
    );
  }
}
