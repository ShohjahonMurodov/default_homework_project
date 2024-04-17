import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:homework/data/models/game_models.dart';
import 'package:homework/screens/game/view/game_screen.dart';

class GameController extends GetxController {
  final questions = <GameModels>[
    GameModels(
      riddle: "Alisherning ismi nima?",
      result: "alisher",
    ),
    GameModels(
      riddle: "Suhrobning ismi nima?",
      result: "suhrob",
    ),
    GameModels(
      riddle: "Mehrojning ismi nima?",
      result: "shohjahon",
    ),
    GameModels(
      riddle: "Abubakrning ismi nima?",
      result: "abubakr",
    ),
  ].obs;

  final currentIndex = 0.obs;
  final inputAnswer = "".obs;
  final errorMessage = "".obs;
  List<String> shuffledLetters = [];

  List<String> alphabet = [
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m",
    "o",
    "p",
    "q",
    "r",
    "s",
    "t",
    "u",
    "v",
    "x",
    "y",
    "z",
  ];

  @override
  void onInit() {
    super.onInit();
    shuffleLetters();
  }

  void shuffleLetters() async {
    shuffledLetters.clear();

    for (int i = 0; i < currentAnswer.length; i++) {
      shuffledLetters.add(currentAnswer[i]);
      print(currentAnswer[i]);
    }

    Random random = Random();

    for (int i = 0; i < 5; i++) {
      int randomIndex = random.nextInt(alphabet.length);
      String randomLetter = alphabet[randomIndex];
      print(randomLetter);
      shuffledLetters.add(randomLetter);
    }
    print(currentAnswer);
    print(shuffledLetters);
    shuffledLetters.shuffle();
    print(shuffledLetters.length);
    inputAnswer.value = "";
    errorMessage.value = "";
  }

  String get currentQuestion => questions[currentIndex.value].riddle;

  String get currentAnswer => questions[currentIndex.value].result;

  void addLetter(String letter) {
    if (inputAnswer.value.length < currentAnswer.length) {
      inputAnswer.value += letter;
      checkAnswer();
    }
  }

  void removeAlphabet(String alphabet) {
    shuffledLetters.remove(alphabet);
  }

  void removeLastLetter() {
    if (inputAnswer.value.isNotEmpty) {
      String lastAlphabet = inputAnswer.substring(inputAnswer.value.length - 1);
      inputAnswer.value =
          inputAnswer.value.substring(0, inputAnswer.value.length - 1);
      shuffledLetters.add(lastAlphabet);
    }
  }

  void checkAnswer() async {
    if (inputAnswer.value == currentAnswer) {
      errorMessage.value = "True answer!";
      nextQuestion();
    } else if (inputAnswer.value.length == currentAnswer.length) {
      shuffleLetters();
      if (isStartAnimation) {
        globalAnimationController.reverse();
        isStartAnimation = false;
      } else {
        globalAnimationController.forward();
        isStartAnimation = true;
        await Future.delayed(const Duration(milliseconds: 500));
        isStartAnimation = false;
      }
      errorMessage.value = "False answer";
      inputAnswer.value = "";
    }
  }

  void nextQuestion() {
    if (currentIndex.value < questions.length - 1) {
      currentIndex.value++;
      shuffleLetters();
    } else {
      Get.dialog(
        AlertDialog(
          title: Text(
            "Natija 😎",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          content: Text(
            "Siz uddaladingiz😀😀😀",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
          actions: [
            Center(
              child: TextButton(
                style: TextButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 11.h),
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    )),
                onPressed: () {
                  currentIndex.value = 0;
                  inputAnswer.value = "";
                  errorMessage.value = "";
                  Get.back();
                },
                child: Text(
                  "Restart",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
