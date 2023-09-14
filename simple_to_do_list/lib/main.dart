// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:simple_to_do_list/pages/archived_page.dart';
import 'package:simple_to_do_list/pages/done_page.dart';
import 'package:simple_to_do_list/pages/tasks_page.dart';
import 'package:simple_to_do_list/task.dart';
void main() => runApp(SimpleToDoList());

List <Task>? Tasks, DoneTasks, ArchivedTasks;

class SimpleToDoList extends StatelessWidget {
  const SimpleToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    TasksPage(),
    DonePage(),
    ArchivedPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.table_rows_rounded),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt_rounded),
            label: 'Done',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive_rounded),
            label: 'Archive',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}