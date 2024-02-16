import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:webview_flutter/webview_flutter.dart';

// class AdminPage extends StatelessWidget {

class GuestPage extends StatefulWidget {
  @override
  _GuestPageState createState() => _GuestPageState();
}

class _GuestPageState extends State<GuestPage> {
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
            'assets/logo/logo_white.png', // Replace with the path to your logo image
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
                        left: 35,
                        top: 20,
                        bottom: 0,
                      ),
                      child: Text(
                        'Paid Adverts',
                        style: TextStyle(
                          color: Color.fromARGB(255, 61, 101, 157),
                          fontSize: 16,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
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
                        viewportFraction: 0.8,
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
                          fontWeight: FontWeight.w400,
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
                                _buildBox('Auction', Icons.gavel),
                                _buildBox('Events', Icons.event),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildBox('Drinks', Icons.local_drink),
                                _buildBox('Advert', Icons.announcement),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildBox('My Account', Icons.person),
                                _buildBox('Contact Us', Icons.phone),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildBox('Coming Soon', Icons.timer),
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
                  _buildFooterButton(
                      'Events', Icons.search, 'https://example.com/search'),
                  _buildFooterButton('Events', Icons.notifications,
                      'https://example.com/notifications'),
                  _buildFooterButton(
                      'More', Icons.person, 'https://example.com/profile'),
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
        navigateToUrl(url);
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

  Widget _buildBox(String label, IconData iconData) {
    return Expanded(
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
                size: 20,
                color: Color.fromARGB(255, 61, 101, 157),
              ),
              SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                    color: Color.fromARGB(255, 61, 101, 157), fontSize: 14),
              ),
            ],
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
