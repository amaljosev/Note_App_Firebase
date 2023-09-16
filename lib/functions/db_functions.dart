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
    titleController.text='';
    descriptionController.text='';
    Get.back(); 
  }
  void deleteNote(docId){
    
  }
  
}
