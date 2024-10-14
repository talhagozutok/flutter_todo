import 'package:flutter/material.dart';
import 'package:flutter_todo/edit_task/edit_task.dart';

class TaskListTile extends StatelessWidget {
  final String id;
  final String title;
  final String date;
  final String description;
  final bool isCompleted;
  final VoidCallback onToggleComplete; // Callback for toggling completion

  const TaskListTile({
    super.key,
    required this.id,
    required this.title,
    required this.date,
    required this.description,
    required this.isCompleted, // Make isCompleted required
    required this.onToggleComplete,
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
              GestureDetector(
                // Make the icon clickable
                onTap: onToggleComplete, // Toggle task completion on tap
                child: Icon(
                  isCompleted ? Icons.done : Icons.radio_button_off_rounded,
                  size: 24,
                  color: isCompleted ? Colors.green : Colors.grey,
                ),
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
              isCompleted: isCompleted,
              isNewTask: false,
            ),
          ),
        );
      },
    );
  }
}
