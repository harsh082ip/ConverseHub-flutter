import 'package:converse_hub/auth/login_page.dart';
import 'package:converse_hub/constants/consts.dart';

import 'package:flutter/material.dart';

// variable to initialize mediaQuery
late Size mq;

void main() {
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
      home: LoginPage(),
    );
  }
}
