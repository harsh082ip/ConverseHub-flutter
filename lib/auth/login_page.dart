import 'dart:io';
import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:converse_hub/APIs/api.dart';
import 'package:converse_hub/main.dart';
import 'package:converse_hub/utils/dialogs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../constants/consts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  _onGoogleBtnClick() {
    Dialogs.progressBar(context);
    _signInWithGoogle().then((user) async {
      Navigator.pop(context);
      if (user != null) {
        if ((await APIs.userExists())) {
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          await APIs.createUser().then((value) {
            Navigator.pushReplacementNamed(context, '/home');
          });
        }
      }
    });
  }

  Future<UserCredential?> _signInWithGoogle() async {
    try {
      await InternetAddress.lookup('google.com');
      print('connected');
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await APIs.auth.signInWithCredential(credential);
    } catch (e) {
      Dialogs.showSnackbar(
          context, 'Some went wrong, CHECK your Internet Connection!');
      print('not connected');

      print('_signInWithGoogle- $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SlideInDown(
          delay: Duration(milliseconds: 200 * 2),
          child: const Text(
            'Welcome to Converse Hub',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: loginBackgroundColor,
      ),
      backgroundColor: loginBackgroundColor,
      body: Stack(children: [
        ZoomIn(
          delay: Duration(milliseconds: 200),
          child: Image.asset(
            'assets/images/login_img.jpg',
            height: mq.height,
            width: mq.width,
          ),
        ),
        Positioned(
          bottom: mq.height * 0.1,
          left: mq.width * .05,
          width: mq.width * .9,
          height: mq.height * .07,
          child: BounceInUp(
            delay: Duration(milliseconds: 400 * 2),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: googleButtonIconColor, elevation: 1),
              onPressed: () {
                _onGoogleBtnClick();
              },
              icon: Image.asset(
                'assets/images/google.png',
                height: 45.0,
              ),
              label: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Sign in with',
                    style: TextStyle(color: Colors.black, fontSize: 18)),
                TextSpan(
                    text: ' Google',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold))
              ])),
            ),
          ),
        )
      ]),
    );
  }
}
