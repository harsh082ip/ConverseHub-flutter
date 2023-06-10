import 'dart:convert';
import 'dart:math';

import 'package:converse_hub/APIs/api.dart';
import 'package:converse_hub/Models/chat_users.dart';
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
  List<ChatUsers> list = [];
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
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return Center(child: CircularProgressIndicator());

            case ConnectionState.active:
            case ConnectionState.done:
              final data = snapshot.data?.docs;
              list =
                  data?.map((e) => ChatUsers.fromJson(e.data())).toList() ?? [];

              if (list.isNotEmpty) {
                return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(top: mq.height * 0.01),
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return ChatUserCards(
                        users: list[index],
                      );
                    });
              } else {
                return Center(
                  child: Text(
                    'No Present Users',
                    style: TextStyle(fontSize: 30.0),
                  ),
                );
              }
          }
        },
      ),
    );
  }
}
