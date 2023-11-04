import 'package:flutter/material.dart';

class TopNavigationBarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Navigation Bar Example'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
              // For example, navigate to a search screen or show a search dialog.
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Implement settings functionality
              // For example, navigate to the settings screen or show a settings menu.
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Your app content goes here.'),
      ),
    );
  }
}
