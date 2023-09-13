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
      body: ListView(children: []),
    );
  }
}
