import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework/cubit/timer/timer_state.dart';
import 'package:homework/screens/splash/splash_screen.dart';

import '../../data/local/local_variable.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerInitialState());

  Future<void> timerLogic(int count, BuildContext context) async {
    emit(TimerLinearState());
    isTrue = false;
    for (int i = count; i >= 0; i--) {
      isStart = true;
      emit(TimerResultState(i));
      await Future.delayed(const Duration(seconds: 1));
    }
    isTrue = true;
    isStart = false;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      ),
    );
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
