import 'package:endproject/pages/Aboutus.dart';
import 'package:endproject/pages/AllScrip.dart';
import 'package:endproject/pages/Myprofile.dart';
import 'package:endproject/pages/STOCKHistory.dart';
import 'package:endproject/pages/Settings.dart';
import 'package:endproject/pages/Stockcalculator.dart';
import 'package:endproject/pages/floorsheet.dart';
import 'package:endproject/pages/mynote.dart';
import 'package:endproject/pages/watchlist.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:endproject/main.dart';
import 'package:endproject/pages/loginpage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'dart:async';
import 'dart:math' as math;

import 'graph.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

bool _iconBool = false;
IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;
ThemeData _LightTheme = ThemeData(
  primarySwatch: Colors.amber,
  brightness: Brightness.light,
);
ThemeData _darkTheme = ThemeData(
  primarySwatch: Colors.red,
  brightness: Brightness.dark,
);

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    void _showLogoutConfirmation(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Log Out'),
            content: Text('Are you sure you want to log out?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Log Out'),
              ),
            ],
          );
        },
      ).then((value) {
        if (value == true) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => loginpage()),
          );
        }
      });
    }

    return MaterialApp(
        theme: _iconBool ? _darkTheme : _LightTheme,
        debugShowCheckedModeBanner: false,
        title: "STONK WATCH",
        home: Scaffold(
          drawer: Drawer(
            backgroundColor: Colors.blueGrey[900],
            child: Column(
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[800],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ListTile(
                  title: Text(
                    'My Profile',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  leading: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => myprofile()),
                    );
                  },
                ),
                ListTile(
                  title: Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  leading: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SettingsPage()),
                    );
                  },
                ),
                ListTile(
                  title: Text(
                    'About Us',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  leading: Icon(
                    Icons.info_outline,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AboutUs()),
                    );
                  },
                ),
                Divider(
                  color: Colors.white,
                  height: 20,
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                ),
                ListTile(
                  title: Text(
                    'Log out',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
                  onTap: () => _showLogoutConfirmation(context),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 61, 201, 161),
            title: Text('STONKWATCH'),
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _iconBool = !_iconBool;
                  });
                },
                icon: Icon(_iconBool ? _iconDark : _iconLight),
              ),
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
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.list,
                text: 'List',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(
                icon: Icons.settings,
                text: 'setting',
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: ListView(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                CandleStick(title: 'My Candlestick Chart'),
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          padding: EdgeInsets.all(12.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blue.shade200,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.auto_graph,
                                size: 40.0,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'StockChart',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => StockCalculator(),
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          padding: EdgeInsets.all(12.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blue.shade200,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.calculate,
                                size: 40.0,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Stock Calculator',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WatchlistScreen(),
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          padding: EdgeInsets.all(12.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blue.shade200,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.watch,
                                size: 40.0,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'WatchList',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => StockCalculator(),
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          padding: EdgeInsets.all(12.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blue.shade200,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.alarm,
                                size: 40.0,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Alerts',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                Floorsheet(title: 'Floorsheet'),
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          padding: EdgeInsets.all(12.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blue.shade200,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.table_chart,
                                size: 40.0,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Floorsheet',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AllScrip(
                              title: 'All Scrip',
                            ),
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          padding: EdgeInsets.all(12.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blue.shade200,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.list,
                                size: 40.0,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'All Scrips',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => STOCKHistory(),
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          padding: EdgeInsets.all(12.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blue.shade200,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.history,
                                size: 40.0,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'STOCK History',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NotePage(),
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          padding: EdgeInsets.all(12.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blue.shade200,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.notes_outlined,
                                size: 40.0,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'My notes',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

// import 'package:endproject/pages/Aboutus.dart';
// import 'package:endproject/pages/Myprofile.dart';
// import 'package:endproject/pages/Settings.dart';
// import 'package:endproject/pages/Stockcalculator.dart';
// import 'package:endproject/pages/mynote.dart';
// import 'package:endproject/pages/watchlist.dart';
// import 'package:flutter/material.dart';
// import 'package:cupertino_icons/cupertino_icons.dart';
// import 'package:endproject/main.dart';
// import 'package:endproject/pages/loginpage.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

// class Homepage extends StatefulWidget {
//   const Homepage({Key? key}) : super(key: key);

//   @override
//   State<Homepage> createState() => _HomepageState();
// }

// class _HomepageState extends State<Homepage> {
//   bool _iconBool = false;
//   IconData _iconLight = Icons.wb_sunny;
//   IconData _iconDark = Icons.nights_stay;
//   ThemeData _lightTheme = ThemeData(
//     primarySwatch: Colors.amber,
//     brightness: Brightness.light,
//   );
//   ThemeData _darkTheme = ThemeData(
//     primarySwatch: Colors.red,
//     brightness: Brightness.dark,
//   );

//   @override
//   Widget build(BuildContext context) {
//     void _showLogoutConfirmation(BuildContext context) {
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Log Out'),
//             content: Text('Are you sure you want to log out?'),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(false),
//                 child: Text('Cancel'),
//               ),
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(true),
//                 child: Text('Log Out'),
//               ),
//             ],
//           );
//         },
//       ).then((value) {
//         if (value == true) {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => loginpage()),
//           );
//         }
//       });
//     }

//     return MaterialApp(
//       theme: _iconBool ? _darkTheme : _lightTheme,
//       debugShowCheckedModeBanner: false,
//       title: "STONK WATCH",
//       home: Scaffold(
//         drawer: Drawer(
//           backgroundColor: Colors.blueGrey[900],
//           child: Column(
//             children: [
//               Container(
//                 height: 150,
//                 decoration: BoxDecoration(
//                   color: Colors.blueGrey[800],
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(20),
//                     bottomRight: Radius.circular(20),
//                   ),
//                 ),
//                 child: Center(
//                   child: Text(
//                     'Profile',
//                     style: TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               ListTile(
//                 title: Text(
//                   'My Profile',
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.white,
//                   ),
//                 ),
//                 leading: Icon(
//                   Icons.person,
//                   color: Colors.white,
//                 ),
//                 onTap: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(builder: (context) => myprofile()),
//                   );
//                 },
//               ),
//               ListTile(
//                 title: Text(
//                   'Settings',
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.white,
//                   ),
//                 ),
//                 leading: Icon(
//                   Icons.settings,
//                   color: Colors.white,
//                 ),
//                 onTap: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(builder: (
