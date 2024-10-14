import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_repository/task_repository.dart';
import 'package:sqflite_task_api/sqflite_task_api.dart';
import 'package:flutter_todo/home/home.dart';
import 'package:flutter_todo/home/cubit/task_cubit.dart';

void main() {
  final taskApi = SqfliteTaskApi();
  final taskRepository = TaskRepository(taskApi: taskApi);

  runApp(App(taskRepository: taskRepository));
}

class App extends StatelessWidget {
  final TaskRepository taskRepository;

  const App({super.key, required this.taskRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TaskCubit(taskRepository),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
