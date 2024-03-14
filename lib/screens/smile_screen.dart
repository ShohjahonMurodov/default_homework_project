import 'dart:math';
import 'package:flutter/material.dart';

class SmileScreen extends StatefulWidget {
  const SmileScreen({super.key});

  @override
  State<SmileScreen> createState() => _SmileScreenState();
}

class _SmileScreenState extends State<SmileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 36, right: 5),
                      width: 150,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: CustomPaint(
                        size: const Size(60, 60),
                        painter: SmilePainter(sweepAngle: 3.4 * pi / 4),
                      ),
                    ),
                    const Positioned(
                      bottom: 20,
                      right: 45,
                      child: Text(
                        textAlign: TextAlign.center,
                        "Juda\nyaxshi",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 36, right: 5),
                      width: 150,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: CustomPaint(
                        size: const Size(60, 60),
                        painter: AveragePainter(sweepAngle: 1.7 * pi / 4),
                      ),
                    ),
                    const Positioned(
                      bottom: 20,
                      right: 33,
                      child: Text(
                        textAlign: TextAlign.center,
                        "O'rtacha",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 36, right: 5),
                      width: 150,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: CustomPaint(
                        size: const Size(60, 60),
                        painter: GoodPainter(),
                      ),
                    ),
                    const Positioned(
                      bottom: 20,
                      right: 45,
                      child: Text(
                        textAlign: TextAlign.center,
                        "Yaxshi",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 36, right: 5),
                      width: 150,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: CustomPaint(
                        size: const Size(60, 60),
                        painter: BadPainter(
                            mouseSweepAngle: 3.4 * pi / 4,
                            eyeSweepAngle: 3.4 * pi / 6),
                      ),
                    ),
                    const Positioned(
                      bottom: 20,
                      right: 40,
                      child: Text(
                        textAlign: TextAlign.center,
                        "Yomon",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 36, right: 5),
                    width: 150,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: CustomPaint(
                      size: const Size(60, 60),
                      painter: TooBadPainter(sweepAngle: pi),
                    ),
                  ),
                  const Positioned(
                    bottom: 20,
                    right: 45,
                    child: Text(
                      textAlign: TextAlign.center,
                      "Juda\nyomon",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SmilePainter extends CustomPainter {
  SmilePainter({required this.sweepAngle});

  final double sweepAngle;

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Offset(size.width * 0.37, size.height / 4) & const Size(40, 40);
    const startAngle = 6.5;

    Paint paint = Paint();

    paint.color = Colors.green;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 7;

    canvas.drawCircle(Offset(size.width / 2, size.height / 3), 40, paint);
    canvas.drawCircle(Offset(size.width / 2.5, size.height / 3.5), 7,
        Paint()..color = Colors.green);
    canvas.drawCircle(Offset(size.width / 1.7, size.height / 3.5), 7,
        Paint()..color = Colors.green);

    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class GoodPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();

    paint.color = Colors.blueAccent;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 7;

    canvas.drawCircle(Offset(size.width / 2, size.height / 3), 40, paint);
    canvas.drawCircle(Offset(size.width / 2.5, size.height / 3.1), 7,
        Paint()..color = Colors.blueAccent);
    canvas.drawCircle(Offset(size.width / 1.7, size.height / 3.1), 7,
        Paint()..color = Colors.blueAccent);

    canvas.drawLine(Offset(size.width / 2.5, size.height / 2.3),
        Offset(size.width / 1.7, size.height / 2.3), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class AveragePainter extends CustomPainter {
  AveragePainter({required this.sweepAngle});

  final double sweepAngle;

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect =
        Offset(size.width * 0.34, size.height / 2.5) & const Size(50, 50);
    const startAngle = 10.3;

    Paint paint = Paint();

    paint.color = Colors.yellow;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 10;

    canvas.drawCircle(Offset(size.width / 2, size.height / 3), 40, paint);
    canvas.drawCircle(Offset(size.width / 2.5, size.height / 3.5), 7,
        Paint()..color = Colors.yellow);
    canvas.drawCircle(Offset(size.width / 1.65, size.height / 3.5), 7,
        Paint()..color = Colors.yellow);
    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class BadPainter extends CustomPainter {
  BadPainter({required this.mouseSweepAngle, required this.eyeSweepAngle});

  final double mouseSweepAngle;
  final double eyeSweepAngle;

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect =
        Offset(size.width * 0.37, size.height / 2.8) & const Size(40, 40);
    const startAngle = 9.65;

    Rect eyeRect1 =
        Offset(size.width * 0.3, size.height / 5.5) & const Size(20, 20);
    const eyeStartAngle1 = 0.3;

    Rect eyeRect2 =
        Offset(size.width * 0.55, size.height / 5.5) & const Size(20, 20);
    const eyeStartAngle2 = 7.3;

    Paint paint = Paint();

    paint.color = Colors.orange;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 7;

    canvas.drawCircle(Offset(size.width / 2, size.height / 3), 40, paint);
    canvas.drawArc(rect, startAngle, mouseSweepAngle, false, paint);
    canvas.drawArc(eyeRect1, eyeStartAngle1, eyeSweepAngle, false, paint);
    canvas.drawArc(eyeRect2, eyeStartAngle2, eyeSweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class TooBadPainter extends CustomPainter {
  TooBadPainter({required this.sweepAngle});

  final double sweepAngle;

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Offset(size.width * 0.37, size.height / 3) & const Size(40, 40);
    const startAngle = 9.4;

    Paint paint = Paint();

    paint.color = Colors.red;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 7;

    canvas.drawCircle(Offset(size.width / 2, size.height / 3), 40, paint);
    canvas.drawArc(
        rect, startAngle, sweepAngle, false, Paint()..color = Colors.red);
    canvas.drawLine(Offset(size.width / 3.0, size.height / 3.6),
        Offset(size.width / 2.2, size.height / 4.1), paint);
    canvas.drawLine(Offset(size.width / 1.8, size.height / 4.1),
        Offset(size.width / 1.5, size.height / 3.6), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
