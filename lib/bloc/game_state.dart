import 'package:equatable/equatable.dart';
import 'package:homework/data/models/game_models.dart';

class GameState extends Equatable {
  const GameState({
    required this.currentQuestionIndex,
    required this.allQuestions,
    required this.trueCount,
    required this.enteredAnswer,
    required this.letterList,
    required this.isStartAnimation,
  });

  final int currentQuestionIndex;
  final List<GameModels> allQuestions;
  final int trueCount;
  final List<String> letterList;
  final String enteredAnswer;
  final bool isStartAnimation;

  GameState copyWith({
    int? currentQuestionIndex,
    List<GameModels>? allQuestions,
    int? trueCount,
    List<String>? letterList,
    String? enteredAnswer,
    bool? isStartAnimation,
  }) {
    return GameState(
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      allQuestions: allQuestions ?? this.allQuestions,
      trueCount: trueCount ?? this.trueCount,
      letterList: letterList ?? this.letterList,
      enteredAnswer: enteredAnswer ?? this.enteredAnswer,
      isStartAnimation: isStartAnimation ?? this.isStartAnimation,
    );
  }

  @override
  List<Object?> get props => [
        allQuestions,
        currentQuestionIndex,
        trueCount,
        letterList,
        enteredAnswer,
        isStartAnimation,
      ];
}
