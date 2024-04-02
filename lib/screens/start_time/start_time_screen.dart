import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/cubit/timer/timer_cubit.dart';
import 'package:homework/cubit/timer/timer_state.dart';
import 'package:homework/utils/size_utils.dart';
import '../../data/local/local_variable.dart';

class StartTimeScreen extends StatefulWidget {
  const StartTimeScreen({super.key, required this.minutes, required this.tag});

  final int minutes;
  final String tag;

  @override
  State<StartTimeScreen> createState() => _StartTimeScreenState();
}

class _StartTimeScreenState extends State<StartTimeScreen> {
  final TextEditingController tagController = TextEditingController();

  @override
  void initState() {
    tagController.text = widget.tag;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            if (isTrue) {
              Navigator.pop(context);
            }
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          100.getH(),
          BlocBuilder<TimerCubit, TimerState>(
            builder: (context, state) {
              switch (state.runtimeType) {
                case TimerInputErrorState:
                  {
                    state as TimerInputErrorState;
                    Future.microtask(
                      () => ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.errorText),
                        ),
                      ),
                    );
                  }
                case TimerLinearState:
                  {
                    return const Center(
                      child: Text("Timer linearing..."),
                    );
                  }
                case TimerResultState:
                  {
                    state as TimerResultState;
                    return Column(
                      children: [
                        Text(
                          "Vaqt tugadi. Vazifani topshiring",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        50.getH(),
                        Center(
                          child: Stack(
                            children: [
                              SizedBox(
                                width: 280.w,
                                height: 280.h,
                                child: CircularProgressIndicator(
                                  value: widget.minutes.toDouble(),
                                  backgroundColor: Colors.white,
                                  strokeWidth: 3.w,
                                  color: const Color(0xFF00696B),
                                ),
                              ),
                              Positioned(
                                top: 100.h,
                                left: 38.w,
                                child: Center(
                                  child: Text(
                                    getMinutelyText(state.result),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 57.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
              }
              return const Center(
                child: Text("Default, Initial state"),
              );
            },
          ),
          55.getH(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: TextField(
              readOnly: true,
              controller: tagController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.cancel_outlined,
                    color: Colors.black,
                  ),
                ),
                filled: true,
                fillColor: const Color(0xFFDDE4E3),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4.r),
                    topRight: Radius.circular(4.r),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4.r),
                    topRight: Radius.circular(4.r),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 66.w),
            child: Text(
              "What you are working on",
              style: TextStyle(
                color: const Color(0xFF49454F),
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          46.getH(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.w),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  backgroundColor: const Color(0xFF00696B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                ),
                onPressed: () {
                  context.read<TimerCubit>().timerLogic(widget.minutes);
                },
                child: Text(
                  "Start",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

getMinutelyText(int timeInMinute) {
  int hour = timeInMinute ~/ 60;
  int min = timeInMinute % 60;

  String hours = hour.toString().length <= 1 ? "0$hour" : "$hour";
  String minute = min.toString().length <= 1 ? "0$min" : "$min";

  return "$hours : $minute";
}
