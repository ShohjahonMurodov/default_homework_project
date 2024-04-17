import 'package:flutter/material.dart';
import 'package:homework/data/local/local_database.dart';
import 'package:homework/data/models/puzzle_model.dart';

class RecordsScreen extends StatefulWidget {
  const RecordsScreen({super.key});

  @override
  State<RecordsScreen> createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {
  List<PuzzleModel> puzzleModel = [];

  _init() async {
    puzzleModel = await LocalDatabase.getAllNotes();
    setState(() {});
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ...List.generate(
            puzzleModel.length,
            (index) {
              print("${puzzleModel.length}--------------------------------");
              return Text(
                puzzleModel[index].count.toString(),
              );
            },
          ),
        ],
      ),
    );
  }
}
