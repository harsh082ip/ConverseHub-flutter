import 'package:converse_hub/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1600), () {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

      if (FirebaseAuth.instance.currentUser != null) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 90, 230),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: mq.height * .6,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/message.png',
                width: mq.width * 0.5,
              ),
            ),
          ),
          Container(
            height: mq.height * 0.4,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Text(
                  'Made with Love💖',
                  style: GoogleFonts.kalam(
                      textStyle: Theme.of(context).textTheme.displayMedium,
                      color: Colors.white,
                      letterSpacing: 3.5,
                      fontSize: 28.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
