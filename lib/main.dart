import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/bloc/auth/auth_bloc.dart';
import 'package:homework/data/local/storage_repository.dart';
import 'package:homework/screens/splash/splash_screen.dart';
import 'package:homework/services/firebase_options.dart';
import 'package:homework/view/image_view_model.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  StorageRepository.instance;

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    Future.microtask(
      () {
        firebaseFirestore
            .collection('users')
            .doc(firebaseAuth.currentUser!.uid)
            .update({
          'isOnline': false,
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc()),
        ChangeNotifierProvider(create: (_) => ImageViewModel()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (context, child) {
          ScreenUtil.init(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(useMaterial3: false),
            home: child,
          );
        },
        child: const SplashScreen(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    updateIsOnline();
    WidgetsBinding.instance.addObserver(this);
  }

  Future<void> updateIsOnline() async {
    await firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .update({
      'isOnline': true,
    });
  }
}
