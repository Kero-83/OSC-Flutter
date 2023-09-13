import 'package:bloc/bloc.dart';
import 'package:simple_to_do_list/cubit/add_screen_state.dart';
import 'package:simple_to_do_list/task.dart';

class AddTaskScreenCubit extends Cubit<AddTaskScreenState>{
  AddTaskScreenCubit() : super(AddTaskScreenState());
  void addTask([String taskName = "Task"]) {

  }
}