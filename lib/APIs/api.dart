import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:converse_hub/Models/chat_users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class APIs {
  // initializing firebase
  static FirebaseAuth auth = FirebaseAuth.instance;

  // for accessing firestore cloud
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  // returning current user
  static User get user => auth.currentUser!;

  // for string self info
  static late ChatUsers me;

  // for checking if a user exist or not
  static Future<bool> userExists() async {
    return (await firestore.collection('users').doc(user.uid).get()).exists;
  }

  // for creating a new user
  static Future<void> createUser() async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    final chatUser = ChatUsers(
        image: user.photoURL.toString(),
        name: user.displayName.toString(),
        about: 'Hey there, I am using Converse Hub',
        createdAt: time,
        isOnline: false,
        id: user.uid,
        last_active: time,
        email: user.email.toString(),
        pushToken: '');

    return await firestore
        .collection('users')
        .doc(user.uid)
        .set(chatUser.toJson());
  }

  // get all the users from firestore database to show up on home page
  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllusers() {
    return APIs.firestore
        .collection('users')
        .where('id', isNotEqualTo: user.uid)
        .snapshots();
  }

  // for getting current user info
  static Future<void> getSelfInfo() async {
    await firestore.collection('users').doc(user.uid).get().then((user) async {
      if (user.exists) {
        me = ChatUsers.fromJson(user.data()!);
      } else {
        await createUser().then((value) => getSelfInfo());
      }
    });
  }
}
