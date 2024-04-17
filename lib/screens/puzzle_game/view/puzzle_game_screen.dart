import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:homework/screens/puzzle_game/puzzle_games_controller.dart';
import 'package:homework/screens/records/records_screen.dart';
import 'package:homework/utils/size_utils.dart';

class PuzzlePage extends StatelessWidget {
  final PuzzleController _controller = PuzzleController();

  PuzzlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade800,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          elevation: 0,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RecordsScreen(),
                  ),
                );
              },
              child: Text(
                "RECORDS",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: PuzzleBoard(controller: _controller),
        ),
      ),
    );
  }
}

class PuzzleBoard extends StatefulWidget {
  final PuzzleController controller;

  const PuzzleBoard({super.key, required this.controller});

  @override
  State<PuzzleBoard> createState() => _PuzzleBoardState();
}

class _PuzzleBoardState extends State<PuzzleBoard> {
  @override
  void initState() {
    widget.controller.timerLogic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return GetBuilder<PuzzleController>(
      init: widget.controller,
      builder: (controller) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: double.infinity,
            color: Colors.grey.shade900,
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: 20.h,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "MOVES",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      controller.counter.toString(),
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                10.getH(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "TIME",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      controller.getMinutelyText(controller.datetime.value),
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.grey.shade900,
            height: 390.h,
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemCount: 16,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    controller.moveTile(index);
                    if (controller.isSorted()) {
                      Get.dialog(
                        AlertDialog(
                          title: const Text('Congratulations!'),
                          content: const Text('You solved the puzzle!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                controller.shuffleTiles();
                                Get.back();
                              },
                              child: const Text('Play Again'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.all(4.0),
                    color: controller.tiles[index] == 15
                        ? Colors.transparent
                        : Colors.blueGrey,
                    child: Center(
                      child: Text(
                        '${controller.tiles[index] == 15 ? '' : controller.tiles[index] + 1}',
                        style: TextStyle(
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
