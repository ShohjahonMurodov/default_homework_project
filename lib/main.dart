import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/bloc/currency/currency_bloc.dart';
import 'package:homework/bloc/currency/currency_event.dart';
import 'package:homework/cubit/single_state/currency_single_cubit.dart';
import 'package:homework/screens/currencies_single/currencies_single_screen.dart';

void main() {
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CurrencyBloc()..add(GetCurrencyEvent()),
        ),
        BlocProvider(create: (_) => CurrencySingleCubit()..callCountry()),
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
        child: const CurrenciesSingleScreen(),
      ),
    );
  }
}
