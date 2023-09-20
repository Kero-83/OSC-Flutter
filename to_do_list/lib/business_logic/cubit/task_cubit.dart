import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/data/task.dart';
import 'package:to_do_list/main.dart';
import 'package:to_do_list/presentation/screens/add_task_page.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<MyState> {
  TaskCubit() : super(TaskInitial());
  void addTask(Task task) {
    emit(TaskStateAdd(task));
  }

  void archieveTask(Task task) {
    ArchivedTasks.add(task);
    if (DoneTasks.contains(task)) {
      DoneTasks.remove(task);
    }
    emit(TaskStateArchieve(task));
  }

  void doneTask(Task task) {
    DoneTasks.add(task);
    emit(TaskStateDone(task));
  }

  void datePickersChange(DateTime dateTime) => emit(DatePickersState(dateTime));
  void timePickersChange(TimeOfDay time) => emit(TimePickersState(time));
}
