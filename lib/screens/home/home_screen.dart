import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/screens/form/form_screen.dart';
import 'package:sample/screens/home/widgets/notes_tile.dart';

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
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            final List<DocumentSnapshot> documents = snapshot.data!.docs;
            return GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 6,
                crossAxisSpacing: 6,
                childAspectRatio: 1 / 0.8,
              ),
              itemCount: documents.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot noteSnap = documents[index];
                return NotesTile(noteSnap: noteSnap, index: index);
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error.toString()}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () => Get.to(const SreenForm()),
        child: const Icon(Icons.add,color: Colors.white,), 
      ),
    );
  }
}


