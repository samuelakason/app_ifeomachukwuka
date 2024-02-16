// categories.dart

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late WebViewController _webViewController;
  double webProgress = 0;
  DateTime timeBackPressed = DateTime.now();
  int selectedIndex = 0; // Default selected index for "Home" button

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: const Text('Events'),
        backgroundColor: Color.fromARGB(255, 15, 25, 82),
        automaticallyImplyLeading: false,
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
                initialUrl: 'https://ifeomachukwuka.ng/buy-online',
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
                    icon: Icons.gavel_rounded,
                    label: 'Auction',
                    index: 0,
                    onPressed: () {
                      // Navigate to the main.dart page
                      Navigator.pop(context);
                    },
                  ),
                  buildButton(
                    icon: Icons.wine_bar,
                    label: 'Events',
                    index: 1,
                    onPressed: () {
                      // Categories button is already on the categories page
                    },
                  ),
                  buildButton(
                    icon: Icons.store,
                    label: 'IfeomaChukwuka',
                    index: 2,
                    onPressed: () {
                      navigateToUrl('https://ifeomachukwuka.ng');
                    },
                  ),
                  buildButton(
                    icon: Icons.contact_mail,
                    label: 'Contact Us',
                    index: 3,
                    onPressed: () {
                      navigateToUrl(
                          'https://ifeomachukwuka.ng/contact-us');
                    },
                  ),
                  buildButton(
                    icon: Icons.leaderboard_rounded,
                    label: 'Advert',
                    index: 4,
                    onPressed: () {
                      navigateToUrl(
                          'https://ifeomachukwuka.ng/auctions/mobile-app-advert');
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
