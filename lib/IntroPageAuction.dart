import 'package:flutter/material.dart';
import 'package:ifeomachukwuka/IntroPageEvents.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'IntroPageAdverts.dart';
import 'SlidePageRoute.dart'; // Import the custom SlidePageRoute
import 'main.dart';

class IntroPageAuction extends StatelessWidget {
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
        //color: Color.fromARGB(255, 238, 244, 248), // Set the background color
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
                    'assets/intro/auction.png',
                    width: 200,
                    height: 200,
                  ),
                  SizedBox(height: 18),
                  Text(
                    'Auction',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 61, 101, 157),
                      fontSize: 30,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Make the most of our auction to sell your items.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      SlidePageRoute(
                        enterPage: IntroPageEvents(),
                        exitPage: IntroPageAuction(),
                        slideDirection: SlideDirection.rightToLeft,
                      ),
                    );
                  },
                  child: Text(
                    'Previous',
                    style: TextStyle(
                      color: Color.fromARGB(255, 61, 101, 157),
                      fontSize: 16,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(width: 9),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      SlidePageRoute(
                        enterPage: IntroPageAdverts(),
                        exitPage: IntroPageAuction(),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
