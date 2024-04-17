import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:homework/data/local/local_database.dart';
import 'package:homework/data/models/puzzle_model.dart';
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
      body: Obx(
        () => Column(
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
                    onTap: () async {
                      controller.moveTile(index);
                      if (controller.isSorted()) {
                        await LocalDatabase.insertNote(
                          PuzzleModel(
                              count: controller.counter.value,
                              dateTime: controller.datetime.value),
                        );
                        Get.dialog(
                          AlertDialog(
                            title: const Text('Congratulations!'),
                            content: const Text('You solved the puzzle!'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  controller.isTrue = true;
                                  controller.timerLogic();
                                  controller.tiles.shuffle();
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
      ),
    );
  }
}
