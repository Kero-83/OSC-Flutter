part of 'task_cubit.dart';

abstract class MyState {
  MyState() : super();
}

abstract class TaskState extends MyState {
  final Task task;
  TaskState(this.task) : super();
}

final class TaskInitial extends TaskState {
  TaskInitial() : super(Task("task", dateNow, timeNow));
}

class TaskStateAdd extends TaskState {
  TaskStateAdd(super.task);
}

class TaskStateArchieve extends TaskState {
  TaskStateArchieve(super.task);
}

class TaskStateDone extends TaskState {
  TaskStateDone(super.task);
}


class DatePickersState extends MyState {
  final DateTime dateTime;

  DatePickersState(this.dateTime) : super();
}

class TimePickersState extends MyState {
  final TimeOfDay timeOfDay;
  TimePickersState(this.timeOfDay) : super();
}
