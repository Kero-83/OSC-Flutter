// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, use_key_in_widget_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/business_logic/cubit/task_cubit.dart';
import 'package:to_do_list/data/task.dart';
import 'package:to_do_list/main.dart';

final dateNow = DateTime.now();
final timeNow = TimeOfDay.now();

class AddTaskPage extends StatelessWidget {
  late String finaltaskName;

  late TimeOfDay finalTimeOfDay, selectedTime = timeNow;

  late DateTime finalDateTime, selectedDate = dateNow;

  late String date;

  late String time;

  String taskName = "Task ${Tasks.length}";

  @override
  Widget build(BuildContext context) {
    date = "${selectedDate.year} - ${selectedDate.month} - ${selectedDate.day}";
    time = selectedTime.format(context);
    return BlocProvider(
      create: (context) => TaskCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Task'),
        ),
        body: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Task Name',
              ),
              onChanged: (value) {
                taskName = value;
              },
            ),
            Container(
              alignment: Alignment.center,
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.date_range,
                            size: 18.0,
                            color: Colors.blue,
                          ),
                          BlocBuilder<TaskCubit, MyState>(
                            builder: (context, state) {
                              return Text(
                                " $date",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              );
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () async {
                      final DateTime? dateTime = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      // setState(() {
                      //   selectedDate = dateTime!;
                      // });
                      if(dateTime != null) {
                        (context).read<TaskCubit>().datePickersChange(dateTime);
                      }
                    },
                    child: Text(
                      "Change ",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.access_time,
                            size: 18.0,
                            color: Colors.blue,
                          ),
                          BlocBuilder<TaskCubit, MyState>(
                            builder: (context, state) {
                              return Text(
                                " $time",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              );
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () async {
                      final TimeOfDay? timeOfDay = await showTimePicker(
                        context: context,
                        initialTime: selectedTime,
                      );
                      // setState(() {
                      //   selectedTime = timeOfDay!;
                      // });
                      if (timeOfDay != null) {
                        BlocProvider(create: (context) => TaskCubit());
                      }
                    },
                    child: Text(
                      "Change ",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              // => context
              // .read<TaskCubit>()
              // .addTask(Task(finaltaskName, finalDateTime, finalTimeOfDay)),
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
