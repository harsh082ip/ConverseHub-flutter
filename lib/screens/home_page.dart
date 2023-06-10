import 'dart:convert';
import 'dart:math';

import 'package:converse_hub/APIs/api.dart';
import 'package:converse_hub/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/chatUserCards.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
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
        body: StreamBuilder(
          // reading and building from the data getting from firestore cloud
          stream: APIs.firestore.collection('users').snapshots(),
          builder: (context, snapshot) {
            final list = [];
            if (snapshot.hasData) {
              final data = snapshot.data?.docs;
              for (var i in data!) {
                print('Data: ${jsonEncode(i.data())}');
                list.add(i.data()['name']);
              }
            }
            return ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(top: mq.height * 0.01),
                itemCount: 15,
                itemBuilder: (context, index) {
                  return ChatUserCards();
                });
          },
        ));
  }
}
