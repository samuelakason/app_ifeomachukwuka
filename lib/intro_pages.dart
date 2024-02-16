import 'package:flutter/material.dart';

class IntroPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageView(
          children: [
            IntroPageBreweries(),
            IntroPageEvents(),
            IntroPageAuction(),
            IntroPageAdverts(),
          ],
        ),
      ),
    );
  }
}

class IntroPageBreweries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implement your IntroPageBreweries UI here
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text('Intro Page Breweries'),
      ),
    );
  }
}

class IntroPageEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implement your IntroPageEvents UI here
    return Container(
      color: Colors.green,
      child: Center(
        child: Text('Intro Page Events'),
      ),
    );
  }
}

class IntroPageAuction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implement your IntroPageAuction UI here
    return Container(
      color: Colors.orange,
      child: Center(
        child: Text('Intro Page Auction'),
      ),
    );
  }
}

class IntroPageAdverts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implement your IntroPageAdverts UI here
    return Container(
      color: Colors.purple,
      child: Center(
        child: Text('Intro Page Adverts'),
      ),
    );
  }
}
