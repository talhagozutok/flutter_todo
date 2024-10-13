import 'package:flutter/material.dart';
import 'package:flutter_todo/home/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
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
    );
  }
}
