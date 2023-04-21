import 'package:flutter/material.dart';

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
                // to save data after database connection
                saveNoteToDatabase(note);
                // Show a snackbar or toast message to confirm the note is saved
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Note saved')),
                );
              },
              child: Text('Save Note'),
            ),
          ],
        ),
      ),
    );
  }

  void saveNoteToDatabase(String note) {
    // code to be added to database after database connection
  }
}
