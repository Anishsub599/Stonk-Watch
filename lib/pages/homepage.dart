
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:endproject/main.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'dart:async';
import 'dart:math' as math;

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

  drawer: Drawer(backgroundColor: Color.fromARGB(255, 126, 165, 192),
   child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: [
      const DrawerHeader(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 122, 188, 210),
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
    backgroundColor: Color.fromARGB(255, 61, 201, 161),
    title: Text('STONKWATCH'),
actions: [
  Icon(Icons.person ),
  
],


  ),
bottomNavigationBar: GNav(
  backgroundColor: Color.fromARGB(255, 15, 15, 16),
  color: Color.fromARGB(255, 243, 240, 241),
  activeColor: Colors.white,
  tabBackgroundColor: Colors.grey.shade800,
  gap: 8,
  padding: EdgeInsets.all(16),
  tabs: [
GButton(icon: Icons.home,
text: 'Home',
),
GButton(icon: Icons.list,
text: 'List',
),
GButton(icon: Icons.search,
text: 'Search',
),
GButton(icon: Icons.settings,
text: 'setting',
),

  ],
),

),
    );
  }
}





    
  
