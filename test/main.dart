import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homework/screens/play/play_screen.dart';

void main() {
  testWidgets(
    "Play Screen uchun text borligini tekshiruvchi test",
    (widgetTester) async {
      await widgetTester.pumpWidget(const PlayScreen());
      expect(find.byWidget(Text("4 Pics 1 Word")), findsOneWidget);
    },
  );
}
