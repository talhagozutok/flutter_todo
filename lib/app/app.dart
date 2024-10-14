import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/app/app_theme.dart';
import 'package:task_repository/task_repository.dart';
import 'package:flutter_todo/home/home.dart';
import 'package:flutter_todo/home/cubit/task_cubit.dart';

class App extends StatelessWidget {
  final TaskRepository taskRepository;

  const App({super.key, required this.taskRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TaskCubit(taskRepository),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.dark,
        themeMode: ThemeMode.dark,
        home: const HomePage(),
      ),
    );
  }
}
