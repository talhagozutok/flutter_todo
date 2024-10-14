import 'package:flutter/material.dart';
import 'package:flutter_todo/app/app.dart';
import 'package:task_repository/task_repository.dart';
import 'package:sqflite_task_api/sqflite_task_api.dart';

void main() {
  final taskApi = SqfliteTaskApi();
  final taskRepository = TaskRepository(taskApi: taskApi);

  runApp(App(taskRepository: taskRepository));
}
