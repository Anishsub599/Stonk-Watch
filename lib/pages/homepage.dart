
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:endproject/main.dart';




class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
title: "STONK WATCH",
home: Scaffold(

  drawer: Drawer(backgroundColor: Color.fromARGB(255, 205, 245, 5),
   child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: [
      const DrawerHeader(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 207, 66, 66),
        ),
        child: Text('FEATURES'),
      ),
      ListTile(
        title: const Text('Stock calculator'),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
      ListTile(
        title: const Text('Stock list'),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
    ],
  ),

  
  
  ),
  appBar: AppBar(
    title: Text('STONKWATCH'),
actions: [
  Icon(Icons.settings)
],


  ),

),




    );
  }
}