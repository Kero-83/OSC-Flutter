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
  late TimeOfDay finalTimeOfDay;
  late DateTime finalDateTime;
  late String date;
  late String time;
  String taskName = "Task ${Tasks.length}";
  @override
  Widget build(BuildContext context) {
    date = "${dateNow.year} - ${dateNow.month} - ${dateNow.day}";
    time = timeNow.format(context);
    return BlocConsumer<TaskCubit, MyState>(
      builder: (context, state) {
        return Scaffold(
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
              BlocListener(
                listener: (context, state) {},
                child: Container(
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
                              Text(
                                " $date",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ],
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () async {
                          final DateTime? dateTime = await showDatePicker(
                            context: context,
                            initialDate: dateNow,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );
                          // setState(() {
                          //   date = "${dateTime.year} - ${dateTime.month} - ${dateTime.day}";
                          // }
                          if(dateTime != null) {
                            BlocProvider.of<TaskCubit>(context).datePickersChange(dateTime);
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
                            Text(
                              " $time",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                          ],
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () async {
                        final TimeOfDay? timeOfDay = await showTimePicker(
                          context: context,
                          initialTime: timeNow,
                        );
                        if (timeOfDay != null) {
                          BlocProvider.of<TaskCubit>(context).timePickersChange(timeOfDay);
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
                onPressed: () => context.read<TaskCubit>().addTask(
                    Task(finaltaskName, finalDateTime, finalTimeOfDay)),
                child: Text('Add Task'),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {
        if (state is DatePickersState) {
          date =
              "${state.dateTime.year} - ${state.dateTime.month} - ${state.dateTime.day}";
        } else if (state is TimePickersState) {
          time = state.timeOfDay.format(context);
        }
      },
    );
  }
}
