import 'package:flutter/material.dart';
import 'package:to_do_list/main.dart';

class DonePage extends StatelessWidget {
  const DonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Done Tasks")),
      ),
      // ignore: prefer_const_literals_to_create_immutables
      body: ListView(children:(DoneTasks.isEmpty) ? [] : DoneTasks),
    );
  }
}