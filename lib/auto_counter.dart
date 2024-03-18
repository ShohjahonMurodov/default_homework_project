import 'package:flutter/material.dart';
import 'package:homework/auto_view_model.dart';
import 'package:provider/provider.dart';

class AutoCounterScreen extends StatefulWidget {
  const AutoCounterScreen({super.key});

  @override
  State<AutoCounterScreen> createState() => _AutoCounterScreenState();
}

class _AutoCounterScreenState extends State<AutoCounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          context.watch<AutoViewModel>().count.toString(),
        ),
      ),
    );
  }
}
