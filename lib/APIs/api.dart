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
}
