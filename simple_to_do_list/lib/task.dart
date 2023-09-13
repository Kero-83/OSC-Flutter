// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  static int counter = 0;
  late String task;
  late DateTime dateTime;
  late TimeOfDay timeOfDay;

  Task(this.task, this.dateTime, this.timeOfDay, {super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              child: Text(timeOfDay.format(context)),
            ),
            Text(task),
            Container(
              height: 10,
              width: 10,
              color: Colors.green,
              child: IconButton(onPressed: () {}, icon: Icon(
                Icons.done,
                color: Colors.white,
              ),)
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.archive)),
          ],
        )
      ],
    );
  }
}
