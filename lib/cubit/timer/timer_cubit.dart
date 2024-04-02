import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework/cubit/timer/timer_state.dart';

import '../../data/local/local_variable.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerInitialState());

  Future<void> timerLogic(int count) async {
    emit(TimerLinearState());
    for (int i = count; i > 0; i--) {
      emit(TimerResultState(i));
      await Future.delayed(const Duration(seconds: 1));
    }
    isTrue = true;
  }

  void getMinutelyText(int timeInMinute) {
    emit(TimerLinearState());
    int hour = timeInMinute ~/ 60;
    int min = timeInMinute % 60;

    String hours = hour.toString().length <= 1 ? "0$hour" : "$hour";
    String minute = min.toString().length <= 1 ? "0$min" : "$min";

    emit(TimerHourAndMinute("$hours : $minute"));
  }
}
