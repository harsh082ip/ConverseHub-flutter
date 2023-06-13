import 'dart:convert';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:converse_hub/APIs/api.dart';
import 'package:converse_hub/Models/chat_users.dart';
import 'package:converse_hub/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/chatUserCards.dart';
import '../constants/consts.dart';

class ProfileScreen extends StatefulWidget {
  final ChatUsers users;
  const ProfileScreen({super.key, required this.users});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      //appBar
      appBar: AppBar(
        title: const Text('Profile Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(
              width: mq.width,
              height: mq.height * 0.01111,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(mq.height * 0.1),
              child: CachedNetworkImage(
                width: mq.height * 0.2,
                height: mq.height * 0.2,
                fit: BoxFit.fill,
                imageUrl: widget.users.image,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    Icon(CupertinoIcons.person),
              ),
            ),
            SizedBox(height: mq.height * 0.025),
            Text(
              widget.users.email,
              style: TextStyle(
                  color: Color.fromARGB(255, 97, 95, 95), fontSize: 18.0),
            ),
            SizedBox(height: mq.height * 0.07),
            TextFormField(
              initialValue: widget.users.name,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                prefixIcon: Icon(
                  Icons.person,
                  color: appBarColor,
                ),
                hintText: 'eg: Jhon Fernendiz',
                label: Text('Name'),
              ),
            ),
            SizedBox(height: mq.height * 0.025),
            TextFormField(
              initialValue: widget.users.about,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                prefixIcon: Icon(Icons.info_outline, color: appBarColor),
                hintText: 'eg: Feeling Happy😊',
                label: Text('About'),
              ),
            ),
            SizedBox(height: mq.height * 0.05),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(mq.width * 0.5, mq.height * 0.06)),
              onPressed: () {},
              icon: Icon(Icons.edit),
              label: Text(
                'Update',
                style: TextStyle(fontSize: 22.0),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.redAccent,
        icon: const Icon(
          Icons.logout,
          color: Colors.white,
        ),
        label: Text(
          'Logout',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
