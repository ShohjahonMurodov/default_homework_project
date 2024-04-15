import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/blocs/countries_bloc.dart';
import 'package:homework/blocs/countries_event.dart';
import 'package:homework/data/api/api_client.dart';
import 'package:homework/screens/controller/controller_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final ApiClient apiClient =
      ApiClient(graphQLClient: ApiClient.create().graphQLClient);

  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) =>
            CountriesBloc(apiClient: apiClient)..add(FetchCountries()),
      ),
    ], child: const MyApp()),
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
