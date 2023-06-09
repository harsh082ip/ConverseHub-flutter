import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class APIs {
  // initializing firebase
  static FirebaseAuth auth = FirebaseAuth.instance;

  // for accessing firestore cloud
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
}
