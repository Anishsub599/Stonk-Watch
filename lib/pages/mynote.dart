// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:endproject/main.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// FirebaseAuth _auth = FirebaseAuth.instance;
// final FirebaseFirestore firestore = FirebaseFirestore.instance;
// Future<void> saveNote(String title, String content) async {
//   try {
//     await firestore.collection('notes').add({
//       'content': content,
//     });
//   } catch (e) {
//     print(e);
//   }
// }

// class NotePage extends StatefulWidget {
//   @override
//   _NotePageState createState() => _NotePageState();
// }

// class _NotePageState extends State<NotePage> {
//   String note = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Note Page'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               onChanged: (value) {
//                 setState(() {
//                   note = value;
//                 });
//               },
//               decoration: InputDecoration(
//                 hintText: 'Write your note here',
//                 border: OutlineInputBorder(),
//               ),
//               maxLines: null,
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 // to save data after database connection
//                 void onSaveNotePressed(String title, String content) {
//                   saveNote(title, content);
//                 }

//                 // Show a snackbar or toast message to confirm the note is saved
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Note saved')),
//                 );
//               },
//               child: Text('Save Note'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void saveNoteToDatabase(String note) {
//     // code to be added to database after database connection
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:endproject/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<void> saveNote(String title, String content) async {
  try {
    await firestore.collection('notes').add({
      'content': content,
    });
  } catch (e) {
    print(e);
  }
}

class NotePage extends StatefulWidget {
  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  String note = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note Page'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 31, 231, 144),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  note = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Write your note here',
                border: OutlineInputBorder(),
              ),
              maxLines: null,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                void onSaveNotePressed(String title, String content) {
                  saveNote(title, content);
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Note saved')),
                );
              },
              child: Text('Save Note'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Set button background color
                onPrimary: Colors.white, // Set button text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
