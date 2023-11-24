// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:news/widgets/body_design.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "News",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Row(
                // mainAxisSize: MainAxisSize.min,
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon(
                  //   Icons.search,
                  //   color: Colors.black,
                  // ),
                  // Icon(
                  //   Icons.notifications_none,
                  //   color: Colors.black,
                  // ),
                  Container(
                    margin: EdgeInsets.fromLTRB(3.5, 0, 0, 0),
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      'https://avatars.githubusercontent.com/u/110491713?v=4',
                    ),
                  ),
                ],
              )
            ],
          ),
          bottom: TabBar(tabs: [
            Tab(
              child: Text(
                'Sports',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            Tab(
              child: Text(
                'Health',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            Tab(
              child: Text(
                'Science',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            Tab(
              child: Text(
                'Tech',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ]),
        ),
        backgroundColor: Colors.white,
        body: TabBarView(
          children: [
            BodyDesign(
              category: 'Sports',
            ),
            BodyDesign(
              category: 'Health',
            ),
            BodyDesign(
              category: 'Science',
            ),
            BodyDesign(
              category: 'Tech',
            ),
          ],
        ),
      ),
    );
  }
}
