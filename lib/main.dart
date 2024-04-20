import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/bloc/scanner_bloc.dart';
import 'package:homework/bloc/scanner_event.dart';
import 'package:homework/screens/tab_box/tab_box_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) {
        ScreenUtil.init(context);
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => ScannerBloc()..add(LoadScannerEvent()),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(useMaterial3: false),
            home: child,
          ),
        );
      },
      child: const TabBox1(),
    );
  }
}
