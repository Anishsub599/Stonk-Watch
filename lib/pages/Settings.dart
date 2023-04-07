import 'package:endproject/pages/theme.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(children:
      
    [
      //  ElevatedButton.icon(
      //         onPressed: () {
      //          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>theme(),));

      //         },
      //         icon: Icon(Icons.mode),
      //         label: Text('THEME')),

    ]),
    );
  }
}
