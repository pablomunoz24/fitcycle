import 'package:firebase_core/firebase_core.dart';
import 'package:fitcycle/pages/login_page.dart';
import 'package:fitcycle/pages/splash_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'firebase_options.dart';
import 'models/local_ejercise.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(LocalEjerciseAdapter());
  await Hive.openBox<LocalEjercise>('ejercise');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
        localizationsDelegates: const[
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: const[
          Locale("es","CO"),
          Locale("en","US"),
        ],
        locale: const Locale ("es","CO"),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white70),
        useMaterial3: true,
      ),
      home: const SplashPage()
    );
  }
}
