import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/controller_screen.dart';
import 'package:homework/data/network/api_provider.dart';
import 'package:homework/data/repository/app_repository.dart';
import 'package:homework/view_models/country_view_model.dart';
import 'package:homework/view_models/people_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  ApiProvider apiProvider = ApiProvider();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PeopleViewModel(
            appRepository: AppRepository(apiProvider: apiProvider),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => CountryViewModel(
            appRepository: AppRepository(apiProvider: apiProvider),
          ),
        ),
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
          home: child,
        );
      },
      child: const ControllerScreen(),
    );
  }
}
