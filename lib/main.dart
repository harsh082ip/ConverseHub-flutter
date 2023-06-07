import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Converse Hub'),
        ),
        drawer: Drawer(),
        body: Align(
          alignment: Alignment.topCenter,
          child: Text(
            'This will turn into a chatting application very soon😊',
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
