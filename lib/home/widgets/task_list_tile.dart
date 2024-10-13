import 'package:flutter/material.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
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
                    'Task title',
                    style: textTheme.titleLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '2024-10-13',
                    style: textTheme.bodySmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'No description',
                    style: textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.radio_button_off_rounded,
              size: 24,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
