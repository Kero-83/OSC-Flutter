import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:to_do_list/business_logic/cubit/task_cubit.dart';
import 'package:to_do_list/main.dart';
import 'package:to_do_list/presentation/screens/add_task_page.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskCubit, MyState>(
      listener: (context, state) {
        if (state is TaskStateAdd) {
          Tasks.add(state.task);
        } else if (state is TaskStateDone) {
          DoneTasks.add(state.task);
          Tasks.remove(state.task);
          state.task.isDone = true;
        } else if (state is TaskStateArchieve) {
          ArchivedTasks.add(state.task);
          Tasks.remove(state.task);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Center(child: Text("Tasks")),
          ),
          body: ListView(children: (Tasks.isEmpty) ? [] : Tasks),
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
        );
      },
    );
  }
}
