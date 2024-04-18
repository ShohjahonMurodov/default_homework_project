import 'package:equatable/equatable.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();
}

class LoadQuestionsEvent extends GameEvent {
  @override
  List<Object?> get props => [];
}

class NextQuestionsEvent extends GameEvent {
  const NextQuestionsEvent();

  @override
  List<Object?> get props => [];
}

class CollectEnteredLetterEvent extends GameEvent {
  const CollectEnteredLetterEvent(this.letter);

  final String letter;

  @override
  List<Object?> get props => [letter];
}
