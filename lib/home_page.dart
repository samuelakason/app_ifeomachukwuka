import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color.fromARGB(255, 15, 25, 82),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Logo
          Image.asset(
            'assets/new/logo1_black.png',
            width: 100, // Adjust the size as needed
            height: 100,
          ),
          // Image under the logo
          Image.asset(
            'path_to_your_image',
            width: 100, // Adjust the size as needed
            height: 100,
          ),
          // Name IfeomaChukwuka under the image
          Text(
            'IfeomaChukwuka',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          // Three buttons under the name
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle button 1 click
                },
                child: Text('Button 1'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle button 2 click
                },
                child: Text('Button 2'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle button 3 click
                },
                child: Text('Button 3'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
