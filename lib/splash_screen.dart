import 'package:flutter/material.dart';
import 'IntroPageBeverages.dart';
import 'IntroPageEvents.dart';
import 'IntroPageAuction.dart';
import 'IntroPageAdverts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateAfterDelay();
  }

  _navigateAfterDelay() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => IntroPageBeverages(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 25, 82),
      body: Center(
        child: Image.asset(
          'assets/logo/white.png',
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}
