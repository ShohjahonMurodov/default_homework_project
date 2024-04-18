import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:homework/screens/records/records_screen.dart';
import 'package:homework/utils/size_utils.dart';

import '../puzzle_games_controller.dart';

class PuzzlePage extends StatefulWidget {
  const PuzzlePage({super.key});

  @override
  State<PuzzlePage> createState() => _PuzzlePageState();
}

class _PuzzlePageState extends State<PuzzlePage> {
  final PuzzleController controller = Get.put(PuzzleController());

  @override
  void initState() {
    controller.timerLogic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "15 PUZZLE",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (!controller.isGame) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RecordsScreen(),
                  ),
                );
              }
            },
            icon: Icon(
              Icons.history,
              size: 30.sp,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: Colors.grey.shade900,
              ),
              width: double.infinity,
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
              height: 390.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: Colors.grey.shade900,
              ),
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
                          AlertDialog.adaptive(
                            backgroundColor: Colors.grey.shade800,
                            title: Text(
                              'Congratulations!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            content: Text(
                              'You solved the puzzle!',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            actions: [
                              TextButton(
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                  ),
                                ),
                                onPressed: () {
                                  controller.isTrue = true;
                                  controller.timerLogic();
                                  controller.tiles.shuffle();
                                  Get.back();
                                },
                                child: Text(
                                  'Play Again',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: controller.tiles[index] == 15
                            ? Colors.transparent
                            : Colors.blueGrey,
                      ),
                      margin: const EdgeInsets.all(4.0),
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () {
          if (!controller.isGame) {
            controller.isTrue = true;
            controller.timerLogic();
            controller.tiles.shuffle();
            Get.back();
          }
        },
        child: Icon(
          Icons.gamepad_outlined,
          size: 30.sp,
          color: Colors.white,
        ),
      ),
    );
  }
}
