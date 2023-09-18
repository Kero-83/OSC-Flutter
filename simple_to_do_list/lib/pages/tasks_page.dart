// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:simple_to_do_list/pages/add_task_screen.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("New Tasks"),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheet(
            elevation: 787,
            backgroundColor: Colors.white70,
              context: context,
              builder: (BuildContext context) => AddTaskScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
