import 'dart:convert';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:converse_hub/APIs/api.dart';
import 'package:converse_hub/Models/chat_users.dart';
import 'package:converse_hub/auth/login_page.dart';
import 'package:converse_hub/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Widgets/chatUserCards.dart';
import '../constants/consts.dart';
import '../utils/dialogs.dart';

class ProfileScreen extends StatefulWidget {
  final ChatUsers users;
  const ProfileScreen({super.key, required this.users});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return GestureDetector(
      // on taping the screen keyboard disables automatically
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        //appBar
        appBar: AppBar(
          title: const Text('Profile Screen'),
        ),
        body: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: mq.width,
                    height: mq.height * 0.01111,
                  ),
                  // for profile picture
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(mq.height * 0.1),
                        child: CachedNetworkImage(
                          width: mq.height * 0.2,
                          height: mq.height * 0.2,
                          fit: BoxFit.fill,
                          imageUrl: widget.users.image,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(CupertinoIcons.person),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: MaterialButton(
                          shape: CircleBorder(),
                          color: Colors.white,
                          elevation: 10.0,
                          onPressed: () {},
                          child: Icon(Icons.edit),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: mq.height * 0.025),
                  // e-mail
                  Text(
                    widget.users.email,
                    style: TextStyle(
                        color: Color.fromARGB(255, 97, 95, 95), fontSize: 18.0),
                  ),
                  SizedBox(height: mq.height * 0.07),
                  // Name text field
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
                  // about Text field
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
                  // update button
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
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            // showing progress dialog
            Dialogs.progressBar(context);

            // sign-out from app
            await APIs.auth.signOut().then((value) async {
              await GoogleSignIn().signOut().then((value) {
                // hiding progress dialog
                Navigator.pop(context);

                // moving to home screen
                Navigator.pop(context);

                // replacing home screen with login screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LoginPage(),
                  ),
                );
              });
            });
          },
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
      ),
    );
  }
}
