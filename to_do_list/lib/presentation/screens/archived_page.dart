import 'package:flutter/material.dart';
import 'package:to_do_list/main.dart';

class ArchivedPage extends StatelessWidget {
  const ArchivedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Archived Tasks")),
      ),
      // ignore: prefer_const_literals_to_create_immutables
      body: ListView(children:(ArchivedTasks.isEmpty) ? [] : ArchivedTasks),
    );
  }
}