import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/consts.dart';
import '../main.dart';

class ChatUserCards extends StatefulWidget {
  const ChatUserCards({super.key});

  @override
  State<ChatUserCards> createState() => _ChatUserCardsState();
}

class _ChatUserCardsState extends State<ChatUserCards> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Card(
      margin: EdgeInsets.symmetric(horizontal: mq.width * 0.02, vertical: 6.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: cardsBackgroundColor,
      elevation: 3,
      child: InkWell(
        onTap: () {
          print('cards button pressed');
        },
        child: const ListTile(
          leading: CircleAvatar(
            child: Icon(CupertinoIcons.person),
          ),
          title: Text(
            'Demo User',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: Text('Last seen a min ago'),
          trailing: Text(
            '12:00 am',
            style: TextStyle(fontSize: 12.0),
          ),
        ),
      ),
    );
  }
}
