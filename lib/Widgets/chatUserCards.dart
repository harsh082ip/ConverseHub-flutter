import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/chat_users.dart';
import '../constants/consts.dart';
import '../main.dart';

class ChatUserCards extends StatefulWidget {
  final ChatUsers users;
  const ChatUserCards({super.key, required this.users});

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
        child: ListTile(
          // leading: CircleAvatar(
          //   child: Icon(CupertinoIcons.person),
          // ),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(mq.height * 0.3),
            child: CachedNetworkImage(
              // width: mq.height * 0.55,
              // height: mq.height * 0.55,
              imageUrl: widget.users.image,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(CupertinoIcons.person),
            ),
          ),
          title: Text(
            widget.users.name,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(widget.users.about),
          trailing: Text(
            '12:00 am',
            style: TextStyle(fontSize: 12.0),
          ),
        ),
      ),
    );
  }
}
