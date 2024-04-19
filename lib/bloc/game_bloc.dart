import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework/bloc/game_event.dart';
import 'package:homework/bloc/game_state.dart';
import 'package:homework/data/models/game_models.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc()
      : super(
          GameState(
            currentQuestionIndex: 0,
            allQuestions: questions,
            trueCount: 0,
            enteredAnswer: "",
            letterList: [],
          ),
        ) {
    on<LoadQuestionsEvent>(onInit);
    on<NextQuestionsEvent>(onNext);
    on<CollectEnteredLetterEvent>(onCollect);
    on<RemoveEvent>(onRemove);
  }

  onInit(LoadQuestionsEvent event, emit) {
    String answerText = questions[state.currentQuestionIndex].trueAnswer;

    emit(
      state.copyWith(
        allQuestions: questions,
        letterList: getOptionLetters(answerText),
      ),
    );
  }

  onRemove(RemoveEvent event, emit) {
    emit(
      state.copyWith(
        enteredAnswer: state.enteredAnswer.replaceAll(event.alphabet, ""),
      ),
    );
  }

  onNext(NextQuestionsEvent event, emit) {
    if (state.currentQuestionIndex < questions.length - 1) {
      int newQuestionIndex = state.currentQuestionIndex + 1;
      getOptionLetters(
          state.allQuestions[state.currentQuestionIndex].trueAnswer);
      emit(state.copyWith(currentQuestionIndex: newQuestionIndex));
      emit(
        state.copyWith(
          enteredAnswer: "",
          letterList:
              getOptionLetters(state.allQuestions[newQuestionIndex].trueAnswer),
        ),
      );
    } else {
      print("6546565654");
    }
  }

  onCollect(CollectEnteredLetterEvent event, emit) {
    String text = state.enteredAnswer;
    text += event.letter;
    emit(state.copyWith(enteredAnswer: text));
    if (state.enteredAnswer ==
        state.allQuestions[state.currentQuestionIndex].trueAnswer) {
      add(const NextQuestionsEvent());
    } else if (state.enteredAnswer.length ==
        state.allQuestions[state.currentQuestionIndex].trueAnswer.length) {
      emit(
        state.copyWith(
          enteredAnswer: "",
        ),
      );
    }
  }
}

String alphabet = "qwertyuiopasdfghjklzxcvbnm";

List<String> getOptionLetters(String answerText) {
  int len = answerText.length;

  for (int i = 0; i < (12 - len); i++) {
    Random random = Random();
    int index = random.nextInt(26);
    answerText += alphabet[index];
  }
  List<String> letterList = answerText.split('');
  letterList.shuffle();
  debugPrint("LENGTH:${letterList.length}:$letterList");
  return letterList;
}

List<GameModels> questions = [
  GameModels(
    trueAnswer: "sut",
    images: [
      "https://s0.rbk.ru/v6_top_pics/media/img/0/78/756801770042780.webp",
      "https://c.files.bbci.co.uk/517E/production/_109926802_milkcow.jpg",
      "https://thumbs.dreamstime.com/b/goat-11661115.jpg",
      "https://cdn.cdnparenting.com/articles/2018/01/158543912-H-1024x700.webp",
    ],
  ),
  GameModels(
    trueAnswer: "avtomobil",
    images: [
      "https://img.freepik.com/free-photo/sports-car-driving-asphalt-road-night-generative-ai_188544-8052.jpg",
      "https://media.architecturaldigest.com/photos/63079fc7b4858efb76814bd2/16:9/w_4000,h_2250,c_limit/9.%20DeLorean-Alpha-5%20%5BDeLorean%5D.jpg",
      "https://www.rbc.ua/static/img/t/u/tusimple_autonomous_truck_1200x675.jpg",
      "https://s0.rbk.ru/v6_top_pics/media/img/7/70/755254270044707.jpg",
    ],
  ),
];
