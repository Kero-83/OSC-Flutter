// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  late final String task;
  late final DateTime dateTime;
  late final TimeOfDay timeOfDay;
  bool isDone;
  Task(this.task, this.dateTime, this.timeOfDay, {this.isDone = false, super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(75),
                color: Colors.blue,
              ),
              child: Center(child: Text(timeOfDay.format(context))),
            ),
            Text(task),
          ],
        ),
        Row(
          children: [
            Container(
                  height: 30,
                  width: 30,
                  color: isDone ? Colors.green : Colors.black,
                  child: GestureDetector(onTap: () {}, child: Icon(
                    Icons.done,
                    color: Colors.white,
                  ),)
                ),
          
            SizedBox(height: 30,width: 30,child: GestureDetector(onTap: () {}, child: Icon(Icons.archive))),
            ],
        ),
      ],
    );
  }
}
