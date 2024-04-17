import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/utils/app_images.dart';
import 'package:homework/screens/game/game_controller.dart';
import 'package:homework/utils/size_utils.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen>
    with SingleTickerProviderStateMixin {
  late Animation<Alignment> animationAlign;
  final GameController controller = Get.put(GameController());

  @override
  void initState() {
    globalAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    animationAlign = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
          tween: Tween(begin: Alignment.center, end: Alignment.centerLeft),
          weight: 40),
      TweenSequenceItem<Alignment>(
          tween: Tween(begin: Alignment.centerLeft, end: Alignment.center),
          weight: 40),
      TweenSequenceItem<Alignment>(
          tween: Tween(begin: Alignment.centerRight, end: Alignment.center),
          weight: 40),
    ]).animate(CurvedAnimation(
        parent: globalAnimationController, curve: Curves.decelerate));

    globalAnimationController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            // Background image
            Image.asset(
              AppImages.images,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 50.h,
              left: 158.w,
              child: Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(
                    color: Colors.black,
                    width: 2.w,
                  ),
                ),
                child: Center(
                  child: Text(
                    "${controller.currentIndex.value + 1}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    controller.currentQuestion,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Align(
                    alignment: animationAlign.value,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        ...List.generate(
                          controller.currentAnswer.length,
                          (index) => Container(
                            margin: EdgeInsets.only(right: 10.w, bottom: 10.h),
                            width: 50,
                            height: 60,
                            decoration: BoxDecoration(
                              color: index < controller.inputAnswer.value.length
                                  ? Colors.deepPurple
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                width: 3,
                                color: isStartAnimation
                                    ? Colors.red
                                    : Colors.deepPurple,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                index < controller.inputAnswer.value.length
                                    ? controller.inputAnswer.value[index]
                                    : "",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: List.generate(
                      controller.shuffledLetters.length,
                      (index) {
                        print(controller.shuffledLetters.length);
                        return alphabetButton(
                          title: controller.shuffledLetters[index],
                          onPressed: () {
                            controller
                                .addLetter(controller.shuffledLetters[index]);
                            controller.removeAlphabet(
                                controller.shuffledLetters[index]);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 60.w,
        height: 60.h,
        child: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          onPressed: controller.removeLastLetter,
          child: Icon(
            Icons.backspace,
            color: Colors.white,
            size: 25.sp,
          ),
        ),
      ),
    );
  }

  Widget alphabetButton({
    required String title,
    required VoidCallback onPressed,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 10, bottom: 10),
      width: 50,
      height: 60,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

late AnimationController globalAnimationController;
bool isStartAnimation = false;
