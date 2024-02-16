// introBeveragesPage
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
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setBool('showIntro', false);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyApp(showIntro: false),
                      ),
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











































// introEventPage
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'IntroPageAuction.dart';
import 'IntroPageBeverages.dart';
import 'SlidePageRoute.dart';
import 'main.dart';

class IntroPageEvents extends StatelessWidget {
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
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setBool('showIntro', false);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyApp(showIntro: false),
                      ),
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
                    //'assets/intro/3.png',
                    'assets/intro/21.png',
                    width: 400,
                    height: 200,
                  ),
                  SizedBox(height: 18),
                  Text(
                    'Events',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 61, 101, 157),
                      fontSize: 30,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Enhance your events with our drink collection.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontFamily: 'Satoshi',
                      // fontWeight: FontWeight.w400,
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
                        enterPage: IntroPageBeverages(),
                        exitPage: IntroPageEvents(),
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
                        enterPage: IntroPageAuction(),
                        exitPage: IntroPageEvents(),
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













































// introAuctionPage
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
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setBool('showIntro', false);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyApp(showIntro: false),
                      ),
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












































// introAdvertPage
import 'package:flutter/material.dart';
import 'package:ifeomachukwuka/IntroPageAuction.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Admin.dart';
import 'main.dart'; // Import your main.dart file
import 'IntroPageEvents.dart';
import 'SlidePageRoute.dart'; // Import the custom SlidePageRoute

class IntroPageAdverts extends StatelessWidget {
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
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setBool('showIntro', false);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyApp(showIntro: false),
                      ),
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
                    'assets/intro/advert.png',
                    width: 300,
                    height: 200,
                  ),
                  SizedBox(height: 18),
                  Text(
                    'Adverts',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 61, 101, 157),
                      fontSize: 30,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Boost the reach of your brand with our adverts.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 10, 10, 10),
                      fontSize: 20,
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w400,
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
                        enterPage: IntroPageAuction(),
                        exitPage: IntroPageAdverts(),
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
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setBool('showIntro', false);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyApp(showIntro: false),
                      ),
                    );
                  },
                  child: Text(
                    'Finish',
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









































import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'guest_login.dart';
import 'IntroPageAuction.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool showIntro = prefs.getBool('showIntro') ?? true;

  runApp(MyApp(showIntro: showIntro));
}

class MyApp extends StatelessWidget {
  final bool showIntro;

  MyApp({required this.showIntro});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: showIntro ? IntroPageAuction() : GuestLoginScreen(),
    );
  }
}

class GuestLoginScreen extends StatefulWidget {
  @override
  _GuestLoginScreenState createState() => _GuestLoginScreenState();
}

class _GuestLoginScreenState extends State<GuestLoginScreen> {
  bool isLoading = false;
  late Future<void> _webViewFuture;

  @override
  void initState() {
    super.initState();
    _webViewFuture = _loadWebView();
  }

  Future<void> _loadWebView() async {
    await Future.delayed(Duration(seconds: 2));
  }

  Future<void> _openGuestLogin(BuildContext context) async {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => GuestLoginScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 15, 25, 82),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo/logo_white.png',
              height: 150,
            ),
            SizedBox(height: 20),
            Text(
              'IfeomaChukwuka',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Your Ultimate Auction Platform',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                await _openWebView(
                  context,
                  "https://ifeomachukwuka.rechargenow.ng/app/login",
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 255, 255, 255),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.blueGrey[900],
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16), // Added space
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    await _openWebView(
                      context,
                      "https://ifeomachukwuka.rechargenow.ng/app/register",
                    );
                  },
                  child: Text(
                    'REGISTER | ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await _openGuestLogin(context);
                  },
                  child: Text(
                    'GUEST LOGIN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () async {
                await _openWebView(
                  context,
                  "https://ifeomachukwuka.rechargenow.ng/blogs",
                );
              },
              child: Text(
                'NEWSROOM',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openWebView(BuildContext context, String url) async {
    setState(() {
      isLoading = true;
    });

    await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => WebViewPage(
        url: url,
        onPageFinished: () {
          setState(() {
            isLoading = false;
          });
        },
      ),
    ));
  }
}

class WebViewPage extends StatelessWidget {
  final String url;
  final Function()? onPageFinished;

  WebViewPage({required this.url, this.onPageFinished});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebView'),
        backgroundColor: Color.fromARGB(255, 15, 25, 82),
      ),
      body: FutureBuilder(
        future: Future.delayed(Duration(seconds: 2), () => url),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return WebView(
              initialUrl: url,
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (_) {
                onPageFinished?.call();
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(Colors.blueGrey[900]!),
              ),
            );
          }
        },
      ),
    );
  }
}
