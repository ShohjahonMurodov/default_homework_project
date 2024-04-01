import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/cubit/country/country_cubit.dart';
import 'package:homework/cubit/to_check/check_cubit.dart';
import 'package:homework/data/local/storage_repository.dart';
import 'package:homework/screens/splash/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  StorageRepository.instance;

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CheckCubit()),
        BlocProvider(create: (_) => CountryCubit()..fetchCountries()),
      ],
      child: const MyApp(),
    ),
  );
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
      designSize: const Size(375, 812),
      builder: (context, child) {
        ScreenUtil.init(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: false),
          home: const SplashScreen(),
        );
      },
    );
  }
}
