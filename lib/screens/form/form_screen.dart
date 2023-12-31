import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/functions/db_functions.dart';

class ScreenForm extends StatelessWidget {
  const ScreenForm({
    super.key,
    required this.isEdit,
    required this.index,
    required this.documentSnapshot,
  });
  final bool isEdit;
  final int index;
  final DocumentSnapshot documentSnapshot;

  @override
  Widget build(BuildContext context) {
    DBFunctions controller = Get.put(DBFunctions());
    isEdit ? controller.loadNotes(documentSnapshot) : controller.reset();
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Note' : 'Add Notes'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
        child: ListView(
          children: [
            TextFormField(
              controller: controller.titleController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Title of note',
                  suffixIcon: Icon(Icons.title)),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: controller.descriptionController,
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
                      onPressed: () => isEdit
                          ? controller.updateNote(documentSnapshot)
                          : controller.addNote(),
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
