// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ArchivedPage extends StatelessWidget {
  const ArchivedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Archived Tasks"),
      ),
      // ignore: prefer_const_literals_to_create_immutables
      body: ListView(children: []),
    );
  }
}
