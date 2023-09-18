import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/functions/db_functions.dart';
import 'package:sample/screens/form/form_screen.dart';

class NotesTile extends StatelessWidget {
  const NotesTile(
      {super.key,
      required this.noteSnap,
      required this.index,
      required this.documentSnapshot});
  final DocumentSnapshot noteSnap;
  final int index;
  final DocumentSnapshot documentSnapshot;

  @override
  Widget build(BuildContext context) {
    DBFunctions controller = Get.put(DBFunctions());
    return GestureDetector(
      onTap: () => navigate(),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: const BorderSide(
            color: Colors.blue,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Text(
                    "${noteSnap['title']}", 
                    maxLines: 1,
                  )),
                  IconButton(
                      onPressed: () => controller.deleteNote(documentSnapshot),
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.blue,
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                  child: Text(
                "    ${noteSnap['description']}",
                overflow: TextOverflow.fade,
              )),
            ],
          ),
        ),
      ),
    );
  }

  navigate() {
    Get.to(ScreenForm(
      documentSnapshot: documentSnapshot,
      isEdit: true,
      index: index,
    ));
  }
}
