import 'package:flutter/material.dart';

final titleController = TextEditingController();
final descriptionController = TextEditingController();

class SreenForm extends StatelessWidget {
  const SreenForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Notes'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
        child: ListView(
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Title of note',
                  suffixIcon: Icon(Icons.title)),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: titleController,
              maxLines: 5,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Description',
                  suffixIcon: Icon(Icons.notes)),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.save),
                      label: const Text('Save')),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
