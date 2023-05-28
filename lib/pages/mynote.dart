import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore firestore = FirebaseFirestore.instance;

class NotePage extends StatefulWidget {
  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final TextEditingController _textEditingController = TextEditingController();
  List<String> notesList = [];

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    loadNotes();
  }

  void loadNotes() async {
    final user = _auth.currentUser;
    final userId = user?.uid;
    final notesRef = firestore.collection('notes');

    final notesSnapshot =
        await notesRef.where('userId', isEqualTo: userId).get();
    final List<String> loadedNotes = [];

    notesSnapshot.docs.forEach((note) {
      final noteContent = note.get('content') as String;
      loadedNotes.add(noteContent);
    });

    setState(() {
      notesList = loadedNotes;
    });
  }

  Future<void> saveNote() async {
    final user = _auth.currentUser;
    final userId = user?.uid;
    final notesRef = firestore.collection('notes');

    await notesRef.add({
      'userId': userId,
      'content': _textEditingController.text,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Note saved')),
    );

    _textEditingController.clear();
    loadNotes();
  }

  void editNote(String note) {
    _textEditingController.text = note;
  }

  Future<void> deleteNote(String note) async {
    final user = _auth.currentUser;
    final userId = user?.uid;
    final notesRef = firestore.collection('notes');

    final QuerySnapshot querySnapshot = await notesRef
        .where('userId', isEqualTo: userId)
        .where('content', isEqualTo: note)
        .get();

    querySnapshot.docs.forEach((doc) async {
      await doc.reference.delete();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Note deleted')),
    );

    _textEditingController.clear();
    loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note Page'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 134, 234, 194),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _textEditingController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Write your note here',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(),
              ),
              maxLines: null,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: saveNote,
              child: Text(
                'Save Note',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF1565C0),
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Old Notes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: notesList.length,
                itemBuilder: (context, index) {
                  final note = notesList[index];
                  return GestureDetector(
                    onTap: () => editNote(note),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(note),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () => deleteNoteDialog(note),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> deleteNoteDialog(String note) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Note'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to delete this note?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                deleteNote(note);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
