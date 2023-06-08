import 'package:converse_hub/auth/login_page.dart';
import 'package:converse_hub/constants/consts.dart';
import 'package:converse_hub/screens/home_page.dart';
import 'package:flutter/material.dart';
// firebase packages
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// variable to initialize mediaQuery
late Size mq;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _initializeFireBase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true).copyWith(
        appBarTheme: const AppBarTheme(
            centerTitle: true,
            backgroundColor: appBarColor,
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 25.0)),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
      },
      home: LoginPage(),
    );
  }
}

_initializeFireBase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
