import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework/bloc/game_bloc.dart';
import 'package:homework/bloc/game_state.dart';
import 'package:homework/utils/size_utils.dart';

import '../../utils/app_images.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    context.read<GameBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BlocBuilder<GameBloc, GameState>(
        builder: (context, state) {
          return Stack(
            children: [
              // Background image
              Image.asset(
                AppImages.image,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Row(
                    //   children: [
                    //     Container(
                    //       width: 50.w,
                    //       height: 50.h,
                    //       child: Image.network(
                    //         state.allQuestions[state.currentQuestionIndex]
                    //             .images[0],
                    //       ),
                    //     ),
                    //     Container(
                    //       width: 50.w,
                    //       height: 50.h,
                    //       child: Image.network(
                    //         state.allQuestions[state.currentQuestionIndex]
                    //             .images[1],
                    //       ),
                    //     ),
                    //     Container(
                    //       width: 50.w,
                    //       height: 50.h,
                    //       child: Image.network(
                    //         state.allQuestions[state.currentQuestionIndex]
                    //             .images[2],
                    //       ),
                    //     ),
                    //     Container(
                    //       width: 50.w,
                    //       height: 50.h,
                    //       child: Image.network(
                    //         state.allQuestions[state.currentQuestionIndex]
                    //             .images[3],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(height: 50),
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        ...List.generate(
                          state.allQuestions.length,
                          (index) => Container(
                            margin: EdgeInsets.only(right: 10.w, bottom: 10.h),
                            width: 50,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Center(
                              child: Text(
                                "",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(state.enteredAnswer),
                    const SizedBox(height: 20),
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: List.generate(
                        state.letterList.length,
                        (index) {
                          print(state.letterList.length);
                          return alphabetButton(
                            title: state.letterList[index],
                            onPressed: () {},
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

Widget alphabetButton({
  required String title,
  required VoidCallback onPressed,
}) {
  return Container(
    margin: const EdgeInsets.only(right: 10, bottom: 10),
    width: 50,
    height: 60,
    child: TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: onPressed,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}
