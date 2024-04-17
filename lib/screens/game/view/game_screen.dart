import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/utils/app_images.dart';
import 'package:homework/screens/game/game_controller.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameController controller = Get.put(GameController());

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
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Display the current riddle
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
                  // Display the answer spaces
                  Wrap(
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
                              color: Colors.deepPurple,
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
                  const SizedBox(height: 20),
                  // Display the random alphabet buttons
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: List.generate(
                      controller.shuffledLetters.length,
                      (index) => alphabetButton(
                        title: controller.shuffledLetters[index],
                        onPressed: () => controller
                            .addLetter(controller.shuffledLetters[index]),
                      ),
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
