import 'package:flutter/material.dart';
import 'package:flutter_todo/home/home.dart';

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
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class FiltersWidget extends StatelessWidget {
  const FiltersWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Row(
          children: [
            InputChip(
              label: const Text('All'),
              selected: true,
              onSelected: (_) => {},
              selectedColor: true ? Colors.lightGreen : null,
            ),
            const SizedBox(width: 8),
            InputChip(
              label: const Text('Completed'),
              selected: false,
              onSelected: (_) => {},
              selectedColor: false ? Colors.lightGreen : null,
            ),
            const SizedBox(width: 8),
            InputChip(
              label: const Text('Incomplete'),
              selected: false,
              onSelected: (_) => {},
              selectedColor: false ? Colors.lightGreen : null,
            ),
          ],
        ),
      ),
    );
  }
}
