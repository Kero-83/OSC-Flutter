import 'package:flutter/material.dart';

class DotNavigatorBarExample extends StatefulWidget {
  @override
  _DotNavigatorBarExampleState createState() => _DotNavigatorBarExampleState();
}

class _DotNavigatorBarExampleState extends State<DotNavigatorBarExample> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  final List<String> pages = ["Page 1", "Page 2", "Page 3", "Page 4"];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dot Navigator Bar Example"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: PageView(
              controller: _pageController,
              children: pages
                  .map((page) => Center(
                        child: Text(
                          page,
                          style: TextStyle(fontSize: 24),
                        ),
                      ))
                  .toList(),
            ),
          ),
          _buildDotNavigator(),
        ],
      ),
    );
  }

  Widget _buildDotNavigator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: pages.asMap().entries.map((entry) {
        final int index = entry.key;
        return Container(
          width: 8.0,
          height: 8.0,
          margin: EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == _currentPage ? Colors.blue : Colors.grey,
          ),
        );
      }).toList(),
    );
  }
}
