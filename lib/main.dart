import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'IntroPageBeverages.dart';
import 'IntroPageEvents.dart';
import 'IntroPageAuction.dart';
import 'IntroPageAdverts.dart';
import 'Admin.dart';
import 'splash_screen.dart'; // Import the splash screen

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
      home: showIntro ? SplashScreen() : GuestLoginScreen(),
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
