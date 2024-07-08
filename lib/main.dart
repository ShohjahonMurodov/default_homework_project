import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/blocs/currency_bloc.dart';
import 'package:homework/blocs/currency_event.dart';
import 'package:homework/data/network/api_provider.dart';
import 'package:homework/data/repository/app_repository.dart';
import 'package:homework/screens/currency/currency_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ApiProvider apiProvider = ApiProvider();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => AppRepository(apiProvider: apiProvider),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                CurrencyBloc(appRepository: context.read<AppRepository>())
                  ..add(
                    CurrencyGetEvent(),
                  ),
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            ScreenUtil.init(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(useMaterial3: false),
              home: child,
            );
          },
          child: const CurrencyScreen(),
        ),
      ),
    );
  }
}
