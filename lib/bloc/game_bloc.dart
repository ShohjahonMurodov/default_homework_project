import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework/bloc/game_event.dart';
import 'package:homework/bloc/game_state.dart';
import 'package:homework/data/models/game_models.dart';
import 'package:homework/data/repositories/game_repositories.dart';
import 'package:homework/services/service_locator.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc()
      : super(
          const GameState(
            currentQuestionIndex: 0,
            allQuestions: [],
            trueCount: 0,
            enteredAnswer: "",
            letterList: [],
          ),
        ) {
    setUpDI();
    on<LoadQuestionsEvent>(onInit);
    on<NextQuestionsEvent>(onNext);
    on<CollectEnteredLetterEvent>(onCollect);
  }

  onInit(LoadQuestionsEvent event, emit) {
    List<GameModels> questions = locator.get<GameRepository>().questions;
    String answerText = questions[state.currentQuestionIndex].trueAnswer;

    emit(
      state.copyWith(
        allQuestions: questions,
        letterList: getOptionLetters(answerText),
      ),
    );
  }

  onNext(NextQuestionsEvent event, emit) {
    if (state.enteredAnswer.toLowerCase() ==
        state.allQuestions[state.currentQuestionIndex].trueAnswer
            .toLowerCase()) {
      if (state.allQuestions.length - 1 >= state.currentQuestionIndex + 1) {
        int newQuestionIndex = state.currentQuestionIndex + 1;
        emit(
          state.copyWith(
            letterList: getOptionLetters(
                state.allQuestions[newQuestionIndex].trueAnswer),
            trueCount: state.trueCount + 1,
            currentQuestionIndex: newQuestionIndex,
            enteredAnswer: "",
          ),
        );
      }
    }
  }

  onCollect(CollectEnteredLetterEvent event, emit) {
    if (state.allQuestions[state.currentQuestionIndex].trueAnswer.length >
        state.enteredAnswer.length) {
      emit(state.copyWith(enteredAnswer: state.enteredAnswer + event.letter));
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
