import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();
}

class LoadQuestionsEvent extends GameEvent {
  @override
  List<Object?> get props => [];
}

class StartAnimationEvent extends GameEvent {
  const StartAnimationEvent(this.isStartAnimation);

  final bool isStartAnimation;

  @override
  List<Object?> get props => [isStartAnimation];
}

class NextQuestionsEvent extends GameEvent {
  NextQuestionsEvent(this.context);

  BuildContext context;

  @override
  List<Object?> get props => [context];
}

class CollectEnteredLetterEvent extends GameEvent {
  CollectEnteredLetterEvent(this.letter, this.context);

  final String letter;
  BuildContext context;

  @override
  List<Object?> get props => [letter, context];
}

class RemoveEvent extends GameEvent {
  const RemoveEvent(this.alphabet);

  final String alphabet;

  @override
  List<Object?> get props => [alphabet];
}
