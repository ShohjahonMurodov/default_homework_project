import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class SnowBallScreen extends StatefulWidget {
  const SnowBallScreen({super.key});

  @override
  State<SnowBallScreen> createState() => _SnowBallScreenState();
}

class _SnowBallScreenState extends State<SnowBallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          color: Colors.grey.shade200,
          child: CustomPaint(
            size: const Size(300, 400),
            painter: SnowBallPainter(
              sweepAngle: 3.3 * pi / 2,
              mouseSweepAngle: 1 * pi / 2,
            ),
          ),
        ),
      ),
    );
  }
}

class SnowBallPainter extends CustomPainter {
  SnowBallPainter({required this.sweepAngle, required this.mouseSweepAngle});

  final double sweepAngle;
  final double mouseSweepAngle;

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect =
        Offset(size.width * 0.1, size.height / 3) & const Size(240, 240);
    const startAngle = 5.28;

    Rect mouseRect =
        Offset(size.width * 0.34, size.height / 7) & const Size(100, 100);
    const mouseStartAngle = 7.05;

    Paint paint = Paint();

    paint.color = Colors.black;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 5;

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 4),
      80,
      paint,
    );

    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
    canvas.drawArc(mouseRect, mouseStartAngle, mouseSweepAngle, false, paint);

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 1.8),
      15,
      Paint()..color = Colors.black,
    );
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 1.5),
      15,
      Paint()..color = Colors.black,
    );
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 1.29),
      15,
      Paint()..color = Colors.black,
    );
    canvas.drawCircle(
      Offset(size.width / 2.5, size.height / 5),
      15,
      paint,
    );
    canvas.drawCircle(
      Offset(size.width / 1.7, size.height / 5),
      15,
      paint,
    );
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 1.5),
      12,
      Paint()..color = Colors.black,
    );
    canvas.drawCircle(
      Offset(size.width / 1.68, size.height / 4.85),
      12,
      Paint()..color = Colors.black,
    );
    canvas.drawCircle(
      Offset(size.width / 2.45, size.height / 4.85),
      12,
      Paint()..color = Colors.black,
    );

    const points = [
      Offset(70, 165),
      Offset(0, 100),
      Offset(230, 165),
      Offset(300, 100),
      Offset(20, 120),
      Offset(0, 120),
      Offset(280, 120),
      Offset(300, 120),
    ];

    canvas.drawPoints(
      PointMode.lines,
      points,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
