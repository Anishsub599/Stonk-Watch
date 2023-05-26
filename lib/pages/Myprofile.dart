// import 'Settings.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';

// class myprofile extends StatefulWidget {
//   myprofile({super.key});

//   @override
//   State<myprofile> createState() => _myprofileState();
// }

// class _myprofileState extends State<myprofile> {
//   FirebaseAuth _auth = FirebaseAuth.instance;

//   String userEmail = FirebaseAuth.instance.currentUser!.email!;
//   String userName = 'KUSHAL '; // replace with the user's actual name
//   String userImage =
//       'https://i.pravatar.cc/150'; // replace with the URL of the user's profile picture
//   // 'https://www.facebook.com/photo/?fbid=1566615570342946&set=a.106565663014618';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 117, 203, 189),
//         leadingWidth: 25,
//         elevation: 0,
//         actions: [
//           Icon(Icons.person),
//         ],
//         title: Text(
//           'PROFILE',
//           style: TextStyle(
//               fontSize: 24,
//               color: Color.fromARGB(255, 247, 245, 245),
//               fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: ListView(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CircleAvatar(
//                   radius: 80.0,
//                   backgroundImage: NetworkImage(userImage),
//                 ),
//                 SizedBox(height: 16.0),
//                 Text('Name: $userName', style: TextStyle(fontSize: 20)),
//                 SizedBox(height: 16.0),
//                 Text('Email: $userEmail', style: TextStyle(fontSize: 20)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

//next code

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class myprofile extends StatefulWidget {
  myprofile({super.key});

  @override
  State<myprofile> createState() => _myprofileState();
}

class _myprofileState extends State<myprofile> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  String userEmail = FirebaseAuth.instance.currentUser!.email!;
  String userName = 'KUSHAL'; // replace with the user's actual name
  String userImage =
      'https://www.facebook.com/photo/?fbid=131427044278998&set=pob.100022351083424'; // replace with the URL of the user's profile picture

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 135, 222, 207),
        leadingWidth: 25,
        elevation: 0,
        title: Text(
          'PROFILE',
          style: TextStyle(
            fontSize: 24,
            color: Color.fromARGB(255, 247, 245, 245),
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 80.0,
                  backgroundImage: NetworkImage(userImage),
                ),
                SizedBox(height: 16.0),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.lightGreen,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Name: $userName',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.lightGreen,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Email: $userEmail',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
