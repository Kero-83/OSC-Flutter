import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/business_logic/cubit/task_cubit.dart';

// ignore: must_be_immutable
class Task extends StatelessWidget {
  late final String task;
  late final DateTime dateTime;
  late final TimeOfDay timeOfDay;
  bool isDone;
  Task(this.task, this.dateTime, this.timeOfDay,
      {this.isDone = false, super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
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
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text(
                    task,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text("${dateTime.year} - ${dateTime.month} - ${dateTime.day}")
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
                height: 30,
                width: 30,
                color: isDone ? Colors.green : Colors.black,
                child: GestureDetector(
                  onTap: () => context.read<TaskCubit>().doneTask(this),
                  child: const Icon(
                    Icons.done,
                    color: Colors.white,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => context.read<TaskCubit>().archieveTask(this),
                child: const Icon(
                  Icons.archive,
                  size: 40.0,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
