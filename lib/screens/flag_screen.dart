import 'dart:math';

import 'package:flutter/material.dart';

class FlagScreen extends StatefulWidget {
  const FlagScreen({super.key});

  @override
  State<FlagScreen> createState() => _FlagScreenState();
}

class _FlagScreenState extends State<FlagScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          color: Colors.white,
          child: CustomPaint(
            size: const Size(300, 200),
            painter: FlagPainter(sweepAngle: 3.4 * pi / 4),
          ),
        ),
      ),
    );
  }
}

class FlagPainter extends CustomPainter {
  FlagPainter({required this.sweepAngle});

  final double sweepAngle;

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect =
        Offset(size.width * 0.01, size.height / 20.0) & const Size(40, 50);
    const startAngle = 8.1;

    final radius = min(size.width, size.height) / 2.5;
    final center = Offset(size.width / 2, size.height / 2);

    final bluePaint = Paint()..color = Colors.blue;
    final whitePaint = Paint()..color = Colors.white;
    final greenPaint = Paint()..color = Colors.green;
    final redPaint = Paint()..color = Colors.red;

    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height * 1 / 3), bluePaint);

    canvas.drawRect(
        Rect.fromLTWH(0, size.height * 1 / 3, size.width, size.height * 1 / 3),
        whitePaint);

    canvas.drawRect(
        Rect.fromLTWH(0, size.height * 2 / 3, size.width, size.height * 1 / 3),
        greenPaint);

    canvas.drawRect(
        Rect.fromLTWH(0, size.height * 1 / 3, size.width, 4), redPaint);
    canvas.drawRect(
        Rect.fromLTWH(0, size.height * 2 / 3 - 1, size.width, 4), redPaint);

    // 1- qator
    canvas.drawCircle(Offset(center.dx - radius / 1.2, center.dy - radius / 1),
        5, Paint()..color = Colors.white);
    canvas.drawCircle(Offset(center.dx - radius / 2, center.dy - radius / 1), 5,
        Paint()..color = Colors.white);
    canvas.drawCircle(Offset(center.dx - radius / 5, center.dy - radius / 1), 5,
        Paint()..color = Colors.white);

    // 2 - qator
    canvas.drawCircle(
        Offset(center.dx - radius / 0.87, center.dy - radius / 1.3),
        5,
        Paint()..color = Colors.white);
    canvas.drawCircle(
        Offset(center.dx - radius / 1.2, center.dy - radius / 1.3),
        5,
        Paint()..color = Colors.white);
    canvas.drawCircle(Offset(center.dx - radius / 2, center.dy - radius / 1.3),
        5, Paint()..color = Colors.white);
    canvas.drawCircle(Offset(center.dx - radius / 5, center.dy - radius / 1.3),
        5, Paint()..color = Colors.white);

    // 3 - qator
    canvas.drawCircle(
        Offset(center.dx - radius / 0.68, center.dy - radius / 1.8),
        5,
        Paint()..color = Colors.white);
    canvas.drawCircle(
        Offset(center.dx - radius / 0.87, center.dy - radius / 1.8),
        5,
        Paint()..color = Colors.white);
    canvas.drawCircle(
        Offset(center.dx - radius / 1.2, center.dy - radius / 1.8),
        5,
        Paint()..color = Colors.white);
    canvas.drawCircle(Offset(center.dx - radius / 2, center.dy - radius / 1.8),
        5, Paint()..color = Colors.white);
    canvas.drawCircle(Offset(center.dx - radius / 5, center.dy - radius / 1.8),
        5, Paint()..color = Colors.white);
    canvas.drawArc(
        rect, startAngle, sweepAngle, false, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
