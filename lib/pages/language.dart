import 'package:flutter/material.dart';

class LanguageSelectionPage extends StatefulWidget {
  @override
  _LanguageSelectionPageState createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  String _selectedLanguage = 'English';

  List<String> _languages = [
    'English',
    'Spanish',
    'French',
    'German',
    'Japanese',
  ];

  void _selectLanguage(String language) {
    setState(() {
      _selectedLanguage = language;
    });

    // Add code to handle language selection and update the app's localization
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 134, 234, 194),
        title: Text('Language Selection'),
      ),
      body: ListView.builder(
        itemCount: _languages.length,
        itemBuilder: (context, index) {
          final language = _languages[index];
          return ListTile(
            title: Text(language),
            trailing: _selectedLanguage == language
                ? Icon(Icons.check)
                : SizedBox.shrink(),
            onTap: () => _selectLanguage(language),
          );
        },
      ),
    );
  }
}
