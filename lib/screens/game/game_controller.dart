import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:homework/data/models/game_models.dart';

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
      riddle: "Shohjahonning ismi nima?",
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
  ];

  @override
  void onInit() {
    super.onInit();
    shuffleLetters();
  }

  void shuffleLetters() {
    shuffledLetters = currentAnswer.split('')..shuffle();

    Random random = Random();

    for (int i = 0; i < 5; i++) {
      int randomIndex = random.nextInt(alphabet.length);
      String randomLetter = alphabet[randomIndex];
      shuffledLetters.add(randomLetter);
    }
    shuffledLetters.shuffle();
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

  void removeLastLetter() {
    if (inputAnswer.value.isNotEmpty) {
      inputAnswer.value = inputAnswer.value.substring(0, inputAnswer.value.length - 1);
    }
  }

  void checkAnswer() {
    if (inputAnswer.value == currentAnswer) {
      errorMessage.value = "To'g'ri!";
      nextQuestion();
    } else if (inputAnswer.value.length == currentAnswer.length) {
      errorMessage.value = "Xato javob";
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
            'GetX Dialog',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          content: Text(
            'This is a GetX dialog.',
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
