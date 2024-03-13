import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimationTweleveth extends StatefulWidget {
  const AnimationTweleveth({super.key});

  @override
  State<AnimationTweleveth> createState() => _AnimationTwelevethState();
}

class _AnimationTwelevethState extends State<AnimationTweleveth> {
  Alignment alignment = Alignment.center;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 300.h,
            width: double.infinity,
            child: AnimatedAlign(
              alignment: alignment,
              duration: const Duration(seconds: 3),
              curve: Curves.linear,
              child: Container(
                height: 100,
                width: 100,
                color: Colors.red,
              ),
            ),
          ),
          const SizedBox(height: 100),
          Column(
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 17),
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    alignment = Alignment.topCenter;
                  });
                },
                child: const Icon(
                  Icons.keyboard_arrow_up,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 17),
                      backgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        alignment = Alignment.centerLeft;
                      });
                    },
                    child: const Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 17),
                      backgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        alignment = Alignment.center;
                      });
                    },
                    child: const Icon(
                      Icons.circle,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 17),
                      backgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        alignment = Alignment.centerRight;
                      });
                    },
                    child: const Icon(
                      Icons.keyboard_arrow_right_outlined,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 17),
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    alignment = Alignment.bottomCenter;
                  });
                },
                child: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
