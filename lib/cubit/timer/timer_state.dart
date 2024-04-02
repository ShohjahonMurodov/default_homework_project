abstract class TimerState {}

class TimerInitialState extends TimerState {}

class TimerResultState extends TimerState {
  int result;

  TimerResultState(this.result);
}

class TimerLinearState extends TimerState {}

class TimerInputErrorState extends TimerState {
  final String errorText;

  TimerInputErrorState(this.errorText);
}

class TimerHourAndMinute extends TimerState {
  final String timerHourAndState;

  TimerHourAndMinute(this.timerHourAndState);
}
