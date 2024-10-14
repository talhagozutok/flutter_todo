import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/home/cubit/task_cubit.dart';
import 'package:flutter_todo/edit_task/edit_task.dart';
import 'package:flutter_todo/home/widgets/task_list_tile.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          if (state is TaskLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TaskLoaded) {
            return ListView(
              children: state.tasks
                  .map((task) => TaskListTile(
                        id: task.id,
                        title: task.title,
                        description: task.description,
                        date: task.date ?? '',
                        isCompleted: task.isCompleted,
                        onToggleComplete: () {
                          final updatedTask = task.copyWith(
                            isCompleted: !task.isCompleted,
                          );
                          BlocProvider.of<TaskCubit>(context)
                              .updateTask(updatedTask);
                        },
                      ))
                  .toList(),
            );
          } else {
            return const Center(child: Text('Something went wrong!'));
          }
        },
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
