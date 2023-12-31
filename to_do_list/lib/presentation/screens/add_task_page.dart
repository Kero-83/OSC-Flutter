// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, use_key_in_widget_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/business_logic/cubit/task_cubit.dart';
import 'package:to_do_list/data/task.dart';
import 'package:to_do_list/main.dart';

final dateNow = DateTime.now();
final timeNow = TimeOfDay.now();

class AddTaskPage extends StatelessWidget {
  TimeOfDay selectedTime = timeNow;
  DateTime selectedDate = dateNow;
  final int tasksNum = Tasks.length;
  late final String finalTaskName;
  late String date, time, taskName = "Task ${tasksNum + 1}";
  @override
  Widget build(BuildContext context) {
    date = "${selectedDate.year} - ${selectedDate.month} - ${selectedDate.day}";
    time = selectedTime.format(context);
    return BlocListener<TaskCubit, MyState>(
      listener: (context, state) {
        if (state is TimePickersState) {
          time = state.timeOfDay.format(context);
        } else if (state is DatePickersState) {
          date =
              "${state.dateTime.year} - ${state.dateTime.month} - ${state.dateTime.day}";
        }
        if (state is TaskStateAdd) {
          
          Navigator.of(context).pop();
        }
      },
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
              onChanged: (value) =>
                taskName = value,
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
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      ).then((value) {
                        if (value != null) {
                          selectedDate = value;
                          context.read<TaskCubit>().datePickersChange(value);
                        }
                      });
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
                    onTap: () {
                      showTimePicker(
                        context: context,
                        initialTime: selectedTime,
                      ).then(
                        (value) {
                          if (value != null) {
                            selectedTime = value;
                            (context)
                                .read<TaskCubit>()
                                .timePickersChange(value);
                          }
                        },
                      );
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
              onPressed: () {
                finalTaskName = taskName;
                context
                  .read<TaskCubit>()
                  .addTask(Task(finalTaskName, selectedDate, selectedTime));},
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
