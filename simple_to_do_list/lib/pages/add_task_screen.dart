import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_to_do_list/cubit/add_screen_cubit.dart';

// class AddTaskScreen extends StatefulWidget {
//   @override
//   _AddTaskScreenState createState() => _AddTaskScreenState();
// }

// class _AddTaskScreenState extends State<AddTaskScreen> {
//   late String taskName;
//   late DateTime dateTime;
//   late TimeOfDay timeOfDay;
//   @override
//   Future<Widget> build(BuildContext context) async {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Task'),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Task Name',
//               ),
//               onChanged: (value) {
//                 setState(() {
//                   taskName = value;
//                 });
//               } ,
//             ),
//             timeOfDay = (await showTimePicker(
//             context: context,
//             initialTime: TimeOfDay.now(),
//             ))!,
//             SizedBox(height: 16.0),

//             ElevatedButton(
//               child: Text('Add Task'),
//               onPressed: () {
//                 Tasks?.add(Task(this.taskName, this.dateTime, this.timeOfDay));}
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

@override
  Widget build(BuildContext context) {
    final taskCubit = BlocProvider.of<AddTaskScreenCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              // Update the task name in the Cubit
              taskCubit.addTask(value);
            },
          ),
          ElevatedButton(
            onPressed: () {
              // Add the task using the Cubit
              taskCubit.addTask();
              Navigator.pop(context);
            },
            child: const Text('Add Task'),
          ),
        ],
      ),
    );
  }
}