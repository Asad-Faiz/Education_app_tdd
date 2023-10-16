import 'dart:developer';

import 'package:education_app_using_tdd/core/res/colors.dart';
import 'package:education_app_using_tdd/core/services/injection_container.dart';
import 'package:education_app_using_tdd/core/services/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  log('initializing....');
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyA2W5f_WKj8hja_VtaKx5V0o6UJ0yMejQE',
      authDomain: 'education-app-tdd.firebaseapp.com',
      projectId: 'education-app-tdd',
      storageBucket: 'education-app-tdd.appspot.com',
      messagingSenderId: '1055984378669',
      appId: '1:1055984378669:web:6b8b659cf4686cb5ffa9a4',
    ),
  );
  // log({await Firebase.initializeApp()}.toString());
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(color: Colors.transparent),
        colorScheme: ColorScheme.fromSwatch(accentColor: Colours.primaryColour),
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: Scaffold(),
      onGenerateRoute: generateRoute,
    );
  }
}
