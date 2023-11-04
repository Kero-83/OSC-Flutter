import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class CurvedNavigationBarExample extends StatefulWidget {
  @override
  _CurvedNavigationBarExampleState createState() =>
      _CurvedNavigationBarExampleState();
}

class _CurvedNavigationBarExampleState
    extends State<CurvedNavigationBarExample> {
  int _selectedPage = 0;

  final List<Widget> _pageOptions = [
    Center(child: Text('Page 1')),
    Center(child: Text('Page 2')),
    Center(child: Text('Page 3')),
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
