import 'package:converse_hub/main.dart';
import 'package:flutter/material.dart';

import '../constants/consts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Welcome to Converse Hub',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: loginBackgroundColor,
      ),
      backgroundColor: loginBackgroundColor,
      body: Stack(children: [
        Image.asset(
          'assets/images/login_img.jpg',
          height: mq.height,
          width: mq.width,
        ),
        Positioned(
          bottom: mq.height * 0.1,
          left: mq.width * .05,
          width: mq.width * .9,
          height: mq.height * .07,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                backgroundColor: googleButtonIconColor, elevation: 1),
            onPressed: () {},
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
        )
      ]),
    );
  }
}
