// lib/Admin.dart

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AdminPage extends StatelessWidget {
  late WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 61, 101, 157),
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/logo/logo_white.png',
            width: 30,
          ),
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 238, 244, 248),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // ... Existing code ...

                    Container(
                      height: 80,
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildFooterButton(
                            context,
                            'Home',
                            Icons.home,
                            'https://example.com/home',
                          ),
                          _buildFooterButton(
                            context,
                            'Events',
                            Icons.search,
                            'https://example.com/search',
                          ),
                          _buildFooterButton(
                            context,
                            'Events',
                            Icons.notifications,
                            'https://example.com/notifications',
                          ),
                          _buildFooterButton(
                            context,
                            'More',
                            Icons.person,
                            'https://example.com/profile',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooterButton(
    BuildContext context,
    String label,
    IconData iconData,
    String url,
  ) {
    return GestureDetector(
      onTap: () {
        navigateToUrl(context, url);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: Color.fromARGB(255, 61, 101, 157),
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: Color.fromARGB(255, 61, 101, 157),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  void navigateToUrl(BuildContext context, String url) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => WebViewPage(url: url),
    ));
  }
}

class WebViewPage extends StatelessWidget {
  final String url;

  WebViewPage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 15, 25, 82),
        automaticallyImplyLeading: false,
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
