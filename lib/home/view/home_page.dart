import 'package:flutter/material.dart';
import 'package:flutter_todo/edit_task/edit_task.dart';
import 'package:flutter_todo/home/home.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: const Column(
        children: [
          FiltersWidget(),
          Divider(),
          Center(
            child: Column(
              children: [
                TaskListTile(
                  title: 'Task title',
                  description: 'No description',
                  date: '2024-10-13',
                  isCompleted: false,
                ),
                TaskListTile(
                  title: 'Make the mistake you had to make.',
                  description: 'No description',
                  date: '2024-10-13',
                  isCompleted: true,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          var now = DateTime.now();
          var formatter = DateFormat('yyyy-MM-dd');
          String formattedDate = formatter.format(now);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => EditTaskPage(
                title: null,
                description: null,
                date: formattedDate,
                isNewTask: true,
              ),
            ),
          );
        },
      ),
    );
  }
}
