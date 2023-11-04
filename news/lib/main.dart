import 'package:flutter/material.dart';
import 'package:news/views/screens/home_screen.dart';
import 'package:news/views/widgets/bottom_navigation_bar.dart';
import 'package:news/views/widgets/curved_navigator_bar_example.dart';
import 'package:news/views/widgets/dot_navigator_bar_example.dart';
import 'package:news/views/widgets/tapped_navigation_bar_example.dart';
import 'package:news/views/widgets/top_navigation_bar_example.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarExample(),
    );
  }
}
