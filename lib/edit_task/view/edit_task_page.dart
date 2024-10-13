// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
                  _buildDueDateFormWidget(context)
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
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

Widget _buildDueDateFormWidget(final BuildContext context) {
  final _dueDateTextFieldController = TextEditingController();
  final _dueDateFormFocusNode = _DisabledFocusNode();

  return TextFormField(
    focusNode: _dueDateFormFocusNode,
    controller: _dueDateTextFieldController,
    maxLength: 50,
    onTap: () async {
      final selectedDate = await _showDatePicker(context);
      if (selectedDate != null) {
        _dueDateTextFieldController.text =
            DateFormat('yyyy-MM-dd').format(selectedDate);
      }
    },
    onChanged: (value) {},
    validator: (_) => '',
    decoration: const InputDecoration(
      icon: Icon(Icons.calendar_today_rounded),
      border: OutlineInputBorder(),
      labelText: 'Due date',
      helperText: 'Required',
    ),
  );
}

Future<DateTime?> _showDatePicker(final BuildContext context) async {
  final selectedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(DateTime.now().year - 5, 1, 1), // 5 years ago
    lastDate: DateTime(DateTime.now().year + 5, 12, 31), // 5 years later
  );
  return selectedDate;
}

class _DisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
