import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/screens/form/form_screen.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final CollectionReference notes =
        FirebaseFirestore.instance.collection('notes');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: StreamBuilder(
        stream: notes.snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot noteSnap = snapshot.data.docs[index];
                return Text(noteSnap['title']);
              },
            );
          } else {
            return Container(
              child: Text('title'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(const SreenForm()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
