// main.dart

import 'package:flutter/material.dart';
import 'webview.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  void openWebView(String url, String title, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebViewFile(initialUrl: url, title: title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter WebView Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => openWebView(
                  'https://example.com', 'Example Website', context),
              child: Text('Open WebView with Example URL'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => openWebView(
                  'https://flutter.dev', 'Flutter Website', context),
              child: Text('Open WebView with Flutter URL'),
            ),
            // Add more buttons as needed
          ],
        ),
      ),
    );
  }
}
