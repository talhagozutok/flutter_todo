// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/home/cubit/task_cubit.dart';
import 'package:intl/intl.dart';
import 'package:task_repository/task_repository.dart';
import 'package:uuid/uuid.dart';

class EditTaskPage extends StatelessWidget {
  final String? id;
  final String? title;
  final String? date;
  final String? description;
  final bool? isCompleted;
  final bool isNewTask;

  const EditTaskPage({
    super.key,
    this.id,
    this.title,
    this.date,
    this.description,
    this.isCompleted,
    required this.isNewTask,
  });

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    String? _id = id;
    String? _taskTitle = title;
    String? _taskDescription = description;
    String? _taskDate = date;

    return Scaffold(
      appBar: AppBar(
        title: isNewTask ? const Text('Add Task') : const Text('Edit Task'),
        actions: [
          IconButton(
            onPressed: () {
              if (!isNewTask && _id != null) {
                BlocProvider.of<TaskCubit>(context).deleteTask(_id);
                Navigator.pop(context);
              }
            },
            icon: isNewTask ? const Icon(null) : const Icon(Icons.delete),
          )
        ],
      ),
      body: Container(
        padding:
            const EdgeInsets.only(left: 16, top: 24, right: 16, bottom: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildTitleFormWidget(
                    initialValue: title,
                    onChanged: (value) => _taskTitle = value,
                  ),
                  const SizedBox(height: 16),
                  _buildDescriptionFormWidget(
                    initialValue: description,
                    onChanged: (value) => _taskDescription = value,
                  ),
                  const SizedBox(height: 16),
                  _buildDueDateFormWidget(
                    context,
                    initialValue: date,
                    onDateSelected: (selectedDate) {
                      _taskDate = selectedDate;
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final Task newTask = Task(
                      id: _id ?? const Uuid().v4(),
                      title: _taskTitle ?? '',
                      description: _taskDescription ?? '',
                      date: _taskDate ?? '',
                      isCompleted: isCompleted ?? false,
                    );

                    if (isNewTask) {
                      BlocProvider.of<TaskCubit>(context).saveTask(newTask);
                    } else {
                      BlocProvider.of<TaskCubit>(context).updateTask(newTask);
                    }
                    Navigator.pop(context);
                  } else {
                    log('Form validation failed');
                  }
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.save_outlined),
                    SizedBox(width: 4),
                    Text('Save'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildTitleFormWidget({
  String? initialValue,
  required Function(String) onChanged,
}) {
  return TextFormField(
    initialValue: initialValue,
    maxLength: 50,
    onChanged: onChanged,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Title is required';
      }
      return null;
    },
    decoration: const InputDecoration(
      icon: Icon(Icons.edit),
      border: OutlineInputBorder(),
      labelText: 'Title',
      helperText: 'Required',
    ),
  );
}

Widget _buildDescriptionFormWidget({
  String? initialValue,
  required Function(String) onChanged,
}) {
  return TextFormField(
    initialValue: initialValue,
    maxLength: 150,
    onChanged: onChanged,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Description is required';
      }
      return null;
    },
    decoration: const InputDecoration(
      icon: Icon(Icons.view_headline),
      border: OutlineInputBorder(),
      labelText: 'Description',
    ),
  );
}

Widget _buildDueDateFormWidget(
  BuildContext context, {
  String? initialValue,
  required Function(String) onDateSelected,
}) {
  final _dueDateTextFieldController = TextEditingController();
  _dueDateTextFieldController.text = initialValue ?? '';

  return TextFormField(
    controller: _dueDateTextFieldController,
    maxLength: 50,
    readOnly: true, // Make readonly to prevent manual input
    onTap: () async {
      final selectedDate = await _showDatePicker(context);
      if (selectedDate != null) {
        final formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
        _dueDateTextFieldController.text = formattedDate;
        onDateSelected(formattedDate);
      }
    },
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Due date is required';
      }
      return null;
    },
    decoration: const InputDecoration(
      icon: Icon(Icons.calendar_today_rounded),
      border: OutlineInputBorder(),
      labelText: 'Due date',
      helperText: 'Required',
    ),
  );
}

Future<DateTime?> _showDatePicker(BuildContext context) async {
  return showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(DateTime.now().year - 5, 1, 1), // 5 years ago
    lastDate: DateTime(DateTime.now().year + 5, 12, 31), // 5 years later
  );
}
