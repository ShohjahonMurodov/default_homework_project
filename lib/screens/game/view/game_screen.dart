import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:homework/data/models/game_models.dart';
import 'package:homework/screens/game/game_controller.dart';
import 'package:homework/utils/size_utils.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> randomWords = [];

  int activeRiddle = 0;

  final controller = Get.put(GameController());

  String answer = "";

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    Widget alphabetItems({required String title}) {
      return TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 15.h,
          ),
          backgroundColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        onPressed: () {
          answer += title;
          if (answer.length == riddles[activeRiddle].result.length) {
            if (answer == riddles[activeRiddle].result) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Great"),
                ),
              );
              activeRiddle++;
              answer = "";
              setState(() {});
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Bad"),
                ),
              );
            }
          }
        },
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }

    randomWords = controller.toRandomWord(riddles[activeRiddle].result);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            riddles[activeRiddle].riddle,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          50.getH(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                riddles[activeRiddle].result.length,
                (index) => Container(
                  width: 50.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(
                      width: 3.w,
                      color: Colors.deepPurple,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      index < answer.length ? answer[index] : "",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                  controller.randomWords.length,
                  (index) => alphabetItems(
                    title: controller.randomWords[index],
                  ),
                ),
              ],
            ),
          ),

          // TextField(
          //   onChanged: (value) {
          //     if (value.length == riddles[activeRiddle].result.length) {
          //       if (value == riddles[activeRiddle].result) {
          //         ScaffoldMessenger.of(context).showSnackBar(
          //           const SnackBar(
          //             content: Text("Great"),
          //           ),
          //         );
          //         activeRiddle++;
          //         setState(() {});
          //       } else {
          //         value = "";
          //         ScaffoldMessenger.of(context).showSnackBar(
          //           const SnackBar(
          //             content: Text("Bad"),
          //           ),
          //         );
          //       }
          //     }
          //   },
          // ),
        ],
      ),
    );
  }
}
