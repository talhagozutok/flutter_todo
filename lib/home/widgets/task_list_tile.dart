import 'package:flutter/material.dart';
import 'package:flutter_todo/edit_task/edit_task.dart';

class TaskListTile extends StatelessWidget {
  final String id;
  final String title;
  final String date;
  final String description;
  final bool isCompleted;

  const TaskListTile({
    super.key,
    required this.id,
    required this.title,
    required this.date,
    required this.description,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: textTheme.titleLarge,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      date,
                      style: textTheme.bodySmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                isCompleted ? Icons.done : Icons.radio_button_off_rounded,
                size: 24,
                color: isCompleted ? Colors.green : Colors.grey,
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => EditTaskPage(
              id: id,
              title: title,
              description: description,
              date: date,
              isNewTask: false,
            ),
          ),
        );
      },
    );
  }
}
