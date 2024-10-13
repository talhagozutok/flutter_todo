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
                  TextFormField(
                    maxLength: 50,
                    onChanged: (value) => {},
                    validator: (_) => '',
                    decoration: const InputDecoration(
                      icon: Icon(Icons.edit),
                      border: OutlineInputBorder(),
                      labelText: 'Title',
                      helperText: 'Required',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
