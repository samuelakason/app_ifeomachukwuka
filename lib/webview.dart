// webview_file.dart

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewFile extends StatefulWidget {
  final String initialUrl;
  final String title;

  WebViewFile({required this.initialUrl, required this.title});

  @override
  _WebViewFileState createState() => _WebViewFileState();
}

class _WebViewFileState extends State<WebViewFile> {
  late WebViewController _webViewController;
  double _progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await _webViewController.canGoBack()) {
          _webViewController.goBack();
          return false;
        } else {
          // WebView cannot go back, allow the default behavior (close the WebView)
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 15, 25, 82),
        iconTheme: IconThemeData(color: Colors.white), // Set arrow color to white
      ),

        body: Column(
          children: [
            if (_progress < 1.0)
              LinearProgressIndicator(
                value: _progress,
                color: Theme.of(context).colorScheme.secondary,
              ),
            Expanded(
              child: WebView(
                initialUrl: widget.initialUrl,
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController controller) {
                  _webViewController = controller;
                },
                onPageStarted: (String url) {
                  setState(() {
                    _progress = 0.0;
                  });
                },
                onPageFinished: (String url) {
                  setState(() {
                    _progress = 1.0;
                  });
                },
                onProgress: (int progress) {
                  setState(() {
                    _progress = progress / 100.0;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
