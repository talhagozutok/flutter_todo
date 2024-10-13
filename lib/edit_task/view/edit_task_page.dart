import 'package:flutter/material.dart';

class EditTaskPage extends StatelessWidget {
  const EditTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Task'),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.delete),
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
              child: Column(
                children: [
                  _buildTitleFormWidget(),
                  const SizedBox(height: 16),
                  _buildDescriptionFormWidget(),
                  const SizedBox(height: 16),
                  _buildDueDateFormWidget()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildTitleFormWidget() {
  return TextFormField(
    maxLength: 50,
    onChanged: (value) => {},
    validator: (_) => '',
    decoration: const InputDecoration(
      icon: Icon(Icons.edit),
      border: OutlineInputBorder(),
      labelText: 'Title',
      helperText: 'Required',
    ),
  );
}

Widget _buildDescriptionFormWidget() {
  return TextFormField(
    maxLength: 150,
    onChanged: (value) => {},
    validator: (_) => '',
    decoration: const InputDecoration(
      icon: Icon(Icons.view_headline),
      border: OutlineInputBorder(),
      labelText: 'Description',
    ),
  );
}

Widget _buildDueDateFormWidget() {
  return TextFormField(
    maxLength: 50,
    onTap: () => {},
    onChanged: (value) => {},
    validator: (_) => '',
    decoration: const InputDecoration(
      icon: Icon(Icons.calendar_today_rounded),
      border: OutlineInputBorder(),
      labelText: 'Due date',
      helperText: 'Required',
    ),
  );
}
