import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/business_logic/cubit/task_cubit.dart';
import 'package:to_do_list/main.dart';

class ArchivedPage extends StatelessWidget {
  const ArchivedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskCubit, MyState>(
      listener: (context, state) {
        if (state is TaskStateDone) {
          state.task.isDone = true;
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Center(child: Text("Archived Tasks")),
          ),
          body: ListView(
            children: (ArchivedTasks.isEmpty) ? [] : ArchivedTasks,
          ),
        );
      },
    );
  }
}
