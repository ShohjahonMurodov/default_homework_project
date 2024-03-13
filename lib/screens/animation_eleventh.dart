import 'package:flutter/material.dart';

class AnimationEleventh extends StatefulWidget {
  const AnimationEleventh({Key? key}) : super(key: key);

  @override
  State<AnimationEleventh> createState() => _AnimationEleventhState();
}

class _AnimationEleventhState extends State<AnimationEleventh>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late final Animation<AlignmentGeometry> alignment;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);

    alignment = Tween<AlignmentGeometry>(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.bounceInOut,
      ),
    );

    animationController.forward();
  }


  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AlignTransition"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              color: const Color(0xFFD8D8FF),
              width: 300,
              height: 300,
              child: AlignTransition(
                alignment: alignment,
                child: Container(
                  color: Colors.green,
                  child: const Text(
                    "Woolha.com",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Change Alignment",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
