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
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     _buildBox(
                            //       'OUR NEWSROOM',
                            //       Icons.gavel_rounded,
                            //       'https://ifeomachukwuka.rechargenow.ng/blogs',
                            //       context,
                            //     ),
                            //   ],
                            // ),
                            Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    ElevatedButton(
      onPressed: () => openWebView(
        'https://ifeomachukwuka.rechargenow.ng/blogs',
        'OUR NEWSROOM',
        context,
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set the background color to white
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'VISIT OUR NEWSROOM',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.black,
            ),
          ],
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
                    'https://ifeomachukwuka.rechargenow.ng/auctions',
                  ),
                  _buildFooterButton(
                    context,
                    'Events',
                    Icons.event,
                    'https://ifeomachukwuka.rechargenow.ng/buy-online',
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
      BuildContext context, String label, IconData iconData,
      [String? url]) {
    return GestureDetector(
      onTap: () {
        if (label == 'Home') {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AdminPage(), // Navigate to AdminPage
          ));
        } else if (label == 'More') {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MorePage(), // Navigate to AdminPage
          ));
        } else {
          // For other labels, navigate using navigateToUrl
          if (url != null) {
            navigateToUrl(context, url);
          }
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
              color:
                  Color.fromARGB(255, 61, 101, 157), // This represents #3d659d
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
                // Icon(
                //   iconData,
                //   color: Color.fromARGB(255, 61, 101, 157),
                // ),
                // SizedBox(width: 70), // Add space between icon and label
                Text(
                  label,
                  style: TextStyle(
                    color: Color.fromARGB(255, 61, 101, 157),
                    fontSize: 16, // Adjust font size as needed
                  ),
                ),
              ],
            ),
            //SizedBox(width: 190),
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

// Dummy classes for illustration purposes
// class AdminPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Admin Page'),
//       ),
//       body: Center(
//         child: Text('Admin Page Content'),
//       ),
//     );
//   }
// }








































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
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     _buildBox(
                            //       'OUR NEWSROOM',
                            //       Icons.gavel_rounded,
                            //       'https://ifeomachukwuka.rechargenow.ng/blogs',
                            //       context,
                            //     ),
                            //   ],
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () => openWebView(
                                    'https://ifeomachukwuka.rechargenow.ng/blogs',
                                    'OUR NEWSROOM',
                                    context,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white, // Background color
                                    onPrimary: Colors.white, // Text color
                                    minimumSize: Size(200,
                                        50), // Set the minimum width and height
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'VISIT OUR NEWSROOM',
                                        style: TextStyle(
                                            color: Colors.black), // Text color
                                      ),
                                      SizedBox(width: 155),
                                      Icon(Icons.arrow_forward,
                                          color: Colors.black), // Icon color
                                    ],
                                  ),
                                )
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
                    'https://ifeomachukwuka.rechargenow.ng/auctions',
                  ),
                  _buildFooterButton(
                    context,
                    'Events',
                    Icons.event,
                    'https://ifeomachukwuka.rechargenow.ng/buy-online',
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
      BuildContext context, String label, IconData iconData,
      [String? url]) {
    return GestureDetector(
      onTap: () {
        if (label == 'Home') {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AdminPage(), // Navigate to AdminPage
          ));
        } else if (label == 'More') {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MorePage(), // Navigate to AdminPage
          ));
        } else {
          // For other labels, navigate using navigateToUrl
          if (url != null) {
            navigateToUrl(context, url);
          }
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
              color:
                  Color.fromARGB(255, 61, 101, 157), // This represents #3d659d
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
                // Icon(
                //   iconData,
                //   color: Color.fromARGB(255, 61, 101, 157),
                // ),
                // SizedBox(width: 70), // Add space between icon and label
                Text(
                  label,
                  style: TextStyle(
                    color: Color.fromARGB(255, 61, 101, 157),
                    fontSize: 16, // Adjust font size as needed
                  ),
                ),
              ],
            ),
            //SizedBox(width: 190),
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

// Dummy classes for illustration purposes
// class AdminPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Admin Page'),
//       ),
//       body: Center(
//         child: Text('Admin Page Content'),
//       ),
//     );
//   }
// }




































import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WebViewExample(),
    );
  }
}

class WebViewExample extends StatefulWidget {
  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  late WebViewController _controller;
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebView Example'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () async {
              if (await _controller.canGoBack()) {
                _controller.goBack();
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _controller.reload();
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://www.google.com',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller = webViewController;
            },
            onPageFinished: (String url) {
              setState(() {
                _isLoading = false;
              });
            },
          ),
          if (_isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}























































import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WebViewExample(),
    );
  }
}

class WebViewExample extends StatefulWidget {
  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  late WebViewController _controller;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebView Example'),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://www.google.com',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller = webViewController;
            },
            onPageFinished: (String url) {
              setState(() {
                _isLoading = false;
              });
            },
          ),
          if (_isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _loadGooglePage();
        },
        tooltip: 'NewsRoom',
        child: Icon(Icons.chrome_reader_mode),
      ),
    );
  }

  void _loadGooglePage() {
    setState(() {
      _isLoading = true;
    });
    _controller.loadUrl('https://www.google.com');
  }
}

















































import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'Admin.dart';

// class AdminPage extends StatelessWidget {

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
                                _buildBox('NewsRoom', Icons.gavel,
                                    'https://ifeomachukwuka.rechargenow.ng/blogs'),
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
                      'Home', Icons.home, 'https://example.com/home'),
                  _buildFooterButton(
                      'Auction', Icons.gavel, 'https://example.com/search'),
                  _buildFooterButton(
                      'Events', Icons.event, 'https://example.com/event'),
                  _buildFooterButton(
                      'More', Icons.more_vert, 'https://example.com/profile'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooterButton(String label, IconData iconData, String url) {
    return GestureDetector(
      onTap: () {
        if (label == 'Home') {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AdminPage(), // Navigate to AdminPage
          ));
        } else if (label == 'More') {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const MyApp(), // Navigate to MyApp
          ));
        } else {
          // For other labels, navigate using navigateToUrl
          navigateToUrl(url);
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
          Text(label,
              style: TextStyle(
                color: Color.fromARGB(
                    255, 61, 101, 157), // This represents #3d659d
                fontSize: 12,
              )),
        ],
      ),
    );
  }

  void navigateToUrl(String url) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => WebViewPage(url: url),
    ));
  }

  Widget _buildBox(String label, IconData iconData, String linkUrl) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          navigateToUrl(linkUrl);
        },
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          margin: EdgeInsets.all(8),
          child: Container(
            height: 80,
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconData,
                  size: 24,
                  color: Color.fromARGB(255, 61, 101, 157),
                ),
                SizedBox(height: 4),
                Text(
                  label,
                  style: TextStyle(
                    color: Color.fromARGB(255, 61, 101, 157),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCurvedImage(String imagePath, String? linkUrl) {
    return GestureDetector(
      onTap: () {
        if (linkUrl != null) {
          navigateToUrl(linkUrl);
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          width: double.infinity,
          child: Image.asset(imagePath, fit: BoxFit.cover),
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
        automaticallyImplyLeading: false,
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}













































































import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'Admin.dart';

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
                    icon: Icons.home_rounded,
                    label: 'Home',
                    index: 1,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AdminPage(), // Use the new page
                      ));
                    },
                  ),
                  buildButton(
                    icon: Icons.gavel_rounded,
                    label: 'Auction',
                    index: 2,
                    onPressed: () {
                      navigateToUrl(
                          'https://ifeomachukwuka.rechargenow.ng/auctions');
                    },
                  ),
                  buildButton(
                    icon: Icons.event,
                    label: 'Events',
                    index: 3,
                    onPressed: () {
                      navigateToUrl(
                          'https://ifeomachukwuka.rechargenow.ng/buy-oline');
                    },
                  ),
                  buildButton(
                    icon: Icons.more_vert,
                    label: 'More',
                    index: 0,
                    onPressed: () {
                      // navigateToUrl(
                      //     'https://ifeomachukwuka.rechargenow.ng/buy-online');
                    },
                  ),
                  // buildButton(
                  //   icon: Icons.login,
                  //   label: 'My Account',
                  //   index: 4,
                  //   onPressed: () {
                  //     navigateToUrl(
                  //         'https://ifeomachukwuka.rechargenow.ng/app/dashboard');
                  //   },
                  // ),
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
