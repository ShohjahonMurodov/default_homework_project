import 'dart:math';

import 'package:get/get.dart';

class GameController extends GetxController {
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

  List<String> randomWords = [];

  toRandomWord(String riddleAnswer) {
    for (int i = 0; i < riddleAnswer.length; i++) {
      randomWords.add(riddleAnswer[i]);
    }

    Random random = Random();

    for (int i = 0; i < 5; i++) {
      int randomIndex = random.nextInt(alphabet.length);
      String randomLetter = alphabet[randomIndex];
      randomWords.add(randomLetter);
    }
    randomWords.shuffle();

    return randomWords;
  }

  toCheck(String riddleAnswer, String answer) {
    if (riddleAnswer == answer) {
      return true;
    }
    return false;
  }
}
