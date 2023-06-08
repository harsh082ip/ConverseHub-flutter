import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar
      appBar: AppBar(
        leading: const Icon(CupertinoIcons.home),
        title: const Text('Converse Hub'),
        actions: [
          //search iconButton
          IconButton(
              onPressed: () {
                print('pressed');
              },
              icon: Icon(Icons.search)),
          //search vertical dot iconButton
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add_comment_rounded,
          color: Color.fromARGB(255, 107, 93, 235),
        ),
      ),
    );
  }
}
