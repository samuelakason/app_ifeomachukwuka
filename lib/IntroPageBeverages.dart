import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'IntroPageEvents.dart';
import 'SlidePageRoute.dart'; // Import the custom SlidePageRoute
import 'main.dart';

class IntroPageBeverages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/introBackground2.png'), // Replace with your pattern image
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              const Color.fromARGB(255, 31, 107, 170)
                  .withOpacity(0.8), // Adjust opacity as needed
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0, right: 30.0),
                child: TextButton(
                  onPressed: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setBool('showIntro', false);
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/main', // Replace with the actual route name for MyApp
                      (route) => false,
                    );
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: Color.fromARGB(255, 61, 101, 157),
                      fontSize: 16,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

              ),
            ),
            SizedBox(height: 150),
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/1.png',
                    width: 300,
                    height: 200,
                  ),
                  SizedBox(height: 18),
                  Text(
                    'Beverages',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 61, 101, 157),
                      fontSize: 30,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Shop and sip - Explore unique beverages',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 22, 22, 22),
                      fontSize: 20,
                      fontFamily: 'Satoshi',
                      //fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 200),
            Row(
              mainAxisAlignment: MainAxisAlignment.end, // Align to the right
              children: [
                Spacer(), // Add Spacer to occupy the space on the left
                Padding(
                  padding: const EdgeInsets.only(
                      right: 43.0), // Adjust left padding as needed
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        SlidePageRoute(
                          enterPage: IntroPageEvents(),
                          exitPage: IntroPageBeverages(),
                          slideDirection: SlideDirection.leftToRight,
                        ),
                      );
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Color.fromARGB(255, 61, 101, 157),
                        fontSize: 16,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
