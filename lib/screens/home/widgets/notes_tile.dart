import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NotesTile extends StatelessWidget {
  const NotesTile({super.key, required this.noteSnap, required this.index});
  final DocumentSnapshot noteSnap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  noteSnap['title'],
                  maxLines: 1,
                )),
                IconButton(onPressed: () {}, icon: const Icon(Icons.delete,color: Colors.blue,)),
              ],
            ),
            const SizedBox(
              height: 10, 
            ),
            Flexible(
                child: Text(
              '    ${noteSnap['description']}',
              overflow: TextOverflow.fade,
            )),
          ],
        ),
      ),
    );
  }
}
