import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:to_do_list/business_logic/cubit/task_cubit.dart';
import 'package:to_do_list/main.dart';
import 'package:to_do_list/presentation/screens/add_task_page.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<TaskCubit, MyState>(
      listener: (context, state) {
        // if (state is TaskStateAdd) {
        //   Tasks.add(state.task);
        // }
        if (state is TaskStateArchieve) {}
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Tasks")),
        ),
        // ignore: prefer_const_literals_to_create_immutables
        body: BlocConsumer<TaskCubit, MyState>(
          listener: (context, state) {
            if (state is TaskStateAdd) {
              Tasks.add(state.task);
            }
          },
          builder: (context, state) {
            return ListView(children: (Tasks.isEmpty) ? [] : Tasks);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              (context),
              MaterialPageRoute(
                builder: (BuildContext context) => AddTaskPage(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
