import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'Admin.dart';
import 'webview.dart';

class MorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 20, 25, 82),
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/logo/white.png', // Replace with the path to your logo image
            width: 30, // Adjust the width as needed
          ),
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 238, 244, 248),
        child: Column(
          children: [
            SizedBox(height: 20), // Add some space here
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      color: Color.fromARGB(255, 238, 244, 248),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Expanded(
  child: ElevatedButton(
    onPressed: () => openWebView(
      'https://ifeomachukwuka.ng/blogs',
      'OUR NEWSROOM',
      context,
    ),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      //padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'VISIT OUR NEWSROOM',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
           SizedBox(width: 100),
          Icon(
            Icons.arrow_forward,
            color: Colors.black,
          ),
        ],
      ),
    ),
  ),
),

  ],
),




                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
                  ),
                  _buildFooterButton(
                    context,
                    'Auction',
                    Icons.gavel_rounded,
                    'https://ifeomachukwuka.ng/auctions',
                  ),
                  _buildFooterButton(
                    context,
                    'Events',
                    Icons.event,
                    'https://ifeomachukwuka.ng/buy-online',
                  ),
                  _buildFooterButton(
                    context,
                    'More',
                    Icons.more_vert,
                  ),
                ],
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
  IconData iconData, [
  String? url,
]) {
  return GestureDetector(
    onTap: () {
      if (label == 'Home') {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => AdminPage(), // Navigate to AdminPage
        ));
      } else if (label == 'More') {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MorePage(), // Navigate to MorePage
        ));
      } else if (url != null) {
        openWebView(url, label, context);
      }
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

  void openWebView(String url, String title, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebViewFile(initialUrl: url, title: title),
      ),
    );
  }

  Widget _buildBox(
      String label, IconData iconData, String url, BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateToUrl(context, url);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical:
                12), // Adjust padding as needed. This adjusts the height and width if the box
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Color.fromARGB(255, 61, 101, 157),
                    fontSize: 16, // Adjust font size as needed
                  ),
                ),
              ],
            ),
            SizedBox(width: 180), // Add space between label and arrow
            Icon(
              Icons.arrow_forward,
              color: Color.fromARGB(255, 61, 101, 157),
            ),
          ],
        ),
      ),
    );
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
        //title: Text('NEWSROOM'),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}