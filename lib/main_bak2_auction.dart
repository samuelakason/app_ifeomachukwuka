import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BidHub'),
        backgroundColor: Colors.blueGrey[900],
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Image.asset(
                  'assets/launch_image.png', // Replace with your app logo
                  height: 100,
                ),
                SizedBox(height: 10),
                Text(
                  'Your Ultimate Auction Platform',
                  style: TextStyle(
                    color: Colors.blueGrey[700],
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    // Add navigation to your app's main page
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
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
                SizedBox(height: 50),
                SectionTitle(title: 'Featured Products'),
                SizedBox(height: 20),
                ProductCarousel(),
                SizedBox(height: 50),
                SectionTitle(title: 'How It Works'),
                SizedBox(height: 20),
                HowItWorks(),
                SizedBox(height: 50),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white, // Background color of the buttons
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildButton(
                    icon: Icons.home,
                    label: 'Home',
                    onPressed: () {
                      // Add navigation logic for Home
                    },
                  ),
                  buildButton(
                    icon: Icons.wine_bar,
                    label: 'Categories',
                    onPressed: () {
                      // Add navigation logic for Categories
                    },
                  ),
                  buildButton(
                    icon: Icons.contact_mail,
                    label: 'Contact Us',
                    onPressed: () {
                      // Add navigation logic for Contact Us
                    },
                  ),
                  buildButton(
                    icon: Icons.store,
                    label: 'Events',
                    onPressed: () {
                      // Add navigation logic for Events
                    },
                  ),
                  buildButton(
                    icon: Icons.login,
                    label: 'My Account',
                    onPressed: () {
                      // Add navigation logic for My Account
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: Colors.blueGrey[900],
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.blueGrey[900],
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.blueGrey[900],
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ProductCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ProductCard(imageUrl: 'assets/product1.jpg'),
          ProductCard(imageUrl: 'assets/product2.jpg'),
          ProductCard(imageUrl: 'assets/product3.jpg'),
          // Add more ProductCard widgets for additional products
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;

  ProductCard({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class HowItWorks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepWidget(number: '1', title: 'Sign Up'),
        StepWidget(number: '2', title: 'Browse Auctions'),
        StepWidget(number: '3', title: 'Place Bids'),
        StepWidget(number: '4', title: 'Win and Enjoy!'),
      ],
    );
  }
}

class StepWidget extends StatelessWidget {
  final String number;
  final String title;

  StepWidget({required this.number, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.amber,
          child: Text(
            number,
            style: TextStyle(
              color: Colors.blueGrey[900],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 10),
        Text(
          title,
          style: TextStyle(
            color: Colors.blueGrey[700],
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
