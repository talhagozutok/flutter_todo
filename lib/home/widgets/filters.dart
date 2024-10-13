import 'package:flutter/material.dart';

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
