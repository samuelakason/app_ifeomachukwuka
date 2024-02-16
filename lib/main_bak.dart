// main.dart

// main.dart

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'guest_login.dart';
import 'IntroPageBeverages.dart';
import 'IntroPageEvents.dart';
import 'IntroPageAuction.dart';
import 'IntroPageAdverts.dart';
import 'Admin.dart'; // Import the Admin.dart file

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
      initialRoute: showIntro ? '/introBeverages' : '/main',
      routes: {
        '/introBeverages': (context) => IntroPageBeverages(),
        '/introEvents': (context) => IntroPageEvents(),
        '/introAuction': (context) => IntroPageAuction(),
        '/introAdverts': (context) => IntroPageAdverts(),
        '/main': (context) => GuestLoginScreen(),
        // Add other routes as needed
      },
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

  // Future<void> _openGuestLogin(BuildContext context) async {
  //   Navigator.of(context).push(MaterialPageRoute(
  //     builder: (context) => GuestLoginScreen(),
  //   ));
  // }

  // Future<void> _openAdminPage(BuildContext context) async {
  //   // Add any admin-related checks here if needed
  //   Navigator.of(context).push(MaterialPageRoute(
  //     builder: (context) => AdminPage(),
  //   ));
  // }

  Future<void> _openGuestPage(BuildContext context) async {
    // Add any admin-related checks here if needed
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => AdminPage(),
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
            // Image.asset(
            //   'assets/logo/logo_white.png',
            //   height: 50,
            //   width: 50,
            // ),
            SizedBox(height: 50),
            Image.asset(
              //'assets/18.png',
              'assets/logo/white.png',
              height: 150,
            ),
            SizedBox(height: 50),
            Text(
              'Welcome To',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'IfeomaChukwuka',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _openWebView(
                  context,
                  "https://ifeomachukwuka.rechargenow.ng/app/dashboard",
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
                'LOGIN',
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
                // GestureDetector(
                //   onTap: () async {
                //     await _openGuestLogin(context);
                //   },
                //   child: Text(
                //     'GUEST LOGIN1',
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 18,
                //     ),
                //   ),
                // ),
                //SizedBox(width: 16), // Added space
                GestureDetector(
                  onTap: () async {
                    await _openGuestPage(context);
                  },
                  child: Text(
                    'GUEST LOGIN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      // fontWeight: FontWeight.bold,
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
                  "https://ifeomachukwuka.rechargenow.ng/forgot-password",
                );
              },
              child: Text(
                'FORGOT PASSWORD',
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

class WebViewPage extends StatefulWidget {
  final String url;
  final Function()? onPageFinished;

  WebViewPage({required this.url, this.onPageFinished});

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController _webViewController;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 15, 25, 82),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            if (isLoading) {
              // If the page is still loading, go back in the WebView
              _webViewController.goBack();
            } else {
              // If the page has finished loading, pop the route
              Navigator.of(context).pop();
            }
          },
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          // Handle back button press
          if (isLoading) {
            // If the page is still loading, go back in the WebView
            _webViewController.goBack();
            return false;
          } else {
            // If the page has finished loading, allow popping the route
            return true;
          }
        },
        child: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          onPageFinished: (_) {
            setState(() {
              isLoading = false;
            });
            widget.onPageFinished?.call();
          },
          onWebViewCreated: (WebViewController webViewController) {
            _webViewController = webViewController;
          },
        ),
      ),
    );
  }
}











































// main.dart

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'guest_login.dart';
import 'IntroPageBeverages.dart';
import 'Admin.dart'; // Import the Admin.dart file

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
      home: showIntro ? IntroPageBeverages() : GuestLoginScreen(),
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

  // Future<void> _openGuestLogin(BuildContext context) async {
  //   Navigator.of(context).push(MaterialPageRoute(
  //     builder: (context) => GuestLoginScreen(),
  //   ));
  // }

  // Future<void> _openAdminPage(BuildContext context) async {
  //   // Add any admin-related checks here if needed
  //   Navigator.of(context).push(MaterialPageRoute(
  //     builder: (context) => AdminPage(),
  //   ));
  // }

  Future<void> _openGuestPage(BuildContext context) async {
    // Add any admin-related checks here if needed
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => AdminPage(),
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
            // Image.asset(
            //   'assets/logo/logo_white.png',
            //   height: 50,
            //   width: 50,
            // ),
            SizedBox(height: 50),
            Image.asset(
              //'assets/18.png',
              'assets/logo/white.png',
              height: 150,
            ),
            SizedBox(height: 50),
            Text(
              'Welcome To',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'IfeomaChukwuka',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _openWebView(
                  context,
                  "https://ifeomachukwuka.rechargenow.ng/app/dashboard",
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
                'LOGIN',
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
                // GestureDetector(
                //   onTap: () async {
                //     await _openGuestLogin(context);
                //   },
                //   child: Text(
                //     'GUEST LOGIN1',
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 18,
                //     ),
                //   ),
                // ),
                //SizedBox(width: 16), // Added space
                GestureDetector(
                  onTap: () async {
                    await _openGuestPage(context);
                  },
                  child: Text(
                    'GUEST LOGIN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      // fontWeight: FontWeight.bold,
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
                  "https://ifeomachukwuka.rechargenow.ng/forgot-password",
                );
              },
              child: Text(
                'FORGOT PASSWORD',
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

class WebViewPage extends StatefulWidget {
  final String url;
  final Function()? onPageFinished;

  WebViewPage({required this.url, this.onPageFinished});

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController _webViewController;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 15, 25, 82),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            if (isLoading) {
              // If the page is still loading, go back in the WebView
              _webViewController.goBack();
            } else {
              // If the page has finished loading, pop the route
              Navigator.of(context).pop();
            }
          },
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          // Handle back button press
          if (isLoading) {
            // If the page is still loading, go back in the WebView
            _webViewController.goBack();
            return false;
          } else {
            // If the page has finished loading, allow popping the route
            return true;
          }
        },
        child: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          onPageFinished: (_) {
            setState(() {
              isLoading = false;
            });
            widget.onPageFinished?.call();
          },
          onWebViewCreated: (WebViewController webViewController) {
            _webViewController = webViewController;
          },
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BidHub'),
        backgroundColor: Colors.blueGrey[900],
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Image.asset(
                  'assets/launch_image.png', // Replace with your app logo
                  height: 100,
                ),
                SizedBox(height: 10),
                Text(
                  'Your Ultimate Auction Platform',
                  style: TextStyle(
                    color: Colors.blueGrey[700],
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    // Add navigation to your app's main page
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
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
                SizedBox(height: 50),
                SectionTitle(title: 'Featured Products'),
                SizedBox(height: 20),
                ProductCarousel(),
                SizedBox(height: 50),
                SectionTitle(title: 'How It Works'),
                SizedBox(height: 20),
                HowItWorks(),
                SizedBox(height: 50),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white, // Background color of the buttons
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildButton(
                    icon: Icons.home,
                    label: 'Home',
                    onPressed: () {
                      // Add navigation logic for Home
                    },
                  ),
                  buildButton(
                    icon: Icons.wine_bar,
                    label: 'Categories',
                    onPressed: () {
                      // Add navigation logic for Categories
                    },
                  ),
                  buildButton(
                    icon: Icons.contact_mail,
                    label: 'Contact Us',
                    onPressed: () {
                      // Add navigation logic for Contact Us
                    },
                  ),
                  buildButton(
                    icon: Icons.store,
                    label: 'Events',
                    onPressed: () {
                      // Add navigation logic for Events
                    },
                  ),
                  buildButton(
                    icon: Icons.login,
                    label: 'My Account',
                    onPressed: () {
                      // Add navigation logic for My Account
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: Colors.blueGrey[900],
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.blueGrey[900],
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.blueGrey[900],
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ProductCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ProductCard(imageUrl: 'assets/product1.jpg'),
          ProductCard(imageUrl: 'assets/product2.jpg'),
          ProductCard(imageUrl: 'assets/product3.jpg'),
          // Add more ProductCard widgets for additional products
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;

  ProductCard({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class HowItWorks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepWidget(number: '1', title: 'Sign Up'),
        StepWidget(number: '2', title: 'Browse Auctions'),
        StepWidget(number: '3', title: 'Place Bids'),
        StepWidget(number: '4', title: 'Win and Enjoy!'),
      ],
    );
  }
}

class StepWidget extends StatelessWidget {
  final String number;
  final String title;

  StepWidget({required this.number, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.amber,
          child: Text(
            number,
            style: TextStyle(
              color: Colors.blueGrey[900],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 10),
        Text(
          title,
          style: TextStyle(
            color: Colors.blueGrey[700],
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}







































import 'package:flutter/material.dart';
import 'categories.dart'; // Import the CategoriesPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Color.fromARGB(255, 15, 25, 82),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Image.asset(
                  'assets/launch_image.png', // Replace with your app logo
                  height: 100,
                ),
                SizedBox(height: 10),
                Text(
                  'Your Ultimate Auction Platform',
                  style: TextStyle(
                    color: Colors.blueGrey[700],
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    // Add navigation to your app's main page
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
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
                SizedBox(height: 50),
                SectionTitle(title: 'Featured Products'),
                SizedBox(height: 20),
                ProductCarousel(),
                SizedBox(height: 50),
                SectionTitle(title: 'How It Works'),
                SizedBox(height: 20),
                HowItWorks(),
                SizedBox(height: 50),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white, // Background color of the buttons
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildButton(
                    icon: Icons.gavel_rounded,
                    label: 'Auction',
                    onPressed: () {
                      // Add navigation logic for Home
                    },
                  ),
                  buildButton(
                    icon: Icons.wine_bar,
                    label: 'Categories',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoriesPage()),
                      );
                    },
                  ),
                  buildButton(
                    icon: Icons.contact_mail,
                    label: 'Contact Us',
                    onPressed: () {
                      // Add navigation logic for Contact Us
                    },
                  ),
                  buildButton(
                    icon: Icons.store,
                    label: 'Events',
                    onPressed: () {
                      // Add navigation logic for Events
                    },
                  ),
                  buildButton(
                    icon: Icons.login,
                    label: 'My Account',
                    onPressed: () {
                      // Add navigation logic for My Account
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: Colors.blueGrey[900],
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.blueGrey[900],
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.blueGrey[900],
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ProductCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ProductCard(imageUrl: 'assets/product1.jpg'),
          ProductCard(imageUrl: 'assets/product2.jpg'),
          ProductCard(imageUrl: 'assets/product3.jpg'),
          // Add more ProductCard widgets for additional products
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;

  ProductCard({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class HowItWorks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepWidget(number: '1', title: 'Sign Up'),
        StepWidget(number: '2', title: 'Browse Auctions'),
        StepWidget(number: '3', title: 'Place Bids'),
        StepWidget(number: '4', title: 'Win and Enjoy!'),
      ],
    );
  }
}

class StepWidget extends StatelessWidget {
  final String number;
  final String title;

  StepWidget({required this.number, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.amber,
          child: Text(
            number,
            style: TextStyle(
              color: Colors.blueGrey[900],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 10),
        Text(
          title,
          style: TextStyle(
            color: Colors.blueGrey[700],
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}














































// main.dart

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'guest_login.dart';
import 'IntroPageBeverages.dart';
import 'Admin.dart'; // Import the Admin.dart file

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
      home: showIntro ? IntroPageBeverages() : GuestLoginScreen(),
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

  // Future<void> _openGuestLogin(BuildContext context) async {
  //   Navigator.of(context).push(MaterialPageRoute(
  //     builder: (context) => GuestLoginScreen(),
  //   ));
  // }

  // Future<void> _openAdminPage(BuildContext context) async {
  //   // Add any admin-related checks here if needed
  //   Navigator.of(context).push(MaterialPageRoute(
  //     builder: (context) => AdminPage(),
  //   ));
  // }

  Future<void> _openGuestPage(BuildContext context) async {
    // Add any admin-related checks here if needed
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => AdminPage(),
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
            // Image.asset(
            //   'assets/logo/logo_white.png',
            //   height: 50,
            //   width: 50,
            // ),
            SizedBox(height: 50),
            Image.asset(
              //'assets/18.png',
              'assets/logo/white.png',
              height: 150,
            ),
            SizedBox(height: 50),
            Text(
              'Welcome To',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'IfeomaChukwuka',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _openWebView(
                  context,
                  "https://ifeomachukwuka.rechargenow.ng/app/dashboard",
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
                'LOGIN',
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
                // GestureDetector(
                //   onTap: () async {
                //     await _openGuestLogin(context);
                //   },
                //   child: Text(
                //     'GUEST LOGIN1',
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 18,
                //     ),
                //   ),
                // ),
                //SizedBox(width: 16), // Added space
                GestureDetector(
                  onTap: () async {
                    await _openGuestPage(context);
                  },
                  child: Text(
                    'GUEST LOGIN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      // fontWeight: FontWeight.bold,
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
                  "https://ifeomachukwuka.rechargenow.ng/forgot-password",
                );
              },
              child: Text(
                'FORGOT PASSWORD',
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

class WebViewPage extends StatefulWidget {
  final String url;
  final Function()? onPageFinished;

  WebViewPage({required this.url, this.onPageFinished});

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController _webViewController;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 15, 25, 82),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            if (isLoading) {
              // If the page is still loading, go back in the WebView
              _webViewController.goBack();
            } else {
              // If the page has finished loading, pop the route
              Navigator.of(context).pop();
            }
          },
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          // Handle back button press
          if (isLoading) {
            // If the page is still loading, go back in the WebView
            _webViewController.goBack();
            return false;
          } else {
            // If the page has finished loading, allow popping the route
            return true;
          }
        },
        child: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          onPageFinished: (_) {
            setState(() {
              isLoading = false;
            });
            widget.onPageFinished?.call();
          },
          onWebViewCreated: (WebViewController webViewController) {
            _webViewController = webViewController;
          },
        ),
      ),
    );
  }
}


















































import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'guest_login.dart';
import 'IntroPageBeverages.dart';
import 'Admin.dart'; // Import the Admin.dart file

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
      home: showIntro ? IntroPageBeverages() : GuestLoginScreen(),
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

  // Future<void> _openGuestLogin(BuildContext context) async {
  //   Navigator.of(context).push(MaterialPageRoute(
  //     builder: (context) => GuestLoginScreen(),
  //   ));
  // }

  // Future<void> _openAdminPage(BuildContext context) async {
  //   // Add any admin-related checks here if needed
  //   Navigator.of(context).push(MaterialPageRoute(
  //     builder: (context) => AdminPage(),
  //   ));
  // }

  Future<void> _openGuestPage(BuildContext context) async {
    // Add any admin-related checks here if needed
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => AdminPage(),
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
            // Image.asset(
            //   'assets/logo/logo_white.png',
            //   height: 50,
            //   width: 50,
            // ),
            SizedBox(height: 50),
            Image.asset(
              //'assets/18.png',
              'assets/logo/white.png',
              height: 150,
            ),
            SizedBox(height: 50),
            Text(
              'Welcome To',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'IfeomaChukwuka',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _openWebView(
                  context,
                  "https://ifeomachukwuka.rechargenow.ng/app/dashboard",
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
                'LOGIN',
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
                // GestureDetector(
                //   onTap: () async {
                //     await _openGuestLogin(context);
                //   },
                //   child: Text(
                //     'GUEST LOGIN1',
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 18,
                //     ),
                //   ),
                // ),
                //SizedBox(width: 16), // Added space
                GestureDetector(
                  onTap: () async {
                    await _openGuestPage(context);
                  },
                  child: Text(
                    'GUEST LOGIN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      // fontWeight: FontWeight.bold,
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
                  "https://ifeomachukwuka.rechargenow.ng/forgot-password",
                );
              },
              child: Text(
                'FORGOT PASSWORD',
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

class WebViewPage extends StatefulWidget {
  final String url;
  final Function()? onPageFinished;

  WebViewPage({required this.url, this.onPageFinished});

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController _webViewController;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 15, 25, 82),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            if (isLoading) {
              // If the page is still loading, go back in the WebView
              _webViewController.goBack();
            } else {
              // If the page has finished loading, pop the route
              Navigator.of(context).pop();
            }
          },
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          // Handle back button press
          if (isLoading) {
            // If the page is still loading, go back in the WebView
            _webViewController.goBack();
            return false;
          } else {
            // If the page has finished loading, allow popping the route
            return true;
          }
        },
        child: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          onPageFinished: (_) {
            setState(() {
              isLoading = false;
            });
            widget.onPageFinished?.call();
          },
          onWebViewCreated: (WebViewController webViewController) {
            _webViewController = webViewController;
          },
        ),
      ),
    );
  }
}










































































import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(title: 'IfeomaChukwuka'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required String title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WebViewController _webViewController;
  double webProgress = 0;
  DateTime timeBackPressed = DateTime.now();
  int selectedIndex = 0; // Default selected index for "Home" button

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IfeomaChukwuka'),
        backgroundColor: Color.fromARGB(255, 15, 25, 82),
      ),
      body: WillPopScope(
        onWillPop: () async {
          final difference = DateTime.now().difference(timeBackPressed);
          final isExitWarning = difference >= const Duration(seconds: 2);

          timeBackPressed = DateTime.now();

          if (await _webViewController.canGoBack()) {
            _webViewController.goBack();
            return false;
          } else if (isExitWarning) {
            const message = 'Press back again to exit';
            Fluttertoast.showToast(msg: message, fontSize: 18);

            return false;
          } else {
            Fluttertoast.cancel();
            return true;
          }
        },
        child: Column(
          children: [
            webProgress < 1
                ? SizedBox(
                    height: 5,
                    child: LinearProgressIndicator(
                      value: webProgress,
                      color: const Color(0xFF20F1952),
                      backgroundColor: Colors.white,
                    ),
                  )
                : const SizedBox(),
            Expanded(
              child: WebView(
                initialUrl: 'https://ifeomachukwuka.rechargenow.ng/mobile-app',
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController controller) {
                  _webViewController = controller;
                },
                onProgress: (progress) => setState(() {
                  webProgress = progress / 100;
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildButton(
                    icon: Icons.home,
                    label: 'Home',
                    index: 0,
                    onPressed: () {
                      navigateToUrl('https://ifeomachukwuka.rechargenow.ng');
                    },
                  ),
                  buildButton(
                    icon: Icons.wine_bar,
                    label: 'Categories',
                    index: 1,
                    onPressed: () {
                      navigateToUrl(
                          'https://ifeomachukwuka.rechargenow.ng/categories');
                    },
                  ),
                  buildButton(
                    icon: Icons.contact_mail,
                    label: 'Contact Us',
                    index: 2,
                    onPressed: () {
                      navigateToUrl(
                          'https://ifeomachukwuka.rechargenow.ng/contact-us');
                    },
                  ),
                  buildButton(
                    icon: Icons.store,
                    label: 'Events',
                    index: 3,
                    onPressed: () {
                      navigateToUrl(
                          'https://ifeomachukwuka.rechargenow.ng/buy-online');
                    },
                  ),
                  buildButton(
                    icon: Icons.login,
                    label: 'My Account',
                    index: 4,
                    onPressed: () {
                      navigateToUrl(
                          'https://ifeomachukwuka.rechargenow.ng/app/dashboard');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton({
    required IconData icon,
    required String label,
    required int index,
    required VoidCallback onPressed,
  }) {
    return Column(
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            setState(() {
              // Update the selected index
              selectedIndex = index;
            });
            onPressed();
          },
          icon: Icon(
            icon,
            color: selectedIndex == index
                ? Color.fromARGB(
                    255, 15, 25, 82) // Highlight color when selected
                : Colors.black.withOpacity(0.2),
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            height: 0.8,
            color: selectedIndex == index
                ? Color.fromARGB(
                    255, 15, 25, 82) // Highlight color when selected
                : Colors.black.withOpacity(0.8),
          ),
        ),
      ],
    );
  }

  void navigateToUrl(String url) {
    _webViewController.loadUrl(url);
  }
}
