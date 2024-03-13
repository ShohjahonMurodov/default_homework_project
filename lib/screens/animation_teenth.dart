import 'package:flutter/material.dart';

class AnimationTeenth extends StatefulWidget {
  const AnimationTeenth({Key? key}) : super(key: key);

  @override
  _AnimationTeenthState createState() => _AnimationTeenthState();
}

class _AnimationTeenthState extends State<AnimationTeenth>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation colorAnimation;
  late Animation containerAnimation;
  late Animation borderAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    colorAnimation = ColorTween(begin: Colors.orange, end: Colors.deepOrange)
        .animate(animationController);

    containerAnimation = ColorTween(begin: Colors.yellow, end: Colors.pink)
        .animate(animationController);

    borderAnimation =
        Tween<double>(begin: 5.0, end: 50.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
      reverseCurve: Curves.bounceIn,
    ))
          ..addListener(() {
            print("CONTROLLER VALUE: ${animationController.value}");
          });

    animationController.addListener(() {
      setState(() {});
    });

    animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation Demo"),
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: containerAnimation.value,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: colorAnimation.value,
              width: borderAnimation.value,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade700,
                blurRadius: 40,
                spreadRadius: 5,
                offset: Offset(20, 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
