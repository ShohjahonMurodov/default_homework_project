import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/bloc/game_bloc.dart';
import 'package:homework/screens/game/game_screen.dart';
import 'package:homework/screens/widgets/button_items.dart';
import 'package:homework/screens/widgets/image_items.dart';
import 'package:homework/utils/size_utils.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "4 Pics 1 Word",
              style: TextStyle(
                color: Colors.white,
                fontSize: 50.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          20.getH(),
          Wrap(
            children: [
              ...List.generate(
                questions[0].images.length,
                (index) => ImageItems(
                  image: questions[0].images[index],
                ),
              ),
            ],
          ),
          50.getH(),
          ButtonItems(
            title: "PLAY",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GameScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
