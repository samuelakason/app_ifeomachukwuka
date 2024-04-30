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
