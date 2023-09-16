import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DBFunctions extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  void addNote() {
    final note = {
      'title': titleController.text,
      'description': descriptionController.text,
    };
    notes.add(note);
    titleController.text = '';
    descriptionController.text = '';
    Get.back();
  }

  Future<void> loadNotes([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      DBFunctions controller = Get.put(DBFunctions());
      controller.titleController.text = documentSnapshot['title'];
      controller.descriptionController.text = documentSnapshot['description'];
    } else {
      print('null obtained');
    }
  }

  Future<void> updateNote([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      await notes.doc(documentSnapshot.id).update({
        'title': titleController.text,
        'description': descriptionController.text
      });
      Get.back();
    } else {
      print('null obtained');
    }
  }

  Future<void> deleteNote([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      await notes.doc(documentSnapshot.id).delete();
      Get.back();
    } else {
      print('null obtained');
    }
  }
}
