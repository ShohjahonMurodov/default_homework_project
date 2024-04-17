import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/data/local/local_database.dart';
import 'package:homework/utils/size_utils.dart';

class RecordsScreen extends StatefulWidget {
  const RecordsScreen({Key? key}) : super(key: key);

  @override
  State<RecordsScreen> createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 30.sp,
          ),
        ),
        title: Text(
          "Game History",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: LocalDatabaseHelper().getAllGameData(),
        // Get all game data from local database
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else {
            final List<Map<String, dynamic>>? gameDataList = snapshot.data;
            if (gameDataList != null && gameDataList.isNotEmpty) {
              return ListView.builder(
                itemCount: gameDataList.length,
                itemBuilder: (context, index) {
                  final gameData = gameDataList[index];
                  return Column(
                    children: [
                      ListTile(
                        title: Row(
                          children: [
                            Text(
                              "${index + 1}",
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            15.getW(),
                            Text(
                              "Move: ${gameData['moves']}",
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            40.getW(),
                            Text(
                              "Timer: ${getMinutelyText(gameData['timer'])}",
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      10.getH(),
                    ],
                  );
                },
              );
            } else {
              return const Center(
                child: Text("No game history available."),
              );
            }
          }
        },
      ),
    );
  }
}

getMinutelyText(int datetime) {
  int min = datetime ~/ 60;
  int sec = datetime % 60;

  String minute = min.toString().length <= 1 ? "0$min" : "$min";
  String second = sec.toString().length <= 1 ? "0$sec" : "$sec";

  return "$minute : $second";
}
