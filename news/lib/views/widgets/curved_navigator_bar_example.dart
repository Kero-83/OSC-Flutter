import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:news/views/screens/home_screen.dart';

class CurvedNavigationBarExample extends StatefulWidget {
  @override
  _CurvedNavigationBarExampleState createState() =>
      _CurvedNavigationBarExampleState();
}

class _CurvedNavigationBarExampleState
    extends State<CurvedNavigationBarExample> {
  int _selectedPage = 0;

  final List<Widget> _pageOptions = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Curved Navigation Bar Example'),
      ),
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedPage,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.search, size: 30),
          Icon(Icons.favorite, size: 30),
          Icon(Icons.person, size: 30),
        ],
        color: Colors.blue,
        buttonBackgroundColor: Colors.blue,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
      ),
    );
  }
}
