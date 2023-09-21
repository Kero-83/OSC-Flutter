import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/business_logic/cubit/task_cubit.dart';
import 'package:to_do_list/main.dart';

class DonePage extends StatelessWidget {
  const DonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskCubit, MyState>(
      listener: (context, state) {
          if(state is TaskStateArchieve){
            ArchivedTasks.add(state.task);
            DoneTasks.remove(state.task);
          }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Center(child: Text("Done Tasks")),
          ),
          body: ListView(children: (DoneTasks.isEmpty) ? [] : DoneTasks),
        );
      },
    );
  }
}
