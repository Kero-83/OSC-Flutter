import 'package:flutter/material.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Archived Tasks"),
      ),
      // ignore: prefer_const_literals_to_create_immutables
      body: ListView(children: []),
    );
  }
}