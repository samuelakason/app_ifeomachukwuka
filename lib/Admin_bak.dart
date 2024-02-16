import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'more.dart';
import 'webview.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).popUntil((route) => route.isFirst);
        return false; // Prevent default behavior
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 20, 25, 82),
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/logo/white.png',
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
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 25,
                          top: 20,
                          bottom: 0,
                        ),
                        child: Text(
                          'Paid Adverts',
                          style: TextStyle(
                            color: Color.fromARGB(255, 61, 101, 157),
                            fontSize: 16,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      CarouselSlider(
                        items: [
                          _buildCurvedImage('assets/banner/HovaPay.png', 'HovaPay', 'https://hovapay.ng'),
                          _buildCurvedImage('assets/banner/Hovasms.png', 'HovaSMS', 'https://hovasms.ng'),
                          _buildCurvedImage('assets/banner/Zaffiro.png', 'Zaffiro International', 'https://www.zaffirointernational.com/'),
                          _buildCurvedImage('assets/banner/FastCloud.png', 'FastCloud', 'https://www.fastcloud.ng'),
                        ],
                        options: CarouselOptions(
                          height: 180.0,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                          viewportFraction: 0.87,
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 30,
                          top: 10,
                          bottom: 2,
                        ),
                        child: Text(
                          'Quick Links',
                          style: TextStyle(
                            color: Color.fromARGB(255, 61, 101, 157),
                            fontSize: 16,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        color: Color.fromARGB(255, 238, 244, 248),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildWebBox('Auction', Icons.gavel_rounded, 'https://ifeomachukwuka.rechargenow.ng/auctions'),
                                  _buildWebBox('Events', Icons.event, 'https://ifeomachukwuka.rechargenow.ng/buy-online'),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildWebBox('Drinks', Icons.local_drink, 'https://ifeomachukwuka.rechargenow.ng/categories'),
                                  _buildWebBox('Advert', Icons.announcement, 'https://ifeomachukwuka.rechargenow.ng/auctions/mobile-app-advert'),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildWebBox('My Account', Icons.person, 'https://ifeomachukwuka.rechargenow.ng/app/login'),
                                  _buildWebBox('Contact Us', Icons.phone, 'https://ifeomachukwuka.rechargenow.ng/contact-us'),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildWebBox('Logistics', Icons.local_shipping, 'https://ifeomachukwuka.rechargenow.ng/coming-soon'),
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
                    _buildFooterButton('Home', Icons.home, ''),
                    _buildFooterButton('Auction', Icons.gavel_rounded, 'https://ifeomachukwuka.rechargenow.ng/auctions'),
                    _buildFooterButton('Events', Icons.event, 'https://ifeomachukwuka.rechargenow.ng/buy-online'),
                    _buildFooterButton('More', Icons.more_vert, 'https://example.com/profile'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooterButton(String label, IconData iconData, String url) {
    return GestureDetector(
      onTap: () {
        if (label == 'Home') {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => AdminPage(),
          ));
        } else if (label == 'More') {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MorePage(),
          ));
        } else {
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

  Widget _buildWebBox(String label, IconData iconData, String url) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          openWebView(url, label, context);
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
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
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

  Widget _buildCurvedImage(String imagePath, String label, linkUrl) {
    return GestureDetector(
      onTap: () {
        if (linkUrl != null) {
          openWebView(linkUrl, label, context);
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

  void openWebView(String url, String title, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => WebViewFile(initialUrl: url, title: title),
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



































































import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'more.dart';
import 'webview.dart';

// class AdminPage extends StatelessWidget {

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  //late WebViewController _webViewController;

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
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
                        top: 20,
                        bottom: 0,
                      ),
                      child: Text(
                        'Paid Adverts',
                        style: TextStyle(
                          color: Color.fromARGB(255, 61, 101, 157),
                          fontSize: 16,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    CarouselSlider(
                      items: [
                        _buildCurvedImage('assets/banner/HovaPay.png', 'HovaPay',
                            'https://hovapay.ng'),
                        _buildCurvedImage('assets/banner/Hovasms.png', 'HovaSMS',
                            'https://hovasms.ng'),
                        _buildCurvedImage('assets/banner/Zaffiro.png', 'Zaffiro International',
                            'https://www.zaffirointernational.com/'),
                        _buildCurvedImage('assets/banner/FastCloud.png', 'FastCloud',
                            'https://www.fastcloud.ng'),
                      ],
                      options: CarouselOptions(
                        height: 180.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction:
                            0.87, //increase the width of the carousel here
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                        top: 10,
                        bottom: 2,
                      ),
                      child: Text(
                        'Quick Links',
                        style: TextStyle(
                          color: Color.fromARGB(255, 61, 101, 157),
                          fontSize: 16,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      color: Color.fromARGB(255, 238, 244, 248),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildWebBox('Auction', Icons.gavel_rounded,
                                      'https://ifeomachukwuka.rechargenow.ng/auctions'),
                                  _buildWebBox('Events', Icons.event,
                                      'https://ifeomachukwuka.rechargenow.ng/buy-online'),
                                ],
                              ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildWebBox('Drinks', Icons.local_drink,
                                    'https://ifeomachukwuka.rechargenow.ng/categories'),
                                _buildWebBox('Advert', Icons.announcement,
                                    'https://ifeomachukwuka.rechargenow.ng/auctions/mobile-app-advert'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildWebBox('My Account', Icons.person,
                                    'https://ifeomachukwuka.rechargenow.ng/app/login'),
                                _buildWebBox('Contact Us', Icons.phone,
                                    'https://ifeomachukwuka.rechargenow.ng/contact-us'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildWebBox('Logistics', Icons.timer, 'https://cdn.dribbble.com/users/2974539/screenshots/11386526/media/2a92f344a0afc841422847f25654f424.gif'),
                                //_buildBox('Contact Us', Icons.chat_bubble_outline),
                                //_buildBox('My Account', Icons.info),
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
                      'Home', Icons.home, ''),
                  _buildFooterButton(
                    'Auction', Icons.gavel_rounded, 'https://ifeomachukwuka.rechargenow.ng/auctions'),
                  _buildFooterButton(
                    'Events', Icons.event, 'https://ifeomachukwuka.rechargenow.ng/buy-online'),
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
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => AdminPage(), // Navigate to AdminPage
        ));
      } else if (label == 'More') {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MorePage(), // Navigate to MyApp
        ));
      } else {
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
    decoration: BoxDecoration(
      color: Colors.white, // Set the background color to white
      borderRadius: BorderRadius.circular(8),
    ),
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

  Widget _buildWebBox(String label, IconData iconData, String url) {
  return Expanded(
    child: GestureDetector(
      onTap: () {
        openWebView(url, label, context);
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
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
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

void openWebView(String url, String title, BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => WebViewFile(initialUrl: url, title: title),
  ));
}


  // Widget _buildCurvedImage(String imagePath, String? linkUrl) {
  //   return GestureDetector(
  //     onTap: () {
  //       if (linkUrl != null) {
  //         navigateToUrl(linkUrl);
  //       }
  //     },
  //     child: ClipRRect(
  //       borderRadius: BorderRadius.circular(5),
  //       child: Container(
  //         width: double.infinity,
  //         child: Image.asset(imagePath, fit: BoxFit.cover),
  //       ),
  //     ),
  //   );
  // }


  Widget _buildCurvedImage(String imagePath, String label, linkUrl) {
  return GestureDetector(
    onTap: () {
      if (linkUrl != null) {
        openWebView(linkUrl, label, context);
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




































import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'more.dart';

// class AdminPage extends StatelessWidget {

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  //late WebViewController _webViewController;

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
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
                        top: 20,
                        bottom: 0,
                      ),
                      child: Text(
                        'Paid Adverts',
                        style: TextStyle(
                          color: Color.fromARGB(255, 61, 101, 157),
                          fontSize: 16,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    CarouselSlider(
                      items: [
                        _buildCurvedImage('assets/banner/banner-1.png',
                            'https://example.com/link2'),
                        _buildCurvedImage('assets/banner/banner-1.png',
                            'https://example.com/link2'),
                        _buildCurvedImage('assets/banner/banner-1.png',
                            'https://example.com/link2'),
                      ],
                      options: CarouselOptions(
                        height: 180.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction:
                            0.87, //increase the width of the carousel here
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                        top: 10,
                        bottom: 2,
                      ),
                      child: Text(
                        'Quick Links',
                        style: TextStyle(
                          color: Color.fromARGB(255, 61, 101, 157),
                          fontSize: 16,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      color: Color.fromARGB(255, 238, 244, 248),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildBox('Auction', Icons.gavel_rounded,
                                    'https://ifeomachukwuka.rechargenow.ng/auctions'),
                                _buildBox('Events', Icons.event,
                                    'https://ifeomachukwuka.rechargenow.ng/buy-online'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildBox('Drinks', Icons.local_drink,
                                    'https://ifeomachukwuka.rechargenow.ng/categories'),
                                _buildBox('Advert', Icons.announcement,
                                    'https://ifeomachukwuka.rechargenow.ng/auctions/mobile-app-advert'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildBox('My Account', Icons.person,
                                    'https://ifeomachukwuka.rechargenow.ng/app/login'),
                                _buildBox('Contact Us', Icons.phone,
                                    'https://ifeomachukwuka.rechargenow.ng/contact-us'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildBox('Coming Soon', Icons.timer, ''),
                                //_buildBox('Contact Us', Icons.chat_bubble_outline),
                                //_buildBox('My Account', Icons.info),
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
                  _buildFooterButton('Auction', Icons.gavel_rounded,
                      'https://ifeomachukwuka.rechargenow.ng/auctions'),
                  _buildFooterButton('Events', Icons.event,
                      'https://ifeomachukwuka.rechargenow.ng/buy-online'),
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
            builder: (context) => MorePage(), // Navigate to MyApp
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
